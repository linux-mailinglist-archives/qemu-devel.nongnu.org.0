Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0031F3EE0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 17:07:51 +0200 (CEST)
Received: from localhost ([::1]:43252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jifqw-0003Zz-UQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 11:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurens.nikolaisen@posteo.de>)
 id 1jifpL-0002at-9W
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 11:06:11 -0400
Received: from mout02.posteo.de ([185.67.36.66]:55359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurens.nikolaisen@posteo.de>)
 id 1jifpJ-0000jJ-3m
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 11:06:10 -0400
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 972CC2400FE
 for <qemu-devel@nongnu.org>; Tue,  9 Jun 2020 17:06:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1591715166; bh=kQXlKQD+5T740RFcahTosnPycM7JbWdKiGeuxB94ikc=;
 h=Date:From:To:Cc:Subject:From;
 b=gMxitNaqt1e4p8Y5ucHQ2nVjLmXjLvGczpLQ0vetngXvUkEdN9mfrixwqDLB0jXy6
 5EjvWKzhlgib/KnUjFYHU9S5pvpJjbXgT0XJUj9KVfKsb4JAjUS3rfRdjEAWJjaipk
 iBTSOdDTfGxmrFo17InMWRsKlTzS2G3VM7Ml5oyPU9B+BXjz/bNuzvb/NToUhVZKDz
 99lQfFtCwKuuUFpnE3Cv0YYub0r84GodhvBQvJ6yBuQQwnR4o6fGuonHIGv+IiaDZa
 +59zl7p37huMGn3kt0XT+cWr3ZOLYKGqIc1KHTcO6ZN6PBtXBnPt19REpD80q133IR
 8LrM1xBy3AFYA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 49hD320Pptz6tmS;
 Tue,  9 Jun 2020 17:06:06 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2020 17:06:05 +0200
From: laurens.nikolaisen@posteo.de
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
Subject: Re: Using QXL & Spice with Windows Host & QEMU
In-Reply-To: <CAJ+F1CKJbOJBOxpd2guyU_iuqoVYNGJWRAinGWXoPT_hqjBgSg@mail.gmail.com>
References: <ba26c2d65cda15b581c1a7cc7274d1b2@posteo.de>
 <CAJ+F1CKJbOJBOxpd2guyU_iuqoVYNGJWRAinGWXoPT_hqjBgSg@mail.gmail.com>
Message-ID: <2951d126288fc96bc68fa8f56984839b@posteo.de>
X-Sender: laurens.nikolaisen@posteo.de
User-Agent: Posteo Webmail
Received-SPF: pass client-ip=185.67.36.66;
 envelope-from=laurens.nikolaisen@posteo.de; helo=mout02.posteo.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 11:06:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU <qemu-devel@nongnu.org>,
 Qemu-devel <qemu-devel-bounces+laurens.nikolaisen=posteo.de@nongnu.org>,
 Frediano Ziglio <fziglio@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc-Andr=C3=A9,

I did take notice of Fredianos answer. Since he redirected me to you=20
guys, I wanted to make sure my intention to get kvm running on Windows=20
could be possible in general. I did download the binaries from [0] which=20
is linked to from qemu.org.

I did enable:
-vga qxl -device virtio-serial-pci -spice port=3D5930,disable-ticketing=20
-device virtserialport,chardev=3Dspicechannel0,name=3Dcom.redhat.spice.0=20
-chardev spicevmc,id=3Dspicechannel0,name=3Dvdagent
=2E.. on the Windows host in the Qemu, but then I get the mentioned error=
=20
of KVM not being available. It just seems like kvm-support has not been=20
compiled into my binaries. Do you have any build guide for Windows? I'd=20
like to test a little further. Maybe we could get some useful=20
information as well that I could file some bug reports if I find any=20
bugs.

Usually I do use Linux (especially Linux Hosts) only. Since I'm foreced=20
to use a Windows Mashine for some of my work I'd love to get Qemu up and=20
running there (insteadt of VirtualBox, Hyper-V etc.).

Cheers,
Laurens

[0]
https://qemu.weilnetz.de/w64/

