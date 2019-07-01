Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3815139D6
	for <lists+qemu-devel@lfdr.de>; Sat,  4 May 2019 14:40:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMtxX-0007J1-RK
	for lists+qemu-devel@lfdr.de; Sat, 04 May 2019 08:40:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1hMtwV-000702-GQ
	for qemu-devel@nongnu.org; Sat, 04 May 2019 08:39:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1hMtwU-0003Cf-Jb
	for qemu-devel@nongnu.org; Sat, 04 May 2019 08:39:03 -0400
Received: from hera.aquilenet.fr ([185.233.100.1]:38114)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <samuel.thibault@ens-lyon.org>)
	id 1hMtwU-0003Aq-Ct
	for qemu-devel@nongnu.org; Sat, 04 May 2019 08:39:02 -0400
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id 7FD4B6C5A;
	Sat,  4 May 2019 14:38:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10lgAxd7cKQa; Sat,  4 May 2019 14:38:58 +0200 (CEST)
Received: from function (105.251.129.77.rev.sfr.net [77.129.251.105])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id 2E92169EA;
	Sat,  4 May 2019 14:38:58 +0200 (CEST)
Received: from samy by function with local (Exim 4.92)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1hMtwP-0003Fg-8G; Sat, 04 May 2019 14:38:57 +0200
Date: Sat, 4 May 2019 14:38:57 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Cao Jiaxi <driver1998@foxmail.com>
Message-ID: <20190504123857.5e3xscijgezftaib@function>
References: <20190430181009.1066-1-driver1998@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430181009.1066-1-driver1998@foxmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.233.100.1
Subject: Re: [Qemu-devel] [PATCH v2 1/4] Initial Windows on ARM (AArch64
 64-Bit) host support
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Cao Jiaxi, le mer. 01 mai 2019 02:10:09 +0800, a ecrit:
> This series of patches is for initial support of Windows 10 on ARM as a QEMU host.
> Currently only TCG intepreter is working correctly, it crashes when TCG JIT is enabled.
> For now we assume it is built using the clang aarch64-w64-mingw32 toolchain, you can get a prebuilt toolchain at https://github.com/mstorsjo/llvm-mingw.
> 
> QEMU_PACKED: Remove gcc_struct attribute in Windows non x86 targets
> This attribute is for x86 only, and it generates an warning on ARM64 Clang/MinGW targets.

I have applied it to the libslirp repo, thanks!

I'll submit a pull request to get it updated on qemu.

Samuel

