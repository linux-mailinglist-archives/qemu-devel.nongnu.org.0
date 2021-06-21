Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585AD3AE9F5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:25:00 +0200 (CEST)
Received: from localhost ([::1]:35344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJv9-0007xw-Cn
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lvJrF-00065s-9P
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:20:57 -0400
Received: from [201.28.113.2] (port=3793 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>) id 1lvJrA-0003r9-KY
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:20:54 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 21 Jun 2021 10:20:48 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 9187A800055;
 Mon, 21 Jun 2021 10:20:48 -0300 (-03)
Subject: Re: [PATCH v2 1/1] accel/tcg: Probe the proper permissions for atomic
 ops
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210617011224.1602932-1-richard.henderson@linaro.org>
 <20210617011224.1602932-2-richard.henderson@linaro.org>
 <4180796b-ff24-545c-0be8-0ff389d64ec4@eldorado.org.br>
 <e55c34aa-b5c6-9f88-2961-7abd8c1f9668@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <d4534eaf-e798-6e49-4a4c-6872a482d150@eldorado.org.br>
Date: Mon, 21 Jun 2021 10:20:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e55c34aa-b5c6-9f88-2961-7abd8c1f9668@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Jun 2021 13:20:48.0872 (UTC)
 FILETIME=[4034C680:01D766A0]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_05=-0.5, NICE_REPLY_A=-0.001,
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
Cc: alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/06/2021 16:32, Richard Henderson wrote:
> On 6/18/21 11:57 AM, Matheus K. Ferst wrote:
>> I can confirm that this fixes #390, and all the other test cases that 
>> I have for lq.
> 
> Yay!  Can I get a Tested-by then?
> 
Ah, I forgot the tag...
Tested-by: <matheus.ferst@eldorado.org.br>

>> Does "Resolves:" automatically closes the issue on GitLab...
> 
> Yes.
> 
> 
> r~


-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

