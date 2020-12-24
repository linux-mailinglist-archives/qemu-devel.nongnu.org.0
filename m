Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DAF2E25C5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 10:54:57 +0100 (CET)
Received: from localhost ([::1]:43016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksNKh-0004iZ-SX
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 04:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1ksNJb-0004Hx-NM
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 04:53:47 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:60103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1ksNJY-0008HJ-Cr
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 04:53:47 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94)
 for qemu-devel@nongnu.org with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1ksNJT-002hef-GT; Thu, 24 Dec 2020 10:53:39 +0100
Received: from dynamic-089-012-156-039.89.12.pool.telefonica.de
 ([89.12.156.39] helo=[192.168.1.10])
 by inpost2.zedat.fu-berlin.de (Exim 4.94)
 for qemu-devel@nongnu.org with esmtpsa (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1ksNJS-0045Zc-OT; Thu, 24 Dec 2020 10:53:39 +0100
To: QEMU Developers <qemu-devel@nongnu.org>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Deprecation of the LM32 target
Message-ID: <49c3d04e-a94c-cf77-4df9-5ceb8c9c7f80@physik.fu-berlin.de>
Date: Thu, 24 Dec 2020 10:53:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 89.12.156.39
Received-SPF: pass client-ip=130.133.4.66;
 envelope-from=glaubitz@zedat.fu-berlin.de; helo=outpost1.zedat.fu-berlin.de
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello!

I was just browsing through the QEMU Christmas Calendar [1] and noticed
the announcement for the deprecation of the LM32 target.

I'm not sure what the motivation of the deprecation is, but isn't one of
the big selling points of QEMU to support deprecated targets?

If QEMU eventually ends up supporting commercially available targets only
and kicking out everything that is obsolete, I'm not sure what the point
of QEMU would be in the first place as products like VMWare and VirtualBox
already provide virtualization functionality.

Please don't deprecate targets just because they're old.

Thanks,
Adrian

> [1] https://www.qemu-advent-calendar.org/2020/

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

