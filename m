Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617562C23DE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 12:09:58 +0100 (CET)
Received: from localhost ([::1]:39394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khWCr-0001Ct-Fl
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 06:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khW8t-00070E-GV
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:05:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:53018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khW8r-0007rj-Dt
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:05:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 597B9AC2D;
 Tue, 24 Nov 2020 11:04:43 +0000 (UTC)
To: Alex Bennee <alex.bennee@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Subject: help with a build-user and build-user-plugin failure
Message-ID: <19955b4e-f33a-a672-e9c6-3efdd640906a@suse.de>
Date: Tue, 24 Nov 2020 12:04:42 +0100
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

I am seeing build failures with build-user and build-user-plugin:

https://gitlab.com/hw-claudio/qemu/-/pipelines/220245998

and I am trying to start investigating.

How do I reproduce this locally?

I am trying to run locally the check-tcg rule, but I cannot get it to work.
I managed to work around the problem of static libraries (disabled them),

but then I get:

  BUILD   TCG tests for x86_64-linux-user
  BUILD   x86_64-linux-user guest-tests with cc
/usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld: /tmp/ccgqtAM9.o: in function `test_fops':
/dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:759: undefined reference to `fmod'
/usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:760: undefined reference to `sqrt'
/usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:761: undefined reference to `sin'
/usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:762: undefined reference to `cos'

Have you seen it before?
Any suggestions? I'm on OpenSUSE Leap 15 SP2.

Ciao,

Claudio

-- 
Claudio Fontana
Engineering Manager Virtualization, SUSE Labs Core

SUSE Software Solutions Italy Srl

