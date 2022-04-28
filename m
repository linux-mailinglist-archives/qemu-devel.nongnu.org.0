Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B1D512F5D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:15:58 +0200 (CEST)
Received: from localhost ([::1]:36916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0Fh-0004gF-3V
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1nk09u-0002KS-HX
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:09:58 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1nk09p-000256-9k
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:09:55 -0400
Received: by mail-pl1-x634.google.com with SMTP id k4so3801761plk.7
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=+qMMI8u5iv04Cdwhn2EecTivqRUuVurVglIU3BXC1lo=;
 b=CzMzUudedDVICukwcyZJgThm5TNvg6LaQPmo7bVXMukx1LzhuFx0ps5s3idnqVIgEu
 cnrj+mUEQsjPkaNTDe5LEny414/ErPeiBgisklW8f54PbtQFVm8KBhMqu5CL2+JWAtMT
 IC+2sMJP5x5qRmZEXtZ1YI1AnOZDxNs1JQRb/mQP5D0fI3ILw5j1q+vsqJ6gC8os4g2R
 NBUuAyGzSIxcFN8ENOzD+uKLd5N3+MJwNt/JbyGEHPcb7W1/TVV5c6rSgvWFQO6qIrvW
 kTk/BK5z0abNcWC2no005eKgZXTE1vk9ZBQSn1YdA0b/CFMcJM3aS33/QyGLlKOELvnI
 GrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=+qMMI8u5iv04Cdwhn2EecTivqRUuVurVglIU3BXC1lo=;
 b=g6777XJ43D9VUxxkYR2RpPsGli6UD/2ofmrFNXJiP7FNQ3EVfMMtDzk0TTH896a3Hj
 CNXpD4ILsE4jQ3Wvx3j3ed7+DpHyssD9Fvp4g50we/K6YUKUPfGe+UixplprsFZHRjMi
 +smuJDTTpOB3Dm4lgRmD+72A5iS74N6vPIugbWds5wXTx9+5v+I1jILnRK90tMbHGiZn
 Z9gbPP9LnEEh3UafSL4vOGKO2OisNffEeccn2feKWRwzgNAm8meIwaLlrzBUZGyhnyoO
 qfzkAlUNZUgIbLQCuytxjCxjh9snXPmL4sbfwkzVNgxjCwT0/ltDj1OSbjFvt716Aj/8
 Ceuw==
X-Gm-Message-State: AOAM5320rw7D0jUGQFKuVLW/235YFH8z5hjWToqc3yaAci4U6BsHofVC
 7oh2Ynv1zt0fEnEkvx7ndXZPgQ==
X-Google-Smtp-Source: ABdhPJyVqglqqi+F1QLUaIHMkzewE9K2Dy8b3wpb6G00L3kKS1K/AV+spHcWWQTGVrOhoG8+4czm3g==
X-Received: by 2002:a17:902:728f:b0:156:24d3:ae1a with SMTP id
 d15-20020a170902728f00b0015624d3ae1amr32548081pll.9.1651136991512; 
 Thu, 28 Apr 2022 02:09:51 -0700 (PDT)
Received: from [10.254.82.118] ([139.177.225.230])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a635915000000b003c14af50644sm2033589pgb.92.2022.04.28.02.09.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Apr 2022 02:09:50 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [External] [PATCH] error-report: fix crash when compute iso8061
 time
From: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>
In-Reply-To: <CAMxuvawaXHkZMW=sLZwnbdTG2YZCN6ZGaFgFciyogFoqJdjcNQ@mail.gmail.com>
Date: Thu, 28 Apr 2022 17:09:46 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <F4AA30DD-A843-4B93-9F21-DB9158F01656@bytedance.com>
References: <20220428001450.13997-1-helei.sig11@bytedance.com>
 <CAMxuvawaXHkZMW=sLZwnbdTG2YZCN6ZGaFgFciyogFoqJdjcNQ@mail.gmail.com>
To: =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fine, just ignore this patch.

> On Apr 28, 2022, at 4:58 PM, Marc-Andr=C3=A9 Lureau =
<marcandre.lureau@redhat.com> wrote:
>=20
> Hi
>=20
> On Thu, Apr 28, 2022 at 4:15 AM Lei He <helei.sig11@bytedance.com> =
wrote:
>>=20
>> g_get_real_time() returns the number of MICROSECONDS since
>> January 1, 1970 UTC, but g_date_time_new_from_unix_utc() expects
>> a timestamp in SECONDS.
>>=20
>> Directly call g_data_time_new_from_unix_utc(g_get_real_time()) causes
>> overflow and a NULL pointer is returned, then qemu crashes.
>>=20
>> Use g_date_time_new_now_utc() instead, and add a check for NULL =
result.
>>=20
>> Signed-off-by: Lei He <helei.sig11@bytedance.com>
>=20
> A fix is already in Paolo last pull request:
> =
https://patchew.org/QEMU/20220428065335.189795-1-pbonzini@redhat.com/20220=
428065335.189795-2-pbonzini@redhat.com/
>=20
> thanks
>=20
>> ---
>> util/error-report.c | 11 ++++++++---
>> 1 file changed, 8 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/util/error-report.c b/util/error-report.c
>> index dbadaf206d..d3c150661d 100644
>> --- a/util/error-report.c
>> +++ b/util/error-report.c
>> @@ -173,10 +173,13 @@ static char *
>> real_time_iso8601(void)
>> {
>> #if GLIB_CHECK_VERSION(2,62,0)
>> -    g_autoptr(GDateTime) dt =3D =
g_date_time_new_from_unix_utc(g_get_real_time());
>> +    g_autoptr(GDateTime) dt =3D g_date_time_new_now_utc();
>>     /* ignore deprecation warning, since GLIB_VERSION_MAX_ALLOWED is =
2.56 */
>> #pragma GCC diagnostic push
>> #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
>> +    if (!dt) {
>> +        return NULL;
>> +    }
>>     return g_date_time_format_iso8601(dt);
>> #pragma GCC diagnostic pop
>> #else
>> @@ -199,8 +202,10 @@ static void vreport(report_type type, const char =
*fmt, va_list ap)
>>=20
>>     if (message_with_timestamp && !monitor_cur()) {
>>         timestr =3D real_time_iso8601();
>> -        error_printf("%s ", timestr);
>> -        g_free(timestr);
>> +        if (timestr) {
>> +            error_printf("%s ", timestr);
>> +            g_free(timestr);
>> +        }
>>     }
>>=20
>>     /* Only prepend guest name if -msg guest-name and -name guest=3D...=
 are set */
>> --
>> 2.11.0
>>=20
>=20


