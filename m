Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1587545497
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 21:04:53 +0200 (CEST)
Received: from localhost ([::1]:38396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzNSe-0007uv-HL
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 15:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzLNF-0003LZ-GO
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:51:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzLND-00074o-8V
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654793466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G6WFCdRvNT/QpBlZPNDv6FQ66nJIlG0MbwIXJJXOh8E=;
 b=ik3/BWkGR3x6iR+ItCg9cNGjjQRKwYd272nFEzfNS+JUjE0Wb53WzKIlgcZWajqtAs/nd/
 za9iVxkMWWnS+sAvz9vzPVQCv3ml8w3XEs4qXTkgvsNSMFms2gBdTYRSPxh+mCfxuld8En
 /9qKq9wqEEkNRu0XHpuRe0nfGzKm/Xs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-W0U7ViPRMgKRprroetaIkA-1; Thu, 09 Jun 2022 12:51:05 -0400
X-MC-Unique: W0U7ViPRMgKRprroetaIkA-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay1-20020a05600c1e0100b0039c3a3fc6a4so8618847wmb.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=G6WFCdRvNT/QpBlZPNDv6FQ66nJIlG0MbwIXJJXOh8E=;
 b=vNCoUij+55RI8LrLxq2G8KnAgE+xDCtglqecwCPbEUIlRHWtKlsSOyuBmF9hwPUZDG
 DmDszZwMOO8qXjPuyhZHm3x2S+WBuLqwyCyJsuKAcItXv8e6+gVUZhFNLIyAVDTdBHZp
 46ajLDKb/9/sG0Dh0ky46KEk2TZcjyDxK8oRwM0U8ud7+Ap0xs+LYWXYcIt8H7I+wxzr
 zyGB679j2cWdWJmpaogK7+/LNWRYPGvCNsO+U6SVGEQOf/DRn4uxGIapOpsJr1/3cH5H
 cZ4AdKavVRO0PVyJYS7Gsv3Qyu65DkenvgU7TSp+A9CRCq0evs4eH3KDTLZLkmxx+yUr
 mixg==
X-Gm-Message-State: AOAM533vOHxHmmSPCrygjkrtCzzdCbI0fL96eSuVRogAF1lgwGrz6dg+
 mJw57w/LvaqFbUO78yVZvSQ1j8HPwwm291iKOYp0glrkL9I1hvYH3cEj73G/5mRZXe06mWXc3O4
 Vy+cdShK8qc5rfZw=
X-Received: by 2002:a05:6000:1f8b:b0:219:bee5:6b77 with SMTP id
 bw11-20020a0560001f8b00b00219bee56b77mr2162682wrb.658.1654793462872; 
 Thu, 09 Jun 2022 09:51:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxsaHqFZDB5gg9nliO6sDqt9F37WE3WLIj5Z0ujgcb9ahq4OFKwV2qBecG2r1KqyuJp884TQ==
X-Received: by 2002:a05:6000:1f8b:b0:219:bee5:6b77 with SMTP id
 bw11-20020a0560001f8b00b00219bee56b77mr2162651wrb.658.1654793462530; 
 Thu, 09 Jun 2022 09:51:02 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r203-20020a1c44d4000000b0039c798b2dc5sm421317wma.8.2022.06.09.09.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 09:51:01 -0700 (PDT)
Date: Thu, 9 Jun 2022 17:51:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 18/20] migration: remove the QEMUFileOps 'writev_buffer'
 callback
