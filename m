Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F9489ECC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:09:06 +0100 (CET)
Received: from localhost ([::1]:46320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6z6O-0000LG-Tl
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:09:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1n6yvT-0006EY-4g; Mon, 10 Jan 2022 12:57:47 -0500
Received: from [201.28.113.2] (port=4279 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1n6yvQ-0006zL-ID; Mon, 10 Jan 2022 12:57:46 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 10 Jan 2022 14:57:27 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 29E658001F1;
 Mon, 10 Jan 2022 14:57:27 -0300 (-03)
Subject: Re: [RFC PATCH] target/ppc: Remove xscmpnedp instruction
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220106112318.13864-1-victor.colombo@eldorado.org.br>
 <379e6b1f-31c6-843d-fba4-05398885161a@kaod.org>
From: Victor Colombo <victor.colombo@eldorado.org.br>
Message-ID: <201b2745-31ab-54c4-6e53-4f49557a9c3e@eldorado.org.br>
Date: Mon, 10 Jan 2022 14:57:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <379e6b1f-31c6-843d-fba4-05398885161a@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Jan 2022 17:57:27.0530 (UTC)
 FILETIME=[87A23CA0:01D8064B]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: victor.colombo@eldorado.org.br, danielhb413@gmail.com,
 matheus.ferst@eldorado.org.br, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/01/2022 12:02, Cédric Le Goater wrote:
> On 1/6/22 12:23, Víctor Colombo wrote:
>> xscmpnedp was added in ISA v3.0 but removed in v3.0B. This patch
>> removes this instruction as it was not in the final version of v3.0.
> 
> Could please resend on top of the VSX combo patchset ?
> 
Absolutely! I will add it between "Implement xvtlsbb instruction" and 
"Refactor VSX_SCALAR_CMP_DP" instead of on top, to avoid moving it to 
decodetree just to remove it later. We will send it together with the 
patchset v2 later.
> Thanks,
> 
> C.

Thanks for everyone's time! Best regards,

-- Víctor

