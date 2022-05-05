Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4177551BD15
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:22:20 +0200 (CEST)
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYcl-0008WF-Bf
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jan.kiszka@siemens.com>)
 id 1nmYYO-0005bg-Qc; Thu, 05 May 2022 06:17:54 -0400
Received: from mail-db3eur04on061f.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::61f]:7687
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jan.kiszka@siemens.com>)
 id 1nmYYH-0002jz-T7; Thu, 05 May 2022 06:17:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldJG9+0B5F1+FSsQcubR8S7uHedwuEpRFc411qRvmEeV9q/Wfaa5cVqgTgNGN0hJiGSR2IlrtMDRq0fLTFDNUswhAFC/KiTh9S8Gpy/LzyB0tdXEUd+82B+No9lNCkr5LNHi7yQhyK6sCff4IhBNyY5euOkZCB/ASSLMMQ9WQBKbXAU04q7N6yDRhvlbbvzbfuyFGrjbesMYkcFT27lrj/7tKBaahCMnR/ioKug9MFPuf5zfPvd8qTa9Lav1IlII6jiHsF1TdFi7q2RePHXsPvQBMF+UaU/nfFrYze8yNSMt6D2TIKSEWHbqsKqDVvxI5isiVHDFYREWpPrTTg9Gaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kktnrF8uhR2LOBdO5Gqm3lxMuc8fTetlnBr8376x/FU=;
 b=fhINMTjGQhVwaKPCWPHbuWhLdO6GBFhDqxCVajvvI1rDIq8/BQ1H3HU08xXDPQ3lX0FpzAB6ySs7txLtATbvouMtaMW9S1MtBOygeosNufw/SjKW4v1In+hQ+/MCtaBpkJE2o8bjb6v1CawztA20xlNiJFBhn59uARSypTYfNyvGKcTiT420Z3W/Q40NAawENWMvUqcmx1eF3GozMwluDGhHjiqYE181o3+j8miL/0cCenCcORT0IbxkkkzOKMm81QNATiYq+qq0TU/gGJ+kT4euV1EknG6E7cNvKE2C11KZrgyY8U4IeZO3tH8qM9cT9nUtYOBwqIY85IbWuKLOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=linaro.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kktnrF8uhR2LOBdO5Gqm3lxMuc8fTetlnBr8376x/FU=;
 b=n/GLf1MdZNd4+/hxzXcrxm2h+EUoELt6/SbwOu3y/os4TxZ2Ivl9m7WTda8cqe7KFIafclYg8CR7GK/9pOuJnv1f2pdZM0JwjgI5YSt8cZyPPfjZKyw+4onzocvs7v96lBpoJPfkfIOFYcFiLFO42EmnLUXytRCqh4aANhrP/WaBL8SuYT0of/8rE2ZNKjsEaqD8KsU2t8MkUK4dQE5aNAQBy3WqRtZ0ztOMZwX/AjTaT1157M+OPDHa4NBP6TLhgcpEqLgiduuCeBQXGa5A29NDsVexPrRm2W9pandvplzPAbEQtNmF4QpfahPFJ1dKrf9lp22vZImgGSrUc8jFMQ==
Received: from OL1P279CA0043.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:14::12)
 by DU0PR10MB5145.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:329::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 10:17:25 +0000
Received: from HE1EUR01FT057.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:14:cafe::2e) by OL1P279CA0043.outlook.office365.com
 (2603:10a6:e10:14::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Thu, 5 May 2022 10:17:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 HE1EUR01FT057.mail.protection.outlook.com (10.152.0.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 10:17:24 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 5 May 2022 12:17:23 +0200
Received: from [167.87.32.15] (167.87.32.15) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 5 May
 2022 12:17:22 +0200
Message-ID: <b46706e1-cf63-446d-f614-4c6adf16d72e@siemens.com>
Date: Thu, 5 May 2022 12:17:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] hw/arm: virt: Add SBSA watchdog
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
References: <4ad779bc-09f6-4041-d671-624fd0e22cf9@web.de>
 <CAFEAcA-8Awh2jbKTBCig7C-oAfVhs3iuP3E6EzkW=DVAKSZ0=A@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CAFEAcA-8Awh2jbKTBCig7C-oAfVhs3iuP3E6EzkW=DVAKSZ0=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.87.32.15]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--9.970800-8.000000
