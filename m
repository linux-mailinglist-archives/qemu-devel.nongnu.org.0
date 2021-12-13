Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4962F4737CC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 23:44:46 +0100 (CET)
Received: from localhost ([::1]:56214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwu3p-0001fR-4w
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 17:44:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mwu2d-0000zj-Rs
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 17:43:31 -0500
Received: from [2001:41c9:1:41f::167] (port=42456
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mwu2c-0001vM-AK
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 17:43:31 -0500
Received: from [2a00:23c4:8b9f:4900:2b16:6388:bafb:d365]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mwu2H-000358-Mp; Mon, 13 Dec 2021 22:43:09 +0000
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-level <qemu-devel@nongnu.org>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <91822021-1d4f-8e4d-1076-c4701c1e2f40@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <0e866be2-88ac-f5a0-43ce-0afcca41d977@ilande.co.uk>
Date: Mon, 13 Dec 2021 22:43:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <91822021-1d4f-8e4d-1076-c4701c1e2f40@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9f:4900:2b16:6388:bafb:d365
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v3 00/27] Add LoongArch softmmu support.
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.093,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/12/2021 03:13, yangxiaojuan wrote:

> Ping!
> 
> Please help review the V3 patch, thank you!

I've been fairly busy recently, but I will try and find some time to look at the v3 
sometime during the week.


ATB,

Mark.

