Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4589C545090
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:20:01 +0200 (CEST)
Received: from localhost ([::1]:42578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJx2-0000cs-6J
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzJbi-0001hY-W5
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzJbh-0002wz-Fg
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654786675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8SVzFrfQGdylFViYIPfrMCCQR3w+KG87aY6j+aOvAww=;
 b=Dfr6n61GGal+JKRbQ1/H7DTt24NGv3Cgk7A7evIH4vlf77o9HfLMlVo7CE3lDpqoyT6LHZ
 VAQ/OcsBEahwF8yXPqf/kSgHZydd/BOc/JwHITZ5vg3eosiXrt2+jAW3K0UFPpZKM5WcN5
 yFaRCcKtJOtRVJvRYns9z4N/6nRSZZA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-d_lGs-jgMEK9kkOrP4YtUg-1; Thu, 09 Jun 2022 10:57:45 -0400
X-MC-Unique: d_lGs-jgMEK9kkOrP4YtUg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so5663071wra.15
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 07:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=8SVzFrfQGdylFViYIPfrMCCQR3w+KG87aY6j+aOvAww=;
 b=bNyTpKoPsU8Yc9r9tQp2QMp6LNjm23VvlbCIFxGygaFW2zYGmDGnohbgBx8xrQCQX+
 jIckC6M87hpe54zxGRdO442sL+7a7gY0kp6+NkF9fyhjXgj1UBinwCw//GdGsZppVyBQ
 ccaM624xN6h1VqiLVlTIDHluiL8AcFRv7M8Zkir3tw1OC5lvoEEL25VMzvdVAAjUmjv1
 n5Aa9q5v+qHs/8gcWG2427fZ2/JmF5YzNCfxsxA2L2pJY8fxIxeKf+p+EZWSMd8eX+xm
 Kz6ibgKA49SpDnOYTMigIGgqM7B151PgCrKnw5+8jgRdfQQnW/7sMRhBiusrygNoGif7
 cDTg==
X-Gm-Message-State: AOAM53119/YNG22JWY3a8XYUcHv2lwxa//rSkDAh1IkW+Yv44afIAI6p
 GIA6nc6MK5OkBg4b7t7fliWS66u8ZRSCmPFHtEk6aVWzRvBCgnvlRbdRimVocR0lZU2pN39lzPA
 u+RLGj0Re0DYQI+U=
X-Received: by 2002:a5d:56d2:0:b0:212:9250:e18b with SMTP id
 m18-20020a5d56d2000000b002129250e18bmr37186450wrw.672.1654786663894; 
 Thu, 09 Jun 2022 07:57:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO4gcQtqtHL8rEXXKtwtot9oQhG5R/7JJpdbFNNpiWLcw+zqT9lMlQwAy9t9xWqYh21SgNbA==
X-Received: by 2002:a5d:56d2:0:b0:212:9250:e18b with SMTP id
 m18-20020a5d56d2000000b002129250e18bmr37186425wrw.672.1654786663637; 
 Thu, 09 Jun 2022 07:57:43 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 z2-20020adff1c2000000b0020c5253d8dcsm23526244wro.40.2022.06.09.07.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 07:57:43 -0700 (PDT)
Date: Thu, 9 Jun 2022 15:57:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 09/20] migration: convert savevm to use QIOChannelBlock
 for VMState
Message-ID: <YqIKZGm9E1rsJYcT@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-10-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-10-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> With this change, all QEMUFile usage is backed by QIOChannel at
> last.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/savevm.c | 42 ++++--------------------------------------
>  1 file changed, 4 insertions(+), 38 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 75d05f1a84..24a50376dc 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -35,6 +35,7 @@
>  #include "migration/misc.h"
>  #include "migration/register.h"
>  #include "migration/global_state.h"
> +#include "migration/channel-block.h"
>  #include "ram.h"
>  #include "qemu-file-channel.h"
>  #include "qemu-file.h"
> @@ -130,48 +131,13 @@ static struct mig_cmd_args {
>  /***********************************************************/
>  /* savevm/loadvm support */
>  
> -static ssize_t block_writev_buffer(void *opaque, struct iovec *iov, int iovcnt,
> -                                   int64_t pos, Error **errp)
> -{
> -    int ret;
> -    QEMUIOVector qiov;
> -
> -    qemu_iovec_init_external(&qiov, iov, iovcnt);
> -    ret = bdrv_writev_vmstate(opaque, &qiov, pos);
> -    if (ret < 0) {
> -        return ret;
> -    }
> -
> -    return qiov.size;
> -}
> -
> -static ssize_t block_get_buffer(void *opaque, uint8_t *buf, int64_t pos,
> -                                size_t size, Error **errp)
> -{
> -    return bdrv_load_vmstate(opaque, buf, pos, size);
> -}
> -
> -static int bdrv_fclose(void *opaque, Error **errp)
> -{
> -    return bdrv_flush(opaque);
> -}
> -
> -static const QEMUFileOps bdrv_read_ops = {
> -    .get_buffer = block_get_buffer,
> -    .close =      bdrv_fclose
> -};
> -
> -static const QEMUFileOps bdrv_write_ops = {
> -    .writev_buffer  = block_writev_buffer,
> -    .close          = bdrv_fclose
> -};
> -
>  static QEMUFile *qemu_fopen_bdrv(BlockDriverState *bs, int is_writable)
>  {
>      if (is_writable) {
> -        return qemu_fopen_ops(bs, &bdrv_write_ops, false);
> +        return qemu_fopen_channel_output(QIO_CHANNEL(qio_channel_block_new(bs)));
> +    } else {
> +        return qemu_fopen_channel_input(QIO_CHANNEL(qio_channel_block_new(bs)));
>      }
> -    return qemu_fopen_ops(bs, &bdrv_read_ops, false);
>  }
>  
>  
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


