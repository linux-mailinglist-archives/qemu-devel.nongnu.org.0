Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE75475DA3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:37:41 +0100 (CET)
Received: from localhost ([::1]:41128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXHg-0003ui-JJ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:37:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXDg-0007MM-MF
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:33:32 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:39699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXDd-0002hU-EM
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:33:32 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.102])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9FEBDD224C09;
 Wed, 15 Dec 2021 17:33:17 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:33:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003380af428-2334-4e69-9d27-11a465852987,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
Message-ID: <c7735c6d-aada-5a93-26d0-4ecf876c7502@kaod.org>
Date: Wed, 15 Dec 2021 17:33:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 0/3] Fix mtfsf, mtfsfi and mtfsb1 bug
Content-Language: en-US
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
References: <20211201163808.440385-1-lucas.araujo@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211201163808.440385-1-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4b2c6e24-586b-4396-b65d-959e22b87e2c
X-Ovh-Tracer-Id: 1787084631360899887
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptdejfeefvdevtdffveejiedtjeegieeujefhffekffeggeehvdelffeuvdejfedtnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehmrghthhgvuhhsrdhfvghrshhtsegvlhguohhrrgguohdrohhrghdrsghr
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk, pc@us.ibm.com, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/21 17:38, Lucas Mateus Castro (alqotel) wrote:
> The instructions mtfsf, mtfsfi and mtfsb1, when called, fail to set the FI
> bit (bit 46 in the FPSCR) and can set to 1 the reserved bit 52 of the
> FPSCR, as reported in https://gitlab.com/qemu-project/qemu/-/issues/266
> (although the bug report is only for mtfsf, the bug applies to mtfsfi and
> mtfsb1 as well).
> 
> These instructions also fail to throw an exception when the exception
> and enabling bits are set, this can be tested by adding
> 'prctl(PR_SET_FPEXC, PR_FP_EXC_PRECISE);' before the __builtin_mtfsf
> call in the test case of the bug report.
> 
> These patches aim to fix these issues.


Applied to ppc-next.

Thanks,

C.

