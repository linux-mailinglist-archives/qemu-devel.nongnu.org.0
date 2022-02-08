Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFAA4AD887
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:09:51 +0100 (CET)
Received: from localhost ([::1]:57920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQFi-0003m2-DX
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:09:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOYa-00016o-VL
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:21:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOYV-0007Oq-GQ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644319266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PTKAVwCXohb+RLoJWK0DLjMMfD/VsiYt80mKdvpDscc=;
 b=RZcG1N9pI/2uNYaq0y0z7UNVBwtq4piZmKFRjZpMgmp7sFtiK8B1WApzOPEaBYE/HbeSQ8
 sVhwYFccoq+qRbwTKyjC8plYg2+Sk/xXuiP0/ChgmiJti3R0VMFoVVi6CfiPqQ5D3qcCht
 gYAZe1fBpYGKDj4/XIAcvHx+w5lh81A=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-Tn2p-uSONDGmKRVpv1SkfQ-1; Tue, 08 Feb 2022 06:21:04 -0500
X-MC-Unique: Tn2p-uSONDGmKRVpv1SkfQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 a88-20020a25a1e1000000b00615c588ab22so34796526ybi.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PTKAVwCXohb+RLoJWK0DLjMMfD/VsiYt80mKdvpDscc=;
 b=LmHIe+UXsjjWz0BIWVW4gJ9rT0p8w+KqGbg0PgZMN1AVE3Ey8fRznYixgTmYskVm0/
 4AkhwCuGcWl+BBnMXl3ju5QONcl8LeE3h1KjfaFmvaCAOM53BSZLxH8XY5Id+kiiiucI
 lqXG6rvow7WSiR49PTgGWFLnJLA2g0qBDazdFXmNLwk4PuHrQYwuf0rXxKtZ1m2agOpo
 7QWr34YnhkUoJXnXFSSynb29HkI1T1CiicoQWVfNkVtrTgcHKiQS7ps5Oi3Td5sUKfts
 r7TbKcc+y8IB9LgHm9RCA8V/G3uGWBt2YT9cJ6PtRzQVomqDFZEj2EowVxRbJMHdWM8o
 jX9w==
X-Gm-Message-State: AOAM5317tnwJNDTIsU+XcdW64wKs4RPJmNUawF+qwLHWQ8LDeR362hIM
 s685/pR2RCLUm/RDUUsXitzqsEElG9Y52d2eY3HvfUjN2Q83fwYBU4U5zqfbIyTVY8fbD8lm62q
 JYfVV3LaJhXw9zgy15MriX9+oNp9GUno=
X-Received: by 2002:a81:3e1e:: with SMTP id l30mr4146693ywa.471.1644319263839; 
 Tue, 08 Feb 2022 03:21:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYkNsD3PQPgiPxSqumCe09RI3eDSuv8U2OJbF+3x+YZhW/KONwc8T4/5r0J149PVqyk2rbrygX6yDkB73Xz94=
X-Received: by 2002:a81:3e1e:: with SMTP id l30mr4146680ywa.471.1644319263662; 
 Tue, 08 Feb 2022 03:21:03 -0800 (PST)
MIME-Version: 1.0
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-21-pbonzini@redhat.com>
 <CAPMcbCprEY8S2GwW-pUQquLNC7T9R-D09H2VwAdV2BT6sfVLEw@mail.gmail.com>
In-Reply-To: <CAPMcbCprEY8S2GwW-pUQquLNC7T9R-D09H2VwAdV2BT6sfVLEw@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 8 Feb 2022 13:20:52 +0200
Message-ID: <CAPMcbCp4J9057L7EFwznVnUzYyjyaK5PTAW0-0iiAOf0pkewLA@mail.gmail.com>
Subject: Re: [PATCH 20/27] qga/vss-win32: use widl if available
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009bbcd405d77fe966"
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

--0000000000009bbcd405d77fe966
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Tue, Feb 8, 2022 at 1:14 PM Konstantin Kostiuk <kkostiuk@redhat.com>
wrote:

> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
>
> On Thu, Feb 3, 2022 at 8:08 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> widl from mingw64-tools and wine can compile a TLB file.
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  qga/vss-win32/meson.build | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
>> index 78bdf5e74a..8f3aff5fe3 100644
>> --- a/qga/vss-win32/meson.build
>> +++ b/qga/vss-win32/meson.build
>> @@ -18,15 +18,18 @@ if add_languages('cpp', required: false)
>>    all_qga +=3D qga_vss
>>  endif
>>
>> -# rules to build qga-vss.tlb
>> -# Currently, only native build is supported because building .tlb
>> -# (TypeLibrary) from .idl requires WindowsSDK and MIDL (and cl.exe in
>> VC++).
>>  midl =3D find_program('midl', required: false)
>> +widl =3D find_program('widl', required: false)
>>  if midl.found()
>>    gen_tlb =3D custom_target('gen-tlb',
>>                            input: 'qga-vss.idl',
>>                            output: 'qga-vss.tlb',
>>                            command: [midl, '@INPUT@', '/tlb', '@OUTPUT@
>> '])
>> +elif widl.found()
>> +  gen_tlb =3D custom_target('gen-tlb',
>> +                          input: 'qga-vss.idl',
>> +                          output: 'qga-vss.tlb',
>> +                          command: [widl, '-t', '@INPUT@', '-o',
>> '@OUTPUT@'])
>>  else
>>    gen_tlb =3D custom_target('gen-tlb',
>>                            input: 'qga-vss.tlb',
>> --
>> 2.34.1
>>
>>
>>
>>

--0000000000009bbcd405d77fe966
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 8=
, 2022 at 1:14 PM Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.=
com">kkostiuk@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr">Signed-off-by: Konstantin Kostiuk =
&lt;<a href=3D"mailto:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redha=
t.com</a>&gt;</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, Feb 3, 2022 at 8:08 PM Paolo Bonzini &lt;<a href=3D"ma=
ilto:pbonzini@redhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Marc-A=
ndr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=
=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
widl from mingw64-tools and wine can compile a TLB file.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/vss-win32/meson.build | 9 ++++++---<br>
=C2=A01 file changed, 6 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build<br>
index 78bdf5e74a..8f3aff5fe3 100644<br>
--- a/qga/vss-win32/meson.build<br>
+++ b/qga/vss-win32/meson.build<br>
@@ -18,15 +18,18 @@ if add_languages(&#39;cpp&#39;, required: false)<br>
=C2=A0 =C2=A0all_qga +=3D qga_vss<br>
=C2=A0endif<br>
<br>
-# rules to build qga-vss.tlb<br>
-# Currently, only native build is supported because building .tlb<br>
-# (TypeLibrary) from .idl requires WindowsSDK and MIDL (and cl.exe in VC++=
).<br>
=C2=A0midl =3D find_program(&#39;midl&#39;, required: false)<br>
+widl =3D find_program(&#39;widl&#39;, required: false)<br>
=C2=A0if midl.found()<br>
=C2=A0 =C2=A0gen_tlb =3D custom_target(&#39;gen-tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0input: &#39;qga-vss.idl&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0output: &#39;qga-vss.tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0command: [midl, &#39;@INPUT@&#39;, &#39;/tlb&#39;, =
&#39;@OUTPUT@&#39;])<br>
+elif widl.found()<br>
+=C2=A0 gen_tlb =3D custom_target(&#39;gen-tlb&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 input: &#39;qga-vss.idl&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 output: &#39;qga-vss.tlb&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 command: [widl, &#39;-t&#39;, &#39;@INPUT@&#39;, &#39;-o&=
#39;, &#39;@OUTPUT@&#39;])<br>
=C2=A0else<br>
=C2=A0 =C2=A0gen_tlb =3D custom_target(&#39;gen-tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0input: &#39;qga-vss.tlb&#39;,<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div>

--0000000000009bbcd405d77fe966--


