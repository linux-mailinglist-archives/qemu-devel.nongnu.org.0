Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695E1553822
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 18:44:59 +0200 (CEST)
Received: from localhost ([::1]:60360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3gzq-0000zL-6o
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 12:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o3gwE-000622-S9; Tue, 21 Jun 2022 12:41:14 -0400
Received: from [187.72.171.209] (port=55532 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o3gwD-0002Jf-EP; Tue, 21 Jun 2022 12:41:14 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 21 Jun 2022 13:39:28 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 422CE80012C;
 Tue, 21 Jun 2022 13:39:28 -0300 (-03)
Message-ID: <ba3fe112-fade-aec2-6235-6c388cc50f4e@eldorado.org.br>
Date: Tue, 21 Jun 2022 13:39:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 02/11] target/ppc: add macros to check privilege level
Content-Language: en-US
To: Lucas Coutinho <lucas.coutinho@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
References: <20220615192006.3075821-1-lucas.coutinho@eldorado.org.br>
 <20220615192006.3075821-3-lucas.coutinho@eldorado.org.br>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <20220615192006.3075821-3-lucas.coutinho@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 21 Jun 2022 16:39:28.0696 (UTC)
 FILETIME=[79C05380:01D8858D]
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

On 6/15/22 16:19, Lucas Coutinho wrote:
> 
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Equivalent to CHK_SV and CHK_HV, but can be used in decodetree methods.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
> ---

Reviewed-by: Leandro Lupori <leandro.lupori@eldorado.org.br>

Thanks,
Leandro

