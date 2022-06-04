Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607BE53D64E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 11:50:32 +0200 (CEST)
Received: from localhost ([::1]:59392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxQQQ-0006bm-TQ
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 05:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nxQKp-0005g2-Bj
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 05:44:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nxQKn-0004La-Hk
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 05:44:43 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0FE9C4012A;
 Sat,  4 Jun 2022 12:44:28 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 6BE352A;
 Sat,  4 Jun 2022 12:44:27 +0300 (MSK)
Message-ID: <0dd3627b-8f4c-93fd-89e7-3c8c3584994b@msgid.tls.msk.ru>
Date: Sat, 4 Jun 2022 12:44:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: q: incorrect register emulation mask for Xen PCI passthrough?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

There's a debian bugreport open - now against qemu - https://bugs.debian.org/988333 -
which initially said VGA Intel IGD Passthrough to Debian Xen HVM DomUs not working
but worked okay with windows DomUs.

The most interesting comment in there is the last one, https://bugs.debian.org/988333#146 ,
which sums it all up and provides a patch for the issue, at
https://github.com/QubesOS/qubes-vmm-xen-stubdom-linux/pull/3/commits/ab2b4c2ad02827a73c52ba561e9a921cc4bb227c
which is from 2017 (!).

I wonder if we should apply this one upstream, or if it is somehow incorrect
fix, should fix this particular issue the right way.  It's 5 years old already
and people are still suffering... :)

Thanks,

/mjt