X-TMASE-MatchedRID: Fi1yTWlF5J+zVz/M38Cs1EaHaPfxl4UYPg9yfk4YC0YlPLVu9PurrQEP
 t+VBx9n9Y4zJvUjGrxVkklsSINyH/FHWvy4Y7EQVS8O6hDbfxqSKP2wHXxUfnVIWq0PbCp4xELb
 qrOgWzycL9Tj77wy87Iji8eo8e2dZ1ZuVhj9PbJM47m81Q4gjgrqHhyOWGmqbSMFvyr5L84IdLj
 iwtocA8s1YMD+2TGH/qU7Z6SqUMjpzm8YiT+QBxXZ8MBMyvk9AtCUKfxFPSAU8IK4Bxqq4TxJSx
 +7Qm/dKlAFH5WviIWiyl1phL2htxAsbwIGkxxcvkZOl7WKIImrvXOvQVlExsK7rlQMPRoOCxEHR
 ux+uk8h+ICquNi0WJE55yu0Rq4VB1cAgqIoCz4vJIGQFYGZEloYVZm67at67ftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.970800-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: D29AF5321569BE7EE45317B65B7CF114DE159209D01E2F44794513CF21F2DA7A2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 977a5bcb-3e0a-4293-9b28-08da2e80730b
X-MS-TrafficTypeDiagnostic: DU0PR10MB5145:EE_
X-Microsoft-Antispam-PRVS: <DU0PR10MB514539EF9B688D63D96A57DF95C29@DU0PR10MB5145.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zqboPGRNmgp/8AXtGVC4Gg4Ok7UO1/FwP0cJafFzG+p4OhQMTkl8gva5476KgP2c1cJ+hHWhXyv+SAZ25755j+RMjF7sPQte2ovmW4vzX21HrgraHgpME6WV3bmtErM1FH+satQD5YhebgCWr910IAi4TZPwKhWHZLwrhX6Td+MZC9RmYNCSetNhX1+2KVMmsMm/3fL+RvGNhX/PprFAZ1Kaa/nQln5Bktulgr2jCHhQKW8vPPz2qQh1Tihqat4xkI1Jm+QmmoYYGiW0xg+gn5kq7zYAmCw6kMFdhDtSjVBQqPSDvy9RPusSDsLmi5lu7PxQMYd6BbWt0Fw9wVqSJ7ncrk6NueXmAEubrghiZIpa8xK5CTTIEdIULKECJxruekRQJ6f0DIcS8c3bOyS166yg2zp0kMITicU/+5pIUuSKoY/sL/rMrmzN13HQXu+M1Nav5BeSyMfimCLxd6akxdDlZxbOKo5vPuN9kq3NZkltpLnn7ZUU2yydQ4OJ1yrwLPvCOhvv0KkZp2vRzW7ulH5Wx9824jNC1TQIa9Q/HB1Dn01JUDIldXPr9yHFADxTeXDnPVPQ5ekUwd85N/ossv2535tHfHphKCZlvweamjuN26MgrBaMf2OyQrfOXplhv+iM7fE3Nb7ufJTc3fdvNZgTaWS9aTtJAWkiQ9u6abvdYtR3Q1QAgbokEpaF4p5pFIOgvEuRCBLp9WmVFSORbYPNk5wwVYwSAngQ5RNyDlyfB/Jy0Zj9BD1DqNMF4odTg2oMdjO0wVmM1Wr7sbi2uQ==
X-Forefront-Antispam-Report: CIP:194.138.21.71; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(31696002)(40460700003)(47076005)(83380400001)(53546011)(356005)(82310400005)(81166007)(336012)(16576012)(26005)(82960400001)(316002)(86362001)(5660300002)(186003)(16526019)(44832011)(8936002)(36860700001)(956004)(36756003)(4326008)(6706004)(6916009)(8676002)(70586007)(70206006)(54906003)(2906002)(508600001)(31686004)(2616005)(3940600001)(43740500002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 10:17:24.6397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 977a5bcb-3e0a-4293-9b28-08da2e80730b
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.71];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT057.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5145
Received-SPF: pass client-ip=2a01:111:f400:fe0c::61f;
 envelope-from=jan.kiszka@siemens.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 05.05.22 10:40, Peter Maydell wrote:
> On Sun, 1 May 2022 at 19:07, Jan Kiszka <jan.kiszka@web.de> wrote:
>>
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> The virt machine lacks a watchdog so far while the sbsa-ref has a simple
>> model that is also supported by Linux and even U-Boot. Let's take it to
>> allow, e.g., system integration tests of A/B software update under
>> watchdog monitoring.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> 
> The virt board has a PCI bus, and QEMU has a model of a
> PCI watchdog device -- the i6300esb. Can you use that?

While one could do that, it implies using completely alien Intel x86
host controller bits on this platform. And, thus, would require changes
in firmware (e.g. adding a driver to U-Boot).

> 
> In general I much prefer it if we can support use cases in
> virt via pluggable PCI devices rather than hard-wired MMIO
> devices -- it means that only users who want the functionality
> need to have the exposed attack surface area of the device
> present in their VM.

Valid point - would making this opt-in via a machine feature be sufficient?

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

