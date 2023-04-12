Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BDA6DF53A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 14:29:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZae-0004ii-1z; Wed, 12 Apr 2023 08:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pmZab-0004ia-Rk
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:28:41 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pmZaW-0003QG-4P
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:28:41 -0400
Received: from [134.155.144.166] (mobile-144-166.wlan.uni-mannheim.de
 [134.155.144.166])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 5E582DA0BC0;
 Wed, 12 Apr 2023 14:28:32 +0200 (CEST)
Message-ID: <ec51176a-1b2f-c8bd-49d5-e41734e4aedd@weilnetz.de>
Date: Wed, 12 Apr 2023 14:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
To: BALATON Zoltan <balaton@eik.bme.hu>, Howard Spoelstra <hsp.cat7@gmail.com>
Cc: qemu-devel@nongnu.org
References: <CABLmASEcJRNWRaFum_BKgwKu7cJ8BDM3W94W-ZZwFLFuEwkh7g@mail.gmail.com>
 <1aacbfc4-2303-4d9c-7644-32ad97d6d748@eik.bme.hu>
Subject: Re: source fails to compile on msys2
In-Reply-To: <1aacbfc4-2303-4d9c-7644-32ad97d6d748@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.083,
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 12.04.23 um 14:12 schrieb BALATON Zoltan:

> On Wed, 12 Apr 2023, Howard Spoelstra wrote:
>> It seems the current source fails to compile with up to date msys2.
>
> See here: https://qemu.weilnetz.de/
> I think there are some patches there that aren't upstream. I don't 
> know why and also don't know why those binaries are not built from 
> QEMU master.


My related Git repository is https://repo.or.cz/w/qemu/ar7.git/. I 
merged v8.0.0-rc3 two days ago, and that code builds with no problems 
for Windows.

And yes, my code includes commits which are (still) missing upstream. 
Some of them are for special hardware which was either removed from QEMU 
master or which I think is not interesting for upstream. Others were 
already sent to qemu-devel, so might become part of QEMU master later. 
In addition there are commits for my Windows build environment which 
also uses a higher warning level than QEMU master. But usually the 
differences to the latest tagged QEMU release are small.

Stefan



