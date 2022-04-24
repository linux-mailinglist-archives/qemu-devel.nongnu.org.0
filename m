Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1924050D1B8
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 14:34:37 +0200 (CEST)
Received: from localhost ([::1]:56840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nibRk-0006pr-7B
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 08:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nibPc-0005L6-0k
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 08:32:24 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:39457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nibPZ-0004fG-0W
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 08:32:22 -0400
Received: by mail-qk1-x72e.google.com with SMTP id q75so9031086qke.6
 for <qemu-devel@nongnu.org>; Sun, 24 Apr 2022 05:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=baeatTTqS4bBftsgT9vK4n+cMKdGkMntKNQIHWKcJfc=;
 b=XcS9Ch9Ei1/mNJirVGsM0QGjeOr/NWVZgHWbP7HCxxrRqallgz57C3ca47TOp7Ky9e
 qm2ncvUSw++O+QnBIbEymVPD4ii1/L95Yge4OvXEp88lh59gP9qWO4IPVSsCzVxdvCOW
 JNKbC9Oe+KwCqszu7r2xmW9oMkckvt+v7R21xr4VyTjDIivyADScvdcJqCY/C0mwt9XB
 iY9cRp3mCFQQBaMMBM6p6YZ1rghgc8+ovQnynhtpq+U60Twi8Kk3gzJ6Jr0qIDdFZZOS
 mYx2x5TynMdMgXdH5gfL5JUdZof563xSfypCCtF/5YSsGksNytnLHSvB2IHktkgDUEtm
 VpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=baeatTTqS4bBftsgT9vK4n+cMKdGkMntKNQIHWKcJfc=;
 b=Rz9j03Ba6h7s1+TzpTrN/+Vd0sE8/9dqM/P+tskBxfyGv0iLwW4J4hlnHpuELNN3A4
 tzSA6brsYL2qyAR6Eq7Yg6SodxRnRWbCDYz9T+KpLRSw+1OxYQfL/x+lzgg8ggQ9MF9a
 1rP3mo5hdpnHW0IdA+WMaAUBqaOLIO2QGntO6e9IQFX+TUuETcAjpl9J8+mcgg0145vU
 PReNpM43QPlvhi2sSU/2E8PLQUtGqRRNBGPHxBWUZg6fUDet3ON3VwbEX5vYMSfPFudC
 eaaY0T4KtgBbBvXAREwtBPjvyFhBTth97LpZjhuqQ6t47dJ6SUDcaRVwF73lpwYvfqV7
 RIsg==
X-Gm-Message-State: AOAM530KFjLlTRv3CosWeMLRTqHFmS6pJiXGoA4dWIojNxkklU5Zi5P9
 loYnRSD5NsIYbEVQYJzmRGV3Wh9EHrZqLNQp0Is=
X-Google-Smtp-Source: ABdhPJwsMZYaC5CEmKmmAA6ofG1AGfCYfyJpK4c3gon4+B9UVh5E79TptqWQFSlKtWklVmSiqyWmE/M8hNv3U3D2zFw=
X-Received: by 2002:a37:aa48:0:b0:69e:d351:9683 with SMTP id
 t69-20020a37aa48000000b0069ed3519683mr7346903qke.539.1650803539523; Sun, 24
 Apr 2022 05:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220424103120.284688-1-haiyue.wang@intel.com>
 <20220424105036.291370-1-haiyue.wang@intel.com>
In-Reply-To: <20220424105036.291370-1-haiyue.wang@intel.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 24 Apr 2022 16:32:08 +0400
Message-ID: <CAJ+F1C+GBthjhPfjfora937=6gPiP4saJgDAA=mHKLvGr_1sQg@mail.gmail.com>
Subject: Re: [PATCH v2] error-report: fix g_date_time_format assertion
To: Haiyue Wang <haiyue.wang@intel.com>
Content-Type: multipart/alternative; boundary="000000000000913c2205dd65a692"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000913c2205dd65a692
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 24, 2022 at 3:27 PM Haiyue Wang <haiyue.wang@intel.com> wrote:

> The 'g_get_real_time' returns the number of microseconds since January
> 1, 1970 UTC, but 'g_date_time_new_from_unix_utc' needs the number of
> seconds, so it will cause the invalid time input:
>
> (process:279642): GLib-CRITICAL (recursed) **: g_date_time_format:
> assertion 'datetime !=3D NULL' failed
>
> Call function 'g_date_time_new_now_utc' instead, it has the same result
> as 'g_date_time_new_from_unix_utc(g_get_real_time() / G_USEC_PER_SEC)';
>
> Fixes: 73dab893b569 ("error-report: replace deprecated
> g_get_current_time() with glib >=3D 2.62")
> Signed-off-by: Haiyue Wang <haiyue.wang@intel.com>
>

Thanks, my bad
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
> v2: use 'g_date_time_new_now_utc' directly, which handles the time
>     zone reference correctly.
> ---
>  util/error-report.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/util/error-report.c b/util/error-report.c
> index dbadaf206d..5edb2e6040 100644
> --- a/util/error-report.c
> +++ b/util/error-report.c
> @@ -173,7 +173,7 @@ static char *
>  real_time_iso8601(void)
>  {
>  #if GLIB_CHECK_VERSION(2,62,0)
> -    g_autoptr(GDateTime) dt =3D
> g_date_time_new_from_unix_utc(g_get_real_time());
> +    g_autoptr(GDateTime) dt =3D g_date_time_new_now_utc();
>      /* ignore deprecation warning, since GLIB_VERSION_MAX_ALLOWED is 2.5=
6
> */
>  #pragma GCC diagnostic push
>  #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
> --
> 2.36.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000913c2205dd65a692
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 24, 2022 at 3:27 PM Haiyu=
e Wang &lt;<a href=3D"mailto:haiyue.wang@intel.com">haiyue.wang@intel.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Th=
e &#39;g_get_real_time&#39; returns the number of microseconds since Januar=
y<br>
1, 1970 UTC, but &#39;g_date_time_new_from_unix_utc&#39; needs the number o=
f<br>
seconds, so it will cause the invalid time input:<br>
<br>
(process:279642): GLib-CRITICAL (recursed) **: g_date_time_format: assertio=
n &#39;datetime !=3D NULL&#39; failed<br>
<br>
Call function &#39;g_date_time_new_now_utc&#39; instead, it has the same re=
sult<br>
as &#39;g_date_time_new_from_unix_utc(g_get_real_time() / G_USEC_PER_SEC)&#=
39;;<br>
<br>
Fixes: 73dab893b569 (&quot;error-report: replace deprecated g_get_current_t=
ime() with glib &gt;=3D 2.62&quot;)<br>
Signed-off-by: Haiyue Wang &lt;<a href=3D"mailto:haiyue.wang@intel.com" tar=
get=3D"_blank">haiyue.wang@intel.com</a>&gt;<br></blockquote><div><br></div=
><div>Thanks, my bad</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a h=
ref=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&=
gt;</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
---<br>
v2: use &#39;g_date_time_new_now_utc&#39; directly, which handles the time<=
br>
=C2=A0 =C2=A0 zone reference correctly.<br>
---<br>
=C2=A0util/error-report.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/util/error-report.c b/util/error-report.c<br>
index dbadaf206d..5edb2e6040 100644<br>
--- a/util/error-report.c<br>
+++ b/util/error-report.c<br>
@@ -173,7 +173,7 @@ static char *<br>
=C2=A0real_time_iso8601(void)<br>
=C2=A0{<br>
=C2=A0#if GLIB_CHECK_VERSION(2,62,0)<br>
-=C2=A0 =C2=A0 g_autoptr(GDateTime) dt =3D g_date_time_new_from_unix_utc(g_=
get_real_time());<br>
+=C2=A0 =C2=A0 g_autoptr(GDateTime) dt =3D g_date_time_new_now_utc();<br>
=C2=A0 =C2=A0 =C2=A0/* ignore deprecation warning, since GLIB_VERSION_MAX_A=
LLOWED is 2.56 */<br>
=C2=A0#pragma GCC diagnostic push<br>
=C2=A0#pragma GCC diagnostic ignored &quot;-Wdeprecated-declarations&quot;<=
br>
-- <br>
2.36.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000913c2205dd65a692--

