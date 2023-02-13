Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09C694892
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:49:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa8U-00036z-El; Mon, 13 Feb 2023 09:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRa8P-00036q-2r
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:48:49 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRa8N-0006yb-5x
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:48:48 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DAUHNa017712; Mon, 13 Feb 2023 14:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=NBH5hm/2GEDT3h7FvlWKZa7WSfyDzeGPNwIVWyAX4O4=;
 b=AAEpzd814u00OSxgxId1iXLDCJeUVxRe2BaRI5SyERi70qdyHO+CWi0NUSVOZMJKyVBN
 qjK46QQhrbQG7YT4ZX6xhKyhokVHI/3rwaq93CoZ8UKSZXRGGpUy1O+og/wf5fKv6OlN
 y9ABnxfU9H0KBOn6Yc6l1W+uLSzk+1ZIjlkmQ8xjkp0BixJn3E8yi8xy8gGQgjGg3aJB
 K4vj0IonNOGF20KUasL3Vnfdnm+WZwrb0IJ/sxTkrK9CQKsP1A2Y4lXWKV8CwEbOqb1Z
 ZiPtBIm5F0/ahkd2C6jEEwSsp+8kJGMzG1KP42aYUb/LsHmHNjTYOn78VUb01mkxskMc xQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np3jttw83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:48:45 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31DDxOoC011523; Mon, 13 Feb 2023 14:48:44 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f46xek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:48:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9Fkzpqsygj+6EE3bQAwnTjTrIuIk1nNM6QyUybatAlltoXINfcR68HsgPJHGHl4fcffVVsNbC8zXlU8OJrL6qAwMDOsBkKenOq3XjLKT+W0k29v2YDJLyPDgeC3H3RRlBz2RY9wPmdDNJDW0dbWRRBEf1skabF5wbX2Sfs9bi82eDpBzA9Wi9HMOK0Jhjn5Rl6e8bB1fHTiW6bOUsryAXoLDVBRL+puSn6cmuvMOVVtfwFvOBjt8akBVsUY2dU76cqY0QqT7DHOSgFqMtIFJimmjN2/vrmENm37aKzMqnkkoCMW8OXHMf+gE/JFR9zr39yPA0c5YtFDkXcbZsnmLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBH5hm/2GEDT3h7FvlWKZa7WSfyDzeGPNwIVWyAX4O4=;
 b=Pk0SovhKeMOBeeMAsi0s558OKvcIS8SseEmJNyqkFYitmzWUqt/9EuoazACcLQFM7XgoBRd9z7OZjhjkj5nmhA0IY4gPCYPVYR+pM2AbU4auBjYOSmz/a2yYqourccK4ywNciNaFeWyGR4ynGw6CjqNYuZ1/6cNNBs9+q2Y1c8cJO66M8Q2o0XUa7qzL1ckBAHLaY4SszkQdmNofXybhgNlALpLJCdIyg5AyrI6WAQ+Kf4ffqEUQEMBXkASJKOCMmjM4BK70K99CLevsVTKdWl+HEIP45sUGCOasOkHGT+A903Hsp8pQLixCy7QlodOXx2Obo/dVVqCPZc2t5SWS5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBH5hm/2GEDT3h7FvlWKZa7WSfyDzeGPNwIVWyAX4O4=;
 b=x5Z0SnKnvLDV6ivLGGkUSybclRZZDufNAdSb+sWFTIshlLghnXURctu+z9k6hYJ2ERoPUOdX4IaRq/filyq55nNzHz47dWI0kCO307gpnnLzxgFbsogI/5dEkHycHsSk+GcoLbUpAlRXsC9hewTK32cdP6tEY1habptfGLvURbw=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by CH0PR10MB5099.namprd10.prod.outlook.com (2603:10b6:610:ca::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Mon, 13 Feb
 2023 14:48:42 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%7]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 14:48:42 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH 10/10] docs/fuzz: remove mentions of fork-based fuzzing
