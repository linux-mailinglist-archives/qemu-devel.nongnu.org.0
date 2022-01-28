Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B0F49FBDF
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 15:39:59 +0100 (CET)
Received: from localhost ([::1]:39176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSPu-0004oP-3Y
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 09:39:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nDSHS-00087e-1Z; Fri, 28 Jan 2022 09:31:14 -0500
Received: from [187.72.171.209] (port=33019 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nDSHP-0004mt-EW; Fri, 28 Jan 2022 09:31:13 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 28 Jan 2022 11:13:02 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 27D91800066;
 Fri, 28 Jan 2022 11:13:02 -0300 (-03)
Message-ID: <48832eff-fc37-86f6-842c-43b75fbe83be@eldorado.org.br>
Date: Fri, 28 Jan 2022 11:13:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/ppc: Remove support for the PowerPC 602 CPU
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220128131227.199226-1-clg@kaod.org>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <20220128131227.199226-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 Jan 2022 14:13:02.0482 (UTC)
 FILETIME=[29467720:01D81451]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TVD_SUBJ_WIPE_DEBT=1.004,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/01/2022 10:12, Cédric Le Goater wrote:
> The 602 was derived from the PowerPC 603, for the gaming market it
> seems. It was hardly used and no firmware supporting the CPU could be
> found. Drop support.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Hello Cédric! I am having problems building QEMU with this patch
applied. Tried on both master and legoater/ppc-7.0. I think you forgot
one reference to PPC_602_SPEC on cpu.h:

  #define PPC_TCG_INSNS  (PPC_INSNS_BASE | PPC_POWER | PPC_POWER2 \
                          | PPC_POWER_RTC | PPC_POWER_BR | PPC_64B \
                          | PPC_64BX | PPC_64H | PPC_WAIT | PPC_MFTB \
-                        | PPC_602_SPEC | PPC_ISEL | PPC_POPCNTB \
+                        | PPC_ISEL | PPC_POPCNTB \
                          | PPC_STRING | PPC_FLOAT | PPC_FLOAT_EXT \
                          | PPC_FLOAT_FSQRT | PPC_FLOAT_FRES \
                          | PPC_FLOAT_FRSQRTE | PPC_FLOAT_FRSQRTES \


Could you take a look at it please? Thanks!

-- Víctor

