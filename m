Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587CF61DE95
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 22:24:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orQeL-0002zO-Id; Sat, 05 Nov 2022 17:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1orQeJ-0002xe-0k
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 17:24:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1orQeH-0007jV-2Z
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 17:24:18 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 97DE640522;
 Sun,  6 Nov 2022 00:24:15 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 2D2CA3D3;
 Sun,  6 Nov 2022 00:24:17 +0300 (MSK)
Message-ID: <a138f3e1-9d4d-8dc4-546c-d630c0f53a7e@msgid.tls.msk.ru>
Date: Sun, 6 Nov 2022 00:24:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH trivial for 7.2 1/2] hw/usb/hcd-xhci.c: spelling: tranfer
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20221105114851.306206-1-mjt@msgid.tls.msk.ru>
 <6d819738-8ab1-0358-e54a-719103aaef09@weilnetz.de>
 <0e514d6d-3367-5e69-b7d2-1070cb1441a2@weilnetz.de>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <0e514d6d-3367-5e69-b7d2-1070cb1441a2@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

05.11.2022 15:23, Stefan Weil via wrote:
..
> All typos from this series were also found by codespell.
> 
> See https://qemu.weilnetz.de/test/typos7 for many more.
> That list was produced with `make check-spelling` from
> my previous patch).

Yeah, codespell is a good thing. But qemu has just TOO MANY typos, and
non-typos too (eg addd). I only patched a few places which are visible
in the binaries.

/mjt