In-Reply-To: <20230205042951.3570008-11-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-11-alxndr@bu.edu>
Date: Mon, 13 Feb 2023 14:48:37 +0000
Message-ID: <m24jrpr58a.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB8PR06CA0004.eurprd06.prod.outlook.com
 (2603:10a6:10:100::17) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|CH0PR10MB5099:EE_
X-MS-Office365-Filtering-Correlation-Id: dac58012-c761-4266-e34f-08db0dd16652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: otrtBGwpgOHvk/rc7YbYnMM0WB4jS42/3VTD2Vk2GOdSWW2eHcizO4W1kM2Tla9pYgVAhk/sIG5gHYVvr4ixPoz/ulSsi3sz1093/qDMXjK7oobn6xOJP2ENh+RV0iQBl4EcZwRjBJiZi65kql1n2fB2HBIfqfgj94Dz79G4447osOkoBdLy4KJmlb4NcKhiPNmuPpPGt8YKq8g18cHVGsTWjEPLb4nkwh1ZnwYLAgI46N4K+p/Y7rmTu/1achzyMoEcloSWJy1j1oSvOSVgdRee6TkBqom7OuydrncpH4i9arQkLDPeO7jb/p6PjiMPqezaA2TNmWCiixPIVAZ/ZbIR3hnYGeR14php+1wL9B543Uqybk/UlTeVQs1lThaLWVxv12UuUrWnDZJ5IcliahcRnZ4KfF+p99aX/7TLZTSFlbDaaJl5fPmT/TCcUsewu4HeoDrqJELaSYc5ULQ7nekcbFY8utkj/wyc08vCliWMF7bjvRqFu4ZY+Rs4py4mBIngwle0cuhbdEq6Y4buKiuj85fOfhhpEEdkHHD2TBpXwjSPicUOaavt5xaKi167RNUsyZALuvt08eG9RlqJVqy/jFdfMvxMYs3IuSuKyyCNR63+oFZZnMMZ766u3nst7alqEFis95ROSYm3MdBXzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199018)(36756003)(2616005)(83380400001)(38100700002)(44832011)(8936002)(41300700001)(5660300002)(2906002)(6666004)(6506007)(186003)(6512007)(26005)(54906003)(6486002)(86362001)(66946007)(66556008)(66476007)(316002)(8676002)(4326008)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JChY12Ka5nijJ2pUUkOCBCoiksMlRNHvfjUlAJ6jny+p+b1elkxFAU1BN3zl?=
 =?us-ascii?Q?wEK/9mFzStuASsBoGdF8SbmYp9sZENNlha9BlD0HedSG0jmt2EBeT/irHr8o?=
 =?us-ascii?Q?F1EagfxS2XBl9L2EGkvUW/SLQw5rY794Zd17qkajtVtDENe+RDQeOBFzYH75?=
 =?us-ascii?Q?Uwn4XKWdfDlC85p6TIZhS3lUo+TQZbvBwFzD4wZaRrRdYQ637yVIwmkMl/qA?=
 =?us-ascii?Q?DuGVsWNtCbTpy/wmNC9gJ3ONgXHRSKU04pmb8Qni+E1kUoDByZGYz2vSUYG0?=
 =?us-ascii?Q?g2xe6RQJaTq48OzOS/KGes2R1IF7ZbylitzCpj0oC6o1oUK4KcHXibiAwM/+?=
 =?us-ascii?Q?XMtdsTTVJvkAS+llhyG7wh1W3056cPZkSuUvJ60PA11hW3D5pniiLsDGl+m0?=
 =?us-ascii?Q?V4TJn1ydhVGddJpaQrMxGtnUxqsunPJiYldklu5RMEyu6qvaXT/40ITsyaL8?=
 =?us-ascii?Q?2wJdtQghkRuhssXX/HvFXAxwD3aAJJSb+lt6RDLnpyh/zBKoQhNhhLdiJeP3?=
 =?us-ascii?Q?TGRYYDULKNI2U20kxjm0hK/X+30F0DatDWEDbiVNGkCLPuLML8eyz4okGEjB?=
 =?us-ascii?Q?QFib0e+/QQZLpaiwZ2bz0z5ATVPDrIo/f99mUfqiExDrNu88YMF1adrxKPyJ?=
 =?us-ascii?Q?P3quxmOHNGTpQmSuMYYfMsv+SPR8nT1MZT3XLdlsNGkpNSA0x4p5vuv+6HUH?=
 =?us-ascii?Q?Yugf/kGKKuNJQJpbhJJP2hcFJLV0SzNlxoB5Ppl7UrtHGPzl8Oe6fWl0hWW1?=
 =?us-ascii?Q?44HLilMXquO6ptGv+CF0skVXg5DFbPwChzooe8YRSdAiXneE0DzkQ0YMztev?=
 =?us-ascii?Q?RBjRx7eBgXen9fZoEzeVjKtrv6vuklkja/neWZUrLndyagRloR7UZpJ/Oeqq?=
 =?us-ascii?Q?5x7Xs3ZTWH2OIC4c2mUH2gmlFsOVBdEWQ6s8oIg9jGNCt6nxsXnl3aXlnx+t?=
 =?us-ascii?Q?bb9w+a3dAr+ued/YUxrY0czAQu8X7o6G/VQSiZ9V1D7iUzsWQ+nSBZfS2B2S?=
 =?us-ascii?Q?DuOBmNTQM7KFLz+ZF5UaF+ZJzhqgD5FcnnxE7lBF5BS2WFE+aJNzyjZ9E3bD?=
 =?us-ascii?Q?ttFVCs+6HAt08//V92Vp9eM1qrg7RUFvy3NQcb8hSchc/2bMZiQZWZIYMf+P?=
 =?us-ascii?Q?hgicZFXC7nZPeP9+0Gc6dOVomFE6J9AqnD1O3p1EJl7sybqWXFFH4DuPzZpt?=
 =?us-ascii?Q?SaM+xR+pk/5G2uBirX9rht+TgxynxfrWSSqxfXEffMdeioVM67NZ95EAxaid?=
 =?us-ascii?Q?9FC/xdVKyM2wfi8oMQJ/EebD8iL0KAseSC/I5BhAR6mjpSvLf0rnSlkaPGIa?=
 =?us-ascii?Q?giJlAPtV5NLfuJWNxo3W4/TfdxvmoSA0aKIgCbelsqV+0/O69ukvJPsWm9KY?=
 =?us-ascii?Q?9nsIbu5ZrzR4JahmSzsoKJh5JH1RBE485X66fm6LkhwgVmx4FHMCv9FVG3oQ?=
 =?us-ascii?Q?hLC+PpMdskLgA1rI25n9+y1RpIftMWdqHJss+tprBjhWeRK8iUNyRCxUyQmZ?=
 =?us-ascii?Q?V5UAxNxAMmSsz9GRBbCWbtIQrGyZbiKuiGLziCdVh8rGxtUprgzjCB0Lqpnt?=
 =?us-ascii?Q?Hs3NnStlse4JE64UfA8AFiAQyz8z1txPV8OOGdQ10cK6qWhsznG3cLW2xTL+?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 4HCEGGEcznPyjCobBjJPO8rGFzvJl6/DZ6fW0KK6/K5FevHTf2pDDeKTGkSk2gPlBoWP55U94VEmgz+iZQIZ9KljX9N0gaI3a/ED1x9L2GwlkOZekj1MSKIyAkkRXpfOOtXbMwQnM99FR4X39d/OQ7SAzDx/mANyoYnIVpgI/xR5hXm8XZ+GQJjW6evoUWla1FcmQxgB1rVFf4YABRbhUdxChKk4k4hpLsFqRDwlsDxUuJocmqcHkM9yMVkdFVL8HErtRslhzqP9cbSDwmwfNSjQCtitcReXvSDsoHVZyqFs9VNZSZSTPGodFAtLHVFUBzigJwvDTEWG+W6W4VcN1Hm0x5OzL0xmcAyrjdCpm0Z8uIAluckcYCNhEtG/N+Fspzqacdj7zKxNvNfVcIfUAn+dgoF+adJnzseVlYk8lYY95ssPSidrbxTj3pNtThE6BOukKdJQgYpSNqELkgdfhq9DqHJ+cFjMw1GTfuqdLc95YQuAXF5F3jrDK3OuDepGBg54oGUofGDFzWgstKoUarevANxLYajbrScgVJtXLcNDi4SazpWO1g1bW90+1jsvb8wPTc0pUb2AJXQb6SCMzql8zuwB2fNEuCwDnrE/59+66jOAawve6ypJzE6BoB9WgmgYsi5MHjEkTRNfjunNO2xDygl8CPImN94GjhIvMdnboXu8nPT6EzuAkCPtLCTtqpRj8LvP8Ny46RF0gqjeP5GFAz5FidOJveMoStMei96t9cIzbW96P7VMb0tabr2aU+OQJDTNCZ/h6hHDMKkzb0Fd49/g0HTd4whyruIfxOlOvT9u694BKdi9bgdnWpez2YP/lFCgz1UX8G60ip0y0A==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac58012-c761-4266-e34f-08db0dd16652
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:48:42.1278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HP0p+tnXCDU9sAsHtQmxrinPMDfIlYq/t7dLzHz65NFFQkzIV5NXZRJHxbAxyeq+12juDVhEPBzwf9qRCHUv3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5099
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130134
X-Proofpoint-ORIG-GUID: HRjqn8Ct2l4ql1ep-5XYlo2N0kY1bndO
X-Proofpoint-GUID: HRjqn8Ct2l4ql1ep-5XYlo2N0kY1bndO
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Saturday, 2023-02-04 at 23:29:51 -05, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

