Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C786A83C8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:49:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXjIT-0006AX-Hw; Thu, 02 Mar 2023 08:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ayushdevel1325@gmail.com>)
 id 1pXjIR-00069v-Jn
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:48:35 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ayushdevel1325@gmail.com>)
 id 1pXjIP-0007Am-FX
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:48:35 -0500
Received: by mail-lj1-x22e.google.com with SMTP id b13so17685012ljf.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 05:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677764911;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=k2i3LpISrdUFtBopt4zCiX0xq5Cz7jxlolQkRa9gk8c=;
 b=dvEiZeXi06+Oi+1bPEOgLpkOFpV/o4v+dwTkrDzPLovO1/I3aokYRrw7F+wRgoq/gj
 6F5lWlBVr+JZdkxXfTS3naHec9lQiZJcJqSjUoO4ofJfADhO8hBVU5KtH2K7WpIB/j2S
 7GRSns6Kw2pOMREGCmHUPJ3IwRGr8lvAvbqWylJs1r+VHFshoDrwKP4SDEb5cSiRcO62
 iST3JdqOnhfHtV42MHmKdgxoig2kGwO63e6SWVKV8CP7msjD32iE8nlBsi67o9ui+kh2
 U1wD0/zY9hurzdPv+exJ+ccdetj6qr1DmCjEdcI67OjbVgeEtUay0kXTIwIxXATNZSVI
 aFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677764911;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k2i3LpISrdUFtBopt4zCiX0xq5Cz7jxlolQkRa9gk8c=;
 b=lC6DwwXv+n7zg/fnSYLusE5rRMIi5KU8B/J0MxjLLtcNJ3hTaXNMc7yOT/XtH25Z5/
 BdVYjBHQv5Hf9ssbTIaEGOzYinW8LI0+28kCAw5X4JdRChHSeEie7vRw7gQImP+2R5kI
 lSk/vnDK5o54OgKtzhUkSX7+AMWDlSwXbtyCuyxxtEP36du3LNrO8H1JcrGSt2tr/PMP
 7fy/MYgPrRbJKiOP0E5bHHTXQnuVJBhQYHusmORB84wGFH6kVXY3c52wgGT9Du4lapSY
 iFh9No6pdIM4ukw+JuCOYiQyUZDZAFx3ZYhs5m/rSjXLx+2lCNzqKjTuaTLr7ZsQueph
 YBVA==
X-Gm-Message-State: AO0yUKWxtmsaBpnyy3PUhW/cjGh792aH/5+A2n3H6lhgFuTHtpl6vlmI
 xSLPPYqkG5YXTdI8u1acpA9gJfxqeHeu84TYbJXuJUx0DlI=
X-Google-Smtp-Source: AK7set/GcjQavNo+Pp/zcS1+hwpZRNVY/xbyEcl76yOtY7VbdaY3h4RhvjsG1CYciKtHsmJ5dA6T11Rbu0F5JFKTL+4=
X-Received: by 2002:a2e:8e2e:0:b0:295:d632:ba22 with SMTP id
 r14-20020a2e8e2e000000b00295d632ba22mr1909219ljk.8.1677764910784; Thu, 02 Mar
 2023 05:48:30 -0800 (PST)
MIME-Version: 1.0
From: Ayush Singh <ayushdevel1325@gmail.com>
Date: Thu, 2 Mar 2023 19:17:46 +0530
Message-ID: <CA+Yfj7vS0kdkbQGe-HYf7stqf-So-5ny5dioeoC_V0LGvMfVuA@mail.gmail.com>
Subject: [GSoC 2023] Introducing Myself
To: qemu-devel@nongnu.org
Cc: rjones@redhat.com, marcandre.lureau@redhat.com
Content-Type: multipart/alternative; boundary="00000000000086250605f5eb15cb"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=ayushdevel1325@gmail.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000086250605f5eb15cb
Content-Type: text/plain; charset="UTF-8"

Hello Everyone,

I am Ayush Singh, a 3rd-year university student from the Indian Institute of
Technology (Indian School of Mines), Dhanbad, India. This email is just to

I participated and successfully completed my GSoC 2022 Project under
Tianocore Organization in Rust, so I am pretty experienced in Rust
Language. I am also fairly proficient in reading and working with C,
although not to the same degree as Rust.

I use Qemu often for testing and thus would like to contribute to Qemu as a
part of GSoC 2023. I have narrowed down the projects to:

1.  Rust bindings for libnbd:
https://wiki.qemu.org/Google_Summer_of_Code_2023#Rust_bindings_for_libnbd
2.  RDP server: https://wiki.qemu.org/Google_Summer_of_Code_2023#RDP_server

I would just like to confirm if both of the above projects are up for grabs
in the upcoming GSoC 2023, and if there are any specific requirements/tasks
to complete to apply for either of the projects.

Finally, what is the preferred way of discussions in Qemu community? I did
see an IRC channel as well as qemu-discuss mailing list.

Yours sincerely
Ayush Singh

Github: https://github.com/Ayush1325
GSoC 2022 Project:
https://summerofcode.withgoogle.com/archive/2022/projects/PwQlcngc

--00000000000086250605f5eb15cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Everyone,</div><div><br></div><div>I am Ayush S=
ingh, a 3rd-year university student from the Indian Institute <span class=
=3D"gmail-il">of</span> Technology (Indian School <span class=3D"gmail-il">=
of</span> Mines), Dhanbad, India. This email is just to<br></div><div><br><=
/div><div>I participated and successfully completed my GSoC 2022 Project un=
der Tianocore Organization in Rust, so I am pretty experienced in Rust Lang=
uage. I am also fairly proficient in reading and working with C, although n=
ot to the same degree as Rust.<br></div><div><br></div><div>I use Qemu ofte=
n for testing and thus would like to contribute to Qemu as a part of GSoC 2=
023. I have narrowed down the projects to:</div><div><br></div><div>1.=C2=
=A0 Rust bindings for libnbd: <a href=3D"https://wiki.qemu.org/Google_Summe=
r_of_Code_2023#Rust_bindings_for_libnbd">https://wiki.qemu.org/Google_Summe=
r_of_Code_2023#Rust_bindings_for_libnbd</a></div><div>2.=C2=A0 RDP server: =
<a href=3D"https://wiki.qemu.org/Google_Summer_of_Code_2023#RDP_server">htt=
ps://wiki.qemu.org/Google_Summer_of_Code_2023#RDP_server</a></div><div><br>=
</div><div>I would just like to confirm if both of the above projects are u=
p for grabs in the upcoming GSoC 2023, and if there are any specific requir=
ements/tasks to complete to apply for either of the projects.</div><div><br=
></div><div>Finally, what is the preferred way of discussions in Qemu commu=
nity? I did see an IRC channel as well as qemu-discuss mailing list.<br></d=
iv><div><br></div><div>Yours sincerely</div><div>Ayush Singh<br></div><div>=
<br></div><div>Github: <a href=3D"https://github.com/Ayush1325">https://git=
hub.com/Ayush1325</a></div><div>GSoC 2022 Project: <a href=3D"https://summe=
rofcode.withgoogle.com/archive/2022/projects/PwQlcngc">https://summerofcode=
.withgoogle.com/archive/2022/projects/PwQlcngc</a></div></div>

--00000000000086250605f5eb15cb--

