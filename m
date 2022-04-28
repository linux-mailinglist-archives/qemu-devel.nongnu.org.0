Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B47512F4E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:09:52 +0200 (CEST)
Received: from localhost ([::1]:59952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk09n-0000t2-V2
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1njzzR-0003SO-4z
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 04:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1njzzL-0000Ph-84
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 04:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651136342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PSxigUBiLwCUUCh5hX9i2sszZW/dC3HmEgXM1UxVKYU=;
 b=aTiR7EKOasxBHWm9S/jGcx0QfunuTsVe/P2llPcPTc6J6j6pNVkKRVXed+QWK+MYYTGPbZ
 n/z1KlTl4NpuETE1LJffpLkq1jdptI1gc0Cfe782saHnUyUUWM8Zcke2VtmAmRoWG3+dZX
 qvkvxAncLHkVh7LbbZSFnXGf6/qPiRM=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-Wl24JNEsOzea3-Sv1Uhpag-1; Thu, 28 Apr 2022 04:58:58 -0400
X-MC-Unique: Wl24JNEsOzea3-Sv1Uhpag-1
Received: by mail-yb1-f197.google.com with SMTP id
 r14-20020a25844e000000b00648bdf7491bso4042829ybm.1
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 01:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PSxigUBiLwCUUCh5hX9i2sszZW/dC3HmEgXM1UxVKYU=;
 b=Bm15PiyaYT/2bpIwX1DJhEpbLOdHTARtBMxBG91xjIesT1GkMptW/1DFmN5M0J1BoS
 iLTufaIb3e0snNv0TpEFtVmDkyIPOSokyTcuWLnjSJDoB3KkLoBVlQTqZwq9Lg8BAO2b
 GpOWazf5/eSTh2yHtVq6qW51XcWlG9RYKrmoRwMb//3xPpBejFbobr0Aiycke4K8uC/p
 gY6OYey9cQAPLQ7bz7OTVrUXjLL22ue7kwRQhz/WRCafrZy5IFNtNvAhLnz6l9uSvXNa
 jiBPyXUv2bQnl/CHBLNU96L5dKVjeM3/0aDjrz4DFsjoAZ0Brq2WD662jieZKYe3hdWI
 fgLQ==
X-Gm-Message-State: AOAM532PAtL3R85sYyTFL5Gm/kT6Coh8A1+0haoyHlSqJbnna8SQxjFt
 Zzgdmiz9UBTxeM3htUSCi2RkElCGitUY/dH/r+xzDYSiAM3GJLAumfmSuuQ83LdUkH9gGpQPaR3
 akkgMy9q3f27fu6PZ1wg7ueBGP3XePhY=
X-Received: by 2002:a5b:312:0:b0:633:75de:5ab4 with SMTP id
 j18-20020a5b0312000000b0063375de5ab4mr31549752ybp.124.1651136338064; 
 Thu, 28 Apr 2022 01:58:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz446VM9UtBxB3ypL/mBfF9F6Og1xnOozd/Rh5RSKIxXhcefeN7Krd64ntRnjtd9dz9z9IpmIbQSVDmXsogNI=
X-Received: by 2002:a5b:312:0:b0:633:75de:5ab4 with SMTP id
 j18-20020a5b0312000000b0063375de5ab4mr31549741ybp.124.1651136337869; Thu, 28
 Apr 2022 01:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220428001450.13997-1-helei.sig11@bytedance.com>
In-Reply-To: <20220428001450.13997-1-helei.sig11@bytedance.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 28 Apr 2022 12:58:46 +0400
Message-ID: <CAMxuvawaXHkZMW=sLZwnbdTG2YZCN6ZGaFgFciyogFoqJdjcNQ@mail.gmail.com>
Subject: Re: [PATCH] error-report: fix crash when compute iso8061 time
To: Lei He <helei.sig11@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Apr 28, 2022 at 4:15 AM Lei He <helei.sig11@bytedance.com> wrote:
>
> g_get_real_time() returns the number of MICROSECONDS since
> January 1, 1970 UTC, but g_date_time_new_from_unix_utc() expects
> a timestamp in SECONDS.
>
> Directly call g_data_time_new_from_unix_utc(g_get_real_time()) causes
> overflow and a NULL pointer is returned, then qemu crashes.
>
> Use g_date_time_new_now_utc() instead, and add a check for NULL result.
>
> Signed-off-by: Lei He <helei.sig11@bytedance.com>

A fix is already in Paolo last pull request:
https://patchew.org/QEMU/20220428065335.189795-1-pbonzini@redhat.com/20220428065335.189795-2-pbonzini@redhat.com/

thanks

> ---
>  util/error-report.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/util/error-report.c b/util/error-report.c
> index dbadaf206d..d3c150661d 100644
> --- a/util/error-report.c
> +++ b/util/error-report.c
> @@ -173,10 +173,13 @@ static char *
>  real_time_iso8601(void)
>  {
>  #if GLIB_CHECK_VERSION(2,62,0)
> -    g_autoptr(GDateTime) dt = g_date_time_new_from_unix_utc(g_get_real_time());
> +    g_autoptr(GDateTime) dt = g_date_time_new_now_utc();
>      /* ignore deprecation warning, since GLIB_VERSION_MAX_ALLOWED is 2.56 */
>  #pragma GCC diagnostic push
>  #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
> +    if (!dt) {
> +        return NULL;
> +    }
>      return g_date_time_format_iso8601(dt);
>  #pragma GCC diagnostic pop
>  #else
> @@ -199,8 +202,10 @@ static void vreport(report_type type, const char *fmt, va_list ap)
>
>      if (message_with_timestamp && !monitor_cur()) {
>          timestr = real_time_iso8601();
> -        error_printf("%s ", timestr);
> -        g_free(timestr);
> +        if (timestr) {
> +            error_printf("%s ", timestr);
> +            g_free(timestr);
> +        }
>      }
>
>      /* Only prepend guest name if -msg guest-name and -name guest=... are set */
> --
> 2.11.0
>


