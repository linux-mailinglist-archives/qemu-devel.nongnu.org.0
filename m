Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949813322F4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:26:18 +0100 (CET)
Received: from localhost ([::1]:42540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZZB-0000In-Bx
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJZVF-0006Sy-9f; Tue, 09 Mar 2021 05:22:13 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:54628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJZVA-00026f-2Z; Tue, 09 Mar 2021 05:22:13 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129AJd4Z010915;
 Tue, 9 Mar 2021 10:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=OQ6LuMZKmrZe2Rsv9g4XWMsLyPmUbJE7R8shR7N8T+g=;
 b=KEy4nw+THe8x3uaahi8U61wKIsv1HpA0drQ0TxPZcDo0gL/aiWs9xTTCF0BW9LvWcLU0
 zKxnKXJkn08GNy08nOrBXqSDS69LYCWoX/dOm28UiqK/Qrkcho3lrsH9/khi6gX9JV+G
 VpuOH9kf+ckPCnHTQL1k/vl+ZV1rQptn54JUW+VCM9UYBJANA3y4rl2+sTi0FkxDzGMB
 2r1LQrzydjumwqfVZVtOletg+snDgKKdxhJwVGkk15DWpf8IPisXCY2iEf28JATXgB6F
 oSotxkXQUz+Lz5w3hBv0H5GnIH/W07q++l0ABL0VM54wBEEiwp2uIrXdIqYF5FIeZiCa 3A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 373y8bpx0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 10:22:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129ALUa3158580;
 Tue, 9 Mar 2021 10:22:06 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by aserp3020.oracle.com with ESMTP id 374kmy995w-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 10:22:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hB7zmvm4l6URo4/LEahkXhJ2PXWn2cwZUPIZ9lCoadwOjZ5AqF1MJe+k1uG1eZZUjmC3xWZGdQDGLmB4Z6gY0sZL6XzoysvTUqwjbl+fSNVrTRYJWdtf73TZy3LSSWUjSP31upkFee54JxoqieHedfmsB8OzgbSrnnBd3pDpxClSFq+uiN5cBmPkJh0LInKDlHWfnK6U72JM4ddjr1XhCzxS61gS77VPvXWrsYo1X2tWsUThXkDWrK2kwt3hRuLEkXflmUN52q+mb/xFiMvLFonIRJY/+Jb/dlPOYeD+/8l/R4sFOYrbarjDcEot0xc2pp8WJ+TyxE7dgDWD64pe3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ6LuMZKmrZe2Rsv9g4XWMsLyPmUbJE7R8shR7N8T+g=;
 b=lknpsNj8Ddj9EVezWlVa0XFjRzl6sIEc+hY97IFHqUVfH5A7Yk20V07OP9klQUf2ffeZ6NFfDALM3LwwHmHlHzOuqHpNsgqpa8GzKVssgBKrkM06DimEGefaiox+Elae5T51Qej5LxobC8osGUAePEBOl6zAtPmeUYRjb49ivvTuHwFXiwmNjC5UrEmhv90DD/j2N50mH4XCk5ExBeHidNrhahD1cHhsy0neKEiDNFib8CNX8EsZbOFW1KUSzlfyCx9G5LHMEHB4D/9KLudcC8Vu/kNnYW34dmbMLElSqncCKLgdtUrbsnniyWD2IAP0ng6BNjp4/NjijhkWkNDHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ6LuMZKmrZe2Rsv9g4XWMsLyPmUbJE7R8shR7N8T+g=;
 b=Uzlt1tNZm81D1o380BVpUbGIom9HzCyyqRz18oZQV4SJwlkyRUKiRxUOav41cDfIHqPf7aSZnRMFpBd+DviQosjuCeI2laD+DMmb9j5paIs3GaERir5/UDj2eX5caticNNse6qXFCuZP0t/xhW1fYSzJcyzk1dGLnjjNxT+mS30=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DS7PR10MB5184.namprd10.prod.outlook.com (2603:10b6:5:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 10:22:04 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 10:22:04 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/4] block/vdi: When writing new bmap entry fails,
 don't leak the buffer
Date: Tue,  9 Mar 2021 10:21:54 +0000
Message-Id: <20210309102157.365356-2-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309102157.365356-1-david.edmondson@oracle.com>
References: <20210309102157.365356-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0297.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::14) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0297.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:196::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 10:22:03 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id afa22f67;
 Tue, 9 Mar 2021 10:21:57 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fb77d77-113c-43ae-3185-08d8e2e52f64
