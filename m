Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3348C4AD87D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:02:22 +0100 (CET)
Received: from localhost ([::1]:48646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQ8S-0004up-Pc
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:02:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOYJ-0000tZ-TI
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:20:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOYH-0007Mn-Kb
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644319252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H/yYORd2bCxfaBsIH2KJ3+BmA2sxZX+nIAmyQ6OxujE=;
 b=KUGYJpDO3raNGBQsDh+FTcYSE4qWVINyu5p9f0BDi5pzCnuDnhzEBA0gj2EUBAwL3GgK3T
 W/P3ErMfHE6VeXMZaulSASj2lNNWA1CwU7bsL9xX4NlfJ1AfOGcr40H5wqttVzQIsepfan
 NT9LcPT06kEyyyBRdq5ylPP0xSjE3rg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-440G0B31MLudirmG7_2quA-1; Tue, 08 Feb 2022 06:20:51 -0500
X-MC-Unique: 440G0B31MLudirmG7_2quA-1
Received: by mail-yb1-f197.google.com with SMTP id
 a88-20020a25a1e1000000b00615c588ab22so34795745ybi.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H/yYORd2bCxfaBsIH2KJ3+BmA2sxZX+nIAmyQ6OxujE=;
 b=SNysmccMhBCS+68qcoE5dIFHwKb3d1Tim+pJnpu8X1ANdEnkWCr5r4GhDdownPqs3j
 CA1MJDKY1neSaMH3EaojZ6tnurVukgguMNhC5W3t36dJ1ixghVLb9wezw0AFPNAnmIzU
 ZPqgipvs4hBztj+s729jw0igk+yrcqHffiReCoBxffAp0ktf4PxYw7lQEWOP3G8f2pWs
 X54FZtRgnZU3O1+QmOUtpRa6AHvcn2cJhrT5YK1dXKENI5n9PvKALh5X3srZisHlSZ/v
 EJXVvG0y3kMw4TN3TYy0Ep4adGH5WTxn4fRqufY9h6Rg5+3w7vzTviAlCxHTygVkSwym
 InhQ==
X-Gm-Message-State: AOAM531ezNf4Lna8haOUwz8U+NTXYvejVKoiM9v12GXVJmfRaabDiv7K
 xk50xHuhN3uZ9L909078rBqd+b9htmYf50DlsvYywXv3xS8bQgMzw2gtxkSAV+UiqVkJX7y3Q7X
 nkoGCqs3Yc+RUJqz5rgFqr2T/HJmgcyU=
X-Received: by 2002:a05:6902:1542:: with SMTP id
 r2mr4438064ybu.674.1644319250750; 
 Tue, 08 Feb 2022 03:20:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkZVKnyDgl82O+YdHjhtVMFVxc08wCosm8foI0tRZO8VnCUa4s3/eK53XmgED5Jntc0kZiqEuPxkteDa2eK88=
X-Received: by 2002:a05:6902:1542:: with SMTP id
 r2mr4438057ybu.674.1644319250574; 
 Tue, 08 Feb 2022 03:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-19-pbonzini@redhat.com>
 <CAPMcbCq1poYW_dkf4yFayQRU6CYgMUzHSjQ7GjFSQ4tziH8F5w@mail.gmail.com>
In-Reply-To: <CAPMcbCq1poYW_dkf4yFayQRU6CYgMUzHSjQ7GjFSQ4tziH8F5w@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 8 Feb 2022 13:20:39 +0200
Message-ID: <CAPMcbCqWdsXjmFxE7VNta0m7BSUMXmU6sUtkiC7b9yF2Yfa8nA@mail.gmail.com>
Subject: Re: [PATCH 18/27] qga/vss-win32: fix midl arguments
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d408bb05d77fe86a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d408bb05d77fe86a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Tue, Feb 8, 2022 at 1:13 PM Konstantin Kostiuk <kkostiuk@redhat.com>
wrote:

> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
>
>
>
> On Thu, Feb 3, 2022 at 8:16 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> Microsoft midl compiler doesn't take "-options" form, nor does it take
>> OUTPUT filename. The -I option seems needless as well (at least with
>> VS15).
>>
>> It's not clear what was actually used when it was introduced in commit
>> b39297aedfabe9.
>>
>> strings says "Created by MIDL version 7.00.0555 at Fri Dec 21 13:36:39
>> 2012".
>>
>> I doubt the makefile rule actually ever worked.
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  qga/vss-win32/meson.build | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
>> index 90825edef3..78bdf5e74a 100644
>> --- a/qga/vss-win32/meson.build
>> +++ b/qga/vss-win32/meson.build
>> @@ -26,8 +26,7 @@ if midl.found()
>>    gen_tlb =3D custom_target('gen-tlb',
>>                            input: 'qga-vss.idl',
>>                            output: 'qga-vss.tlb',
>> -                          command: [midl, '-tlb', '-I' +
>> config_host['WIN_SDK'],
>> -                                     '@INPUT@', '@OUTPUT@'])
>> +                          command: [midl, '@INPUT@', '/tlb', '@OUTPUT@
>> '])
>>  else
>>    gen_tlb =3D custom_target('gen-tlb',
>>                            input: 'qga-vss.tlb',
>> --
>> 2.34.1
>>
>>
>>
>>

--000000000000d408bb05d77fe86a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 8=
, 2022 at 1:13 PM Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.=
com">kkostiuk@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Signed-off-by: Ko=
nstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com" target=3D"_blan=
k">kkostiuk@redhat.com</a>&gt;<div><div dir=3D"ltr"><div dir=3D"ltr"><br></=
div></div></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, Feb 3, 2022 at 8:16 PM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzini@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" =
target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Microsoft midl compiler doesn&#39;t take &quot;-options&quot; form, nor doe=
s it take<br>
OUTPUT filename. The -I option seems needless as well (at least with<br>
VS15).<br>
<br>
It&#39;s not clear what was actually used when it was introduced in commit<=
br>
b39297aedfabe9.<br>
<br>
strings says &quot;Created by MIDL version 7.00.0555 at Fri Dec 21 13:36:39=
<br>
2012&quot;.<br>
<br>
I doubt the makefile rule actually ever worked.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/vss-win32/meson.build | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build<br>
index 90825edef3..78bdf5e74a 100644<br>
--- a/qga/vss-win32/meson.build<br>
+++ b/qga/vss-win32/meson.build<br>
@@ -26,8 +26,7 @@ if midl.found()<br>
=C2=A0 =C2=A0gen_tlb =3D custom_target(&#39;gen-tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0input: &#39;qga-vss.idl&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0output: &#39;qga-vss.tlb&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 command: [midl, &#39;-tlb&#39;, &#39;-I&#39; + config_hos=
t[&#39;WIN_SDK&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;@INPUT@&#39=
;, &#39;@OUTPUT@&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 command: [midl, &#39;@INPUT@&#39;, &#39;/tlb&#39;, &#39;@=
OUTPUT@&#39;])<br>
=C2=A0else<br>
=C2=A0 =C2=A0gen_tlb =3D custom_target(&#39;gen-tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0input: &#39;qga-vss.tlb&#39;,<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div>

--000000000000d408bb05d77fe86a--


