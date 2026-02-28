package org.avi1606.uberprojectentity.models;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
@EntityListeners(AuditingEntityListener.class)
@Table(name = "bookingreview")
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class Review extends BaseModel{

    private String content;

    private Double rating;

    @Override
    public String toString() {
        return "Review [id=" + getId() + ", content=" + content + ", rating=" + rating + ", createdAt=" + getCreatedAt() + "]";
    }

}