X-MS-TrafficTypeDiagnostic: DS7PR10MB5184:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR10MB5184DDF0B503A0784A6164C888929@DS7PR10MB5184.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6T3Tvpfqz+ngiTWpLfPyEObFMSQOh/ENZR9Hm0MQC6uSti3TVSWw/QRhNcF7UgAIexXmeOk0Lqn21nkoPS++HCQXhRzvqr6cSYO1W3VMzQhQpuiu0RG2KnIvCvyW0GP6VD3f7EDBdjHEf+TUPZZGC/ZUrIYVJkj6HPWer8zkTsFYoI3Ynm8E1NcBKqiLEhMoJ3Axnj+7PKHv8wxLVTjndef8q7xVgeW+709Os6KyjqG9/VDY5TBLVaNsaAmw6vGbyQSEw7YT/AglLtw1hbtd2+8WAwypj+gH2ZhbdyXxRlkDyQBVkfM85J6gURTxFJq+U5B2rigXCHcH/gq+y05jvlbw1ra+6zr7x9LuMrJGXtZSv9ANJxLDgbZP8L56LAgbwC7M5C4GULdHW+iWnlb3BMU29SxgtfF8f57CCneq/0fZasXVw11UOxNZpUlfmCjDt/nnNJjKZJ7h//klmS/wOWEJt2SUKGohAcxvvvgqH2UaCZagx7feQFrnEZ8qM1mhGNiGD6z0zQKnLYnVJwDgXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(39860400002)(346002)(366004)(136003)(2616005)(66946007)(6666004)(4744005)(478600001)(107886003)(86362001)(1076003)(6916009)(66556008)(54906003)(66476007)(8936002)(8676002)(186003)(5660300002)(316002)(44832011)(52116002)(2906002)(4326008)(83380400001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4gPlYhdccfOFaB4lRpIe5acmeFuzCe8HnIw4HURhM4gSwJFVQRouFqdxwI7O?=
 =?us-ascii?Q?1s3vmPeN586HyCRLWCLSUMFH2g47YkQcMLJhdf7EquCDF6SaE21r1xzjxEhY?=
 =?us-ascii?Q?/Yvp5hQ8iKwy1z5k9uUDnUQEacrApf1pKWcKGe9i16X1FuO7MLP8f/WWqM0D?=
 =?us-ascii?Q?EeF6S/WDQNaZfUXG6cXSXuf+t02r3/iD5LfAlz1O8rKuPMbW6qQ6ZBCYXy95?=
 =?us-ascii?Q?6mVfO16kUITN7XXNdZNsJ3MJVmfcLTYzvUTZ8EsZTl2m1lpiZ0afnhcH6DA1?=
 =?us-ascii?Q?CROA0QbfPVUgXxINtw2XnNBiZBeLWZvvLCsPByioeJfiAAP5+k93WiQn22iP?=
 =?us-ascii?Q?8YyqAXFA7Lr9hmJtJVWZadJsSOeR1Gdbqp7S7/cVpqjRtaSOPlORhET+13vi?=
 =?us-ascii?Q?lddjgJzV0y/aV4M5kmrO5t4DBYztJ3CaIgiX9hF7xyAYvPPlL0Wjj5d3qEyX?=
 =?us-ascii?Q?VfPjMqiprSouRmGfQZ4mZhh+PRqLWOOitU7xFjTBWuE6WbXxryZzIu76EC7d?=
 =?us-ascii?Q?TWVo3u4eB2GtcVavIuAKamF22x95xv1Pi1zUWvyvtZ0gkoUJT7B+832l75Dr?=
 =?us-ascii?Q?5DxYqx0PoPxs86aWwi/Qot6G3VKBZkIj6dRyDGQqIuRDmCdPJzaBhx5v+nXj?=
 =?us-ascii?Q?c74/AAedtlOhR0lh6k6Q1GusdFHHjjRjpJf4GuCLkhwpro6DMHGiNIhWzmfb?=
 =?us-ascii?Q?t5E/IeFBssxVET684ObWiBsOGjwPVJvai+gA2ph6a2BjBglAf2n7pD8MCZw6?=
 =?us-ascii?Q?Q/WgYExnXlBHWSpPPLHHgDjjzfGcGGMcqOByFlmlopSm5chWTpVkES0wCkgH?=
 =?us-ascii?Q?Ccfad4I0sLfyStULQB6pP9xLoVbO6ZhMrqgYJwvN7aQkOcTrdN+Od94b9qoD?=
 =?us-ascii?Q?tkN12iXgbqHb4Mt5KYxxXrpUP944w4zH6FkkbHeLp4E/WJiiMguE8mmndNh1?=
 =?us-ascii?Q?3yYhhZPRsSDneTMh+r4H/A7eBvaiTnEdDqLV3JhFXUDzMvQhs8jyvJqqgZLS?=
 =?us-ascii?Q?iVnSpZajUc1qL5R0GTLT6MNYsX9gMbjP9D8KictUHxY7+Hk8ZUnRMuksPLyj?=
 =?us-ascii?Q?pV68TWJsdxVsY/Vj/ZiKm71twcEJJCjE6h/LxVI7Ew9sh2W5gyfI/2UQvaaL?=
 =?us-ascii?Q?Wu206x7DWKNxuiZpRRFAmhyrW9EYNADZqiBzlrPjHMIqQQl6Pg4K+q4kWBOT?=
 =?us-ascii?Q?LSbKMwpK27l+XZjQpfAPCLnj1sYHuTCPqovvBEWS2ZNVWLoRF1qFioXvyUla?=
 =?us-ascii?Q?AZMX4Hu4RwspXNxCil26j/O+V6bFmEQHMF77Aetqb9Zkj2Qxm29Nj4ziILke?=
 =?us-ascii?Q?nYT3GunPXbtir+EYJXMA1tiZbmN1ZFRszHFOE4WhlbU8drkoQVr99ro/DN0F?=
 =?us-ascii?Q?QwMGsuY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb77d77-113c-43ae-3185-08d8e2e52f64
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 10:22:04.6556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtxJ6fdK6+W/aeNs99fFBRXCbco1O7l/YCkUigKfRq3UaPk8ybaXoaAqgtKiL8vCmyOAl6yosCtxHMBC0OPNnKCh3Z0SwOKKfh5WC/CpS5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090049
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090049
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Max Reitz <mreitz@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a new bitmap entry is allocated, requiring the entire block to be
written, avoiding leaking the buffer allocated for the block should
the write fail.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 block/vdi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/vdi.c b/block/vdi.c
index 5627e7d764..2a6dc26124 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -690,6 +690,7 @@ nonallocating_write:
 
     logout("finished data write\n");
     if (ret < 0) {
+        g_free(block);
         return ret;
     }
 
-- 
2.30.1


