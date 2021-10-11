Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F0428644
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:38:00 +0200 (CEST)
Received: from localhost ([::1]:48926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZo0d-0002r8-TZ
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuV-0002Vj-UH
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:39 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuT-0004AP-Nz
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:39 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B2iHY0010266; 
 Mon, 11 Oct 2021 05:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=jSUqZWzYsyThnFjykQxNIzxGxuhVA2UyBajG0xpbnR8=;
 b=j0TCKEpU/4EYpdpkF0zFxYIcr2aCDtGuMIMgc1ViBeei3eXmCJzb1iUUxrJWZhiV4HEZ
 PyJJaB5nAFoBB3AdTUD/DdiSvWbXHkiOWcs/dhpI2XDJXjnERv1gvlZnkQMtDj7E5k/g
 8hwiTOgzIB8x6bbw3zfpVuA0ORN//7JQ5j57Q5guo4wCbGD04c9y+I03UUDEkc9tMoQv
 CxG9QmfwmoKgumGyMP9B2yX93vO3tBeXwEcMgcXrVTaz9xEN4mzSajDZXmKx1qzC/jrE
 sxDk9W40dnb/AaegaslBOruDK45eXdDayYmH6SNiy1wh3FYodwCUvPys0uq1w7dDyvaA Rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkw3j1y1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B5UHu6084545;
 Mon, 11 Oct 2021 05:31:35 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3030.oracle.com with ESMTP id 3bkyxpc91s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHD5is9ZD+qLO8HoD2nZvGQZZGJWYWWzD5fl3vUcQ1Usr+6bBY9r6zn+LUOlMvmX62J1doqKpg8UquEDKrXNeUQvNzsefU3RJIRVGd/+RSFVW8GFAYQE+xIVvUD/be/6slUyIWmU9vrPhVfk+hCIaRco67tn5GqlLJnd0OYUmM4J7fD2OzOY341m1LbbVBaiWQbfJk5rBHzC2azqzEmC/IAQSxTZ5rsMyk3m0dWsQPC3zXXUMuYdKlyDGjymwxC5i5adRfKn1qciq4d7QWcP4xjjh5fB7l7LM1Fwn/PN5c8dnV2s3eXF/n7Q2FfG1p/CQUkVvnx2EFj/w2pE8ahYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSUqZWzYsyThnFjykQxNIzxGxuhVA2UyBajG0xpbnR8=;
 b=blCnQZZZy0OqeZZ61wNxYdCB59KX7HGx+5AcgamDJAky6cR6IZWFxKfLctdGrHUq+lFCQHmuOqkDKd1f3Un9oV30a8ZwsKu8Ufshd/4njpMvpSy+N3f7jdaSTA600Kij6AK8Xre5r3rraAO9zswlaR8mxA+0EtniHq90wVREqL68H16k25zjvOwgJGhF+djx1pHuAa2Cw7hXLE1GRUysdXJMqFs47JC7gbVnxP3hW29bBhhUaXCwS0hKhz0g8OYnKNTRVxZg5ueS6EdUz2q1j5wo/P9HzXIkKJefU/zM0oAonHcWrQzRk9IuVydOqN+sZpaYZ8axSDc0dDbrMwqqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSUqZWzYsyThnFjykQxNIzxGxuhVA2UyBajG0xpbnR8=;
 b=iKHa6lwvmWm0CJTeR6yxaiEy2yatUhHL6IH740EdRezWowRLYXqc+9ck4OrkPtNtrbfjGB7v1rsnY067xI6ICx5FoebpCZwPtDSRL9wat8QcneOAtxyHtx+XCeJl8PXis+k0msTbzyG26VvxIo0uxTBa3nM15ABPAsPwN3cFWNQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3902.namprd10.prod.outlook.com (2603:10b6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 05:31:32 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 05:31:32 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/12] vfio-user: define vfio-user-server object
Date: Mon, 11 Oct 2021 01:31:08 -0400
Message-Id: <13dba991f1de91711e5c3cad9a332d6e7c5eee7b.1633929457.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1633929457.git.jag.raman@oracle.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
Received: from jaraman-bur-1.us.oracle.com (209.17.40.40) by
 BY5PR17CA0072.namprd17.prod.outlook.com (2603:10b6:a03:167::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:31:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d96dc63-6782-4e1e-64e2-08d98c786271
X-MS-TrafficTypeDiagnostic: MN2PR10MB3902:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB390232568611737EE226899B90B59@MN2PR10MB3902.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:457;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g5pekl3bYaotbev/9zoZibBWb7Ro6hnqot6fPybs7JE3Xw9zOnJg5rzaDR37pkTgcoPeoQy5HrJj4aLfBXgIaEuAJI4GHTvvypR0cYMuIQEEYxhJgA89qhCRPDSwNi9LA3Rr+3W0mTY9Is9Au7daFwoKkOHM8VuF1dEp2PCSVHguG18MRaMnB6HS/ThsXzfsfP7pG3sud5Xf+9SzDC9oRFO85z85Yl92YBZ7+3cbQ1oMH6RIQXnbJbPPqUAko3RnX36oeSmXtMGvF0R+M8vHHDjQ/O/HN5xUfX9IyzicgDhDV0M+VeW0uPgJGSq/XyVxT7+SCmjXaLZhbCALmvH4SCU97Qu/+56x23S5g7y8yKLG+xk8KITtH9qfeUKx7zvMqCk0Y9H6GkoC5SiGG1IEHQJEbdSkx2FH79X4s8skSiUFsQjrmfWhhYGbTDKFV4cQI/G+BhIGh+jPKTQZ6lksNLR5+RcKzVoKEc3gbHGfsLOF3C8z3ch/kMa/3z5b5MzfnJT8Cg/37Wdzt4vw17Z588ExtjnMhMOQ+7gSp8wljWH83bM8k5bM/e5RSLiVgSVGQFhOoPH+fBWgqX1819WO855liMch5n6Vloka8V86ReGhnUC5SEVgSMIqHJkpshtOHbZLElVSEayoE7TsBJBFUry4VilP9qa5lYpydRlEJgYITJhXM6glpT7O9NFseUmWisrXhI++v9U5/7MOv/zfhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(6916009)(6486002)(186003)(508600001)(8676002)(7696005)(26005)(2906002)(107886003)(52116002)(316002)(38350700002)(6666004)(38100700002)(5660300002)(8936002)(86362001)(66556008)(66476007)(83380400001)(66946007)(36756003)(7416002)(2616005)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWtyZHlxY2JIZkdqR29ZREUxbUVmU1FBS0xQc1JuK1lqM1dwRGk1MUV1d0Zn?=
 =?utf-8?B?RHZzdWhjTndzTi9wMFRaRGYyQWtkZkY5VXBqMGlmVGVVWUNqTzBtcUpXSDZL?=
 =?utf-8?B?bVhMNzlhTU43cXQvRFNJMUFRSDA1RjN1c2oyblpUVkJMVU1hdkVJWG5jbURD?=
 =?utf-8?B?NVIxN3RwYzhreFhTOFR5MnJpdmFsOUg1TGlIa2FsQytQOXNRcnBIak42RXpF?=
 =?utf-8?B?ZlVRK1d5SEZlczI2U1FkTzlsbnlNaUNLMk4ycjlsMWs2bUdDWnErOFc2dlRx?=
 =?utf-8?B?dmJTK3lJMkh4ZkgySGtibU02dlUwUVVYdWt5bnh0bHZoMlJFY0h6dmVVYTQ0?=
 =?utf-8?B?dzMxdVV4UzFMZTdBaDJlci8ydUYyY01rTWgzRVVxTi9ERjVzdTB6UDdVZjZp?=
 =?utf-8?B?c3dtUzEyS0tmSzEvckpiOVZaTUNiT01xUUtxTVhCM0pybGZNUGVMdHFtRDhT?=
 =?utf-8?B?ekxsLzZpY0wrUGVIbnpwcEJEb1VLV2tISkpNSHkxVG1JNk9lUGo0WjJGTGJ0?=
 =?utf-8?B?M3hRbDFBVHp5SVNTdjZ0UG9Gc2FPV3NySVhSaWNONWFPbmM3UTlsbVVrVEJ5?=
 =?utf-8?B?QWYrL2ZwZGNLZjIxTlJJd2tCYlpRQWVGY0E3eW9uU2ZzL01pcnZJWU5OMDBj?=
 =?utf-8?B?dk52Zlk2cW1UZXJBOEZHdXduODVGU0hDdjc1VjdYS3pCQU1vQXdSM0RoQWdH?=
 =?utf-8?B?aWZIdUVRdU5ITm5xNS95WG51QTdZMXFPaTBQcCtvOUNMaTkyN3JtdERiOHJj?=
 =?utf-8?B?QjJ2RW90eUtraGpYK0hGTERDWktxS2xvYk9hb0RmVFRFTm1zOHlxWE1WUFcw?=
 =?utf-8?B?MThqZ2JmekFuckNhSjM3Sk8vQUpSV1FGM2FralBseDlJSGVxTkh3cnZ3Wk9V?=
 =?utf-8?B?K2pXOCtFOFN0MTc4bnBPSG9vcVhZSWt5TU9OdysyeWd6YXZVbTFWNWdwakx2?=
 =?utf-8?B?Ty9hN2JEQVpINnpIYVBWYXgrekoyelZMcVpSWGh2QmF4RGZoMG5TTFRMeE9S?=
 =?utf-8?B?L2NTTHlMbUpSSExuYmRhNVpSUkFTNW1XTTRQaks5K0JwUmxwMVJMUjVvbG9O?=
 =?utf-8?B?NW1hWUtoeEpOclJWUTM4TjkzcmZlR1JsWFpGMzNvVWkxcVQ0Z0FMZGdTa05a?=
 =?utf-8?B?VWF6RVR2cG9LTlNwTDFzU0lVYWlmVFZscnhqL2hKUVdZNlM0bVdQUkx3ZU00?=
 =?utf-8?B?ekU0blFCN0tWREI0b3FWd1padnkvQ0JxMWxNU0l5aDBPbHZ1V0FCeFE3a1NH?=
 =?utf-8?B?SEFYY2g4WTl2ZlhOcmhlODk5emozbFR1eTJ6QitnaXd2aWhJMWRTMk1ZUHNi?=
 =?utf-8?B?SUJ3a2pna1R6YmVOTnhoV1h4MVNKSVE2dks5dkJFV2tBNGU3cS9TckRmZTN1?=
 =?utf-8?B?N0NFVFRMcVl3SlVjQzZHbUc2ZVlNTVQ0czY1blNwR1NWeXQ5VU92cTdFM0Vz?=
 =?utf-8?B?ZDZTTFBCdzlaOE1XTEJoOHphUGMzR0JUREp5Ym5uWWYySGY0TnkzVEUvWGRx?=
 =?utf-8?B?OHRKTlFqZU1TemR1YW0rcmVKNnduR3F1OGVkTWZ0cStXYkxjM3pGZzI0ZGFU?=
 =?utf-8?B?WDkvZjltaUsrbEZqSGdxS0YxRTRZWnRUUFZ1UXZicU1aYjJ0QkRGSTlaNW85?=
 =?utf-8?B?MDRzTzFGR1cwV2JqOEJNOGxTZnMxQjhIbUdPNUozZ1FNcHlZY3JIYkpUVHRR?=
 =?utf-8?B?eEhIdmRGdHlpMkVGQzhONEs2YXRNdTdUVGJMdm5zQ0Z5R2lZaWZIaGhXMlc0?=
 =?utf-8?Q?jyg3qhCtgt7CitEiZAgr58cB06sbw3frGOv8pz9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d96dc63-6782-4e1e-64e2-08d98c786271
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:31:32.7287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMOyECdquFcJrBrONpaqga9dWcb/U4Bae5IcbMNver8T2qZf74836jZPNxEP8UVBZy+lap4UDVQ4H4/sD6RnkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3902
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110110032
X-Proofpoint-GUID: 7f4HYdFngwyvuhZCaCVI87VEMfQlAxCj
X-Proofpoint-ORIG-GUID: 7f4HYdFngwyvuhZCaCVI87VEMfQlAxCj
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define vfio-user object which is remote process server for QEMU. Setup
object initialization functions and properties necessary to instantiate
the object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 qapi/qom.json             |  20 ++++-
 hw/remote/vfio-user-obj.c | 173 ++++++++++++++++++++++++++++++++++++++
 MAINTAINERS               |   1 +
 hw/remote/meson.build     |   1 +
 hw/remote/trace-events    |   3 +
 5 files changed, 196 insertions(+), 2 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c

diff --git a/qapi/qom.json b/qapi/qom.json
index 0222bb4506..97de79cc36 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -705,6 +705,20 @@
 { 'struct': 'RemoteObjectProperties',
   'data': { 'fd': 'str', 'devid': 'str' } }
 
+##
+# @VfioUserServerProperties:
+#
+# Properties for vfio-user-server objects.
+#
+# @socket: socket to be used by the libvfiouser library
+#
+# @device: the id of the device to be emulated at the server
+#
+# Since: 6.0
+##
+{ 'struct': 'VfioUserServerProperties',
+  'data': { 'socket': 'SocketAddress', 'device': 'str' } }
+
 ##
 # @RngProperties:
 #
@@ -830,7 +844,8 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
-    'x-remote-object'
+    'x-remote-object',
+    'vfio-user-server'
   ] }
 
 ##
