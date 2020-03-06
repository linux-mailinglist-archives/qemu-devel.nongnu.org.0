Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735F917BBFC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 12:45:21 +0100 (CET)
Received: from localhost ([::1]:35464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jABPr-0003xD-VH
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 06:45:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43437)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tianjia.zhang@linux.alibaba.com>) id 1jABP7-0003Xh-VG
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:44:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tianjia.zhang@linux.alibaba.com>) id 1jABP1-0004th-R9
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:44:29 -0500
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:35144)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tianjia.zhang@linux.alibaba.com>)
 id 1jABP1-0004PD-Fy
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:44:27 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R881e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=2; SR=0;
 TI=SMTPD_---0Trp40-q_1583495055; 
Received: from 30.27.224.42(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0Trp40-q_1583495055) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 06 Mar 2020 19:44:16 +0800
Subject: Re: [PATCH] tests: Fix a bug with count variables
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20200207115433.118254-1-tianjia.zhang@linux.alibaba.com>
 <20200306105309.GA1365924@stefanha-x1.localdomain>
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <aa09b294-aa50-3d97-aab0-1900b411200c@linux.alibaba.com>
Date: Fri, 6 Mar 2020 19:44:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306105309.GA1365924@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 47.88.44.36
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/3/6 18:53, Stefan Hajnoczi wrote:
> On Fri, Feb 07, 2020 at 07:54:33PM +0800, Tianjia Zhang wrote:
>> The counting code here should use the local variable n_nodes_local.
>> Otherwise, the variable n_nodes is counting incorrectly, causing the
>> counting logic of the code to be wrong.
>>
>> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
>> ---
>>   tests/test-rcu-list.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Sorry for the delay!  Normally this would not go through my tree, but
> the tests/ maintainer is away on leave so I'll merge the patch.
> 
> Thanks, applied to my block tree:
> https://github.com/stefanha/qemu/commits/block
> 
> Stefan
> 

Thanks and Best,
Tianjia

