Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3040B55387C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:04:28 +0200 (CEST)
Received: from localhost ([::1]:59944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3hIh-0004Wt-95
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o3hA0-0005PP-IO; Tue, 21 Jun 2022 12:55:28 -0400
Received: from [187.72.171.209] (port=36453 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o3h9z-0004bf-3v; Tue, 21 Jun 2022 12:55:28 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 21 Jun 2022 13:55:25 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 9836280012C;
 Tue, 21 Jun 2022 13:55:24 -0300 (-03)
Message-ID: <5ca74073-4f54-e57d-ac47-c33fffb0a0cc@eldorado.org.br>
Date: Tue, 21 Jun 2022 13:55:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 10/11] target/ppc: Move slbsync to decodetree
Content-Language: en-US
To: Lucas Coutinho <lucas.coutinho@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org
References: <20220615192006.3075821-1-lucas.coutinho@eldorado.org.br>
 <20220615192006.3075821-11-lucas.coutinho@eldorado.org.br>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <20220615192006.3075821-11-lucas.coutinho@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 21 Jun 2022 16:55:25.0050 (UTC)
 FILETIME=[B3C85DA0:01D8858F]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/22 16:20, Lucas Coutinho wrote:
> 
> Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
> ---
Reviewed-by: Leandro Lupori <leandro.lupori@eldorado.org.br>

Thanks,
Leandro

