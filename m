Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511FF3B881F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:01:53 +0200 (CEST)
Received: from localhost ([::1]:55582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyeX2-00057n-9S
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyeVI-00049d-DR
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:00:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyeVG-0005pv-8X
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625076001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HEZQlS1IHAIzBisPTZxboxOrbHNSR3sz8YQ3UADXcfs=;
 b=EU+Lo7u1bY/7D0r12RZD7sdMNH8NfgoPzvqwkYX/iXGalwayqnoNrMoxEq8Wfyl1AIkSvJ
 /kiXOGtcXD4u2v/kJd7roUWM2B46zOF+4mg/JxlBuaVKD//y76fcCK5r/JK4tM318ppGFG
 lwVaVlJuDw/vNdX524dgp05KjdLJipc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-EWjOsG_5NX-wqMjeb_0cuA-1; Wed, 30 Jun 2021 13:59:59 -0400
X-MC-Unique: EWjOsG_5NX-wqMjeb_0cuA-1
Received: by mail-wm1-f72.google.com with SMTP id
 z127-20020a1c7e850000b02901e46e4d52c0so3164535wmc.6
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 10:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=HEZQlS1IHAIzBisPTZxboxOrbHNSR3sz8YQ3UADXcfs=;
 b=cG9xgwQgnuvUKj8P2LyBdpV1cWsnnAkGS2N82kIQUDL4vrjr3CDWB+pVKVDnIKjUgO
 Xnuejy5iahKYkohkNtqa+yhwhh5/u4yn1lhzoXK0VQnkumtsnZYPNr0qfLY9iV5nkWXr
 grLrYHNFrpCPs7vLg9mySG9bj4Aimyu9G69O1yqiZuyiNfLu07BxGg4rd6sJoKNFmRaB
 h1PkMaLRQNwdR23iJeDtjTV/klTnByTITxOiMJKK706HYWRe6gqXMt3qJhl+VNHm6mxN
 30xK1Us9AnuwLeVlRsGhn1PakKG7Hf/jZbcYvzKCkcUEZ25j4hyGmEXALhfzNKWYrlo8
 21OA==
X-Gm-Message-State: AOAM530hqLOfYG9wIj0V9Hktn4Bi5a02hP+ZiPhC9VDVRm8nI6GI7BcG
 ltQ770i7RKYy81ysNp2kPFibEAW3rCAMGCOFc4gOvIps05E4oCML6vAffB+WgnaZpIQBaaQnvcA
 iXMT4f6tPR6h5csU=
X-Received: by 2002:a05:600c:354f:: with SMTP id
 i15mr6136538wmq.24.1625075998648; 
 Wed, 30 Jun 2021 10:59:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDhTsnvCWAB32h0pi+WJnCduBVDy+SX0N1fk+zm5ghf2a5G6+273Pc/Pv3BNX03ti3MWdt6w==
X-Received: by 2002:a05:600c:354f:: with SMTP id
 i15mr6136521wmq.24.1625075998415; 
 Wed, 30 Jun 2021 10:59:58 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id t9sm15645257wrq.92.2021.06.30.10.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 10:59:57 -0700 (PDT)
Date: Wed, 30 Jun 2021 18:59:56 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2] virtiofsd: use GDateTime for formatting timestamp for
 debug messages
Message-ID: <YNyxHD2mzvs/D1nS@work-vm>
References: <20210611164319.67762-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210611164319.67762-1-berrange@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> The GDateTime APIs provided by GLib avoid portability pitfalls, such
> as some platforms where 'struct timeval.tv_sec' field is still 'long'
> instead of 'time_t'. When combined with automatic cleanup, GDateTime
> often results in simpler code too.
> 
> Localtime is changed to UTC to avoid the need to grant extra seccomp
> permissions for GLib's access of the timezone database.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Queued
> ---
>  tools/virtiofsd/passthrough_ll.c | 25 ++++---------------------
>  1 file changed, 4 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 49c21fd855..9858e961d9 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -3559,10 +3559,6 @@ static void setup_nofile_rlimit(unsigned long rlimit_nofile)
>  static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
>  {
>      g_autofree char *localfmt = NULL;
> -    struct timespec ts;
> -    struct tm tm;
> -    char sec_fmt[sizeof "2020-12-07 18:17:54"];
> -    char zone_fmt[sizeof "+0100"];
>  
>      if (current_log_level < level) {
>          return;
> @@ -3574,23 +3570,10 @@ static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
>              localfmt = g_strdup_printf("[ID: %08ld] %s", syscall(__NR_gettid),
>                                         fmt);
>          } else {
> -            /* try formatting a broken-down timestamp */
> -            if (clock_gettime(CLOCK_REALTIME, &ts) != -1 &&
> -                localtime_r(&ts.tv_sec, &tm) != NULL &&
> -                strftime(sec_fmt, sizeof sec_fmt, "%Y-%m-%d %H:%M:%S",
> -                         &tm) != 0 &&
> -                strftime(zone_fmt, sizeof zone_fmt, "%z", &tm) != 0) {
> -                localfmt = g_strdup_printf("[%s.%02ld%s] [ID: %08ld] %s",
> -                                           sec_fmt,
> -                                           ts.tv_nsec / (10L * 1000 * 1000),
> -                                           zone_fmt, syscall(__NR_gettid),
> -                                           fmt);
> -            } else {
> -                /* fall back to a flat timestamp */
> -                localfmt = g_strdup_printf("[%" PRId64 "] [ID: %08ld] %s",
> -                                           get_clock(), syscall(__NR_gettid),
> -                                           fmt);
> -            }
> +            g_autoptr(GDateTime) now = g_date_time_new_now_utc();
> +            g_autofree char *nowstr = g_date_time_format(now, "%Y-%m-%d %H:%M:%S.%f%z");
> +            localfmt = g_strdup_printf("[%s] [ID: %08ld] %s",
> +                                       nowstr, syscall(__NR_gettid), fmt);
>          }
>          fmt = localfmt;
>      }
> -- 
> 2.31.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


