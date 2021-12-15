Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81949475C8D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:02:30 +0100 (CET)
Received: from localhost ([::1]:44286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWjd-0004mC-KM
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:02:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKW-00067D-BU
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:32 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:61428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKU-0008WR-6v
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:32 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEa9rN005911; 
 Wed, 15 Dec 2021 15:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=hOSBlTBFB+s6ea/5oe5bG28IG9JqPOZLvRE8szeF1lM=;
 b=tyrjb7j4VX2HZkpW01NlNgO01HFWV2MU2WflC+HrWXFNFF+aUFpY9b4FvRKeiFiuFkKK
 Souc31Efqy4I5REUdxI36LiHgLpFhCBk2KI10B4pSewps6aUdEAn6ltiASLLT0a9fuqT
 vMDjYrQJnQGJRIdp9ZxpMJuirt+IIi+zJWLGqPgJWjYsItK4fyofW4GBqi3mCuF59pGD
 m5TAC/tITXhXTGGgWgbUmrqvY+gvfXFL3KbFfSchhhdLZlNhim4vO4jG8BP4R4HDUVSs
 MLMksXbx1hBXZLiWGmY5khcE8TNjI5ATB58mMJziRlzkJa1Gbp7o1i7E720NLQIsCWZb jA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx56u6ug9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFUXS6094355;
 Wed, 15 Dec 2021 15:36:25 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by aserp3020.oracle.com with ESMTP id 3cxmrc0u86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zgb7Vh6z8+C6lNfaqvjgnNwiaJLuWwWeI2aoK7MlANoMse8alr3ipMgrl0AvqniFXDmT4JBHeJJaKNsEHqaCfGCjyIohCpljdhC+EQ60UXgk/tDtA/E/tmN+lGQxQvi9FSb7I+dL/3csZQORhB6+m1PMLKRuofmoy0f3D0mYdpvJLiSdDDbpw3x1X422IyfKibRpt5siwa0/UP6/+F6W0H/eR+0/TXqKoxcH7DVhsrkzCz/mg/jZ6n37XenNgblDiGcYjgvh0NCvxTW1jMzrAIvh7VqKjabCUUGIiJyXvBAmWR3TGk5rhVVA+cQmM3aGGkOnpxDickkC+K4Xznj2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOSBlTBFB+s6ea/5oe5bG28IG9JqPOZLvRE8szeF1lM=;
 b=A41mI0B4PyjRfJwEpFHI3gkWlu4KlfWACCaC26nNlJpZ5yp39MHHGNat07HnbtszC3jMZ76+vQSdEOOuazO9DVc5z60I7MMJGLJ8BVGFEo6cpQYI0uTLPyetWt5O45d2O9v2gsL1W3HPR5Ni2pxM6BsYTvFc1mNy2B5Rq3lmyz7cphHMc3BDHa33K6y8RIJQitF25U6yPZ8dHliFHabt56pFFbQ9g8YW/FRZYCEwqo9gt7Rm2wbbbhmt+lvMygX5DKetDr6iJx0wnIZsTA6FIflKzf5qgXqnp6Ry2+0AGJAGYFk9ZfgXwBfJOntGgZsB4qyaQpGwb9+c78z30xqyzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOSBlTBFB+s6ea/5oe5bG28IG9JqPOZLvRE8szeF1lM=;
 b=Wb6xp9YDmf8g+AAuSMM9sdOmxS+0kjKTR9NxDCsRuT/alDpThvPect/xJPqKlQvV7XLeb8zn2un168+ygO3cJijzVl65zmV4nWW9X+iErXQckTbn/zkTJZnPIUvvT26QO8o+4O/0mW1pXv0bVZ+sEFL6URE4u3zMZdJK9HJ+Vko=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5282.namprd10.prod.outlook.com (2603:10b6:208:30e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 15:36:22 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:36:22 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/14] vfio-user: IOMMU support for remote device
Date: Wed, 15 Dec 2021 10:35:35 -0500
Message-Id: <acae079dec4261d762311b86a0e699ba9ad79737.1639549843.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1639549843.git.jag.raman@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e57d8d15-4eb8-4282-032e-08d9bfe0a5ce
X-MS-TrafficTypeDiagnostic: BLAPR10MB5282:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB528269C0EC972315290EC64190769@BLAPR10MB5282.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:38;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f8DkJEPyRndYDK0oMkm5mKjOBFKA9U+4VwYVnf5rrLCZCCoRt7G9dqxtuJv7p5ZNgol2Ql2X72FbTvUZOkOI4f7g65IMPQOTCtIvD96QQySKEQHe9b/CfqgP25u/KwYeiH/TgrI9xQCPNwNepgoG//7v4tTXH4Nx2Swv7zpy+OPUWbottUkf4erneCMAi659Crr3NfxBdEsDOnad8aECvpJV4WBHkRA+J7aV/GPo15up3cA84BLL2OV/5DhkRknf/jOJBWiKDrJQNK5Lo18SMklUen5yPDOj49yZECWOt6JxSXGDSheGto2l77j0ZHQnQqfMYK/H3WCahQbZl920zaVXKgiU36ohM9ckxYuLPS6+fsxG4SYwNG5okvQ8U8BjSqrIzu0SBmxm88T3cuzIPeBNMdrIfZjRUSyzlEZJKmwHH21OVrbDvFDwaDXJgpsT5tH6LB6b5HXfrBRJL1PfpJErblKzd2+XRRvjeLXT1UC6S5TNIjnrygpyuJUcNPUmT+A3i536u2a0KkUWtwaEziVe67Q+0OPBRgZj+doe0j/npa0B49IKDkRWTa+43OclZyiyxLEkBTM1FQCvWwUcbsKWaJDgjMrOGtbVIwQ6KRDZT2NfsQYsJ3E7BJ1IODhlhnek1+ExVb8+BXKkrBjzhIXE6uDihCbQriIW8WDBD+XBC19nNC1eWfJtyBNRMypJtb2USD0gIvAxr1HA9iqxAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(86362001)(36756003)(316002)(52116002)(6512007)(508600001)(2616005)(6506007)(4326008)(6666004)(6916009)(6486002)(7416002)(107886003)(83380400001)(8676002)(26005)(8936002)(38100700002)(38350700002)(66946007)(5660300002)(66556008)(66476007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkVRQzBEMW1JcW80WFBjUENFSTZrNm1wajFCY2VIOUd2eTM4WkZXYVByMVVy?=
 =?utf-8?B?T1NXS29Qam1iSlR1djBVRHFMVmw5dW05dWNwYm51TUx4N3Fnam5rcXNpOVdt?=
 =?utf-8?B?QUN4cDhoZTEvVndKTmxqdVM2MHZPNzNhVjhjMU5VRERXb25oSlhzcURBK3RT?=
 =?utf-8?B?RE9YM0xYQU03dWVRa1RERlNlTXhDeEdBOXpzWnM2eG8rd1liMktnZlFhbWF3?=
 =?utf-8?B?UEUwK2lwZGZtUFV3V0hhZEF6UTNCYjJlckVJZnp5SGw3S1dxZ0x0YnJIYjgr?=
 =?utf-8?B?SVVwOXRDeWZ5NSsxdXJaaVduZG1uZnh1QUw5N2JLOVFmOFU1cE5OazJCM0F0?=
 =?utf-8?B?c3FRMHJXVHZ3SFFzd1N4bE9SbUNndVRIWnJzbW1EcGZkV25GYmZJdjJPTE1O?=
 =?utf-8?B?cmFrWlNRSzk5dUZXbXZtOTdzd3lTMGFFeTRlcnNQT0NWUUY5WWVveEIvdEhD?=
 =?utf-8?B?anVWYWFBRUkrbThCbnZPZUo0RnptbjlVd0tpQXNrZGVKQVRpdUlJT2xTbkQ2?=
 =?utf-8?B?ZnVtbWVzbjd3dGxLc3k1eWh4ZWpRWDFlSnM5TWRseEVnZ0JMbVN4UTBDYzZG?=
 =?utf-8?B?UnpTemgvM2laejRmZGgzRVZJcENtNVovU3l3cmtwbG1BQ0MwWDRSVVlTb0x5?=
 =?utf-8?B?VUZLdTgzZmRMMjlrSlFkOWFVMTRhOVJsTWk4aUIwRjNXM042emZmMVJORGU2?=
 =?utf-8?B?ekUvK29pY0dNVlM5OG9mVnhFTUp4M0Rad1JHb2JoT3JXcmNqdVNWRWxncGN6?=
 =?utf-8?B?eW5HRG5XREVDTENUOStIOW9vSS96M0pZK3dFalg5MFgxV0pHYW05ZkVGbm1T?=
 =?utf-8?B?OFkvSng0QXFqRW94MVdwNlVieTFBOU5FejBxaHpYdXVRNXBxZUc5bTZ6SjR3?=
 =?utf-8?B?MmppVDhJOWdzNklSNTZRY2xDUlBEbVorc0gwbHNqZnBYemFqN3Q4NWhNSlo2?=
 =?utf-8?B?cmtETHE5cXpKMW1hT1N4MHNvcHFCUHY4K3VJWnZCSkNLZW8vb2ZicUlCZEpq?=
 =?utf-8?B?OUZRelJoaG9hcmlqTktlTTk2SmFHemJaNGxqbkR3aGFWbEptQzUwTGlkbjJM?=
 =?utf-8?B?WUl2SkFHcFdiSDRSQzRHbWFtbno2aFdHdm8zTVZKL2x2bUhSVGJCUzBTMHgy?=
 =?utf-8?B?c0NUWWZJTndGK3k0V2VUSFhzMk5VNlpKR3l5OWJvUXlIL3hnM083YTJZRDNN?=
 =?utf-8?B?TWordUR5WTNKZFJHQTEwVGxsQTNMVHI3S2lsUHBBOUw5eEcvUkcvVnZpQjh4?=
 =?utf-8?B?YW5VZ3BPZk04aFJ5c3k5Y1VsUDJmVjc1cytEYkZqUm1Ka1dMcG9CWFg1Tjdi?=
 =?utf-8?B?bWN1TkJPdTBQYkhTclJ4RFJXZExqZTZxLzRLTEJyOU8yeTZiUXo0TUo3MUg5?=
 =?utf-8?B?cm5oa2hvSUpZZ240ZFNyb3NEejVxKzFjUjMzb0J5V2dYU2I4MmllSldQb2tV?=
 =?utf-8?B?R3duQWZMSGZQeWZja1lkUnRXYTN4V1J3TXYvMXZpbWx6TWN1TjVZczlzNE83?=
 =?utf-8?B?a1BZSVIzK1FwRVpxMzU1TldNRHJtSXN0VXQ3Wml1QmxRTk1wVHZwUkZ5NXBu?=
 =?utf-8?B?SGtVYkl1VlNFdmVXM3AwSmR0NVp1SmttTGRXYlJDdkUrdExZbGQwdXozVVdN?=
 =?utf-8?B?T21qV1FpTjJKSG1aeXFYNFlIN1czTTJ2ekRiaVMxZm1QVGU1UzhUdU9VUTJB?=
 =?utf-8?B?SUNRVGhOM1dhWTdjQjNXeWVMVDhhazZRakxvZldwNUNtQTlKUlBhdzZ4MHY4?=
 =?utf-8?B?SXhvbWlMZmxEcXBNRE9LeVY2N3dTbkkwa3FucVQ4MWFtdTBKcTlBL3A1dmRn?=
 =?utf-8?B?QVY5Mlo3c25qaTJVSWVBUlFUbW1mWXZ2ejNqemkwM25TZzRYRWZoZFBURFZa?=
 =?utf-8?B?SFV0cmFCY2xSUjVsWEk4Y0FJMmlXbThhT3hKVGc3TFVmK0hYbjU4ajZYSmVo?=
 =?utf-8?B?V0FLNWJzODZ3YnpTSGhWUkg0ZXJEU2d4VmJyZlhZbE9iVWdKVGd0c2xhUHRp?=
 =?utf-8?B?WG16VnVuTHlLNW9ERFFVMFZIdWtUM0Z6MzV1R3pUcDFpVTM5TTBLSFVHY2hF?=
 =?utf-8?B?U3dKOWRDYUNRaldWc0pubGp0YVEzWTFyTlNFQWlEWkJuWXFBelZIWlJDZjJI?=
 =?utf-8?B?VUJ2c3lzR0tiaHBHMyt4VVA5eFVBbndTMVZ3Mm0xT3N1ZUpPakF6djFGcnFk?=
 =?utf-8?Q?X6m+UdbvVtoeSw8zXG+DHAo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e57d8d15-4eb8-4282-032e-08d9bfe0a5ce
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:36:22.6832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgjd4BBE0DILIYYCI3NXAC/KrOp+rKq7NmHNUwvLkqnmB4kYZQVEy+pZ6YYq4l5PGEcEkyWT5kkDLlZn/+HgRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5282
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: 1cw_7gz2Ag6toHKgpF9HONuMfeSnaYtS
X-Proofpoint-GUID: 1cw_7gz2Ag6toHKgpF9HONuMfeSnaYtS
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, bleal@redhat.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, philmd@redhat.com, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Assign separate address space for each device in the remote processes.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/pci/pci.h      |   2 +
 include/hw/remote/iommu.h |  24 ++++++++
 hw/pci/pci.c              |   2 +-
 hw/remote/iommu.c         | 117 ++++++++++++++++++++++++++++++++++++++
 hw/remote/machine.c       |   5 ++
 hw/remote/vfio-user-obj.c |  20 ++++++-
 MAINTAINERS               |   2 +
 hw/remote/meson.build     |   1 +
 8 files changed, 169 insertions(+), 4 deletions(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 hw/remote/iommu.c

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 5c4016b995..f2fc2d5375 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -734,6 +734,8 @@ void lsi53c8xx_handle_legacy_cmdline(DeviceState *lsi_dev);
 qemu_irq pci_allocate_irq(PCIDevice *pci_dev);
 void pci_set_irq(PCIDevice *pci_dev, int level);
 
+void pci_init_bus_master(PCIDevice *pci_dev);
+
 static inline void pci_irq_assert(PCIDevice *pci_dev)
 {
     pci_set_irq(pci_dev, 1);
diff --git a/include/hw/remote/iommu.h b/include/hw/remote/iommu.h
new file mode 100644
index 0000000000..42ce0ca383
--- /dev/null
+++ b/include/hw/remote/iommu.h
@@ -0,0 +1,24 @@
+/*
+ * IOMMU for remote device
+ *
+ * Copyright © 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_IOMMU_H
+#define REMOTE_IOMMU_H
+
+#include "hw/pci/pci_bus.h"
+
+void remote_iommu_free(PCIDevice *pci_dev);
+
+void remote_iommu_init(void);
+
+void remote_iommu_set(PCIBus *bus);
+
+MemoryRegion *remote_iommu_get_ram(PCIDevice *pci_dev);
+
+#endif
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 4a84e478ce..57d561cc03 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -95,7 +95,7 @@ static const VMStateDescription vmstate_pcibus = {
     }
 };
 
-static void pci_init_bus_master(PCIDevice *pci_dev)
+void pci_init_bus_master(PCIDevice *pci_dev)
 {
     AddressSpace *dma_as = pci_device_iommu_address_space(pci_dev);
 
diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
new file mode 100644
index 0000000000..30c866badb
--- /dev/null
+++ b/hw/remote/iommu.c
@@ -0,0 +1,117 @@
+/*
+ * Remote IOMMU
+ *
+ * Copyright © 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "hw/remote/iommu.h"
+#include "hw/pci/pci_bus.h"
+#include "exec/memory.h"
+#include "exec/address-spaces.h"
+#include "trace.h"
+
+struct VFUIOMMU {
+    AddressSpace  as;
+    MemoryRegion  mr;
+};
+
+typedef struct VFUPciBus {
+    PCIBus           *bus;
+    struct VFUIOMMU  *iommu[];
+} VFUPciBus;
+
+GHashTable *remote_as_table;
+
+static AddressSpace *remote_iommu_get_as(PCIBus *bus, void *opaque, int devfn)
+{
+    VFUPciBus *vfu_pci_bus = NULL;
+    struct VFUIOMMU *iommu = NULL;
+
+    if (!remote_as_table) {
+        return &address_space_memory;
+    }
+
+    vfu_pci_bus = g_hash_table_lookup(remote_as_table, bus);
+
+    if (!vfu_pci_bus) {
+        vfu_pci_bus = g_malloc0(sizeof(VFUPciBus));
+        vfu_pci_bus->bus = bus;
+        g_hash_table_insert(remote_as_table, bus, vfu_pci_bus);
+    }
+
+    iommu = vfu_pci_bus->iommu[devfn];
+
+    if (!iommu) {
+        g_autofree char *mr_name = g_strdup_printf("vfu-ram-%d", devfn);
+        g_autofree char *as_name = g_strdup_printf("vfu-as-%d", devfn);
+
+        iommu = g_malloc0(sizeof(struct VFUIOMMU));
+
+        memory_region_init(&iommu->mr, NULL, mr_name, UINT64_MAX);
+        address_space_init(&iommu->as, &iommu->mr, as_name);
+
+        vfu_pci_bus->iommu[devfn] = iommu;
+    }
+
+    return &iommu->as;
+}
+
+void remote_iommu_free(PCIDevice *pci_dev)
+{
+    VFUPciBus *vfu_pci_bus = NULL;
+    struct VFUIOMMU *iommu = NULL;
+
+    if (!remote_as_table) {
+        return;
+    }
+
+    vfu_pci_bus = g_hash_table_lookup(remote_as_table, pci_get_bus(pci_dev));
+
+    if (!vfu_pci_bus) {
+        return;
+    }
+
+    iommu = vfu_pci_bus->iommu[pci_dev->devfn];
+
+    vfu_pci_bus->iommu[pci_dev->devfn] = NULL;
+
+    if (iommu) {
+        memory_region_unref(&iommu->mr);
+        address_space_destroy(&iommu->as);
+        g_free(iommu);
+    }
+}
+
+void remote_iommu_init(void)
+{
+    remote_as_table = g_hash_table_new_full(NULL, NULL, NULL, NULL);
+}
+
+void remote_iommu_set(PCIBus *bus)
+{
+    pci_setup_iommu(bus, remote_iommu_get_as, NULL);
+}
+
+MemoryRegion *remote_iommu_get_ram(PCIDevice *pci_dev)
+{
+    PCIBus *bus = pci_get_bus(pci_dev);
+    VFUPciBus *vfu_pci_bus;
+
+    if (!remote_as_table) {
+        return get_system_memory();
+    }
+
+    vfu_pci_bus = g_hash_table_lookup(remote_as_table, bus);
+    if (!vfu_pci_bus) {
+        return get_system_memory();
+    }
+
+    return &vfu_pci_bus->iommu[pci_dev->devfn]->mr;
+}
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 952105eab5..023be0491e 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -21,6 +21,7 @@
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
+#include "hw/remote/iommu.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -52,6 +53,10 @@ static void remote_machine_init(MachineState *machine)
 
     remote_iohub_init(&s->iohub);
 
+    remote_iommu_init();
+
+    remote_iommu_set(pci_host->bus);
+
     pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
                  &s->iohub, REMOTE_IOHUB_NB_PIRQS);
 }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 9399e87cbe..ae375e69b9 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -49,6 +49,7 @@
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
+#include "hw/remote/iommu.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -210,6 +211,7 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
 
 static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
 {
+    VfuObject *o = vfu_get_private(vfu_ctx);
     MemoryRegion *subregion = NULL;
     g_autofree char *name = NULL;
     static unsigned int suffix;
@@ -226,14 +228,15 @@ static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
     memory_region_init_ram_ptr(subregion, NULL, name,
                                iov->iov_len, info->vaddr);
 
-    memory_region_add_subregion(get_system_memory(), (hwaddr)iov->iov_base,
-                                subregion);
+    memory_region_add_subregion(remote_iommu_get_ram(o->pci_dev),
+                                (hwaddr)iov->iov_base, subregion);
 
     trace_vfu_dma_register((uint64_t)iov->iov_base, iov->iov_len);
 }
 
 static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
 {
+    VfuObject *o = vfu_get_private(vfu_ctx);
     MemoryRegion *mr = NULL;
     ram_addr_t offset;
 
@@ -242,7 +245,7 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
         return;
     }
 
-    memory_region_del_subregion(get_system_memory(), mr);
+    memory_region_del_subregion(remote_iommu_get_ram(o->pci_dev), mr);
 
     object_unparent((OBJECT(mr)));
 
@@ -320,6 +323,7 @@ static vfu_region_access_cb_t *vfu_object_bar_handlers[PCI_NUM_REGIONS] = {
  */
 static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
 {
+    VfuObject *o = vfu_get_private(vfu_ctx);
     int i;
 
     for (i = 0; i < PCI_NUM_REGIONS; i++) {
@@ -332,6 +336,12 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
                          vfu_object_bar_handlers[i],
                          VFU_REGION_FLAG_RW, NULL, 0, -1, 0);
 
+        if ((o->pci_dev->io_regions[i].type & PCI_BASE_ADDRESS_SPACE) == 0) {
+            memory_region_unref(o->pci_dev->io_regions[i].address_space);
+            o->pci_dev->io_regions[i].address_space =
+                remote_iommu_get_ram(o->pci_dev);
+        }
+
         trace_vfu_bar_register(i, pdev->io_regions[i].addr,
                                pdev->io_regions[i].size);
     }
@@ -490,6 +500,10 @@ static void vfu_object_finalize(Object *obj)
 
     o->device = NULL;
 
+    if (o->pci_dev) {
+        remote_iommu_free(o->pci_dev);
+    }
+
     o->pci_dev = NULL;
 
     if (!k->nr_devs && !k->daemon) {
diff --git a/MAINTAINERS b/MAINTAINERS
index b5eb306662..5dc67d79a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3466,6 +3466,8 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: include/hw/remote/iommu.h
+F: hw/remote/iommu.c
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 534ac5df79..bcef83c8cc 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iommu.c'))
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
-- 
2.20.1


