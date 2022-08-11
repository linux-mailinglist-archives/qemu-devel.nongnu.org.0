Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F43958FD5F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 15:28:20 +0200 (CEST)
Received: from localhost ([::1]:51228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM8EU-0005rI-VO
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 09:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wbx@openadk.org>) id 1oM8BA-0001h6-R0
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:24:57 -0400
Received: from helium.openadk.org ([89.238.66.15]:55688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wbx@openadk.org>) id 1oM8B7-0004mg-P3
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:24:51 -0400
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 542E831E00C3; Thu, 11 Aug 2022 15:24:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1660224285; bh=Mhw9eGnozu8TwnHOhByEdpUuNBrNi18518IF4vfFvb8=;
 h=Date:From:To:Subject:From;
 b=EUl26UzmMqwp1BNcM3Mg1oZS4eZcXk2VCJ1UQXwNcMIh9zRQ5uW8/9190sxgpVCSH
 TG2EdU5oHNID2l9HqsObGbkije5Q4/itx80sk1+GFmaIrs2H9t6rJ/GBR4RiL8p0lb
 J7KtAutorj5mDHwegiYyH0UV2BAqckJmNXZ0bSnVQORaQMCTEx8IHAhUbJLNTHWAhR
 OC+gc5BYxBfsaUGD+chQWS+O4wyIWZkzBgWLZb4XBl8JAWFQrifNrWmguCFVOglfJd
 vneGB9gfiE8XxcZlxpMb2V0E4Rp9Sqfw+fWdXuDYcWccWLgngTxu4NVyplrqvzIiC9
 sjjdaZpMgQzQQ==
Date: Thu, 11 Aug 2022 15:24:45 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: qemu-devel@nongnu.org
Subject: problem with qemu-system-loongarch64
Message-ID: <YvUDHecm0tYqb3bI@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-10-amd64 x86_64
Received-SPF: pass client-ip=89.238.66.15; envelope-from=wbx@openadk.org;
 helo=helium.openadk.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Qemu developers,

I am trying to bootup a loongarch64 Linux kernel in Qemu 7.1.0-rc2.
The problem is I get no output when using following command:
qemu-system-loongarch64 -M virt -nographic -kernel vmlinux

You can find my vmlinux initramfs here:
https://debug.openadk.org/vmlinux

It is cross-compiled with binutils 2.39, gcc 12.1, glibc 2.36 and
Linux 5.19. I use the provided defconfig loongson3_defconfig for the
kernel build.

Any hint what I can do to get a bootable Linux image?

best regards
 Waldemar

