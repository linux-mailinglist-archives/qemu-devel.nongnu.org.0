Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EFE4563DA
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 21:04:33 +0100 (CET)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnne3-0006JD-K4
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 15:04:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnnbv-0004Kf-Q3
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 15:02:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnnbr-0003CY-70
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 15:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637265733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8WDL46CDiExHjRqPChdYG6VFzdQOyKNtlCECVkMhKTI=;
 b=iVUnre0tqWtVx7cHMjli0C93SRAjYFBcKyvTwN7/vLHv0KAbwAH7POZ3fhAQ+VYV0JVfNv
 KUdO4Hy/V/W8v+/S4tHlGya/hjrcqT+Ddqymbhze3ABqIxm7MJCRAdy/kF9WZJqDvOc2AQ
 PcR+P0AcohUoEtLICF0BIMntBAesIPo=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-560-cZ5vf9A3PGCJ7OcxnTA-lg-1; Thu, 18 Nov 2021 15:02:11 -0500
X-MC-Unique: cZ5vf9A3PGCJ7OcxnTA-lg-1
Received: by mail-vk1-f198.google.com with SMTP id
 i67-20020a1f5446000000b002ff133294c8so3078588vkb.13
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 12:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8WDL46CDiExHjRqPChdYG6VFzdQOyKNtlCECVkMhKTI=;
 b=Av5h6ybVVYL1tGBb/YARKfIZ1rXIybImph/qjdHRKXlXcOkyGMITysSNRmRvOloOoM
 UlmZukGAao33Uwv9ioSwdtbHRQzsBzKktWPUV9NlFnCQnOjJiACH5vK0vJ4vMdynS2ty
 YZlKNLmO+HHSLz7OtxUdTGnH7KJ9g91BwQoIfhdIfNna6/pnJOBjcm+5fF86BQTJXlHt
 tELkZtgaoKM4DLqLL/Yzt/ko2KaNVhIvisjOFFg6LYKZcju+I7OFe7Nn1xw0aMHcNCpA
 kKu9hcBxzMSoTEkx7Zz07KGuQYghqNjWPCKT3OxUkPryJyDa6uTOKObNcMtJBBB5tZlE
 qd2Q==
X-Gm-Message-State: AOAM530Tb2GUjId+xKDevSxpCBQMG1a6a0IBTI6ikWiMzrfDvH+LKlfi
 1wzbqW6tjf+kiIdCN/QqBsTmch19fZK4uQD1KpumNfsUFePSUlQIaOv/bMc4u4x0f19AMnv5veY
 vmPpTvbrqs9GVk5sUeGvB7cnnO17WeJo=
X-Received: by 2002:a1f:7c85:: with SMTP id
 x127mr106648550vkc.10.1637265731247; 
 Thu, 18 Nov 2021 12:02:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzE5hz/qIPbWSPMsYGSLQa7I+EkRuNwL6VXAgQjqlzhBp+MEgmQVqIa+4TCXP1kqgibxC8e5QeWovC52JRQDvM=
X-Received: by 2002:a1f:7c85:: with SMTP id
 x127mr106648506vkc.10.1637265731077; 
 Thu, 18 Nov 2021 12:02:11 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-Z+mfnVdit=0ECS-Gc1tExHvR2X4Pr26b0bGtXxyaCPAQ@mail.gmail.com>
 <25ca79c9-b08b-741d-43ae-cfe80f6ce588@redhat.com>
