Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83124AD83A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:19:31 +0100 (CET)
Received: from localhost ([::1]:41210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPT0-0003Ap-W1
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:19:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHORT-0000UA-97
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:13:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHORP-00063G-Gq
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644318826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J1WURe8EukujoOz559a5U44ay6ulUdrmrWgsL+1Iwbc=;
 b=DdVy2tgyX48cxoolbQ/obtMirLBOWsWmTjvqWtL1nbeAy+pXRM89yDd08LSftKgqT13vAO
 ll2AwVinYsS988JMRKvYa175kvsh84GSy+S4VazvPwxztIvL+Uv6fx2j9krtoE6vXCgC2g
 OlWIBkgtxvi14123GWMohwoWJWbyqCc=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-poqTjxTqNOOlnK8QBIWuuQ-1; Tue, 08 Feb 2022 06:13:44 -0500
X-MC-Unique: poqTjxTqNOOlnK8QBIWuuQ-1
Received: by mail-yb1-f200.google.com with SMTP id
 127-20020a250f85000000b00611ab6484abso34567448ybp.23
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J1WURe8EukujoOz559a5U44ay6ulUdrmrWgsL+1Iwbc=;
 b=nsv+psJ8XtqZ8otn7leaObh61qt+XMhNpuMcvCmWcZDtB4bVuQ7AXilPCXb66rTcid
 Hp9t+h4PdkdTROTlbripHG5l1hyyiy1sIV92Iy9w3mXgNj470m61jvbgQbmvMGkBjH2h
 Hg43J6HFjqmW/hhzt8F1i4TyfAu+zzi9wrDA1SceDf2saM8jnOFaxlUS04rGX9qf4YtU
 MEsyMrErkhZdKFRkq8tjWbYKlqBGY9UHUEH22OvvI4hXVAcQHOWgmvDphdU6mUqiSGV7
 Q7iZcb9hudYJzeGoOnOoONALXLkSa9UeETI+fMDykJoaFeKqgVy3YjcBNAEmMViJzXf0
 gZfg==
X-Gm-Message-State: AOAM533spfmM0tPRIjkQQo2pEu/F38CyTtKBZ7eTZqUG/2FJz5Q1Zyp/
 qgwimGn9mjt4eWg0iZA5AqxB49rdYERJjuUSpq7IqSqgGITIb8wiqnfwLDUOkvFAfnwQcz95Kvx
 n/mUYjmscY+eXvWWQa/fMd2GADa+R1l0=
X-Received: by 2002:a05:6902:120c:: with SMTP id
 s12mr3957475ybu.100.1644318824253; 
 Tue, 08 Feb 2022 03:13:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUco2vomLRJlEIMIcsV6uG7w6WBQL10IyQqRCFBC6Qe03nRa57C4eBoBnXplc0kYFZ7Vwy3eORkN91Uw2SuVA=
X-Received: by 2002:a05:6902:120c:: with SMTP id
 s12mr3957468ybu.100.1644318824072; 
 Tue, 08 Feb 2022 03:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-19-pbonzini@redhat.com>
In-Reply-To: <20220203173359.292068-19-pbonzini@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 8 Feb 2022 13:13:32 +0200
Message-ID: <CAPMcbCq1poYW_dkf4yFayQRU6CYgMUzHSjQ7GjFSQ4tziH8F5w@mail.gmail.com>
Subject: Re: [PATCH 18/27] qga/vss-win32: fix midl arguments
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000681e2505d77fcf57"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

--000000000000681e2505d77fcf57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>



On Thu, Feb 3, 2022 at 8:16 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Microsoft midl compiler doesn't take "-options" form, nor does it take
> OUTPUT filename. The -I option seems needless as well (at least with
> VS15).
>
> It's not clear what was actually used when it was introduced in commit
> b39297aedfabe9.
>
> strings says "Created by MIDL version 7.00.0555 at Fri Dec 21 13:36:39
> 2012".
>
> I doubt the makefile rule actually ever worked.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qga/vss-win32/meson.build | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
> index 90825edef3..78bdf5e74a 100644
> --- a/qga/vss-win32/meson.build
> +++ b/qga/vss-win32/meson.build
> @@ -26,8 +26,7 @@ if midl.found()
>    gen_tlb =3D custom_target('gen-tlb',
>                            input: 'qga-vss.idl',
>                            output: 'qga-vss.tlb',
> -                          command: [midl, '-tlb', '-I' +
> config_host['WIN_SDK'],
> -                                     '@INPUT@', '@OUTPUT@'])
> +                          command: [midl, '@INPUT@', '/tlb', '@OUTPUT@']=
)
>  else
>    gen_tlb =3D custom_target('gen-tlb',
>                            input: 'qga-vss.tlb',
> --
> 2.34.1
>
>
>
>

--000000000000681e2505d77fcf57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Signed-off-by: Konstantin Kostiuk &lt;<a =
href=3D"mailto:kkostiuk@redhat.com">kkostiuk@redhat.com</a>&gt;<div><div di=
r=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div=
 dir=3D"ltr"><br></div></div></div><br></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 3, 2022 at 8:16 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From=
: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com"=
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

--000000000000681e2505d77fcf57--


