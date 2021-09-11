Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B92407A08
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:56:28 +0200 (CEST)
Received: from localhost ([::1]:36666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP7Eo-00037E-Gv
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mP79H-0001WG-3Z
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 13:50:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mP79F-0005uk-4B
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 13:50:42 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 8C0424000A
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 20:50:30 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 7D7A0F2
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 20:50:30 +0300 (MSK)
To: qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: tcg: pointer size warning on x32 arch
Message-ID: <f5bd1db5-1bf1-e32f-3eff-aa8f0c7e8a1e@msgid.tls.msk.ru>
Date: Sat, 11 Sep 2021 20:50:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi.

The following warning is reported by the C compiler when compiling
tcg code on x32 architecture:

In file included from ../../tcg/tcg.c:429:
tcg/i386/tcg-target.c.inc: In function ‘tcg_out_movi_int’:
tcg/i386/tcg-target.c.inc:959:30: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
   959 |     diff = tcg_pcrel_diff(s, (const void *)arg) - 7;

I dunno if we should be concerned or if it is worth to support x32
in the first place. But I thought I'd report it anyway.

Thanks!

/mjt