In-Reply-To: <25ca79c9-b08b-741d-43ae-cfe80f6ce588@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 18 Nov 2021 15:01:59 -0500
Message-ID: <CAFn=p-YigydcjKySDXaBNSc5uCscWq8OQtMdJocwQw5oredBUg@mail.gmail.com>
Subject: Re: device-crash-test
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004dd8fc05d115a210"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004dd8fc05d115a210
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 1:31 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> On 11/18/21 18:55, John Snow wrote:
> > I finally squashed all of the bugs and got a clean run of
> > device-crash-test with a full build of QEMU, over 182,000 individual
> > test cases.
> >
> > Here's all of the legitimate failures I saw:
> >
> > CRITICAL: failed: binary=3D./qemu-system-x86_64 accel=3Dkvm machine=3Dn=
one
> > device=3Dsgx-epc
> > CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine none,accel=3Dkvm
> > -device sgx-epc
> > CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE=
:
> > Object 0x55b1c9dcad90 is not an instance of type generic-pc-machine
> > CRITICAL: exit code: -6
> >
> > CRITICAL: failed: binary=3D./qemu-system-x86_64 accel=3Dkvm machine=3Dx=
-remote
> > device=3Dsgx-epc
> > CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine x-remote,accel=3Dkv=
m
> > -device sgx-epc
> > CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE=
:
> > Object 0x559b43269d40 is not an instance of type generic-pc-machine
> > CRITICAL: exit code: -6
> >
> > CRITICAL: failed: binary=3D./qemu-system-x86_64 accel=3Dkvm machine=3Dm=
icrovm
> > device=3Dsgx-epc
> > CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine microvm,accel=3Dkvm
> > -device sgx-epc
> > CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE=
:
> > Object 0x55760ca941b0 is not an instance of type generic-pc-machine
> > CRITICAL: exit code: -6
> >
> > CRITICAL: failed: binary=3D./qemu-system-x86_64 accel=3Dtcg machine=3Dn=
one
> > device=3Dsgx-epc
> > CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine none,accel=3Dtcg
> > -device sgx-epc
> > CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE=
:
> > Object 0x557a52333d90 is not an instance of type generic-pc-machine
> > CRITICAL: exit code: -6
> >
> > CRITICAL: failed: binary=3D./qemu-system-x86_64 accel=3Dtcg machine=3Dx=
-remote
> > device=3Dsgx-epc
> > CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine x-remote,accel=3Dtc=
g
> > -device sgx-epc
> > CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE=
:
> > Object 0x55bbcd596d40 is not an instance of type generic-pc-machine
> > CRITICAL: exit code: -6
> >
> > CRITICAL: failed: binary=3D./qemu-system-x86_64 accel=3Dtcg machine=3Dm=
icrovm
> > device=3Dsgx-epc
> > CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine microvm,accel=3Dtcg
> > -device sgx-epc
> > CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE=
:
> > Object 0x55ca35c081b0 is not an instance of type generic-pc-machine
> > CRITICAL: exit code: -6
> >
> > CRITICAL: failed: binary=3D./qemu-system-i386 accel=3Dkvm machine=3Dnon=
e
> > device=3Dsgx-epc
> > CRITICAL: cmdline: ./qemu-system-i386 -S -machine none,accel=3Dkvm -dev=
ice
> > sgx-epc
> > CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE=
:
> > Object 0x55d0e0a03d90 is not an instance of type generic-pc-machine
> > CRITICAL: exit code: -6
> >
> > CRITICAL: failed: binary=3D./qemu-system-i386 accel=3Dkvm machine=3Dx-r=
emote
> > device=3Dsgx-epc
> > CRITICAL: cmdline: ./qemu-system-i386 -S -machine x-remote,accel=3Dkvm
> > -device sgx-epc
> > CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE=
:
> > Object 0x564648250b30 is not an instance of type generic-pc-machine
> > CRITICAL: exit code: -6
> >
> > CRITICAL: failed: binary=3D./qemu-system-i386 accel=3Dkvm machine=3Dmic=
rovm
> > device=3Dsgx-epc
> > CRITICAL: cmdline: ./qemu-system-i386 -S -machine microvm,accel=3Dkvm
> > -device sgx-epc
> > CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE=
:
> > Object 0x55bef7a235b0 is not an instance of type generic-pc-machine
> > CRITICAL: exit code: -6
> >
> > CRITICAL: failed: binary=3D./qemu-system-i386 accel=3Dtcg machine=3Dnon=
e
> > device=3Dsgx-epc
> > CRITICAL: cmdline: ./qemu-system-i386 -S -machine none,accel=3Dtcg -dev=
ice
> > sgx-epc
> > CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE=
:
> > Object 0x5608b9fecd90 is not an instance of type generic-pc-machine
> > CRITICAL: exit code: -6
> >
> > CRITICAL: failed: binary=3D./qemu-system-i386 accel=3Dtcg machine=3Dx-r=
emote
> > device=3Dsgx-epc
> > CRITICAL: cmdline: ./qemu-system-i386 -S -machine x-remote,accel=3Dtcg
> > -device sgx-epc
> > CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE=
:
> > Object 0x558306c9cb30 is not an instance of type generic-pc-machine
> > CRITICAL: exit code: -6
> >
> > CRITICAL: failed: binary=3D./qemu-system-i386 accel=3Dtcg machine=3Dmic=
rovm
> > device=3Dsgx-epc
> > CRITICAL: cmdline: ./qemu-system-i386 -S -machine microvm,accel=3Dtcg
> > -device sgx-epc
> > CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE=
:
> > Object 0x55e041f465b0 is not an instance of type generic-pc-machine
> > CRITICAL: exit code: -6
>
> Aren't these fixed by
>
> https://lore.kernel.org/qemu-devel/20211109175021.17813-1-pbonzini@redhat=
.com/
> ?
>

