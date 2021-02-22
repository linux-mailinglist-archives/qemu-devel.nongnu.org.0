Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1735B321AAC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:01:09 +0100 (CET)
Received: from localhost ([::1]:51752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEChv-0005Bp-Tl
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:01:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lECTQ-0001XB-F6
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:46:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lECTO-00061F-QX
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:46:08 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7C17D40727;
 Mon, 22 Feb 2021 17:46:05 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 8CB178D;
 Mon, 22 Feb 2021 17:46:06 +0300 (MSK)
Subject: Re: [PATCH] linux-user: manage binfmt-misc preserve-arg[0] flag
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210222105004.1642234-1-laurent@vivier.eu>
 <0ee2b107-1533-3098-9797-040633964300@physik.fu-berlin.de>
 <09fefe8c-c3bb-1303-9e85-d207c6ec4ffc@msgid.tls.msk.ru>
 <d0076988-a8f9-cd4c-1d19-bcb0b0a28dfb@physik.fu-berlin.de>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <ba3a2bae-d2a4-ca3d-cf3f-c2effc9d6ca9@msgid.tls.msk.ru>
Date: Mon, 22 Feb 2021 17:46:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d0076988-a8f9-cd4c-1d19-bcb0b0a28dfb@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Helge Deller <deller@gmx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.02.2021 17:43, John Paul Adrian Glaubitz wrote:
> On 2/22/21 3:38 PM, Michael Tokarev wrote:

>>
>> It's been fixed a week or so ago.
> 
> Doesn't the patch require a kernel fix which is only present in Linux 5.12?

No it does not. My approach does not require kernel support but it relies
on special argv[0] for the qemu binfmt interpreter.

/mjt

> @Laurent: Could you help clarify the difference of both fixes?
> 
> Thanks,
> Adrian
> 


