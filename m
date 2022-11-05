Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA71A61DEB7
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 22:45:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orQxa-0008On-HQ; Sat, 05 Nov 2022 17:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1orQxY-0008Oc-88
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 17:44:12 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1orQxV-0001pL-NW
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 17:44:12 -0400
Received: from [192.168.44.88] (unknown [185.238.219.90])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id C3E11DA08BC;
 Sat,  5 Nov 2022 22:44:07 +0100 (CET)
Message-ID: <3c880743-7f29-ab36-c7ed-bb8348bf546c@weilnetz.de>
Date: Sat, 5 Nov 2022 22:44:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20221105114851.306206-1-mjt@msgid.tls.msk.ru>
 <6d819738-8ab1-0358-e54a-719103aaef09@weilnetz.de>
 <0e514d6d-3367-5e69-b7d2-1070cb1441a2@weilnetz.de>
 <a138f3e1-9d4d-8dc4-546c-d630c0f53a7e@msgid.tls.msk.ru>
Subject: Re: [PATCH trivial for 7.2 1/2] hw/usb/hcd-xhci.c: spelling: tranfer
In-Reply-To: <a138f3e1-9d4d-8dc4-546c-d630c0f53a7e@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 05.11.22 um 22:24 schrieb Michael Tokarev:

> 05.11.2022 15:23, Stefan Weil via wrote:
> ..
>> All typos from this series were also found by codespell.
>>
>> See https://qemu.weilnetz.de/test/typos7 for many more.
>> That list was produced with `make check-spelling` from
>> my previous patch).
>
> Yeah, codespell is a good thing. But qemu has just TOO MANY typos, and
> non-typos too (eg addd). I only patched a few places which are visible
> in the binaries.
>
> /mjt


More typos which are visible in binaries like firwmare, Changeing, 
Unknow, accomodate, migrateable, facilties, ... can be found with `git 
grep '"' | codespell -s -.

Stefan