Maybe, dunno. I've been working on fixing up the testing infrastructure and
haven't rebased in a week. It takes a few hours to run the entire battery,
so I can try again tonight and let you know tomorrow. My goal here was
fixing device-crash-test itself -- and since it takes so long to run,
figured I'd share the results.

--js

--0000000000004dd8fc05d115a210
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 18, 2021 at 1:31 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 11/18/21 18:55, John Snow wrote:<br>
&gt; I finally squashed all of the bugs and got a clean run of<br>
&gt; device-crash-test with a full build of QEMU, over 182,000 individual<b=
r>
&gt; test cases.<br>
&gt; <br>
&gt; Here&#39;s all of the legitimate failures I saw:<br>
&gt; <br>
&gt; CRITICAL: failed: binary=3D./qemu-system-x86_64 accel=3Dkvm machine=3D=
none<br>
&gt; device=3Dsgx-epc<br>
&gt; CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine none,accel=3Dkvm<b=
r>
&gt; -device sgx-epc<br>
&gt; CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHIN=
E:<br>
&gt; Object 0x55b1c9dcad90 is not an instance of type generic-pc-machine<br=
>
&gt; CRITICAL: exit code: -6<br>
&gt; <br>
&gt; CRITICAL: failed: binary=3D./qemu-system-x86_64 accel=3Dkvm machine=3D=
x-remote<br>
&gt; device=3Dsgx-epc<br>
&gt; CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine x-remote,accel=3Dk=
vm<br>
&gt; -device sgx-epc<br>
&gt; CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHIN=
E:<br>
&gt; Object 0x559b43269d40 is not an instance of type generic-pc-machine<br=
>
&gt; CRITICAL: exit code: -6<br>
&gt; <br>
&gt; CRITICAL: failed: binary=3D./qemu-system-x86_64 accel=3Dkvm machine=3D=
microvm<br>
&gt; device=3Dsgx-epc<br>
&gt; CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine microvm,accel=3Dkv=
m<br>
&gt; -device sgx-epc<br>
&gt; CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHIN=
E:<br>
&gt; Object 0x55760ca941b0 is not an instance of type generic-pc-machine<br=
>
&gt; CRITICAL: exit code: -6<br>
&gt; <br>
&gt; CRITICAL: failed: binary=3D./qemu-system-x86_64 accel=3Dtcg machine=3D=
none<br>
&gt; device=3Dsgx-epc<br>
&gt; CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine none,accel=3Dtcg<b=
r>
&gt; -device sgx-epc<br>
&gt; CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHIN=
E:<br>
&gt; Object 0x557a52333d90 is not an instance of type generic-pc-machine<br=
>
&gt; CRITICAL: exit code: -6<br>
&gt; <br>
&gt; CRITICAL: failed: binary=3D./qemu-system-x86_64 accel=3Dtcg machine=3D=
x-remote<br>
&gt; device=3Dsgx-epc<br>
&gt; CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine x-remote,accel=3Dt=
cg<br>
&gt; -device sgx-epc<br>
&gt; CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHIN=
E:<br>
&gt; Object 0x55bbcd596d40 is not an instance of type generic-pc-machine<br=
>
&gt; CRITICAL: exit code: -6<br>
&gt; <br>
&gt; CRITICAL: failed: binary=3D./qemu-system-x86_64 accel=3Dtcg machine=3D=
microvm<br>
&gt; device=3Dsgx-epc<br>
&gt; CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine microvm,accel=3Dtc=
g<br>
&gt; -device sgx-epc<br>
&gt; CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHIN=
E:<br>
&gt; Object 0x55ca35c081b0 is not an instance of type generic-pc-machine<br=
>
&gt; CRITICAL: exit code: -6<br>
&gt; <br>
&gt; CRITICAL: failed: binary=3D./qemu-system-i386 accel=3Dkvm machine=3Dno=
ne<br>
&gt; device=3Dsgx-epc<br>
&gt; CRITICAL: cmdline: ./qemu-system-i386 -S -machine none,accel=3Dkvm -de=
vice<br>
&gt; sgx-epc<br>
&gt; CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHIN=
E:<br>
&gt; Object 0x55d0e0a03d90 is not an instance of type generic-pc-machine<br=
>
&gt; CRITICAL: exit code: -6<br>
&gt; <br>
&gt; CRITICAL: failed: binary=3D./qemu-system-i386 accel=3Dkvm machine=3Dx-=
remote<br>
&gt; device=3Dsgx-epc<br>
&gt; CRITICAL: cmdline: ./qemu-system-i386 -S -machine x-remote,accel=3Dkvm=
<br>
&gt; -device sgx-epc<br>
&gt; CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHIN=
E:<br>
&gt; Object 0x564648250b30 is not an instance of type generic-pc-machine<br=
>
&gt; CRITICAL: exit code: -6<br>
&gt; <br>
&gt; CRITICAL: failed: binary=3D./qemu-system-i386 accel=3Dkvm machine=3Dmi=
crovm<br>
&gt; device=3Dsgx-epc<br>
&gt; CRITICAL: cmdline: ./qemu-system-i386 -S -machine microvm,accel=3Dkvm<=
br>
&gt; -device sgx-epc<br>
&gt; CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHIN=
E:<br>
&gt; Object 0x55bef7a235b0 is not an instance of type generic-pc-machine<br=
>
&gt; CRITICAL: exit code: -6<br>
&gt; <br>
&gt; CRITICAL: failed: binary=3D./qemu-system-i386 accel=3Dtcg machine=3Dno=
ne<br>
&gt; device=3Dsgx-epc<br>
&gt; CRITICAL: cmdline: ./qemu-system-i386 -S -machine none,accel=3Dtcg -de=
vice<br>
&gt; sgx-epc<br>
&gt; CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHIN=
E:<br>
&gt; Object 0x5608b9fecd90 is not an instance of type generic-pc-machine<br=
>
&gt; CRITICAL: exit code: -6<br>
&gt; <br>
&gt; CRITICAL: failed: binary=3D./qemu-system-i386 accel=3Dtcg machine=3Dx-=
remote<br>
&gt; device=3Dsgx-epc<br>
&gt; CRITICAL: cmdline: ./qemu-system-i386 -S -machine x-remote,accel=3Dtcg=
<br>
&gt; -device sgx-epc<br>
&gt; CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHIN=
E:<br>
&gt; Object 0x558306c9cb30 is not an instance of type generic-pc-machine<br=
>
&gt; CRITICAL: exit code: -6<br>
&gt; <br>
&gt; CRITICAL: failed: binary=3D./qemu-system-i386 accel=3Dtcg machine=3Dmi=
crovm<br>
&gt; device=3Dsgx-epc<br>
&gt; CRITICAL: cmdline: ./qemu-system-i386 -S -machine microvm,accel=3Dtcg<=
br>
&gt; -device sgx-epc<br>
&gt; CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHIN=
E:<br>
&gt; Object 0x55e041f465b0 is not an instance of type generic-pc-machine<br=
>
&gt; CRITICAL: exit code: -6<br>
<br>
Aren&#39;t these fixed by<br>
<a href=3D"https://lore.kernel.org/qemu-devel/20211109175021.17813-1-pbonzi=
ni@redhat.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.or=
g/qemu-devel/20211109175021.17813-1-pbonzini@redhat.com/</a><br>
?<br></blockquote><div><br></div><div>Maybe, dunno. I&#39;ve been working o=
n fixing up the testing infrastructure and haven&#39;t rebased in a week. I=
t takes a few hours to run the entire battery, so I can try again tonight a=
nd let you know tomorrow. My goal here was fixing device-crash-test itself =
-- and since it takes so long to run, figured I&#39;d share the results.<br=
></div><div><br></div><div>--js<br></div></div></div>

--0000000000004dd8fc05d115a210--


