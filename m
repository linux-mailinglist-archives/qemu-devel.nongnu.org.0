Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF605284D1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:58:16 +0200 (CEST)
Received: from localhost ([::1]:34320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqaIh-0000zX-2X
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nqYwX-0006oy-So
 for qemu-devel@nongnu.org; Mon, 16 May 2022 07:31:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nqYwW-0006uz-8p
 for qemu-devel@nongnu.org; Mon, 16 May 2022 07:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652700675;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=U7KTS/wESNuWSRc40RvT5Z+aAljnQsL1WQgLkbi3TOA=;
 b=WBoO+s8qkW54wvvea4VeSY9aUIwt35hQtqpATnL44aNhDKMbS1+hl8ulhZyMOj8OxTwdUs
 v1NgSjPOyKg23jKgHRZkJz7ZzBCJOTCPq8gisekwU65/I0Hm6Va2BXu0IgQ4G23FCiU0fw
 KeQoziDKr7OZ6rVujbkzYDw25qCfkJg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171--Y7BQWdLP8iBNKj-vZyJ4w-1; Mon, 16 May 2022 07:31:14 -0400
X-MC-Unique: -Y7BQWdLP8iBNKj-vZyJ4w-1
Received: by mail-wm1-f70.google.com with SMTP id
 n26-20020a1c721a000000b003941ea1ced7so5501757wmc.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 04:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=U7KTS/wESNuWSRc40RvT5Z+aAljnQsL1WQgLkbi3TOA=;
 b=qDwiYE13LQA4maGmBPnX+zxqJufCiqOuSxEwgkDFf0HDj8qgjcRFgZHnSgV/2CVBSm
 hKV0GAv26UDH4VOSESu46gJtYPZ11DwHuHXUGwoOzImCxTPklnWkJngqv1c53MHnGB8W
 PYInAr7LMmIlV0a4GHm89EYNS9kQ9f8UGvUfhVHkUzXDepFAQKjz+gu3bEoz/i2tqSww
 VwyWYrOhKSXhsXYKn1eyNVg6dbx0hUFdohOoAS6H6DGqFgM+YS5fWN4hjYW7Hx0OMH77
 1KVvuNZfhl510lFz1BG3bACvWITd20N/8r2ZVOAwYIupqiAt/3lOm8Ofv8mesY2Kq9vU
 /PYw==
X-Gm-Message-State: AOAM531JzX4m4pn/edjNjobZWycOPSxsJZHDSqqCB/9liF1FT6w3Ou5j
 3Bq2Iht/0rpG1Ae0KMK5RLUTqityzssHmoj2DpkwA4VXINLK+ONOo+Vs61DEs+wy91vH6RewCx8
 wJKe09eV2G23ZssQ=
X-Received: by 2002:a05:600c:3490:b0:394:5616:ac78 with SMTP id
 a16-20020a05600c349000b003945616ac78mr16437576wmq.80.1652700672905; 
 Mon, 16 May 2022 04:31:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4ImgW7B71wOaVvX6m7EyXrB1A80Ma4HJLMaLCNzLZhcnxucIdkkVdeU3fZm0fXErUJ0PTXQ==
X-Received: by 2002:a05:600c:3490:b0:394:5616:ac78 with SMTP id
 a16-20020a05600c349000b003945616ac78mr16437550wmq.80.1652700672707; 
 Mon, 16 May 2022 04:31:12 -0700 (PDT)
Received: from localhost (static-211-115-85-188.ipcom.comunitel.net.
 [188.85.115.211]) by smtp.gmail.com with ESMTPSA id
 e2-20020adf9bc2000000b0020d069148bcsm3737032wrc.110.2022.05.16.04.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 04:31:12 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>,  "Michael S . Tsirkin" <mst@redhat.com>,
 "Cornelia Huck" <cohuck@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Alex Williamson" <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,  Yishai Hadas
 <yishaih@nvidia.com>,  Jason Gunthorpe <jgg@nvidia.com>,  "Mark Bloch"
 <mbloch@nvidia.com>,  Maor Gottlieb <maorg@nvidia.com>,  Kirti Wankhede
 <kwankhede@nvidia.com>,  Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 5/9] migration/qemu-file: Add qemu_file_get_to_fd()
In-Reply-To: <20220512154320.19697-6-avihaih@nvidia.com> (Avihai Horon's
 message of "Thu, 12 May 2022 18:43:16 +0300")
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-6-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 16 May 2022 13:31:11 +0200
Message-ID: <87czgdsohs.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avihai Horon <avihaih@nvidia.com> wrote:
> Add new function qemu_file_get_to_fd() that allows reading data from
> QEMUFile and writing it straight into a given fd.
>
> This will be used later in VFIO migration code.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  migration/qemu-file.c | 34 ++++++++++++++++++++++++++++++++++
>  migration/qemu-file.h |  1 +
>  2 files changed, 35 insertions(+)
>
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 1479cddad9..cad3d32eb3 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -867,3 +867,37 @@ QIOChannel *qemu_file_get_ioc(QEMUFile *file)
>  {
>      return file->has_ioc ? QIO_CHANNEL(file->opaque) : NULL;
>  }
> +
> +/*
> + * Read size bytes from QEMUFile f and write them to fd.
> + */
> +int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size)
> +{
> +    while (size) {
> +        size_t pending = f->buf_size - f->buf_index;
> +        ssize_t rc;
> +
> +        if (!pending) {
> +            rc = qemu_fill_buffer(f);
> +            if (rc < 0) {
> +                return rc;
> +            }
> +            if (rc == 0) {
> +                return -1;
> +            }
> +            continue;
> +        }
> +
> +        rc = write(fd, f->buf + f->buf_index, MIN(pending, size));
> +        if (rc < 0) {
> +            return rc;
> +        }
> +        if (rc == 0) {
> +            return -1;
> +        }
> +        f->buf_index += rc;
> +        size -= rc;
> +    }
> +
> +    return 0;
> +}

Is there a really performance difference to just use:

uint8_t buffer[size];

qemu_get_buffer(f, buffer, size);
write(fd, buffer, size);

Or telling it otherwise, what sizes are we talking here?

Thanks, Juan.


> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 3f36d4dc8c..dd26037450 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -162,6 +162,7 @@ int qemu_file_shutdown(QEMUFile *f);
>  QEMUFile *qemu_file_get_return_path(QEMUFile *f);
>  void qemu_fflush(QEMUFile *f);
>  void qemu_file_set_blocking(QEMUFile *f, bool block);
> +int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size);
>  
>  void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
>  void ram_control_after_iterate(QEMUFile *f, uint64_t flags);


