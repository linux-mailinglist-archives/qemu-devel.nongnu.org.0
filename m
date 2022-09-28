Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0A55EE948
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 00:20:48 +0200 (CEST)
Received: from localhost ([::1]:38966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odfQ7-0006Lm-KQ
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 18:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odfMw-0003gL-6N
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 18:17:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odfMs-0007sZ-0J
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 18:17:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664403442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1+HcsGb2xY1873i1+p6PipSCP2+rrsCqnp88YeOzTUY=;
 b=hD47Dt26cwdTyRd4nYaFlz8eaM2DER0uJl2RxKoZwODpo94TClw60qL+JJg/icJiyZswVS
 47cZlfvvkAaV1WoDG4iFxxf0J1KZ0faAb9rgdcx1wnMvN+uKa8WugR8jvn8n1LTAuQ8nur
 e/AS2U+NpmAbiN7k5kWcDukvoRQdgXM=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-235-miIPh-03NFCWiHDJFd9hhQ-1; Wed, 28 Sep 2022 18:17:16 -0400
X-MC-Unique: miIPh-03NFCWiHDJFd9hhQ-1
Received: by mail-vk1-f200.google.com with SMTP id
 h194-20020a1f9ecb000000b003a29cd56380so4772121vke.15
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 15:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1+HcsGb2xY1873i1+p6PipSCP2+rrsCqnp88YeOzTUY=;
 b=7TcmBbyRU2vSrqxg7pLSFdVhS4zKdiqK8hZSKBqg5kEoZ/JVSVQjQcfzZD0eAlopZF
 deGzTodwaDmLwjFVoWdrH5MZGIbiVTgWTFuaXpZ1Ogd7Y7MoDWBpeb14AeT4Be/w5V8p
 9Gf2aGiNb5oBtbEThnZOKkdt23PrxUBDxObCGh4xf4coL4iaaM0v3WQHUILxXEbsK73l
 NTUrybNT+01APj3rBBDKtzHwKQLyqDobt+JY2PsUSb97E38D7CBw62Ad0lL8HMN+50Wl
 2sdmHBTPad2hL/g+wnGZa5CA062qPncK2B99pOGV7OEvfcBXEIx7Ry/fufJ5MQTeWSst
 G3Ow==
X-Gm-Message-State: ACrzQf2GKU99u/b7234TAdiup+bupx/9kTuWq6RBCC3fM/Loq/URGN8/
 TfHiXZ7J+Tss6zLTAXgsl/HmbM4GNkfyUKi2baPFTY/a1HJwziFkGBwQYGGsgBaTUVEh00nVKIk
 UWYUK4iYaHzBK1fR03GA6FCqg4U1KF6s=
X-Received: by 2002:a67:fc44:0:b0:398:30ac:1c95 with SMTP id
 p4-20020a67fc44000000b0039830ac1c95mr15528309vsq.16.1664403435667; 
 Wed, 28 Sep 2022 15:17:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4LBUSjnsUlKw8yFWFg6MW/E2JIufscenuZ5iMYhnaEVFl+b06qkPWYB5e6yQonR/tgPxwOo9uiTv+rPaIduZo=
X-Received: by 2002:a67:fc44:0:b0:398:30ac:1c95 with SMTP id
 p4-20020a67fc44000000b0039830ac1c95mr15528301vsq.16.1664403435384; Wed, 28
 Sep 2022 15:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220927213501.4069117-1-alex.bennee@linaro.org>
 <CABgObfYjhe7_qTRYMz_eeTCaJekHOBe3WLrx_OnPBfaMRcuMKA@mail.gmail.com>
 <877d1n3mw1.fsf@linaro.org>
In-Reply-To: <877d1n3mw1.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 29 Sep 2022 00:17:04 +0200
Message-ID: <CABgObfZ0M6Ewg-3mTS-AUPd+oF4JroOB1_pxOv3+wnFJ2BddCQ@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/qtest: bump up QOS_PATH_MAX_ELEMENT_SIZE
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000087862505e9c41fa8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000087862505e9c41fa8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh, wait, this is not a path! This is the stack for a graph visit, and the
limit is not the maximum length of the path, but rather the number of nodes
in the graph.

In other words, QOS_PATH_MAX_ELEMENT_SIZE is being overloaded and using it
in qos_node_stack is wrong. The solution is to use a linked list there, for
now the patch is okay.

Paolo

Il mer 28 set 2022, 10:48 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scri=
tto:

>
> Paolo Bonzini <pbonzini@redhat.com> writes:
>
> > What is an example of one such huge path? This would mean that LTO is
> changing the set of tests that are run, which is
> > unexpected.
>
> It does look like the LTO build runs more tests although its hard to
> diff as the order if different:
>
> =E2=9E=9C  grep "list" without-lto | wc -l
> 201
> =F0=9F=95=9909:45:35 alex@zen:qemu.git/builds/arm.all  on =EE=82=A0 gitdm=
/next [$!?=E2=87=A1]
> =E2=9E=9C  grep "list" ../debug/with-lto | wc -l
> 195
>
> Logs attached:
>
>
> >
> > Paolo
> >
> > Il mar 27 set 2022, 23:35 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha
> scritto:
> >
> >  It seems the depth of path we need to support can vary depending on
> >  the order of the init constructors getting called. It seems
> >  --enable-lto shuffles things around just enough to push you over the
> >  limit.
> >
> >  Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >  Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1186
> >  ---
> >   tests/qtest/libqos/qgraph.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
> >  index 6e94824d09..5c0046e989 100644
> >  --- a/tests/qtest/libqos/qgraph.h
> >  +++ b/tests/qtest/libqos/qgraph.h
> >  @@ -24,7 +24,7 @@
> >   #include "libqos-malloc.h"
> >
> >   /* maximum path length */
> >  -#define QOS_PATH_MAX_ELEMENT_SIZE 50
> >  +#define QOS_PATH_MAX_ELEMENT_SIZE 64
> >
> >   typedef struct QOSGraphObject QOSGraphObject;
> >   typedef struct QOSGraphNode QOSGraphNode;
> >  --
> >  2.34.1
>
>
> --
> Alex Benn=C3=A9e
>

--00000000000087862505e9c41fa8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Oh, wait, this is not a path! This is the stack for a gra=
ph visit, and the limit is not the maximum length of the path, but rather t=
he number of nodes in the graph.<div dir=3D"auto"><br></div><div dir=3D"aut=
o">In other words, QOS_PATH_MAX_ELEMENT_SIZE is being overloaded and using =
it in qos_node_stack is wrong. The solution is to use a linked list there, =
for now the patch is okay.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Paolo=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Il mer 28 set 2022, 10:48 Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; ha scritt=
o:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" =
rel=3D"noreferrer">pbonzini@redhat.com</a>&gt; writes:<br>
<br>
&gt; What is an example of one such huge path? This would mean that LTO is =
changing the set of tests that are run, which is<br>
&gt; unexpected.<br>
<br>
It does look like the LTO build runs more tests although its hard to<br>
diff as the order if different:<br>
<br>
=E2=9E=9C=C2=A0 grep &quot;list&quot; without-lto | wc -l<br>
201<br>
=F0=9F=95=9909:45:35 alex@zen:qemu.git/builds/arm.all=C2=A0 on =EE=82=A0 gi=
tdm/next [$!?=E2=87=A1] <br>
=E2=9E=9C=C2=A0 grep &quot;list&quot; ../debug/with-lto | wc -l<br>
195<br>
<br>
Logs attached:<br>
<br>
<br>
&gt;<br>
&gt; Paolo<br>
&gt;<br>
&gt; Il mar 27 set 2022, 23:35 Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.=
bennee@linaro.org" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.=
org</a>&gt; ha scritto:<br>
&gt;<br>
&gt;=C2=A0 It seems the depth of path we need to support can vary depending=
 on<br>
&gt;=C2=A0 the order of the init constructors getting called. It seems<br>
&gt;=C2=A0 --enable-lto shuffles things around just enough to push you over=
 the<br>
&gt;=C2=A0 limit.<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.benne=
e@linaro.org" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</=
a>&gt;<br>
&gt;=C2=A0 Fixes: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/=
1186" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/qe=
mu-project/qemu/-/issues/1186</a><br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0tests/qtest/libqos/qgraph.h | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qg=
raph.h<br>
&gt;=C2=A0 index 6e94824d09..5c0046e989 100644<br>
&gt;=C2=A0 --- a/tests/qtest/libqos/qgraph.h<br>
&gt;=C2=A0 +++ b/tests/qtest/libqos/qgraph.h<br>
&gt;=C2=A0 @@ -24,7 +24,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;libqos-malloc.h&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/* maximum path length */<br>
&gt;=C2=A0 -#define QOS_PATH_MAX_ELEMENT_SIZE 50<br>
&gt;=C2=A0 +#define QOS_PATH_MAX_ELEMENT_SIZE 64<br>
&gt;<br>
&gt;=C2=A0 =C2=A0typedef struct QOSGraphObject QOSGraphObject;<br>
&gt;=C2=A0 =C2=A0typedef struct QOSGraphNode QOSGraphNode;<br>
&gt;=C2=A0 -- <br>
&gt;=C2=A0 2.34.1<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div>

--00000000000087862505e9c41fa8--


