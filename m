Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B7A515E26
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 16:22:16 +0200 (CEST)
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknzC-0001Bv-UN
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 10:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nknoe-0006Uf-J0
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 10:11:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nknoc-0003fw-Sf
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 10:11:20 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7D63B407EB
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 17:11:11 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id BAD7B2A
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 17:05:54 +0300 (MSK)
Message-ID: <31fb2fcb-6ad0-b769-9ec9-94fba0679065@msgid.tls.msk.ru>
Date: Sat, 30 Apr 2022 17:11:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: Building tools on unsupported cpu/arch
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

Hello!

Previously, it was possible to build qemu tools (such as qemu-img, or qemu-ga)
on an unsupported cpu/architecture.  In a hackish way, by specifying
--enable-tcg-interpreter on the ./configure line.

Today (with 7.0), it does not work anymore, with the following error
during configure:

  common-user/meson.build:1:0: ERROR: Include dir host/unknown does not exist.

This is with --disable-system --disable-linux-user --disable-user.

And without --enable-tcg-interpreter, it gives:

  meson.build:390:6: ERROR: Problem encountered: Unsupported CPU m68k, try --enable-tcg-interpreter

What's the way to build tools on an unsupported architecture these days?

Thanks,

/mjt

