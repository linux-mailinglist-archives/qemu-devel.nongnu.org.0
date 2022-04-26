Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBA350F178
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 08:47:08 +0200 (CEST)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njEyY-0008U5-Pl
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 02:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1njEtE-00072n-AC
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 02:41:37 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:44975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1njEtC-000503-7d
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 02:41:35 -0400
Received: by mail-qt1-x836.google.com with SMTP id t11so5039942qto.11
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 23:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HRQyGRBrq7hhEkSUPNNs2N6T0xISpadK6QnLQ+DenJI=;
 b=KBWs1bYuPU+2n6nn8t4UEHiQw714PH5HkVGg5qo1ZqXMzrcAYlv98phmJqWYTUKMFI
 qHQ6bZkvEDO8qbLn0R+wnXp41xHp03z5GehqZmRrCXfvHsuPQ+G5+t1IgzJ3ZLI0cbKg
 qF407M/yq5bX9XZrcleFv6+GEGY23jI1jvRl6mlzn1lhoKip1BRdoFWjmSRLDNgPVouV
 KjLdMRuzPCIVTpHOJsOJNQ3ev6YeaGVL0tCRQVdOrfVuHHX/Fbo/JU6hHeh/W0qCX19h
 0e1QG7Q2nZXCb52+zsvw/c8KHao4nNwMQDTJeGbob7lIqzV5sMUrHQHuj/nAjqdON4no
 Bnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HRQyGRBrq7hhEkSUPNNs2N6T0xISpadK6QnLQ+DenJI=;
 b=LDgS8ZCucxT1BlGy/q1POHlIlcKHkPoG63oINgFkqa5CVJDToWCaWMfQ49CsArqx0M
 eBfaxtpepg46I8Nzz6DAIMVzhSwRbERRpSZ/p80aS6RcgjKcOcanwEPzUu2iM+/hA0o4
 1VoyIJTaq9VrIMmnUUfn4uWDaZaBhew2y5gqjRzrQhftBLtOo3Bw4gJseqitpsODLLC7
 otORFS9sw25dt2TD1AP+j3m//ZN3T1rMnmhWZHW8vk8I+NFh0z+OE3qg6SFxamvRwoJw
 +kwCC1N0hNuyUwYjsDsx/iPHS4N+F0NsMNRVkmcSeJD0plnJ1DNQhOq0Ych+y9G0NEE5
 0fbQ==
X-Gm-Message-State: AOAM533KX0VRXQ120WHW58Qih/8u2g07tJ0uVqbt8UmsStA4e9Zi5VuX
 zFi5nht9HVn9IOe+9VWf0L3Xg+BU7cMuRf4h2+Q=
X-Google-Smtp-Source: ABdhPJzogtzofSLgabonnb47/fIrX+redOWV1n370JGHxYCsxP9R3CzoLHppmQMK9R1Wb2GhGlb/ASKr0LJ8kdktSic=
X-Received: by 2002:a05:622a:cc:b0:2f1:fc74:c7a6 with SMTP id
 p12-20020a05622a00cc00b002f1fc74c7a6mr14200997qtw.387.1650955292938; Mon, 25
 Apr 2022 23:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220425204136.2370585-1-farman@linux.ibm.com>
In-Reply-To: <20220425204136.2370585-1-farman@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 26 Apr 2022 10:41:21 +0400
Message-ID: <CAJ+F1C+E2V0VeWvCxmuF=8i+Hp3vfQtvZ50K+kpvd1v=WZq5Hw@mail.gmail.com>
Subject: Re: [PATCH] error-report: Fix GDateTime usage
To: Eric Farman <farman@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000c694b205dd88fb8a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x836.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c694b205dd88fb8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Apr 26, 2022 at 12:43 AM Eric Farman <farman@linux.ibm.com> wrote:

> According to the glib manual:
>
>  - g_date_time_new_from_unix_utc() takes a parameter of the number of
>    SECONDS since the unix epoch
>  - g_get_real_time() returns the number of MICROSECONDS since the
>    unix epoch
>
> Rather than convert the latter with G_USECS_PER_SEC, use the convenient
> g_date_time_new_now_utc() routine to create the GDateTime object.
> This fixes a userspace fault seen when messages get sent to monitor,
> such as when a guest is destroyed.
>
> Fixes: 73dab893b569 ("error-report: replace deprecated
> g_get_current_time() with glib >=3D 2.62")
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
>

Same patch as:
https://patchew.org/QEMU/20220424105036.291370-1-haiyue.wang@intel.com/

thanks

---
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
> 2.32.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c694b205dd88fb8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 26, 2022 at 12:43 AM Er=
ic Farman &lt;<a href=3D"mailto:farman@linux.ibm.com">farman@linux.ibm.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A=
ccording to the glib manual:<br>
<br>
=C2=A0- g_date_time_new_from_unix_utc() takes a parameter of the number of<=
br>
=C2=A0 =C2=A0SECONDS since the unix epoch<br>
=C2=A0- g_get_real_time() returns the number of MICROSECONDS since the<br>
=C2=A0 =C2=A0unix epoch<br>
<br>
Rather than convert the latter with G_USECS_PER_SEC, use the convenient<br>
g_date_time_new_now_utc() routine to create the GDateTime object.<br>
This fixes a userspace fault seen when messages get sent to monitor,<br>
such as when a guest is destroyed.<br>
<br>
Fixes: 73dab893b569 (&quot;error-report: replace deprecated g_get_current_t=
ime() with glib &gt;=3D 2.62&quot;)<br>
Signed-off-by: Eric Farman &lt;<a href=3D"mailto:farman@linux.ibm.com" targ=
et=3D"_blank">farman@linux.ibm.com</a>&gt;<br></blockquote><div><br></div><=
div>Same patch as:<br></div><div><a href=3D"https://patchew.org/QEMU/202204=
24105036.291370-1-haiyue.wang@intel.com/">https://patchew.org/QEMU/20220424=
105036.291370-1-haiyue.wang@intel.com/</a></div><div><br></div><div>thanks<=
br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c694b205dd88fb8a--

