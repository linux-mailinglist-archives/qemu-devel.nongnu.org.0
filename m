Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CA84EDE9E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 18:19:57 +0200 (CEST)
Received: from localhost ([::1]:59870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZxWd-0004wK-St
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 12:19:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nZxTn-00044D-9H; Thu, 31 Mar 2022 12:17:01 -0400
Received: from [187.72.171.209] (port=48667 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nZxTl-0000jm-MY; Thu, 31 Mar 2022 12:16:58 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 31 Mar 2022 13:16:53 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 78A5F800013;
 Thu, 31 Mar 2022 13:16:53 -0300 (-03)
Message-ID: <7e2a7424-2186-7726-bfcb-6ee6921e77c7@eldorado.org.br>
Date: Thu, 31 Mar 2022 13:16:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v2 0/5] Port PPC64/PowerNV MMU tests to QEMU
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
References: <20220331145813.21719-1-leandro.lupori@eldorado.org.br>
 <6e563c03-1551-4da6-efdb-1b12e03b3c39@kaod.org>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <6e563c03-1551-4da6-efdb-1b12e03b3c39@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Mar 2022 16:16:53.0482 (UTC)
 FILETIME=[BC1B94A0:01D8451A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/22 12:47, Cédric Le Goater wrote:
> 
> Hello Leandro,
> 
> I think we should start looking at semihosting like Richard proposed
> and for it, rework the QEMU attn implementation or may be use a special
> form of scv.
> 
> It should not change too much the tests, only exit and output which
> would remove the dependency on the platform console. In the long run,
> it looks like  a good investment for more low level tests.
> 
> Thanks,
> 
> C.
> 

Hi Cédric,

I've assumed you would handle the comments related to the attn 
instruction implementation, so that's why I've sent a v2 with only the 
other changes.
But no problem, we can coordinate how we're going to add semihosting 
support to PPC.

Thanks,
Leandro

