Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CDB3FF8FA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 04:57:05 +0200 (CEST)
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLzO4-00068U-BP
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 22:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vintagepc404@protonmail.com>)
 id 1mLzMd-0005K3-9l
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 22:55:35 -0400
Received: from mail-40140.protonmail.ch ([185.70.40.140]:63745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vintagepc404@protonmail.com>)
 id 1mLzMb-0004SH-29
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 22:55:34 -0400
Date: Fri, 03 Sep 2021 02:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1630637728;
 bh=vRKBmFyI6wUefWdfOJKM5/8Qd1QzIh6HgFxgEQBoHKk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=VGN+Q69TxCbNrmYpNJqaVScemapAAoMAtrrFJpbRmV0IAk+cyKVofx946Od8ILnOL
 Zrv8BJLFH5X6wYwIChcAij0vgpcvlwQCZzg2d1sjRnerkog57W6bNx/Y3sO7913yoO
 SHwcHFBwdX1BXcOaEUM994dpMvZAFt7F3QB43PUE=
To: "kraxel@redhat.com" <kraxel@redhat.com>
From: VintagePC <vintagepc404@protonmail.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Subject: Re: USB-MSD non-functional after merging v5.1 to v6.x (seems to be
 internal USB stack issue?)
Message-ID: <utXX9E4xF79uuQWasw0gE1nMa9D3uG6GXEyHgPcpYUyH4mNwhjnU8JjGVRYBAxIjr_1R7gS-nKrg0V0bMm_nR6Y9EMYGr7ro_7ixYyJ2584=@protonmail.com>
In-Reply-To: <vAlTpwWpoR91zKfyUom-_cFnqJA3-xN8UGC9BiCUBK3pVgcjE18OC6e_jfWca_POVxFm-kCa73O6g2Da5FLhDZXwOoY6aq8vZU31NRIAcYc=@protonmail.com>
References: <HiU5xYXWuIPVg8tuVKzH1LTrKtKSBr01C6h_-uUbJ720IWY8SO1Bna1_-ak0HWraabqIa-hkGUoxeG2aQn6v7WAy1gnDxq9b_tklE0dGRYc=@protonmail.com>
 <20210902062232.uau63uq53akr6snr@sirius.home.kraxel.org>
 <vAlTpwWpoR91zKfyUom-_cFnqJA3-xN8UGC9BiCUBK3pVgcjE18OC6e_jfWca_POVxFm-kCa73O6g2Da5FLhDZXwOoY6aq8vZU31NRIAcYc=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.140;
 envelope-from=vintagepc404@protonmail.com; helo=mail-40140.protonmail.ch
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO_END_DIGIT=0.25, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: VintagePC <vintagepc404@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Well... the plot thickens. I have found the smoking gun.

At some point during implementation of the STM USB stack must have run into=
 the same problem with the communications choking during MSD init. And at t=
he time (which involved a LOT of wireshark comparisons with a real USB driv=
e on the host and on the DCW2 Rpi2 stack) I'd added the QEMU_PACKED directi=
ve to the usb_msd_csw struct.

Naturally, when the definitions were relocated to a header, that was lost w=
hen resolving the merge conflict because I wasn't paying attention. (D'oh!)

So while it's working again... the question still remains why I had to make=
 this tweak in the first place - so I dug further:

I just re-compared with the MSD setup of a real drive on the PC. The status=
 section of the MSD is only a single byte for the real drive but is 4 bytes=
 in the packet received by the guest without the PACKED directive. Wireshar=
k also cannot decode this "oversize" packet properly, which seems to furthe=
r suggest  that this may indeed be an actual bug in the MSD implementation =
- naturally it would only manifest on systems/compilers where the data alig=
nment precipitates this problem.

Further code inspection suggests this originates with the following line in=
 usb-storage.c:
> len =3D MIN(sizeof(s->csw), p->iov.size);
specifically, if the iov.size is > than the MSD CSW. And that's where my kn=
owledge of the QEMU USB system ends and I defer to those more knowledgeable=
. I'm guessing this might mean that things are fine if the receiving endpoi=
nt configures itself to exactly the expected CSW size - but breaks if the e=
ndpoint is configured with a larger receive buffer. At least for ARM kernel=
 being run this isn't custom code and is part of the generic HAL and USB st=
ack STM offers - so I have a hard time believing this is an unusual practic=
e.

I even went so far as to eliminate dev-storage from the picture entirely an=
d use USB-host to connect a real physical USB drive with the simulated plat=
form - and again, the wireshark capture reveals that the CSW packet size is=
 a single byte as the "correct" behaviour regardless of how the device sets=
 up its receive buffers.

Thoughts?

~ VintagePC


