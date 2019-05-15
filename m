Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3FC1F932
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 19:15:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40085 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQxUk-0004VT-Mr
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 13:15:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <s.priebe@profihost.ag>) id 1hQxTe-000488-Ng
	for qemu-devel@nongnu.org; Wed, 15 May 2019 13:14:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <s.priebe@profihost.ag>) id 1hQxTd-0000xk-Qa
	for qemu-devel@nongnu.org; Wed, 15 May 2019 13:14:02 -0400
Received: from cloud1-vm154.de-nserver.de ([178.250.10.56]:20279)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <s.priebe@profihost.ag>)
	id 1hQxTd-0000q1-E5
	for qemu-devel@nongnu.org; Wed, 15 May 2019 13:14:01 -0400
Received: (qmail 23413 invoked from network); 15 May 2019 19:13:57 +0200
X-Fcrdns: No
Received: from phoffice.de-nserver.de (HELO [10.242.2.6]) (185.39.223.5)
	(smtp-auth username hostmaster@profihost.com, mechanism plain)
	by cloud1-vm154.de-nserver.de (qpsmtpd/0.92) with
	(ECDHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA;
	Wed, 15 May 2019 19:13:57 +0200
To: qemu-devel <qemu-devel@nongnu.org>
From: Stefan Priebe - Profihost AG <s.priebe@profihost.ag>
Message-ID: <7c80a63c-a7ce-1e83-650b-0b8343563127@profihost.ag>
Date: Wed, 15 May 2019 19:13:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-User-Auth: Auth by hostmaster@profihost.com through 185.39.223.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.250.10.56
Subject: [Qemu-devel] cpu.fail / MDS fixes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello list,

i've updated my host to kernel 4.19.43 and applied the following patch
to my qemu 2.12.1:
https://bugzilla.suse.com/attachment.cgi?id=798722

But my guest running 4.19.43 still says:
Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state
unknown

while the host says:
Vulnerable: Clear CPU buffers attempted, SMT Host state unknown

I expected the guest can use the new microcode.

Greets,
Stefan

