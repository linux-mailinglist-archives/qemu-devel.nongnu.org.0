Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C14759F9F4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 14:29:55 +0200 (CEST)
Received: from localhost ([::1]:34316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQpW6-0006OA-9W
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 08:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oQoCk-0007tZ-Hc
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 07:05:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oQoCf-000666-Nh
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 07:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661339144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oHttoDAJpBHmw/vD8R/xq0QOu383B+UhEzHrr9zu6+Y=;
 b=WHKG6bXnCaXh03e4AwDTIrHnuRClfh3rO6SE2bHW6v4kTlIIVhsIihrAmBxA1SQDX+bOjF
 FXGr+z0QG8jM9DqCk0hMaYe29ZFcHpfZCe/d/f1W1NHSK/IjhB/hNM17RXI9l/Tm2XLayH
 BXqZxCvG4BZY50MlZlFVwO0+QSQyTyw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-110-U0X590X5MFiwDPFV6bB57Q-1; Wed, 24 Aug 2022 07:05:42 -0400
X-MC-Unique: U0X590X5MFiwDPFV6bB57Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 i29-20020adfa51d000000b002251fd0ff14so2706924wrb.16
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 04:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=oHttoDAJpBHmw/vD8R/xq0QOu383B+UhEzHrr9zu6+Y=;
 b=GxsjYBxefXz0Zgt6bQHhE2be4/KeVQOR5zWHVE8P5KYwxXF3A1tYyR65Y39FpP0nUZ
 cjFgIVtjVCPgMlOopd/53oWyLkPMPbO/0F6DtWOCdt1jd9ZNKRWwlYxDuApjWuUmfiQ+
 PkeDVMM9Xx27lCDcTurUFT4/zTM6w95xxRlrRK/jz7Be/B5bq9U/7ACZybqMNS4EgCnL
 LEMcnkVoixjyrC+gWXPMF7Q26JcvsXWe/3EcyY1HK/jOkk/aSm4eIO+LGXLszxAVitFe
 4ifqAb0pm2NeSU7ldXBMR5363lNnAHs90hbM4s/RDAWwceLygGNCvZqhfjDcdwRvNga2
 2Rrg==
X-Gm-Message-State: ACgBeo3asCk6ZqRYGBlGAEt7JNtE3Ux1sB3O5EF/I4Xcb4GNNIm0QQGN
 JCe1+6Kb20Dob5Y57tXcjwfmYQoiVpu6Rp6cC5inOxFyR5IBSvsaVcYOyRdClrZw9bzRw7NY5wk
 1ESg+Fu9yUXs6xto=
X-Received: by 2002:a05:600c:a08:b0:3a1:9319:ab78 with SMTP id
 z8-20020a05600c0a0800b003a19319ab78mr4811095wmp.158.1661339141385; 
 Wed, 24 Aug 2022 04:05:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7RvtOx6d0Wura8KHx8V9mliPChlmN+ZYzoUj5R/nckeX9nMWSfTqcCIuXiVZhMT0lYkUIz2g==
X-Received: by 2002:a05:600c:a08:b0:3a1:9319:ab78 with SMTP id
 z8-20020a05600c0a0800b003a19319ab78mr4811077wmp.158.1661339141120; 
 Wed, 24 Aug 2022 04:05:41 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 b5-20020a05600c4e0500b003a331c6bffdsm1460464wmq.47.2022.08.24.04.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 04:05:40 -0700 (PDT)
Date: Wed, 24 Aug 2022 12:05:38 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Yusuke Okada <yokada.996@gmail.com>, berrange@redhat.com,
 marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Yusuke Okada <okada.yusuke@jp.fujitsu.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH] virtiofsd: use g_date_time_get_microsecond to get
 subsecond
Message-ID: <YwYGAuPjexuazlC2@work-vm>
References: <20220818184618.2205172-1-yokada.996@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818184618.2205172-1-yokada.996@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

* Yusuke Okada (yokada.996@gmail.com) wrote:
> From: Yusuke Okada <okada.yusuke@jp.fujitsu.com>
> 
> The "%f" specifier in g_date_time_format() is only available in glib
> 2.65.2 or later. If combined with older glib, the function returns null
> and the timestamp displayed as "(null)".

Well spotted; thanks for the patch.
I notice there's also a use in rocker and qga (Copying Dan and
Marc-Andre in who added them)

> For backward compatibility, g_date_time_get_microsecond should be used
> to retrieve subsecond.
> 
> In this patch the g_date_time_format() leaves subsecond field as "%06d"
> and let next snprintf to format with g_date_time_get_microsecond.
> 
> Signed-off-by: Yusuke Okada <okada.yusuke@jp.fujitsu.com>


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/passthrough_ll.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 371a7bead6..20f0f41f99 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -4185,6 +4185,7 @@ static void setup_nofile_rlimit(unsigned long rlimit_nofile)
>  static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
>  {
>      g_autofree char *localfmt = NULL;
> +    char buf[64];
>  
>      if (current_log_level < level) {
>          return;
> @@ -4197,9 +4198,11 @@ static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
>                                         fmt);
>          } else {
>              g_autoptr(GDateTime) now = g_date_time_new_now_utc();
> -            g_autofree char *nowstr = g_date_time_format(now, "%Y-%m-%d %H:%M:%S.%f%z");
> +            g_autofree char *nowstr = g_date_time_format(now,
> +                                       "%Y-%m-%d %H:%M:%S.%%06d%z");
> +            snprintf(buf, 64, nowstr, g_date_time_get_microsecond(now));
>              localfmt = g_strdup_printf("[%s] [ID: %08ld] %s",
> -                                       nowstr, syscall(__NR_gettid), fmt);
> +                                       buf, syscall(__NR_gettid), fmt);
>          }
>          fmt = localfmt;
>      }
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


