Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9279F13897C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 03:34:06 +0100 (CET)
Received: from localhost ([::1]:44814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqpYL-000306-Kg
	for lists+qemu-devel@lfdr.de; Sun, 12 Jan 2020 21:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iqpXY-0002aD-M1
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 21:33:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iqpXX-0006fg-5E
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 21:33:16 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2675 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iqpXW-0006S6-Pu
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 21:33:15 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 97EA8DC5E434E4AC29E5;
 Mon, 13 Jan 2020 10:33:07 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 13 Jan
 2020 10:33:00 +0800
Subject: Re: [PATCH V2] vhost-user-test: fix a memory leak
To: Thomas Huth <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>
References: <1576805214-2508-1-git-send-email-pannengyuan@huawei.com>
 <072970b5-b7cc-ad71-d3e4-933e888b7093@redhat.com>
 <3312978e-2bff-091a-b618-d9183b8c7252@redhat.com>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <b0a705c0-c734-c431-f8de-475c293092d2@huawei.com>
Date: Mon, 13 Jan 2020 10:32:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3312978e-2bff-091a-b618-d9183b8c7252@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/12/2020 6:39 PM, Thomas Huth wrote:
> On 10/01/2020 15.07, Thomas Huth wrote:
>> On 20/12/2019 02.26, pannengyuan@huawei.com wrote:
>>> From: Pan Nengyuan <pannengyuan@huawei.com>
>>>
>>> Spotted by ASAN.
>>>
>>> Reported-by: Euler Robot <euler.robot@huawei.com>
>>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>>> ---
>>> Changes V2 to V1:
>>> - use a "goto cleanup", instead of duplicating the "free" functions.
>>> - free "dest_cmdline" at the end.
>>> ---
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>> ... and picked up to my qtest-next tree.
> 
> ... and now I had to unqueue the patch again. It is reproducibly causing
> one of the gitlab CI pipelines to fail with a timeout, e.g.:
> 
>  https://gitlab.com/huth/qemu/-/jobs/400101552
> 
> Not sure what is going on here, though, there is no obvious error
> message in the output... this needs some more investigation... do you
> have a gitlab account and could have a look?
> 

OK, I will register a account and have a look.

>  Thomas
> 
> .
> 