@@ -887,7 +902,8 @@
       'tls-creds-psk':              'TlsCredsPskProperties',
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
-      'x-remote-object':            'RemoteObjectProperties'
+      'x-remote-object':            'RemoteObjectProperties',
+      'vfio-user-server':           'VfioUserServerProperties'
   } }
 
 ##
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
new file mode 100644
index 0000000000..c2a300f0ff
--- /dev/null
+++ b/hw/remote/vfio-user-obj.c
@@ -0,0 +1,173 @@
+/**
+ * QEMU vfio-user-server server object
+ *
+ * Copyright © 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL-v2, version 2 or later.
+ *
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+/**
+ * Usage: add options:
+ *     -machine x-remote
+ *     -device <PCI-device>,id=<pci-dev-id>
+ *     -object vfio-user-server,id=<id>,type=unix,path=<socket-path>,
+ *             device=<pci-dev-id>
+ *
+ * Note that vfio-user-server object must be used with x-remote machine only.
+ * This server could only support PCI devices for now.
+ *
+ * type - SocketAddress type - presently "unix" alone is supported. Required
+ *        option
+ *
+ * path - named unix socket, it will be created by the server. It is
+ *        a required option
+ *
+ * device - id of a device on the server, a required option. PCI devices
+ *          alone are supported presently.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "qom/object.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "trace.h"
+#include "sysemu/runstate.h"
+#include "hw/boards.h"
+#include "hw/remote/machine.h"
+#include "qapi/error.h"
+#include "qapi/qapi-visit-sockets.h"
+
+#define TYPE_VFU_OBJECT "vfio-user-server"
+OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
+
+struct VfuObjectClass {
+    ObjectClass parent_class;
+
+    unsigned int nr_devs;
+
+    /* Maximum number of devices the server could support */
+    unsigned int max_devs;
+};
+
+struct VfuObject {
+    /* private */
+    Object parent;
+
+    SocketAddress *socket;
+
+    char *device;
+};
+
+static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    g_free(o->socket);
+
+    o->socket = NULL;
+
+    visit_type_SocketAddress(v, name, &o->socket, errp);
+
+    if (o->socket->type != SOCKET_ADDRESS_TYPE_UNIX) {
+        error_setg(&error_abort, "vfu: Unsupported socket type - %s",
+                   o->socket->u.q_unix.path);
+        return;
+    }
+
+    trace_vfu_prop("socket", o->socket->u.q_unix.path);
+}
+
+static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    g_free(o->device);
+
+    o->device = g_strdup(str);
+
+    trace_vfu_prop("device", str);
+}
+
+static void vfu_object_init(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+
+    if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHINE)) {
+        error_setg(&error_abort, "vfu: %s only compatible with %s machine",
+                   TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
+        return;
+    }
+
+    if (k->nr_devs >= k->max_devs) {
+        error_setg(&error_abort,
+                   "Reached maximum number of vfio-user-server devices: %u",
+                   k->max_devs);
+        return;
+    }
+
+    k->nr_devs++;
+}
+
+static void vfu_object_finalize(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs--;
+
+    g_free(o->socket);
+
+    g_free(o->device);
+
+    if (k->nr_devs == 0) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
+
+static void vfu_object_class_init(ObjectClass *klass, void *data)
+{
+    VfuObjectClass *k = VFU_OBJECT_CLASS(klass);
+
+    /* Limiting maximum number of devices to 1 until IOMMU support is added */
+    k->max_devs = 1;
+    k->nr_devs = 0;
+
+    object_class_property_add(klass, "socket", "SocketAddress", NULL,
+                              vfu_object_set_socket, NULL, NULL);
+    object_class_property_set_description(klass, "socket",
+                                          "SocketAddress "
+                                          "(ex: type=unix,path=/tmp/sock). "
+                                          "Only UNIX is presently supported");
+    object_class_property_add_str(klass, "device", NULL,
+                                  vfu_object_set_device);
+    object_class_property_set_description(klass, "device",
+                                          "device ID - only PCI devices "
+                                          "are presently supported");
+}
+
+static const TypeInfo vfu_object_info = {
+    .name = TYPE_VFU_OBJECT,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(VfuObject),
+    .instance_init = vfu_object_init,
+    .instance_finalize = vfu_object_finalize,
+    .class_size = sizeof(VfuObjectClass),
+    .class_init = vfu_object_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void vfu_register_types(void)
+{
+    type_register_static(&vfu_object_info);
+}
+
+type_init(vfu_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 661f91a160..79ff8331dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3421,6 +3421,7 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
+F: hw/remote/vfio-user-obj.c
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index dfea6b533b..534ac5df79 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
 
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 0b23974f90..7da12f0d96 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -2,3 +2,6 @@
 
 mpqemu_send_io_error(int cmd, int size, int nfds) "send command %d size %d, %d file descriptors to remote process"
 mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d, %d file descriptors to remote process"
+
+# vfio-user-obj.c
+vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
-- 
2.20.1


