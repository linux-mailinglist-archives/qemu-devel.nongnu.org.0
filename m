Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779F93A2ECC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:57:25 +0200 (CEST)
Received: from localhost ([::1]:56966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrM7Y-0006sv-D9
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lrM45-0001Rk-Px
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:53:49 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:44622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lrM43-0006TQ-4r
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:53:49 -0400
Received: by mail-yb1-xb36.google.com with SMTP id p184so41181181yba.11
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=raft3lpeag/rqtRynAaHlmWg1MOepzdNoG7GEthmT68=;
 b=i1mZ6Kw+5Ugh18G9WL2flSM6gA9nGSynmHPIvHF+j94omhSIEd9el+li0TIXRT8PBi
 EXqeYQTVYPaLtAMgWr0R312Sy+K6iw/fUtfPUtE0o47dhW4IgRZcSRmY3tA21palt7xD
 YOcMs3Kwa0HLzvy2SVeXZhsn3rS0VXK/6anZUNaVugybbT2jpJ5WpVPWFltIb/VDp4vb
 kNy/ik4D/ORT4MhnhdoppaVPqkutAlGVI3O6wd7gbfnzw0rJwCwivYrV+qhy8WM6ii2a
 gjSEvf8a0BwtwofytaEx1D+C2LHQHPTbB7c3cyD0XGVgkYP9gtMjEbVQhm0YSTqfRlqW
 PnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=raft3lpeag/rqtRynAaHlmWg1MOepzdNoG7GEthmT68=;
 b=j1VcPNG6pNDL37k40pkOM6rmgVYGpY1C4+9ZyfwYQRBUZSrgYzi6LWgtdxPqMYILuJ
 lvprTYt/anR5tlmj5hZ76zNJnZkbnfxOqUOfeFmtDxKIEF8f3zWFwNfuMi9MgNdHxj96
 XShtSnInbhebyNT3h3bYak8pwJaiEnK+sHNbe4rs18yuyZoFbQttga4aVFBo3zFnH8r9
 5H1Fs2em7CTn93j7wI9sHnMN3ZryDudb3CgheabnRAlmBpnSYONq9q8R5HM9WFMD1x51
 Cyl1i+3jt2/19mas9cdNMwgtBYmWOayaPaGO2VomoTl2RC3n8fBflaKFKvEfBNMzaV0Q
 QcOA==
X-Gm-Message-State: AOAM531K5tvPytDR3tLaYHf5OZ4/s7UhhRx6qIz/MMn02WAv15sGl5pT
 WgJsOI3ttYVTh5oUHxxttY8uO55nOnJnQnjR1fuSew==
X-Google-Smtp-Source: ABdhPJxhcWpaozeXfCgzNJf+5QSkLU4/etpQrBlb2CFNPp26IL1nq54ZYw/OnQ/8TSN8orkav73IldWDw8+qpzzejp4=
X-Received: by 2002:a25:b74d:: with SMTP id e13mr8180906ybm.372.1623336825920; 
 Thu, 10 Jun 2021 07:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210610143800.3293854-1-konstantin@daynix.com>
 <CAJ+F1C+WhQRd7W4ATJh=QeyRnYULipPFHr38MODwrLc6Gu73eQ@mail.gmail.com>
In-Reply-To: <CAJ+F1C+WhQRd7W4ATJh=QeyRnYULipPFHr38MODwrLc6Gu73eQ@mail.gmail.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Thu, 10 Jun 2021 17:53:35 +0300
Message-ID: <CAJ28CFROd2KPknSoT=P6NS2PzizsTi=K4tKx0dV5By=cqKUDJg@mail.gmail.com>
Subject: Re: [PATCH] qga-win: Free GMatchInfo properly
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000dc31ee05c46a8e49"
Received-SPF: none client-ip=2607:f8b0:4864:20::b36;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dc31ee05c46a8e49
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

For freeing GMatchInfo struct, a special function is required. I'm not sure=
 is
it possible to use g_autoptr in this case or no.
In GLib example
https://developer.gnome.org/glib/stable/glib-Perl-compatible-regular-expres=
sions.html#g-regex-match,
g_match_info_free is used directly.

Best wishes,
Kostiantyn Kostiuk


On Thu, Jun 10, 2021 at 5:41 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Thu, Jun 10, 2021 at 6:38 PM Kostiantyn Kostiuk <konstantin@daynix.com=
>
> wrote:
>
>> The g_regex_match function creates match_info even if it
>> returns FALSE. So we should always call g_match_info_free.
>>
>> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
>> ---
>>  qga/commands-win32.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
>> index 300b87c859..e8bc3df306 100644
>> --- a/qga/commands-win32.c
>> +++ b/qga/commands-win32.c
>> @@ -2497,6 +2497,7 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error
>> **errp)
>>              GMatchInfo *match_info;
>>
>
> What about using g_autoptr instead?
>
>              GuestDeviceIdPCI *id;
>>              if (!g_regex_match(device_pci_re, hw_ids[j], 0,
>> &match_info)) {
>> +                g_match_info_free(match_info);
>>                  continue;
>>              }
>>              skip =3D false;
>> --
>> 2.25.1
>>
>>
>>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--000000000000dc31ee05c46a8e49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi All,<br><br></div>For freeing <span class=3D"=
gmail-im">GMatchInfo struct, a special function is required. I&#39;m not su=
re </span>is it possible to use g_autoptr in this case or no.<br></div>In G=
Lib example <a href=3D"https://developer.gnome.org/glib/stable/glib-Perl-co=
mpatible-regular-expressions.html#g-regex-match">https://developer.gnome.or=
g/glib/stable/glib-Perl-compatible-regular-expressions.html#g-regex-match</=
a>, g_match_info_free is used directly.<br><div><br clear=3D"all"><div><div=
><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr"><div>Best wishes,</div><div>Kostiantyn Kostiuk</d=
iv></div></div></div><br></div></div></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 10, 2021 at 5:41 PM =
Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">ma=
rcandre.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun=
 10, 2021 at 6:38 PM Kostiantyn Kostiuk &lt;<a href=3D"mailto:konstantin@da=
ynix.com" target=3D"_blank">konstantin@daynix.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">The g_regex_match function=
 creates match_info even if it<br>
returns FALSE. So we should always call g_match_info_free.<br>
<br>
Signed-off-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:konstantin@daynix.c=
om" target=3D"_blank">konstantin@daynix.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-win32.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index 300b87c859..e8bc3df306 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -2497,6 +2497,7 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **er=
rp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GMatchInfo *match_info;<br>=
</blockquote><div><br></div><div>What about using g_autoptr instead?</div><=
div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GuestDeviceIdPCI *id;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!g_regex_match(device_p=
ci_re, hw_ids[j], 0, &amp;match_info)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_match_info_free(=
match_info);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skip =3D false;<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div>

--000000000000dc31ee05c46a8e49--

