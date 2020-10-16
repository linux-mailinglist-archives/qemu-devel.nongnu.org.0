Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65B290413
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 13:33:41 +0200 (CEST)
Received: from localhost ([::1]:37808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTNzQ-00048R-E9
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 07:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTNyd-0003eY-UC
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:32:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56992
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTNyb-0000fS-5d
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:32:50 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1kTNyd-0000kp-Io
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 12:32:51 +0100
To: qemu-devel <qemu-devel@nongnu.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <2baf958b-80bd-778e-e0e8-b03364a942a6@ilande.co.uk>
Date: Fri, 16 Oct 2020 12:32:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: aio_poll() assertion fail on Windows
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9,
 PDS_TONAME_EQ_TOLOCAL_SHORT=1.999, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Whilst testing a Windows build of git master of qemu-system-ppc in MSYS2/MingW64 I 
noticed the following assertion message in the console after booting into OpenBIOS 
and then closing the GTK GUI window without booting a client OS:

$ ./qemu-system-ppc
**
ERROR:../util/aio-win32.c:337:aio_poll: assertion failed: 
(in_aio_context_home_thread(ctx))
Bail out! ERROR:../util/aio-win32.c:337:aio_poll: assertion failed: 
(in_aio_context_home_thread(ctx))

Has anyone else seen this at all?


ATB,

Mark.