Message-ID: <YqIk9AvFQF0hWcu0@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-19-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-19-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> This directly implements the writev_buffer logic using QIOChannel APIs.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  migration/qemu-file-channel.c | 43 -----------------------------------
>  migration/qemu-file.c         | 24 +++++++------------
>  migration/qemu-file.h         |  9 --------
>  3 files changed, 8 insertions(+), 68 deletions(-)
> 
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index 7b32831752..2e139f7bcd 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -32,48 +32,6 @@
>  #include "yank_functions.h"
>  
>  
> -static ssize_t channel_writev_buffer(void *opaque,
> -                                     struct iovec *iov,
> -                                     int iovcnt,
> -                                     int64_t pos,
> -                                     Error **errp)
> -{
> -    QIOChannel *ioc = QIO_CHANNEL(opaque);
> -    ssize_t done = 0;
> -    struct iovec *local_iov = g_new(struct iovec, iovcnt);
> -    struct iovec *local_iov_head = local_iov;
> -    unsigned int nlocal_iov = iovcnt;
> -
> -    nlocal_iov = iov_copy(local_iov, nlocal_iov,
> -                          iov, iovcnt,
> -                          0, iov_size(iov, iovcnt));
> -
> -    while (nlocal_iov > 0) {
> -        ssize_t len;
> -        len = qio_channel_writev(ioc, local_iov, nlocal_iov, errp);
> -        if (len == QIO_CHANNEL_ERR_BLOCK) {
> -            if (qemu_in_coroutine()) {
> -                qio_channel_yield(ioc, G_IO_OUT);
> -            } else {
> -                qio_channel_wait(ioc, G_IO_OUT);
> -            }
> -            continue;

I wondered where that code went, but it turns out it's already copied
into qio_channel_writev_full_all, so:


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> -        }
> -        if (len < 0) {
> -            done = -EIO;
> -            goto cleanup;
> -        }
> -
> -        iov_discard_front(&local_iov, &nlocal_iov, len);
> -        done += len;
> -    }
> -
> - cleanup:
> -    g_free(local_iov_head);
> -    return done;
> -}
> -
> -
>  static QEMUFile *channel_get_input_return_path(void *opaque)
>  {
>      QIOChannel *ioc = QIO_CHANNEL(opaque);
> @@ -94,7 +52,6 @@ static const QEMUFileOps channel_input_ops = {
>  
>  
>  static const QEMUFileOps channel_output_ops = {
> -    .writev_buffer = channel_writev_buffer,
>      .get_return_path = channel_get_output_return_path,
>  };
>  
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index e024b43851..72a6f58af5 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -245,10 +245,6 @@ static void qemu_iovec_release_ram(QEMUFile *f)
>   */
>  void qemu_fflush(QEMUFile *f)
>  {
> -    ssize_t ret = 0;
> -    ssize_t expect = 0;
> -    Error *local_error = NULL;
> -
>      if (!qemu_file_is_writable(f)) {
>          return;
>      }
> @@ -257,22 +253,18 @@ void qemu_fflush(QEMUFile *f)
>          return;
>      }
>      if (f->iovcnt > 0) {
> -        expect = iov_size(f->iov, f->iovcnt);
> -        ret = f->ops->writev_buffer(f->ioc, f->iov, f->iovcnt, f->total_transferred,
> -                                    &local_error);
> +        Error *local_error = NULL;
> +        if (qio_channel_writev_all(f->ioc,
> +                                   f->iov, f->iovcnt,
> +                                   &local_error) < 0) {
> +            qemu_file_set_error_obj(f, -EIO, local_error);
> +        } else {
> +            f->total_transferred += iov_size(f->iov, f->iovcnt);
> +        }
>  
>          qemu_iovec_release_ram(f);
>      }
>  
> -    if (ret >= 0) {
> -        f->total_transferred += ret;
> -    }
> -    /* We expect the QEMUFile write impl to send the full
> -     * data set we requested, so sanity check that.
> -     */
> -    if (ret != expect) {
> -        qemu_file_set_error_obj(f, ret < 0 ? ret : -EIO, local_error);
> -    }
>      f->buf_index = 0;
>      f->iovcnt = 0;
>  }
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index cd49184c00..542c637934 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -29,14 +29,6 @@
>  #include "exec/cpu-common.h"
>  #include "io/channel.h"
>  
> -/*
> - * This function writes an iovec to file. The handler must write all
> - * of the data or return a negative errno value.
> - */
> -typedef ssize_t (QEMUFileWritevBufferFunc)(void *opaque, struct iovec *iov,
> -                                           int iovcnt, int64_t pos,
> -                                           Error **errp);
> -
>  /*
>   * This function provides hooks around different
>   * stages of RAM migration.
> @@ -69,7 +61,6 @@ typedef size_t (QEMURamSaveFunc)(QEMUFile *f,
>  typedef QEMUFile *(QEMURetPathFunc)(void *opaque);
>  
>  typedef struct QEMUFileOps {
> -    QEMUFileWritevBufferFunc *writev_buffer;
>      QEMURetPathFunc *get_return_path;
>  } QEMUFileOps;
>  
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


