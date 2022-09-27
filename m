Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7F75EBD3D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:28:43 +0200 (CEST)
Received: from localhost ([::1]:55786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5xK-0002jb-T0
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od594-0007iS-5E
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:36:46 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:57031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od592-0002Tn-Gn
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:36:45 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Ml6Vg-1p6bXz3N1g-00lWju; Tue, 27 Sep 2022 09:36:35 +0200
Message-ID: <bd9994bb-86e9-4518-f61d-a34f33e4bef9@vivier.eu>
Date: Tue, 27 Sep 2022 09:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] linux-user: fix bug about missing signum convert of
 sigqueue
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>
References: <7819f62a.51d7c.182f21781c5.Coremail.fanwj@mail.ustc.edu.cn>
 <9bed9eaf-1b30-27d8-42b9-332a62f2922c@linaro.org>
Cc: fanwj@mail.ustc.edu.cn, qemu-devel@nongnu.org
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <9bed9eaf-1b30-27d8-42b9-332a62f2922c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jB3hQSx0xZyslKSVIjjWiS9oF7kv3y6KhWMlLnig6Scdrth3Ifj
 EhgJNq35UtXVnTdFEODeWb/LBjGl+n4yRzSXYtnOd6XkZ9ZLpAhedTo//EQi6aC9gbgueWh
 W70uO0QQfmfI/uXLauBm/9rca9X3wUVRbGbQgOhnzUfj/qSd1LukoxfveBh8Nt39PvW3tBT
 os0M4owJCxjPzY7pKQIeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r1MN/x8QYJo=:g05QcDLJy9wHq4odniITxK
 tl66tzSWEJRNCJ9GfUGrINfQ7UdXEKBk8r/QLoSRv14Nq8DMQXXgjkz29nC8mMcqRpcVca+hV
 Y1HIJI+t3U+3Ly4bv3+SSf4XgoIcPX/MMoD5TMy55mscqEWk7Y0r6wZz6zgEbhC/2+k6S6B/9
 9eWXcITon22yl/9I8+DO7lwRCv29NHzkT4B0iTtQ70b9PMD43sFobPvSKo6tWzqsWRhxKROmi
 8XBQmuxSehtrjd0X4JGnpYUt0i35YyExGdu/51Ew/EJ6KKhG+5rkTfZfXZobC04eCCE+bNbT2
 zviGwLv3bgu4AEsPP9Vq82mPDkl5WTNAjsvEqgNT2iRXesH3vjunK2vjtbsDIlIPd8uB5nucG
 kXnhYARgmwNWBOjGKjyziUhmxUf8Uo+eXApzB28UagZLaD3il6C1tDZNR3QwMyhXrnKNxIxIl
 N3eNBEZAkU/FBvnk3eR8Trp5nTyu0DKxC/uIfj6+N19MR2TMh2CKAENGcz+QY8CSSvZ+gp0//
 UNdBEc/NVmtIQGITHo2aJWQX7ZZM4KWTdlW6E4U36Js85A1m0Yx8Xa6u8mxbyyD6/PDNkMNEO
 GClJbPwEmMlMqUA3qm/J5N7Sh6cy+jU77iBd1wozHb4zLIa3ssrg9aBG8Rn3PEu44/6tYQS4D
 D6H//+9JAoRhl4bFRbvulOp98UIytbuVShsTUdBFtmVb6ILfg6KLECXn6XBZmvn5vq7eBqnlL
 issHKJgaBCi1TsrH5p6w1436bAhWGiBiHVTHmSi+jbuvycmzsEwRV/aKKWK0xhXOhmC+UbzlN
 HuPpyJF
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/09/2022 à 19:54, Richard Henderson a écrit :
> On 8/31/22 05:10, fanwj@mail.ustc.edu.cn wrote:
>>  From 4ebe8a67ed7c4b1220957b2b67a62ba60e0e80ec Mon Sep 17 00:00:00 2001
>> From: fanwenjie <fanwj@mail.ustc.edu.cn>
>> Date: Wed, 31 Aug 2022 11:55:25 +0800
>> Subject: [PATCH] linux-user: fix bug about missing signum convert of sigqueue
>>
>> Signed-off-by: fanwenjie <fanwj@mail.ustc.edu.cn>
> 
> Queued to linux-user-next.

I'm preparing a PR, do you want I take it?

Thanks,
Laurent


