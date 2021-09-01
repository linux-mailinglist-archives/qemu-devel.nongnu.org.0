Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1413FD919
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:58:37 +0200 (CEST)
Received: from localhost ([::1]:52480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOt2-000333-4s
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlK-00072o-Vq
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:39 -0400
Received: from mail-dm6nam10on2092.outbound.protection.outlook.com
 ([40.107.93.92]:59136 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlJ-0002U7-9i
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYm8rQN1p83VNSjj76gMtGPLWr4YQ+nyvYL+4WdYcH1Foz6oKrDb+GfljZzRm3u5ct6XC1JUmSW4/BkUUN1cnjjFjYq4/XX0vi9pZwiqjc0d8afV4fl6r3jGzGpJEQSzzZdRN3s8d5jc8gqnNZGPdhvY0w4il/DUOdOK0VsDHHNXk6O/cqlvEEMj8mrGfDmRm/Asr+86K8/gj7g6OFTufqW7Yr7O/hgDJnG6amKoPEZLX2If/sF7BsIJNHCBS2fIR/xZhySspAGGDTgMANMZr9yVeg62Xu71KpTy5EurXH0oYfFoCcFh8Lz2URHbSL0B5A/XCVJL/Z/47xZPL/53bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=RS5VNGxeUN9kFBnmZPTDmWeQfEk9w3XcHErJGQjs6+Y=;
 b=cCdfhpCcQX4LoeGLZSEfB2EY/JrF16BUzMwJHMNhPgu6K/QUYTYgyz7EBpZA5UlqWfenN2hA60tJWFPBPf+mhLwsmGadrgKRa95+wSFLoWb0blP2lGZCjmbe3pR1/RdEvP5uqy5N/LuqNg0koEpinI5un5eIGTMzzwfhLbflr0/IOZZeKi0EVkVlLDsoeYuJjB0mq73Osv7vUzrhP2URMK187OwINO8IGMf5h1MUF8g9L9WQtAzWJnRwKqO+/10A0NFssES1DYJBW/QpK8kJJstIiVdSJtPbCaIJ+GQV3DoMRjuQTl20v/R6CpMNANFVd0vn5D7WOjyP5hwf1/V8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RS5VNGxeUN9kFBnmZPTDmWeQfEk9w3XcHErJGQjs6+Y=;
 b=pPJiGza4Q5DtY8KBpj2DpnruqutRkIv/NAH5Fl0a5RZWczFN0yk7FN5GsAiZQp1oP5xSt1HHPAcYfBPKLosPguNqSIgPFZ0dq1EIzc8vDur+2NVlHccFFUiKKRxgLTCwUP7jkJAZxKtLjJzg+ngmMoRx/bPzkSnOnqygZ46JA6Pm8g992uvg0/z56yvRRW9qiyLahYjhy6sBUclBTVOkhnjEsulHBpMGXQU/EDrJKTqsaOx7C8mtgxrteBnI2tigG1OqpxL3Yx7X9SNZczRuMR8So2fkQwumLu4sRLXoR+PCkNu4cOvWcwAJO0evPZjJYvpS4ejdulkQgYbynNC7/g==
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN2PR03MB2286.namprd03.prod.outlook.com (2603:10b6:804:b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 11:50:33 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 11:50:33 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL v3 8/8] MAINTAINERS: add fuzzing reviewer
Date: Wed,  1 Sep 2021 07:50:04 -0400
Message-Id: <20210901115004.34768-9-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901115004.34768-1-alxndr@bu.edu>
References: <20210901115004.34768-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0328.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0328.namprd13.prod.outlook.com (2603:10b6:208:2c1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.8 via Frontend
 Transport; Wed, 1 Sep 2021 11:50:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a779370b-2a02-40ec-99ef-08d96d3eb42d
X-MS-TrafficTypeDiagnostic: SN2PR03MB2286:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB2286B4233033770E6274C452BACD9@SN2PR03MB2286.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sktnHTqpMoeCCbeLTi2etnstsrR61q4BLnu9/GQrXXa6m1Ri/hKgm3ANvGmGmaMH5EfagtWVbj5dIpCrgkRkLPJFzKEf1yxD3e1Z3f0FdEIDRr5Z9C3ASm2m3J43kJtWBSNfVQHyO6zzmfQI6Jj+BGIuznj1EJxQiUhUmd1d/k1ZYFeiAoCoFZxW+KnwYv4zpuHB1/2PIjo69dFIhlCiVKl5WsZjdJVJagug2v9rZu4hHP6/kBTECuRIPcP1skBTU567Hgm0LNzzLNfHwQ0GxXiqTFaOA9t72NAjYaWCV8pMuiMPkl4l4YWixPyTJ5NoJnBrJcgklGXKx662Wso03wGXjJPW7bgqYY4Q88hYespuBOw334gFCWJJ07fLNBhkHwq+XWVYgG1p+fEw7BQzUlez+lWAaX54KvbpCkAf23HPKKcdwDK0jGIkduyDeP8GCDstClZ/vW5omdI8kjxxar0tIDRYM8X54/u7Y5J+FfDpxsR1Vpo95JphC8VwmCBbvcyrzsBZdcIanBfYOQoPXXMKO3EW/ycKTbdfnBMIRcpavub/bBPBKWdssy21GJis/SBeMpliGQlewqtuaB0s3wSEeFSiHwIjHDeU7HeRRzymc/xZtMfXGqIJie1crAdAOElUP1TVxoUPT73pH26tuag+RsSDK8LX6g628pRlJzy6KyYGeNqeQlftIlV5n9UkrsGTRehqbaVm4wdgUWG2p7aXeOqduNzXbK9Qmn4rVzFensDnWNIC2/GYUJ8EaRfv91GjMqMQz00RwGPWjHJHHv3nhuE/q+OzT/B2WY3AY88=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(6486002)(5660300002)(66476007)(66556008)(6916009)(66946007)(6512007)(8676002)(8936002)(4744005)(36756003)(478600001)(45080400002)(2906002)(4326008)(86362001)(966005)(75432002)(54906003)(1076003)(2616005)(956004)(6666004)(316002)(38100700002)(38350700002)(6506007)(52116002)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUhXcHNmQ3JOMVdGdnRvVkxzWjdSZXBGU2o1a1RuT0VOL2JxRzJKb1c3RjRD?=
 =?utf-8?B?ejBWYVFGQkpZbkdSUElZZkVzTjI4VmkxajlGZVI3L25hSG1QeWNRdjBzWVFV?=
 =?utf-8?B?UjBFSGE0cnk1b012dGVhdzVwc1RhSWFhMDZ2OVY5YnlYKzBEdmFJZ2hyY3lF?=
 =?utf-8?B?SU40dDVTVWh2b1ZzbEtUOVR6dEZ6UnhGWjROaWUxSC83RERVSFFtUUxqcHBQ?=
 =?utf-8?B?M3BXNnhYUmg0OE90VkpwYitEa2c5RlFYRWQvbXZ5dXhoTER4bkZ6Yks3ZHo4?=
 =?utf-8?B?OTNxQk95THpvMjNrVHBITjhmRzZhQXRHVUwyWVJiV01oZStneHpINVJ3ZzZp?=
 =?utf-8?B?V0Y1ejZuTXVqZmx1RkJJTEdxcytrSjBxZllMS3F2N202Zi9lVnF4bXRzMm5N?=
 =?utf-8?B?R1NhT1JhTzJqSUR5ZFZGL0UyMTNLOUFGYi9YdW9GZkpuSi9YQXpBQnl2a3I0?=
 =?utf-8?B?TXVGMXdIbUFaL2NWMThVam5maVB3NFF5alhMNTIyY3ZvbzMwQ1dudUVJWkEv?=
 =?utf-8?B?MkRueUJwQzlwZy9LRXJIWlJpOWVNajZnK21aSG0xYThGSExUQTBXRjhXc2Rv?=
 =?utf-8?B?WEw4eVFEMFpOSENiN253SWk5UGJ4UHBOSkY1RVkzRnl3MVRmQWp2K09ZcFFs?=
 =?utf-8?B?dEhqVWhZclNTL09Rbm9EVEVxN1VMbFBuNHRwdU1qbzJSVTFUZ2VzR1hhOUhk?=
 =?utf-8?B?VkF3Vk4wcVo3OTQ0UnUyU2V3cklPSWlRa1hLRGIvMXJMS2JKWWhFQi9YR0dD?=
 =?utf-8?B?RHl3Wml6RUhjdWRPejNINDBjNjR4K1ltWi9NWXRtQVdrcWUrbmRjZTY2eDQz?=
 =?utf-8?B?RUtoTUZpRFYrVUhLSGtqRVVybFBUcXlNampkbzUyRjBCOWRHdjVWNG9Jakdh?=
 =?utf-8?B?bGgva0pUQzdsNlN6SnU5Q0N2UGJ1blBEWGZ1QTNRcDdibHc5K1RTYTJDazIw?=
 =?utf-8?B?NlhnejhwelZCcjNFTlhVQlpaOGRxOHh4MTZQbDUyY0VvNjFxamdiUzh3ZWVa?=
 =?utf-8?B?cFkwMlhJTEk4NkVObHlmY1B5bUlTbk5vbi9mRE1MV253VFV5NEdHVEhERDNz?=
 =?utf-8?B?clZhcExaYkptNmxmTERmMThhYTFwOUJaYU82VDlveWhIVmFSVjZ4NGd1Nm0y?=
 =?utf-8?B?Z0kvSVN1R3VQWVdtVVZlb2VJS2FldktxZGI0cEQ2U0hhR2JnRDFMUXNsRnA0?=
 =?utf-8?B?Vm5wSnhpQS9iVm1mTFJiZlhjQllnRVI0RnVyeENCNTljNzc5WitFcjBneS9v?=
 =?utf-8?B?NHVXenpKeE43SGRUUzRxSXhQcGxPNzFuSkNVMXhuVXJZZVhWb1g1TFNQYjBS?=
 =?utf-8?B?RkxXQkVBTlRHNnVZN3lWNHFJeVZFRkx0WDlMMWUrajlFc3NaMUJLaEtoU2hi?=
 =?utf-8?B?RzZvblM5VkNOOXQrS2Q0MVJ4M1lYbWtacVNVc1A5bmUwMGxGWGc1YndWd2lN?=
 =?utf-8?B?Vi9ZcHErelpxSHIvM09qNitVZi9BUDQvNmp4MEJ6K1RBb2d6WEVRb0U3UWlx?=
 =?utf-8?B?dDNZeklKVE03cUVyN3dPT1hUMVVwNjYyWUpyQ3ZOMDNtc2JWL3RpWmJmay9Q?=
 =?utf-8?B?d0xmdm9IbEVWREZoYmlRVUNYZjhGS0o3QTFiRUg3bkZPc0kvZEcwR2cxQTU5?=
 =?utf-8?B?S3g5aTJvdGF6ckRhZmt1SEV3Znk2eW41UTBHK0doT2M2aHdyS3NObDM4WXY4?=
 =?utf-8?B?bGJtbHQrT2ovK3lLblZEbitjMUxKYi9HRE44TmZjUjhVUmszZkdGNjJrY2x6?=
 =?utf-8?Q?71X3Ei8c2xgWNA80VIwF2jr8u+fDWLclDS2OIdQ?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: a779370b-2a02-40ec-99ef-08d96d3eb42d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:50:33.1301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8AYqCeWusF0QyytPV0kTqMTkR6jCp2OhIxHwwfw4I9tWWh0CcjN7DTw+3Nz9+NJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2286
Received-SPF: pass client-ip=40.107.93.92; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.238, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, Alexander Bulekov <alxndr@bu.edu>,
 bonzini@redhat.com, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Qiuhao Li <Qiuhao.Li@outlook.com>

To keep me cc-ed when something changes. Suggested by Alexander.

https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg03631.html

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8b725091d4..590e1bc492 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2712,6 +2712,7 @@ R: Bandan Das <bsd@redhat.com>
 R: Stefan Hajnoczi <stefanha@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
 R: Darren Kenny <darren.kenny@oracle.com> 
+R: Qiuhao Li <Qiuhao.Li@outlook.com>
 S: Maintained
 F: tests/qtest/fuzz/
 F: tests/qtest/fuzz-*test.c
-- 
2.30.2


