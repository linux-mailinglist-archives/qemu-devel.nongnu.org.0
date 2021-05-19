Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627453884AB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 04:11:42 +0200 (CEST)
Received: from localhost ([::1]:40796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljBgS-0004TE-Um
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 22:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gbs@canishe.com>) id 1ljBfT-0003ji-UQ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 22:10:39 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:49191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gbs@canishe.com>) id 1ljBfR-0005xi-Sw
 for qemu-devel@nongnu.org; Tue, 18 May 2021 22:10:39 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B475F166D;
 Tue, 18 May 2021 22:10:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 18 May 2021 22:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canishe.com; h=
 from:content-type:content-transfer-encoding:mime-version:subject
 :message-id:date:cc:to; s=fm2; bh=hJzIytr8OgKE9ZZ+5ZVdnWtPqzlZHD
 K/APbGbHQVvvs=; b=CI4RVVKvlM13tJebwM0UzOLZTpswMSNEECUL9ymx9oTtE1
 oTMkazfLyNhtT5RFr5rQNG0JHtLS0DpYaTGD701eus3HTtqlX9+yb2401/4R6TOV
 JLSxMQJWEilsDhSK7UDk6cBuMsa3DBur7nLGEUv5ChFrQRyNJjR13YIQtOAX0Aj2
 6lG12nw3bTSi1s4ZEdFzV0ejLZuHgBmxCJYP/cAdtH4f3+k28Urd4+cQ8/rvm6xX
 7ph0GquX/Wn57lY4m/Vwk6ygnWsDJjokc7igVqN5KZNz5oI17450D4JO7M89S37x
 LibPy8+GMmgifuJVW97LpuSZwsyVU/S0zZlnweeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hJzIyt
 r8OgKE9ZZ+5ZVdnWtPqzlZHDK/APbGbHQVvvs=; b=FiaAfTvGxURe17idlXQqr5
 kJowf+t9gDehvI+oLqTtA2vbkTu1bCvpkYYwytntS/y7Tb8jPkLyscyLFQQ0p8t9
 HX33yxSXRdXmZqmBxLrpCbuCWqsfiOyGf9MjlYo9TcCHmQwuhmYvsRRDDRGz00aL
 NPdKOyhLp6Wyvwyetah5JGiuFAsSTRiZdfGj4/ZwelgjAgNzLitMZdLNAa2FSVwu
 8bSYPeRbzDWcjX6T+rAVUao7BPhaJwoHeo+H8UDY+zoJULw1pLqSO9u0+bxCbOSV
 AfKC8jFJN9mSVoHt2GVd7jepHCld2B1IbYKMMgx6599NG+RScy0S1aYACVzwG1sw
 ==
X-ME-Sender: <xms:mXOkYGD8ylV4X10Old1lW9RDnnbii9hiVwfXRksrM3fwr4CIhQ3itg>
 <xme:mXOkYAjRoRY4xFdP2n8GHrkRLRi3s7QNWV_OC0MAGKOzEO0t76rQWb3iMngQvxlFh
 NcPeyfW69O6FcygHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeikedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhtgfgggfukfffvffosehtjehmtd
 hhtddvnecuhfhrohhmpefirggvlhgrnhcuufhtvggvlhgvuceoghgsshestggrnhhishhh
 vgdrtghomheqnecuggftrfgrthhtvghrnhephffguedtkeevgfevtdehfeejudeujeettd
 ettdetjeffteehueejiedtheegffeinecukfhppeelkedrvdefvddrjedvrdejleenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgsghssegtrg
 hnihhshhgvrdgtohhm
X-ME-Proxy: <xmx:mXOkYJmIc58-ridIdja0UqZaqev7udeRcT9fR_PibYzjPRcY1h97Ig>
 <xmx:mXOkYEwL2pADJeus2Q0KccOYLs1DHDRrMAXb2zRUKYvpvEDz14iY5A>
 <xmx:mXOkYLTbUCE7plArJsJdmRWzfMfmnNEPD796Y3oJLsl6qDGO58YnBw>
 <xmx:mnOkYCeTGsikAYCtN7fZRjiaI2pPeef40q55YO9xgGGSp-14pX9gvg>
Received: from smtpclient.apple (c-98-232-72-79.hsd1.wa.comcast.net
 [98.232.72.79]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 22:10:33 -0400 (EDT)
From: Gaelan Steele <gbs@canishe.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: GSoC introduction: Rust vhost-user-scsi device
Message-Id: <250A3378-EA7A-4B8C-8FEA-10AD611F00FA@canishe.com>
Date: Tue, 18 May 2021 19:10:31 -0700
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Received-SPF: none client-ip=64.147.123.25; envelope-from=gbs@canishe.com;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello all,

I'm Gaelan Steele, one of QEMU's Google Summer of Code students this
year. My mentor (Sergio Lopez) has asked me to introduce myself and my
project here.

As you all may know, QEMU supports virtio-scsi in one of two ways: it
can use a built-in C implementation, running in the main QEMU process,
or delegate to another implementation over vhost-user. We have an
existing proof-of-concept vhost-user-scsi implementation in contrib/
that  passes requests through to an iSCSI target, but we don't have
such an implementation for a local disk image. My goal is to write 
one, in Rust. This has a few primary advantages over the existing
in-process SCSI implementation:

* Security - SCSI is a complex binary protocol - a fairly large attack
  surface. By moving the SCSI implementation into a separate process in
  a memory-safe language, we both reduce the risk of bugs in the first
  place, and make it possible to sandbox the vhost-user-scsi process,
  reducing the potential impact even if the process is compromised.
* Reusability - the plan is for this implementation to live with the
  rust-vmm project, where it can be used by QEMU but also by any other
  VMM that speaks vhost-user.
* Performance - living in a separate process might allow some
  optimizations that would be difficult to implement within QEMU proper.

My minimum goal is to implement enough of SCSI for the guest to be able
to mount a block device read-only; if I have time, I'll also implement
write support, add support for forwarding to an iSCSI target, and spend
time benchmarking and optimizing the new implementation.

We're currently in GSoC's "community bonding period", which I'll use
to get acquainted with the community and the rust-vmm codebase, and
nail down any toolchain issues. The coding period proper starts June 7
and continues for 10 weeks until August 16.

Finally, a bit about me: I'm an undergraduate computer science student
at the University of St Andrews, Scotland; physically, I'm at home in
the Pacific Northwest USA for the summer. I've been contributing to
open source for about a decade now.

Thanks for welcoming me into your community!
Gaelan Steele

