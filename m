Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB153C2132
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:05:45 +0200 (CEST)
Received: from localhost ([::1]:58324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1mS8-00066o-Fc
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mQQ-00045D-4R; Fri, 09 Jul 2021 05:03:58 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:37229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mQO-0000zU-Du; Fri, 09 Jul 2021 05:03:57 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MaInF-1lhFOM3A1d-00WETh; Fri, 09 Jul 2021 11:03:43 +0200
Subject: Re: [PATCH] memory: Display MemoryRegion name in read/write ops trace
 events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210307074833.143106-1-f4bug@amsat.org>
 <8892fbd6-a63c-ef02-78f3-935e4f95dbb1@amsat.org>
 <2def176e-8707-78cc-b524-3fd47456261f@amsat.org>
 <c4b050f9-8d36-28a5-b5fe-343bbbe0efdb@vivier.eu>
 <dadd0b69-e613-a0f6-5f81-a62159b41493@amsat.org>
 <a3660d89-0a2b-bb28-8a78-8d8078b71a01@vivier.eu>
 <ac9ed125-4efa-6068-9050-3dc367066de7@amsat.org>
 <c1f1313c-6d32-c560-30e6-0acd8a6f2090@vivier.eu>
 <89e922a4-a22d-89ea-f6db-3181e7c2e7ca@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8fe937e8-b23e-e649-8b7a-f3ec6db23e0c@vivier.eu>
Date: Fri, 9 Jul 2021 11:03:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <89e922a4-a22d-89ea-f6db-3181e7c2e7ca@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Xm0Dn1yqdYXsL3ujPq2eImyYsoyrlivmxLhVzD6LnKw5f2p6I11
 aMbKwf6LGZzQpk7ka8WcNnzY9l5qmeMWBb2mXAF7l6vCAxQTwk7bc9gW7Hg6ESo79H9/l/0
 opIvHN2XLdDDs5eRu9G052k/MXCtQ/mALXgyUYV2/MJBa3CXxOY6XV+x5KV0+ho8RRxIw/A
 D19OK6hm7VPwy8EPqgmGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g/LeGVBluDQ=:9BblTzi3TfzHPjwYcuhIXs
 AxTIoetKUtCiqJkcJmfoettEsMZHjkwSwtfFTTD2XgbXe1T+dqrboBbp3uQg1nhqSOulQXyYo
 wNGSDGc1eaiHCMBEXXiY2DU6XcWOHgPiJeG9Awti9/xyU4jMxpCpcngp8n9pfzMKzlrAYgeV9
 UnebVWEQcV0NOtk/NlCZPYwpiV6Ik8Slk08kTEv4R7fRx8M/gZWovLd/RmFDgLusNNUTGb1J5
 /qeob624A/aumxsCaNHUwX2KfU55XUgxZ9ai1W+SNRpYvP+b4HxaiaXqvTOUBRYmRlUcFj918
 uULh/07arC0YOI+kyS8j1msVUoVkziXlPxDSOguIwg4AOG2OlJU+eyzHGpJHgPRMps+y5eXGM
 V5ETbPVChEmL9QTSW1g0JFs0/IpdQzBWas8Q2CHeypTdJfb7f0zZEivMrSiAL85OYWyU7wwJP
 P7phPlIj/u+8i8hnnawEp4p6zZGCj+bMwmUN+o/AXVWnaSWtO2ailQgItqgE8s3/ta8r9DZwM
 YHzv9rwEU1UiCNiuMYICUORzG5Eytarry185flUta9oAN20CQzahsdyjmMJpcUWa/m1h684a2
 Q1LuCVtp4FN72thSlMOQMzSh6liAkViN7XtQaFYj9+2hYpeeCdCmjycERdGz8zQFygGQintbO
 RisuXMAyOgBCxfCjFfIm7tDOn+4xVXgMxc56xt6haTinxoFrHCAFJSPwuGRWsbe8TKV3GFatX
 4FgxJORJ6QtnFIqXJBqAZ5hitotgIS2fcRHC40dN4ShIew6qtgEcalOKy1liPKB/xIj/CMx4B
 QEtMo5WnFvrmXCM+Ky2tYMc1jreNHtXZNrASVpJDGChrYFjtMvGWhlpcvlZHohudCzNiyeA
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/06/2021 à 14:17, Philippe Mathieu-Daudé a écrit :
> On 6/21/21 12:13 PM, Laurent Vivier wrote:
>> Le 21/06/2021 à 12:08, Philippe Mathieu-Daudé a écrit :
>>> Hi Laurent,
>>>
>>> On 6/7/21 1:29 PM, Laurent Vivier wrote:
>>>> Le 07/06/2021 à 10:28, Philippe Mathieu-Daudé a écrit :
>>>>> On 6/7/21 9:33 AM, Laurent Vivier wrote:
>>>>>> Le 02/06/2021 à 12:49, Philippe Mathieu-Daudé a écrit :
>>>>>>> Cc'ing qemu-trivial@
>>>>
>>>> So it looks good.
>>>
>>> Is there something else you expect me to do with this patch?
>>> Maybe you expect another R-b to take it, so I should keep
>>> pinging for review?
>>>
>>
>> No, I'm working on a linux-user pull request, once done I'll do a new trivial branch pull request.
> 
> No hurry, I just wanted to know if there was something missing on my side :)


Applied to my trivial-patches branch.

Thanks,
Laurent

