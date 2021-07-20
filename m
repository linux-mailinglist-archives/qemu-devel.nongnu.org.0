Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1B03CF743
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 11:56:55 +0200 (CEST)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5mUg-0001Cr-Ez
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 05:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gbs@canishe.com>) id 1m5mTY-0008Mj-1W
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:55:44 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:57555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gbs@canishe.com>) id 1m5mTV-00085V-Vl
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:55:43 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7BDDA5C034E;
 Tue, 20 Jul 2021 05:55:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 20 Jul 2021 05:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canishe.com; h=
 from:content-type:content-transfer-encoding:mime-version:subject
 :message-id:date:cc:to; s=fm2; bh=5VAOhqmK7BzBMQxT5/brckcI3iH6oX
 hxcrXXJL3XBpE=; b=iJFUgJo9JhPHuxHLUCs5N9A81hCUw0/TPkOGwbuggtvOrZ
 gG90sbcpMG5q9jQj6zTHVhDE1li9Jy5c07VUvafyAN6l14gaP0gM9eoOOgGH+gcR
 JdnZhH0U7f+tm25THhj8iBdXQ5kmjTy3I2uEvUZGNX+I5DT0dy/G1wJV9oVLYTSI
 e+OWG2PSofoSAVgiWpNcYX90J7xUmSHg44dT4XXN0sodXi6+fkNw/X4wlWiAChHa
 YHovRQUkKmhyzK3UH6zxPASrhanO/2jCKiHeoDA7bmjBwbum5P16y25vhVg3ytbL
 kPEZOXFgupq55QNpqlb15MOxjCE3zpeiitFwmoHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5VAOhq
 mK7BzBMQxT5/brckcI3iH6oXhxcrXXJL3XBpE=; b=UFB0nVlcj5Nkb6DOg/Pcho
 k39pIXSjG9yAWS4L22FgnOpJwXCLr7DquYZDfJ3CMU+Eo9Iz3SFOoHIVMEtuAy21
 sAdDh2soHwtyxXvZLOBgjMNfD5jLlDNefi8angU+IWnEGhpy+55KDvmD4gvs8UNh
 O2Z9BAkjUfULij/gGB/Oo4LpJSRLl6chQwzaPeg72XdbulwJJw4FSWc/x+OiU8Dq
 g2SUYKAWaLG4O2HVcbVkdr97xoV85J/T0X3JdDPxrJnYUb4Lz12lxQ4jrRItLqs5
 Nu5C11yXztHGTpFJ+K2TGfUfgS9IRg5092T2vWd/nG1SPiQ+P5ceLcJytfNELeDQ
 ==
X-ME-Sender: <xms:mZ32YNEzZyM8pDQ_8Ijw5ju9FjD-DyKpne2yoYnICouWT2lwYIK-wA>
 <xme:mZ32YCXyIBZLKCpsUHFdlWR8PhuMd13crd72cZothL81O1wwIT3EivVcM0k3WRZrY
 4UracrfQxL1qDKw2A>
X-ME-Received: <xmr:mZ32YPKvEE39nYoJKYKfLIaXqIC6ER96FcPzdHZ5G6d0PKJGsBIRxwWyIDbwv9MVdf7IrdoW62xn25qiq8lOROz9DZDuXlE5uSvoD8c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedvgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhtgfgggfukfffvffosehtjehmtdhhtddvnecuhfhrohhmpefirggvlhgrnhcu
 ufhtvggvlhgvuceoghgsshestggrnhhishhhvgdrtghomheqnecuggftrfgrthhtvghrnh
 ephefguedtgfektdekudelieetudefteehkeeiuefhleehhfehueeiffdvueeiueevnecu
 ffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehgsghssegtrghnihhshhgvrdgtohhm
X-ME-Proxy: <xmx:mZ32YDHCKSIjpo2d0651VkKbAop7spK2nQP63Imxjn1ZsxMhJzGD3g>
 <xmx:mZ32YDV5r8-QzNSgxa6XvtWqJDWdzpoemXKNr1Be7OTcQXV3SUZAag>
 <xmx:mZ32YOPVXkhdx3jwdLX-3UrtmM9JkrarFu6LTNlqe70__RF10E0cGw>
 <xmx:mZ32YEcZtTCKsTTXsbgy9MbeP_HHsgWzHW0pcNAyflQvpwKTz3VP1w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 05:55:36 -0400 (EDT)
From: Gaelan Steele <gbs@canishe.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3681.0.2.1.2\))
Subject: [RFC] Rust vhost-user-scsi implementation
Message-Id: <B2112AF6-3E5E-4CF6-8714-C2DE109FD7E6@canishe.com>
Date: Tue, 20 Jul 2021 02:55:35 -0700
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3681.0.2.1.2)
Received-SPF: none client-ip=66.111.4.28; envelope-from=gbs@canishe.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

I've been working as one of QEMU's Google Summer of Code interns to
implement a vhost-user-scsi daemon in Rust. That work's now reached a
point where it's usable to attach read-only raw disk images to a VM,
and I'd like to get some feedback from the QEMU community, especially
anyone with experience with the SCSI protocol.

My code, and some further information, are available at
https://github.com/rust-vmm/vhost-device/pull/4 or
https://github.com/Gaelan/vhost-device.git#scsi-v1. Feedback is
welcome either on GitHub or by email. If people here would prefer me
to send the code as a patch to this list, I could do that as well.

Thanks!
Gaelan Steele