> ---
>  docs/devel/fuzzing.rst | 22 ++--------------------
>  1 file changed, 2 insertions(+), 20 deletions(-)
>
> diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
> index 715330c856..3bfcb33fc4 100644
> --- a/docs/devel/fuzzing.rst
> +++ b/docs/devel/fuzzing.rst
> @@ -19,11 +19,6 @@ responsibility to ensure that state is reset between fuzzing-runs.
>  Building the fuzzers
>  --------------------
>  
> -*NOTE*: If possible, build a 32-bit binary. When forking, the 32-bit fuzzer is
> -much faster, since the page-map has a smaller size. This is due to the fact that
> -AddressSanitizer maps ~20TB of memory, as part of its detection. This results
> -in a large page-map, and a much slower ``fork()``.
> -
>  To build the fuzzers, install a recent version of clang:
>  Configure with (substitute the clang binaries with the version you installed).
>  Here, enable-sanitizers, is optional but it allows us to reliably detect bugs
> @@ -296,10 +291,9 @@ input. It is also responsible for manually calling ``main_loop_wait`` to ensure
>  that bottom halves are executed and any cleanup required before the next input.
>  
>  Since the same process is reused for many fuzzing runs, QEMU state needs to
> -be reset at the end of each run. There are currently two implemented
> -options for resetting state:
> +be reset at the end of each run. For example, this can be done by rebooting the
> +VM, after each run.
>  
> -- Reboot the guest between runs.
>    - *Pros*: Straightforward and fast for simple fuzz targets.
>  
>    - *Cons*: Depending on the device, does not reset all device state. If the
> @@ -308,15 +302,3 @@ options for resetting state:
>      reboot.
>  
>    - *Example target*: ``i440fx-qtest-reboot-fuzz``
> -
> -- Run each test case in a separate forked process and copy the coverage
> -   information back to the parent. This is fairly similar to AFL's "deferred"
> -   fork-server mode [3]
> -
> -  - *Pros*: Relatively fast. Devices only need to be initialized once. No need to
> -    do slow reboots or vmloads.
> -
> -  - *Cons*: Not officially supported by libfuzzer. Does not work well for
> -     devices that rely on dedicated threads.
> -
> -  - *Example target*: ``virtio-net-fork-fuzz``
> -- 
> 2.39.0

