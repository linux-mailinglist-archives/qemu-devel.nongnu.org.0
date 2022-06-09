Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70935452EE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:26:40 +0200 (CEST)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLvb-0003HH-JW
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzLQM-000733-3n
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:54:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzLQK-0007O3-CU
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654793659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wg0S6t4qXtGfHgGy0/i9RC1/6jXXHHObrUk+Sh0XT1g=;
 b=YxgQJvm0CmDQhOkSmbrSMR6n+Ild15aS7G5k4sNip/19G24a4RDGUwYPZD6SqfAXB0bvp2
 YSyAXOZOfSbH4CZWQE/dNfd4t62q8HAlxgzIwnsNhk538wXUmxYJQOmFKE/c2eFMVPIAm3
 s7qotYrBDvfg9BdJ822JSlS2JKRZGdU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-ejvZt-yENyGC3oe8ej-gHQ-1; Thu, 09 Jun 2022 12:54:18 -0400
X-MC-Unique: ejvZt-yENyGC3oe8ej-gHQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a05600c1c8500b003974c5d636dso11566455wms.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=wg0S6t4qXtGfHgGy0/i9RC1/6jXXHHObrUk+Sh0XT1g=;
 b=bpeQ5HiThZDG6K4Leb0v7SME8Tfr0OPO4iQJqUEkmq3hSGAZYEP4KfPKGxe9KujwJG
 fdD2GlPzdOSuhnygkL00syY7595cTuww/sZz55LvMXO/f2KHrOQ5tH6yEzhBZpTyN4te
 JQXsQ+r0gLfe/sdNFjQ39DeFgtJbr7tCNJKWjV8rdyortPbMAPjR7V5uflDfOTRACBQv
 VO/XxM+kO3Q9W6PdpgtEu/0CUCkGN0ZamdCxuPqrrrUWn8rP6OwyzVlLc4xglg0QvVNV
 KtSTz6+8IBxLwcQH2oSWpv47b7kum2/1kWiwGnOvplLXvfUEum9mG1HNDh0uEBvOYtfk
 yCcg==
X-Gm-Message-State: AOAM533+wnOYFHBC8AUURfaNw5evj9deO7O8pBMes9g7sZR3ssRuivBx
 nehOPWaYQqr+xBU64LGTsR0Am80BkivHzxpvYksDG77kYXtPKRycoeV7TcKFEEnxFhLIogQP9f1
 Ultr0lEY28YFBVPk=
X-Received: by 2002:a5d:5410:0:b0:218:5b98:425 with SMTP id
 g16-20020a5d5410000000b002185b980425mr10926133wrv.243.1654793657335; 
 Thu, 09 Jun 2022 09:54:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGdsSL4A6IQrAeDYyZeT9Ne2WtwFFF4KMBvddvC0OZ1B/BpLWJESPpuv1wubfaPo5E/x1VGg==
X-Received: by 2002:a5d:5410:0:b0:218:5b98:425 with SMTP id
 g16-20020a5d5410000000b002185b980425mr10926112wrv.243.1654793657100; 
 Thu, 09 Jun 2022 09:54:17 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 s1-20020adfea81000000b00210320d9fbfsm30305027wrm.18.2022.06.09.09.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 09:54:16 -0700 (PDT)
Date: Thu, 9 Jun 2022 17:54:14 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 19/20] migration: remove the QEMUFileOps
 'get_return_path' callback
Message-ID: <YqIltvU8Og5veFPC@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-20-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-20-berrange@redhat.com>
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
> This directly implements the get_return_path logic using QIOChannel APIs.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/qemu-file-channel.c | 16 ----------------
>  migration/qemu-file.c         | 22 ++++++++++------------
>  migration/qemu-file.h         |  6 ------
>  3 files changed, 10 insertions(+), 34 deletions(-)
> 
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index 2e139f7bcd..51717c1137 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -32,27 +32,11 @@
>  #include "yank_functions.h"
>  
>  
> -static QEMUFile *channel_get_input_return_path(void *opaque)
> -{
> -    QIOChannel *ioc = QIO_CHANNEL(opaque);
> -
> -    return qemu_fopen_channel_output(ioc);
> -}
> -
> -static QEMUFile *channel_get_output_return_path(void *opaque)
> -{
> -    QIOChannel *ioc = QIO_CHANNEL(opaque);
> -
> -    return qemu_fopen_channel_input(ioc);
> -}
> -
>  static const QEMUFileOps channel_input_ops = {
> -    .get_return_path = channel_get_input_return_path,
>  };
>  
>  
>  static const QEMUFileOps channel_output_ops = {
> -    .get_return_path = channel_get_output_return_path,
>  };
>  
>  
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 72a6f58af5..dfee808924 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -92,18 +92,6 @@ int qemu_file_shutdown(QEMUFile *f)
>      return ret;
>  }
>  
> -/*
> - * Result: QEMUFile* for a 'return path' for comms in the opposite direction
> - *         NULL if not available
> - */
> -QEMUFile *qemu_file_get_return_path(QEMUFile *f)
> -{
> -    if (!f->ops->get_return_path) {
> -        return NULL;
> -    }
> -    return f->ops->get_return_path(f->ioc);
> -}
> -
>  bool qemu_file_mode_is_not_valid(const char *mode)
>  {
>      if (mode == NULL ||
> @@ -131,6 +119,16 @@ static QEMUFile *qemu_file_new_impl(QIOChannel *ioc,
>      return f;
>  }
>  
> +/*
> + * Result: QEMUFile* for a 'return path' for comms in the opposite direction
> + *         NULL if not available
> + */
> +QEMUFile *qemu_file_get_return_path(QEMUFile *f)
> +{
> +    object_ref(f->ioc);
> +    return qemu_file_new_impl(f->ioc, f->ops, !f->is_writable);
> +}
> +
>  QEMUFile *qemu_file_new_output(QIOChannel *ioc, const QEMUFileOps *ops)
>  {
>      return qemu_file_new_impl(ioc, ops, true);
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 542c637934..5370e4e5ec 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -55,13 +55,7 @@ typedef size_t (QEMURamSaveFunc)(QEMUFile *f,
>                                   size_t size,
>                                   uint64_t *bytes_sent);
>  
> -/*
> - * Return a QEMUFile for comms in the opposite direction
> - */
> -typedef QEMUFile *(QEMURetPathFunc)(void *opaque);
> -
>  typedef struct QEMUFileOps {
> -    QEMURetPathFunc *get_return_path;
>  } QEMUFileOps;
>  
>  typedef struct QEMUFileHooks {
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


