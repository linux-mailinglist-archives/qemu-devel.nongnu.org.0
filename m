Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2387C3406CB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 14:25:08 +0100 (CET)
Received: from localhost ([::1]:57378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMseA-0007J7-ML
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 09:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <susinilorenzo1@gmail.com>)
 id 1lMqpn-0000ow-NE
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:28:59 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:41871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <susinilorenzo1@gmail.com>)
 id 1lMqpl-0001Kj-Tw
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:28:59 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id l13so1332930vst.8
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 04:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=GPi1R+/F5l5xMmx3avvBOsltXruDH5DoLlMjV8xOSmk=;
 b=jlRSvUXHTD5TsUtnocuIZY6xhWSeveHXVc1xShYIN+znp3P2+hKhjjIsIqgD48pUMx
 LGq9vTNeEBi7OPMEMD71iIaZTuABu6lNbr0gUtcNkgq9e7tiq9wnLrBNfI139JO+Bayp
 yLrGx5iY6VKECPgmoNcWSTjPjfh5lbR+3kj6zlExJf9tjqot6VxUXxjDQny6aecRjH+/
 r1wd2yLQaFLNOZ1JJZsGxUlUQ91d4GoBpHol7JMDfFDf9wKjN2P7xRXXy5gumzK9pNrB
 Y/CDkO9u/omXF3RdeTFnBKxRkH+abbeOxmu0EcPG7Q5+q3QTCuGLzICWN2pPuJivLpbX
 pKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GPi1R+/F5l5xMmx3avvBOsltXruDH5DoLlMjV8xOSmk=;
 b=PagrNKpPHEEXuDrsFkWHXbXnCWRW+EffqDmKcHyScvfWXp4f/DRluiK5oSWJWFinjZ
 5+HMOQbb+UFKBeeNEth+tfa65qBJVsA2ayJ6trSUGBaVY17a0Q1cc9Pl5fvNUr6BXtFe
 yMfdID4f5rvz6ZleAZdM51Ck7cUSpiaMvB4FQ+WbB6H9lqiCBnSEOIxOtx/M+Di40NaB
 QvE5NPSj+qsizgzhYmbgp67MMz3Z00GLeryBWqX27/W9u+3WheaY5TRjsVY+JFmGeI9+
 ZGUhWg5sL9vCxsOsy10stPh6L0mcxy64mCLdQU/aaUW4iGqQlCrAxLeuZmxdZPI7NM8m
 zKnA==
X-Gm-Message-State: AOAM5328ykrCp+s5s6cfLe4yLY5sQQ1dxbgFnYYOdVs6E+Zpmq3e6sLD
 UDMgcaLEdUqOmx+f/MuEXiq4CEQiPPbgUQmiNKfbUTdBdACn0g==
X-Google-Smtp-Source: ABdhPJwbMIzB7DBtiD+M4oEmMV4xiwIGYBT1D91MoJH6/L4wHBFCPmRgu1yFNMfaapruqlC/DeeFvHxX2x/h23eduBw=
X-Received: by 2002:a67:fa05:: with SMTP id i5mr6246716vsq.41.1616066936194;
 Thu, 18 Mar 2021 04:28:56 -0700 (PDT)
MIME-Version: 1.0
From: Lorenzo Susini <susinilorenzo1@gmail.com>
Date: Thu, 18 Mar 2021 12:28:45 +0100
Message-ID: <CAHFRQs1GuB+8tw+SDK11LOLXF4H6z+6+ZbQMTABXNK3gj7vffA@mail.gmail.com>
Subject: KVM_MEM_READONLY slot flag not working properly
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000aa4a9305bdcde7d6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=susinilorenzo1@gmail.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 18 Mar 2021 09:24:06 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aa4a9305bdcde7d6
Content-Type: text/plain; charset="UTF-8"

Hello,

Have some of you successfully used the KVM_MEM_READONLY slot flag?

I'm working on a project and I'm trying to protect the guest's IDT by using
KVM, modifying kvm-all.c.
I'm able to correctly locate the IDT in the host by reading IDTR with
KVM_GET_SREGS,
translating it with KVM_TRANSLATE and, by using the KVMSlot struct, I'm
able to find the corresponding
host virtual address. I've double checked the addresses with the Qemu
Monitor (gpa2hva and gva2gpa) and they
are correct.

Then, I decided to split the slot where the IDT currently lives into three
separate ones, setting the IDT in its own private slot and making it
read-only with KVM_MEM_READONLY:

INITIAL SLOT ===> PRE IDT SLOT |  IDT SLOT (KVM_MEM_READONLY)  |  POST IDT
SLOT.

By doing this, the VM continues its execution normally. Also, I'm not
moving memory in the host when
reassigning slots, so I'm just changing the sizes and the addresses when
doing kvm_set_userspace_memory_region,
there's no need to move data anywhere else in my opinion, and this is
confirmed by the fact that VM, after doing so, behaves normally.

However, when I try to register a new interrupt handler (for instance for
the edu device, just to try it out), it works perfectly,
meaning that the IDT is not really read-only. Do you have any idea why? Any
suggestions on how to solve the problem?
Of course I've also checked KVM_CAP_READONLY_MEM, no problem with that.

Anyway, is this the right place to post?

Thank you,
Lorenzo

--000000000000aa4a9305bdcde7d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,=C2=A0<div><br><div>Have some of you successfully us=
ed the KVM_MEM_READONLY slot flag?</div><div><br><div>I&#39;m working on a =
project and I&#39;m trying to protect the guest&#39;s IDT by using KVM,=C2=
=A0modifying kvm-all.c.=C2=A0</div><div>I&#39;m able to correctly locate th=
e IDT in the host by reading IDTR with KVM_GET_SREGS,=C2=A0</div><div>trans=
lating it with KVM_TRANSLATE and, by using the KVMSlot struct, I&#39;m able=
 to find the corresponding<br></div></div></div><div>host virtual address. =
I&#39;ve double checked the addresses with the Qemu Monitor (gpa2hva and=C2=
=A0gva2gpa) and they</div><div>are correct.=C2=A0</div><div><br></div><div>=
Then, I decided to split the slot where the IDT currently lives into three =
separate ones, setting the IDT in its own private slot and making it=C2=A0<=
/div><div>read-only with KVM_MEM_READONLY:</div><div><br></div><div>INITIAL=
 SLOT =3D=3D=3D&gt; PRE IDT SLOT |=C2=A0 IDT SLOT (KVM_MEM_READONLY)=C2=A0 =
|=C2=A0 POST IDT SLOT.=C2=A0</div><div><br></div><div>By doing this, the VM=
 continues its execution normally. Also, I&#39;m not moving memory in the h=
ost when=C2=A0</div><div>reassigning slots, so I&#39;m just changing the si=
zes and the addresses when doing kvm_set_userspace_memory_region,=C2=A0</di=
v><div>there&#39;s no need to move data anywhere else in my opinion, and th=
is is confirmed by the fact that VM, after doing so, behaves normally.=C2=
=A0</div><div><br></div><div>However, when I try to register a new interrup=
t handler (for instance for the edu device, just to try it out), it works p=
erfectly,=C2=A0</div><div>meaning that the IDT is not really read-only. Do =
you have any idea why? Any suggestions on how to solve the problem?=C2=A0</=
div><div>Of course I&#39;ve also checked=C2=A0KVM_CAP_READONLY_MEM, no prob=
lem with that.=C2=A0</div><div><br></div><div>Anyway, is this the right pla=
ce to post?</div><div><br></div><div>Thank you,=C2=A0</div><div>Lorenzo</di=
v></div>

--000000000000aa4a9305bdcde7d6--

