Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ECF4E8621
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Mar 2022 07:56:46 +0200 (CEST)
Received: from localhost ([::1]:57754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYLtM-0002oe-Tn
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 01:56:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca.mckeever@protonmail.com>)
 id 1nYLrf-00022e-29
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 01:54:59 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:56874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca.mckeever@protonmail.com>)
 id 1nYLrd-0006ks-0S
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 01:54:58 -0400
Date: Sun, 27 Mar 2022 05:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1648360492;
 bh=0Q9u6YU0N4abum1SiIpTO/08zEMQ8MTmBVNSjwuRyug=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID;
 b=Pcmo/ruIUNk/N54Hz1uQCtL5aKPQXid9wGz77AzgalwZ4NTBunCOKRE9eEA79HOYG
 mXpGwgyoQfeY+YpErat5My9IujeKqgouCGk1lacc7Z82W0BKoK4RGLiHvrZUgqXzJs
 5Bl/dl6xkUeaPccbVNxddB5qAFakDUDyNAqQ5sHCGEinTligAQN/Bi1oZ4+LI4coUf
 O8T7vXHOoKBQFha3HRV5qmwGDn8eGNRgefuOPy9TNAmKJGOWVq16rbRtGm/TUHXlCI
 fZ0fNI8kGV5Zj3YPVWYBcrKVrRd3gvTqauDVMISLjk8La5Uru5F48MZ7ShQfggZ6Pp
 38D0n/CtIXToA==
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
From: Rebecca Mckeever <rebecca.mckeever@protonmail.com>
Subject: Outreachy Contributor Intro
Message-ID: <zpNsdOSBrF8s8OvheaVLixrNEW9lmTEj43EzZPCEwUCYJg6aLR6WdKDW9JsLSmzTwPrEHmNYef6hJZjtOABtT3omHj7ASFVyl1EnUp219CM=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.134;
 envelope-from=rebecca.mckeever@protonmail.com; helo=mail-40134.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Rebecca Mckeever <rebecca.mckeever@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Everyone,

My name is Rebecca Mckeever, and I am a senior Computer Science student and=
 an Outreachy May 2022 applicant. I am interested in contributing to one of=
 the QEMU projects (Add zoned device support to QEMU's virtio-blk emulation=
 or Implement VIRTIO_F_IN_ORDER support for virtio devices), but I haven't =
yet decided which one. I am new to open source contributions, but I am very=
 interested Linux development. I have a lot of experience with C/C++, and I=
 use Ubuntu as my primary operating system. I am familiar with the Continuo=
us Integration process and have used git/GitHub extensively for personal an=
d class projects. I am looking forward to working with this community.

