Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0667C4561E4
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 18:57:24 +0100 (CET)
Received: from localhost ([::1]:38556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnlf0-00017Q-Jl
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 12:57:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnldp-0000Ft-JW
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 12:56:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnldk-0003JO-1q
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 12:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637258163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=pGrv5wwkd33kDXokZA0RfBfVXnc6fQ/CTVyIgQM4+H8=;
 b=T7YLBzMFopGEOsEDoUdz6PkOmy4rup9Jzqk4RaxR1DHY4isxNc0CRGmIS/8Ex9Myrjzzxr
 iteciAu8+Ces/XGGu3MpTb7f9XipspbEYswEQ1wQzv3kwCdTEsFNHflpkecXS+50wUt8YF
 AFnjVxcsKcTZeBEtXaBfKm+MXjDRfu8=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-ew6I-J_oNg-L9X9blN-2yw-1; Thu, 18 Nov 2021 12:55:59 -0500
X-MC-Unique: ew6I-J_oNg-L9X9blN-2yw-1
Received: by mail-vk1-f200.google.com with SMTP id
 f11-20020a1f9c0b000000b002e52d613018so3344959vke.20
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 09:55:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=pGrv5wwkd33kDXokZA0RfBfVXnc6fQ/CTVyIgQM4+H8=;
 b=q0nzICait7kMHhXlRqVBG7+WyjUvsv/JTFhkn5cGh57CE16l7o0E10Fb+BR5dFdiwS
 na9lq8Cc8DbIbipPwm6jtRmATAUfnRq6n6yAUGTf1LrSM/GnG32qu0YjfMhK/UnXm4p9
 kfbtCIEs/4p/MxopzOey5wVg0igyZNacHddslhu5u6SBLL7F/WccVMcE+FGExdgAK0hE
 Kpdvyq5K7d65Gpz/oDGXEx29XNNY3r6DfD3ZL0uWjxK9Lo2eMqK5lTI2uSq9Zi61nTGE
 7JmukDLYfXYRdYb2XgIID6IiXxN40vx3s+nTu0ioiIx9kmAOLtT+LSSG2mtsibrp7KxU
 pUfA==
X-Gm-Message-State: AOAM530rLN/JNtNM9LgNaoVv2eNOT0vmrPsTAqubn7Pu0nDE170FXhPM
 UPRAVJjv89ja67cffaloX5hLEN1Ef1k5JGiXQOuF55XkU/Zj9Bi2ilqBiOg7F//KU1oL5OnwIUc
 kydD1LzodUdRujAicI8/GjCb8TaE3EGM=
X-Received: by 2002:a67:cb0c:: with SMTP id b12mr85889537vsl.13.1637258158823; 
 Thu, 18 Nov 2021 09:55:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqJnw7UFZ4ZoH0SNWcMB6BIEVjYdzeGLhiAmCcmz7mN3xpxc4fju1AwkCRPCJ8dHOBjHZLwjdFwTygX+wDtYo=
X-Received: by 2002:a67:cb0c:: with SMTP id b12mr85889499vsl.13.1637258158521; 
 Thu, 18 Nov 2021 09:55:58 -0800 (PST)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Thu, 18 Nov 2021 12:55:48 -0500
Message-ID: <CAFn=p-Z+mfnVdit=0ECS-Gc1tExHvR2X4Pr26b0bGtXxyaCPAQ@mail.gmail.com>
Subject: device-crash-test
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f1d4e605d113de48"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f1d4e605d113de48
Content-Type: text/plain; charset="UTF-8"

I finally squashed all of the bugs and got a clean run of device-crash-test
with a full build of QEMU, over 182,000 individual test cases.

Here's all of the legitimate failures I saw:

CRITICAL: failed: binary=./qemu-system-x86_64 accel=kvm machine=none
device=sgx-epc
CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine none,accel=kvm -device
sgx-epc
CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
Object 0x55b1c9dcad90 is not an instance of type generic-pc-machine
CRITICAL: exit code: -6

CRITICAL: failed: binary=./qemu-system-x86_64 accel=kvm machine=x-remote
device=sgx-epc
CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine x-remote,accel=kvm
-device sgx-epc
CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
Object 0x559b43269d40 is not an instance of type generic-pc-machine
CRITICAL: exit code: -6

CRITICAL: failed: binary=./qemu-system-x86_64 accel=kvm machine=microvm
device=sgx-epc
CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine microvm,accel=kvm
-device sgx-epc
CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
Object 0x55760ca941b0 is not an instance of type generic-pc-machine
CRITICAL: exit code: -6

CRITICAL: failed: binary=./qemu-system-x86_64 accel=tcg machine=none
device=sgx-epc
CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine none,accel=tcg -device
sgx-epc
CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
Object 0x557a52333d90 is not an instance of type generic-pc-machine
CRITICAL: exit code: -6

CRITICAL: failed: binary=./qemu-system-x86_64 accel=tcg machine=x-remote
device=sgx-epc
CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine x-remote,accel=tcg
-device sgx-epc
CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
Object 0x55bbcd596d40 is not an instance of type generic-pc-machine
CRITICAL: exit code: -6

CRITICAL: failed: binary=./qemu-system-x86_64 accel=tcg machine=microvm
device=sgx-epc
CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine microvm,accel=tcg
-device sgx-epc
CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
Object 0x55ca35c081b0 is not an instance of type generic-pc-machine
CRITICAL: exit code: -6

CRITICAL: failed: binary=./qemu-system-mips64el accel=tcg machine=pica61
device=isa-cirrus-vga
CRITICAL: cmdline: ./qemu-system-mips64el -S -machine pica61,accel=tcg
-device isa-cirrus-vga
CRITICAL: log: RAMBlock "vga.vram" already registered, abort!
CRITICAL: exit code: -6

CRITICAL: failed: binary=./qemu-system-i386 accel=kvm machine=none
device=sgx-epc
CRITICAL: cmdline: ./qemu-system-i386 -S -machine none,accel=kvm -device
sgx-epc
CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
Object 0x55d0e0a03d90 is not an instance of type generic-pc-machine
CRITICAL: exit code: -6

CRITICAL: failed: binary=./qemu-system-i386 accel=kvm machine=x-remote
device=sgx-epc
CRITICAL: cmdline: ./qemu-system-i386 -S -machine x-remote,accel=kvm
-device sgx-epc
CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
Object 0x564648250b30 is not an instance of type generic-pc-machine
CRITICAL: exit code: -6

CRITICAL: failed: binary=./qemu-system-i386 accel=kvm machine=microvm
device=sgx-epc
CRITICAL: cmdline: ./qemu-system-i386 -S -machine microvm,accel=kvm -device
sgx-epc
CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
Object 0x55bef7a235b0 is not an instance of type generic-pc-machine
CRITICAL: exit code: -6

CRITICAL: failed: binary=./qemu-system-i386 accel=tcg machine=none
device=sgx-epc
CRITICAL: cmdline: ./qemu-system-i386 -S -machine none,accel=tcg -device
sgx-epc
CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
Object 0x5608b9fecd90 is not an instance of type generic-pc-machine
CRITICAL: exit code: -6

CRITICAL: failed: binary=./qemu-system-i386 accel=tcg machine=x-remote
device=sgx-epc
CRITICAL: cmdline: ./qemu-system-i386 -S -machine x-remote,accel=tcg
-device sgx-epc
CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
Object 0x558306c9cb30 is not an instance of type generic-pc-machine
CRITICAL: exit code: -6

CRITICAL: failed: binary=./qemu-system-i386 accel=tcg machine=microvm
device=sgx-epc
CRITICAL: cmdline: ./qemu-system-i386 -S -machine microvm,accel=tcg -device
sgx-epc
CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE:
Object 0x55e041f465b0 is not an instance of type generic-pc-machine
CRITICAL: exit code: -6

CRITICAL: failed: binary=./qemu-system-mips64 accel=tcg machine=pica61
device=isa-cirrus-vga
CRITICAL: cmdline: ./qemu-system-mips64 -S -machine pica61,accel=tcg
-device isa-cirrus-vga
CRITICAL: log: RAMBlock "vga.vram" already registered, abort!
CRITICAL: exit code: -6


--js

--000000000000f1d4e605d113de48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I finally squashed all of the bugs and got a clean ru=
n of device-crash-test with a full build of QEMU, over 182,000 individual t=
est cases.<br><br></div><div>Here&#39;s all of the legitimate failures I sa=
w:</div><div><br></div>CRITICAL: failed: binary=3D./qemu-system-x86_64 acce=
l=3Dkvm machine=3Dnone device=3Dsgx-epc<br>CRITICAL: cmdline: ./qemu-system=
-x86_64 -S -machine none,accel=3Dkvm -device sgx-epc<br>CRITICAL: log: /hom=
e/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE: Object 0x55b1c9dcad90=
 is not an instance of type generic-pc-machine<br>CRITICAL: exit code: -6<b=
r><br>CRITICAL: failed: binary=3D./qemu-system-x86_64 accel=3Dkvm machine=
=3Dx-remote device=3Dsgx-epc<br>CRITICAL: cmdline: ./qemu-system-x86_64 -S =
-machine x-remote,accel=3Dkvm -device sgx-epc<br>CRITICAL: log: /home/jsnow=
/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE: Object 0x559b43269d40 is not=
 an instance of type generic-pc-machine<br>CRITICAL: exit code: -6<br><br>C=
RITICAL: failed: binary=3D./qemu-system-x86_64 accel=3Dkvm machine=3Dmicrov=
m device=3Dsgx-epc<br>CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine m=
icrovm,accel=3Dkvm -device sgx-epc<br>CRITICAL: log: /home/jsnow/src/qemu/i=
nclude/hw/i386/pc.h:128:PC_MACHINE: Object 0x55760ca941b0 is not an instanc=
e of type generic-pc-machine<br>CRITICAL: exit code: -6<br><br>CRITICAL: fa=
iled: binary=3D./qemu-system-x86_64 accel=3Dtcg machine=3Dnone device=3Dsgx=
-epc<br>CRITICAL: cmdline: ./qemu-system-x86_64 -S -machine none,accel=3Dtc=
g -device sgx-epc<br>CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc=
.h:128:PC_MACHINE: Object 0x557a52333d90 is not an instance of type generic=
-pc-machine<br>CRITICAL: exit code: -6<br><br>CRITICAL: failed: binary=3D./=
qemu-system-x86_64 accel=3Dtcg machine=3Dx-remote device=3Dsgx-epc<br>CRITI=
CAL: cmdline: ./qemu-system-x86_64 -S -machine x-remote,accel=3Dtcg -device=
 sgx-epc<br>CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC=
_MACHINE: Object 0x55bbcd596d40 is not an instance of type generic-pc-machi=
ne<br>CRITICAL: exit code: -6<br><br>CRITICAL: failed: binary=3D./qemu-syst=
em-x86_64 accel=3Dtcg machine=3Dmicrovm device=3Dsgx-epc<br>CRITICAL: cmdli=
ne: ./qemu-system-x86_64 -S -machine microvm,accel=3Dtcg -device sgx-epc<br=
>CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE: O=
bject 0x55ca35c081b0 is not an instance of type generic-pc-machine<br>CRITI=
CAL: exit code: -6<br><br>CRITICAL: failed: binary=3D./qemu-system-mips64el=
 accel=3Dtcg machine=3Dpica61 device=3Disa-cirrus-vga<br>CRITICAL: cmdline:=
 ./qemu-system-mips64el -S -machine pica61,accel=3Dtcg -device isa-cirrus-v=
ga<br>CRITICAL: log: RAMBlock &quot;vga.vram&quot; already registered, abor=
t!<br>CRITICAL: exit code: -6<br><br>CRITICAL: failed: binary=3D./qemu-syst=
em-i386 accel=3Dkvm machine=3Dnone device=3Dsgx-epc<br>CRITICAL: cmdline: .=
/qemu-system-i386 -S -machine none,accel=3Dkvm -device sgx-epc<br>CRITICAL:=
 log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE: Object 0x55=
d0e0a03d90 is not an instance of type generic-pc-machine<br>CRITICAL: exit =
code: -6<br><br>CRITICAL: failed: binary=3D./qemu-system-i386 accel=3Dkvm m=
achine=3Dx-remote device=3Dsgx-epc<br>CRITICAL: cmdline: ./qemu-system-i386=
 -S -machine x-remote,accel=3Dkvm -device sgx-epc<br>CRITICAL: log: /home/j=
snow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE: Object 0x564648250b30 is=
 not an instance of type generic-pc-machine<br>CRITICAL: exit code: -6<br><=
br>CRITICAL: failed: binary=3D./qemu-system-i386 accel=3Dkvm machine=3Dmicr=
ovm device=3Dsgx-epc<br>CRITICAL: cmdline: ./qemu-system-i386 -S -machine m=
icrovm,accel=3Dkvm -device sgx-epc<br>CRITICAL: log: /home/jsnow/src/qemu/i=
nclude/hw/i386/pc.h:128:PC_MACHINE: Object 0x55bef7a235b0 is not an instanc=
e of type generic-pc-machine<br>CRITICAL: exit code: -6<br><br>CRITICAL: fa=
iled: binary=3D./qemu-system-i386 accel=3Dtcg machine=3Dnone device=3Dsgx-e=
pc<br>CRITICAL: cmdline: ./qemu-system-i386 -S -machine none,accel=3Dtcg -d=
evice sgx-epc<br>CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:1=
28:PC_MACHINE: Object 0x5608b9fecd90 is not an instance of type generic-pc-=
machine<br>CRITICAL: exit code: -6<br><br>CRITICAL: failed: binary=3D./qemu=
-system-i386 accel=3Dtcg machine=3Dx-remote device=3Dsgx-epc<br>CRITICAL: c=
mdline: ./qemu-system-i386 -S -machine x-remote,accel=3Dtcg -device sgx-epc=
<br>CRITICAL: log: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE=
: Object 0x558306c9cb30 is not an instance of type generic-pc-machine<br>CR=
ITICAL: exit code: -6<br><br>CRITICAL: failed: binary=3D./qemu-system-i386 =
accel=3Dtcg machine=3Dmicrovm device=3Dsgx-epc<br>CRITICAL: cmdline: ./qemu=
-system-i386 -S -machine microvm,accel=3Dtcg -device sgx-epc<br>CRITICAL: l=
og: /home/jsnow/src/qemu/include/hw/i386/pc.h:128:PC_MACHINE: Object 0x55e0=
41f465b0 is not an instance of type generic-pc-machine<br>CRITICAL: exit co=
de: -6<br><br>CRITICAL: failed: binary=3D./qemu-system-mips64 accel=3Dtcg m=
achine=3Dpica61 device=3Disa-cirrus-vga<br>CRITICAL: cmdline: ./qemu-system=
-mips64 -S -machine pica61,accel=3Dtcg -device isa-cirrus-vga<br>CRITICAL: =
log: RAMBlock &quot;vga.vram&quot; already registered, abort!<br><div>CRITI=
CAL: exit code: -6</div><div><br></div><div><br></div><div>--js<br></div></=
div>

--000000000000f1d4e605d113de48--


