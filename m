Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E26941052C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 10:35:48 +0200 (CEST)
Received: from localhost ([::1]:36814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRVp4-00022q-UK
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 04:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alivatankhah72@gmail.com>)
 id 1mRVRj-0004F7-H1; Sat, 18 Sep 2021 04:11:39 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:44001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alivatankhah72@gmail.com>)
 id 1mRVRh-0003cX-MN; Sat, 18 Sep 2021 04:11:39 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id cf2so7932989qvb.10;
 Sat, 18 Sep 2021 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AhP0JRlrDLbBcy/Iv52Pwdg0pj92OIpZllOi+a5BuEg=;
 b=WiPvvWT5Cq24cXT6vD7tMl0RwzlO1P+KxcgIkYyECOKCzgrughl66YKQMYG0xWT8eL
 LfnTwlMXeDYPRT4vuVtAJLaNaP5tc5kVRrEd0iqDXfvL9ZMmNik+I0vZlOcL2CwQd++b
 d7XAGg9/C+Kqdx7waxH6l+RCL+MPGJZBZzm8kz0WvCM50FzKy4YVGmFDxv2Bah2VTA9b
 4Q/QLmmM1HRQZXJfJtSYshePLf9ipP/74/LMSSiOoNb70WlN9HeCZgkBosOUzQauYd66
 GlhCIc5713aFbdL6xTuwkRAbcTePVcn7PexvGlnNBmSWxHnzVJyawffmfzIDj1ysoIk7
 JoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AhP0JRlrDLbBcy/Iv52Pwdg0pj92OIpZllOi+a5BuEg=;
 b=CZuCTCxLxWc9KbWd30HOe5Lf80yUtEtp3fvatbxsZWwRZC9+AXbSa37vZ4q2Q543Dl
 wq+sMLldAt8eRfwrxPUFAIfusf6mVHLCc5iKLNQ6pe35/fDQ/030sTCpMpL9J0A2l9ni
 t1rAZ+w3J4mKlRYPdZ5409ZsnR9hZs9RGlU4gJJTtYMb6K/n4AOQajosoQJzCKu9mym3
 fsaGCGLtbDnCMX0MPGZF1oK4LcH2IUGub8o6Ckj7NMEc+PEVg1wkJ/UGyqUKvsv8FYlT
 70I0zVP3mooJEVVqCGg/JlHJm2kQFaZCzJjFnPD9pnMlKebDsI5Puu04ua9+CibDgRfM
 uKbA==
X-Gm-Message-State: AOAM5311v6JCfVUvSZWznxvinBd65uz6WNRuJqxZ5D1dCoamZHx0Ce8e
 5HEZbutrfAxFv5Ux0Uq5q/3pu3xA/A5f1lbUaYN6qG51ZEB66eq9
X-Google-Smtp-Source: ABdhPJwiEJr25Pr0vkFnZJ+wl5cqrqEpfSKLKt29tBCdvmeK4e70uiUjMZYXKyVi/GInowTuNZGDdAiTt5bUyxyitLM=
X-Received: by 2002:a05:6214:529:: with SMTP id
 x9mr15146777qvw.17.1631952695176; 
 Sat, 18 Sep 2021 01:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <CABip9V9nwDNAEg-620hG2r5pyhw_rig+2nf9Ja3s=WA-wmH=jQ@mail.gmail.com>
 <e53eecec-8897-767a-149f-51faffd76d67@amsat.org>
In-Reply-To: <e53eecec-8897-767a-149f-51faffd76d67@amsat.org>
From: Ali Vatankhah <alivatankhah72@gmail.com>
Date: Sat, 18 Sep 2021 12:41:57 +0430
Message-ID: <CABip9V88osKWXBqSLDscAup6wAoh+_W-6WZR_Okwj9GG60nGCw@mail.gmail.com>
Subject: Re: high cpu usage in idle state
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000afb21a05cc40982e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=alivatankhah72@gmail.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 18 Sep 2021 04:21:31 -0400
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000afb21a05cc40982e
Content-Type: text/plain; charset="UTF-8"

Hi Philippe, Thank for your email

I investigated your advice,

first checked the CPU's programmer's reference manual and it has wait for
interrupt instruction.

then to check what instructions are executing I run this command:

qemu-system-ppc64 -nographic -M ppce500 -cpu e5500 -kernel uImage
-singlestep -d in_asm -D target_asm.log

Obviously this results in a Kernel panic, but the point is that after panic
there is no guest
 instruction running as there is no more log in the file but still CPU
usage is 100.

also run this command to check generated host assembly code:

qemu-system-ppc64 -nographic -M ppce500 -cpu e5500 -kernel uImage
-singlestep -d out_asm -D host_asm.log

and the result was the same, after Kernel panic there are no more
instructions to run
(though there are some nop instructions in tb slow paths + alignment
section at
the end of some TBs but I think it's not relevant).

in another test I run the complete working command with log options and
after login kill all
 services except init:

qemu-system-ppc64 -nographic -m 256 -M ppce500 -cpu e5500 -kernel uImage
-initrd rootfs.ext2.gz
         -append 'root=/dev/ram rw ramdisk_size=150000' -singlestep -d
out_asm -D  host_asm.log

it logs in the file once in a while but still CPU usage is 100% constantly.

Thanks. Regards

--000000000000afb21a05cc40982e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Philippe, Thank for your email<div><br></div><div>=
I investigated your advice,=C2=A0</div><div><br></div><div>first checked th=
e CPU&#39;s programmer&#39;s reference manual and it has wait for interrupt=
 instruction.</div><div><br><div>then to check what instructions are execut=
ing I run this command:</div></div><div><br></div><div><font face=3D"monosp=
ace">qemu-system-ppc64 -nographic -M ppce500 -cpu e5500 -kernel uImage -sin=
glestep -d in_asm -D target_asm.log</font><br></div><div><font face=3D"mono=
space"><br></font></div><div>Obviously this results in a Kernel panic, but =
the point is that after panic there is no guest</div><div>=C2=A0instruction=
 running as there is no more log in the file but still CPU usage is 100.</d=
iv><div><br></div><div>also run this command to check=C2=A0generated host a=
ssembly code:</div><div><br></div><div><font face=3D"monospace">qemu-system=
-ppc64 -nographic -M ppce500 -cpu e5500 -kernel uImage -singlestep -d out_a=
sm -D host_asm.log</font><br></div><div><font face=3D"monospace"><br></font=
></div><div>and the result was the same, after Kernel panic there are no mo=
re instructions to run=C2=A0</div><div>(though there are some nop instructi=
ons in tb slow paths + alignment section at=C2=A0</div><div>the end of some=
 TBs but I think it&#39;s not relevant).</div><div><br></div><div>in anothe=
r test I run the complete working command with log options and after login =
kill all</div><div>=C2=A0services except=C2=A0init:</div><div><br></div><di=
v><font face=3D"monospace">qemu-system-ppc64 -nographic -m 256 -M ppce500 -=
cpu e5500 -kernel uImage -initrd rootfs.ext2.gz</font></div><div><font face=
=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-append &#39;root=3D/dev/r=
am rw ramdisk_size=3D150000&#39; -singlestep -d out_asm -D=C2=A0

host_asm.log</font><br></div><div><br></div><div>it logs in the file=C2=A0o=
nce in a while but still CPU usage is 100% constantly.</div><div><br></div>=
<div>Thanks. Regards</div><div><br></div></div>

--000000000000afb21a05cc40982e--

