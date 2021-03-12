Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91B7338B8B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 12:34:01 +0100 (CET)
Received: from localhost ([::1]:48810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKg3N-00032X-1O
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 06:34:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKg1r-00029N-DA
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:32:27 -0500
Received: from mx2.suse.de ([195.135.220.15]:37498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKg1n-0000y3-Hk
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:32:27 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB1A9B02F;
 Fri, 12 Mar 2021 11:32:21 +0000 (UTC)
To: Alex Bennee <alex.bennee@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Subject: on master, x86_64: make check-tcg: "Error loading uncompressed kernel
 without PVH ELF Note"
Message-ID: <1b9dbb21-7baf-d7d1-fea8-1bb9fa3cd72a@suse.de>
Date: Fri, 12 Mar 2021 12:32:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

are you also seeing this for make check-tcg on master?

make[2]: Entering directory '/home/claudio/git/qemu-pristine/qemu/build-x86/tests/tcg/x86_64-softmmu'
timeout 15  /home/claudio/git/qemu-pristine/qemu/build-x86/qemu-system-x86_64 -monitor none -display none -chardev file,path=memory.out,id=output  -device isa-debugcon,chardev=output -device isa-debug-exit,iobase=0xf4,iosize=0x4 -kernel memory
qemu-system-x86_64: Error loading uncompressed kernel without PVH ELF Note
make[2]: *** [../Makefile.target:162: run-memory] Error 1

Thanks,

Claudio

-- 
Claudio Fontana
Engineering Manager Virtualization, SUSE Labs Core

SUSE Software Solutions Italy Srl

