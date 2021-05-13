Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960C437F964
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 16:09:30 +0200 (CEST)
Received: from localhost ([::1]:48798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhC1o-0007dx-4F
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 10:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lhBw5-0003BW-OC; Thu, 13 May 2021 10:03:33 -0400
Received: from [201.28.113.2] (port=64775 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lhBw3-0003Ug-Or; Thu, 13 May 2021 10:03:33 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 13 May 2021 11:03:25 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 9B13E80139F;
 Thu, 13 May 2021 11:03:24 -0300 (-03)
Subject: Re: [PATCH 09/11] include/exec: added functions to the stubs in
 exec-all.h
To: Richard Henderson <richard.henderson@linaro.org>,
 "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-10-bruno.larsen@eldorado.org.br>
 <c4b7cba3-eb5f-ff65-9376-da9dc8edf45f@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Message-ID: <f0fbb69b-76e9-c951-f18d-cfc4629f5f2a@eldorado.org.br>
Date: Thu, 13 May 2021 11:03:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c4b7cba3-eb5f-ff65-9376-da9dc8edf45f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-OriginalArrivalTime: 13 May 2021 14:03:25.0153 (UTC)
 FILETIME=[BDC20D10:01D74800]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/05/2021 15:34, Richard Henderson wrote:
> On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
>> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
>>
>> Added tlb_set_page and tlb_set_page_with_attrs to the
>> stubbed functions in exec-all.h  as it is needed
>> in some functions when compiling without TCG
>>
>> Signed-off-by: Lucas Mateus Castro 
>> (alqotel)<lucas.araujo@eldorado.org.br>
>> ---
>>   include/exec/exec-all.h | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>
> No, the caller is tcg-specific already.
>
>
> r~

tlb_set_page is called by many ppc_hash64_handle_mmu_fault, 
ppc_radix64_handle_mmu_fault and ppc_hash32_handle_mmu_fault, all of 
which from what I've seen are only used inside #if 
defined(CONFIG_SOFTMMU). So what is the best way to deal with these 
tlb_set_page calls? Should these part of the _handle_mmu_fault functions 
never be reached or should these functions never be called?

If it's the latter then should we change the #if defined to #if 
defined(CONFIG_SOFTMMU) && (CONFIG_TCG)?


P.S: There was a miscommunication between me and Bruno, this should've 
been a RFC.


