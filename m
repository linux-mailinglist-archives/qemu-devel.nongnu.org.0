Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73D12D89E0
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 21:06:36 +0100 (CET)
Received: from localhost ([::1]:56494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koBA3-0001it-8Q
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 15:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koB2j-0005sE-MG; Sat, 12 Dec 2020 14:59:02 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:33485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koB2Z-0004xo-KK; Sat, 12 Dec 2020 14:59:01 -0500
Received: from [192.168.100.1] ([82.252.152.214]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MiaLn-1k9us73ZwN-00fiUk; Sat, 12 Dec 2020 20:58:29 +0100
Subject: Re: [PATCH V2 08/14] m68k/: fix some comment spelling errors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20201009064449.2336-1-zhaolichang@huawei.com>
 <20201009064449.2336-9-zhaolichang@huawei.com>
 <f790ec0a-1f0d-90fd-f597-20fddad9a60c@vivier.eu>
 <CAAdtpL4dxKYxu=W3zboCaOuAiJeiV1SzOnPXXLxtoX_BkW7sow@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f14ca245-4bc4-5d19-a342-2dbcd35470b1@vivier.eu>
Date: Sat, 12 Dec 2020 20:58:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL4dxKYxu=W3zboCaOuAiJeiV1SzOnPXXLxtoX_BkW7sow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0p0w8YVK1n7CPdKPaKpBQ0MAbLKHVbt1PujZNG9lmVNo5Vifs87
 jE3CRxoK3eJ6Zr4Euelbbg4W/LOFJ0nUvLuZF/31dKpMqiqhPtzbo7i6n6WW1fzb9oT8NEY
 fgm8gp6LIIJAHd6neqwwUwaRIxR/sxB4adpkPuPZR9bLAKijjn7MdJwsb0TptxsxX4eAYeO
 Wu3OxZBWCnbwYRCCHMX+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0/WavY6hGL0=:QDb1WNMaZCccqJVIET5Dci
 CXX1wHtLvlup23mw9tqsGWJ2S6g4K2QUEFoaMQeRnH9Q5274iBrqhXtMxMTUCmTdKnM4WtZTK
 Jrn/Ba7qNmBqIyYGi4UlAuNAK7YYD7hW3o1t6abTzTh4KGMPf2nolcVVd3NpOWO1TN9QIIEC3
 /Fg25gAfj1ULxIf9zghxBaARI9jPQ6uZNG3XBmbgtT1V1Z7JILWcN6KT1OsOSV/nvnwpHZ40f
 /O/gxMS8Geqqi6MM/rinphw806++M2GgFymrIAa6CDt3qqdFUofCx6FdvQMWlKYznW8+qe1Rx
 /gzzC10MoS5GTNXeHW/7OnpC+XtVpvd1mMQ1cZsO+h4giP8j+of/NM3kyHvtj4x/LbSDGtzgy
 JxzMlZm9SnMp0N5oCci4OBhzJxgEV3GsdByi3NCApIjpkIqKxUm+wfPfAH7SJnDRYpJCNKSKH
 oRsKRRSbEg==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 David Edmondson <david.edmondson@oracle.com>,
 zhaolichang <zhaolichang@huawei.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/12/2020 à 18:56, Philippe Mathieu-Daudé a écrit :
> Hi Laurent,
> 
> On Sat, Dec 12, 2020 at 6:11 PM Laurent Vivier <laurent@vivier.eu> wrote:
>> Le 09/10/2020 à 08:44, zhaolichang a écrit :
>>> I found that there are many spelling errors in the comments of qemu/target/m68k.
>>> I used spellcheck to check the spelling errors and found some errors in the folder.
>>>
>>> Signed-off-by: zhaolichang <zhaolichang@huawei.com>
>>> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
>>> Reviewed-by: Philippe Mathieu-Daude<f4bug@amsat.org>
> 
> Do you mind replacing this line by:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 

Sorry, too late...

Laurent

