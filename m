Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045164760C1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:30:56 +0100 (CET)
Received: from localhost ([::1]:41408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZ3H-0006Ti-19
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:30:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mxXoc-000211-Kr; Wed, 15 Dec 2021 12:11:42 -0500
Received: from [201.28.113.2] (port=6300 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mxXoa-0006gS-SF; Wed, 15 Dec 2021 12:11:42 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 15 Dec 2021 14:11:32 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 68C828009F6;
 Wed, 15 Dec 2021 14:11:32 -0300 (-03)
Subject: Re: [PATCH for-7.0 v2] target/ppc: do not silence SNaN in xscvspdpn
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211214144459.1086343-1-matheus.ferst@eldorado.org.br>
 <1d56a137-e20f-aabc-89b8-4d6c8a37c34a@kaod.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <c5be5a2b-e2ff-c5b1-33a3-3eee43c3d839@eldorado.org.br>
Date: Wed, 15 Dec 2021 14:11:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1d56a137-e20f-aabc-89b8-4d6c8a37c34a@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Dec 2021 17:11:32.0700 (UTC)
 FILETIME=[CEE309C0:01D7F1D6]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.64,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/12/2021 13:53, Cédric Le Goater wrote:
> On 12/14/21 15:44, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> The non-signalling versions of VSX scalar convert to shorter/longer
>> precision insns doesn't silence SNaNs in the hardware. To better match
>> this behavior, use the non-arithmatic conversion of helper_todouble
>> instead of float32_to_float64. A test is added to prevent future
>> regressions.
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> 
> Applied to ppc-next.
> 
> Thanks,
> 
> C.

Hi Cédric,

Alex requested some changes in the test part, could you drop this patch 
for now?

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

