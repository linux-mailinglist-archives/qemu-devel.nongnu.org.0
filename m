Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8197C51D072
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 07:03:55 +0200 (CEST)
Received: from localhost ([::1]:42142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmq8A-0006Tq-Ky
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 01:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nmpzS-0004sk-De
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:54:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nmpzP-0004RL-T6
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:54:53 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245Nd6p3027626;
 Fri, 6 May 2022 04:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=4eBz8jXBwAKOkC6klvoyWnzOAv8yPwpTsqzeeAgeBf0=;
 b=GHiqnu0IyfskNKkEjmBl74Xm78qmtkWGwhvJTlkzztz1/pbSEZyhm2SxopPo9R7+RkPV
 CZTYX4PqOH8zd2oc9tP/tshzIYjHXcen7+VtuvjQduTBOlYbXprd3elfmRu5DBQjz8GU
 3h16Md4i5Kg1x1ThG2GFt66zmfYa4P1pkPobVD5DkOEbgqk4V3hb7lxK5QaknysK0Ipr
 C0/DNuqP+jIHdmtMbAaGV9GcwHMvloL8XtD+dzw46XKzORzEJEJVsR8X38rfQq6Z3CK4
 NwugDPtNg7ZbgATDYUYGfYhxxsrv/KY8m0wiLyOPeHaPuWWJ3xP0yXrB+PSnN3uTvGyf wQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruw2n3n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 04:54:48 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2464pP7Z039424; Fri, 6 May 2022 04:54:46 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fs1a7wn38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 04:54:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rcx3QLIA3iZtopsLpIt5igAtBkqDyHbZZcG1tBfvjkq0HcfRXc8MmcTwXHAfKT+iI3nfmEBce8c1NU/9ZkKJhefW4ryKgl/Bqg0eVrVcHppk6eYZv88PL1CYGDpEOMKSHAPEVo/OFz4lvXEyHrBiSfdBd/YVtVPGVQ8rZF9/WEAiOC3deIZoXVvMxLrGrnGSuvQCcbD2gRwnZVQYQQItdjBMSdo48ocQYFySiSItsww/MJLWQkzNECFLScjG+LMZpakn/DhoPW3CkXbP/Yf4N4y0MajEiTxhr5bSvP6fCSmxplt2TmPVtXc5arzf2+Jjp3yyH3YN9uXhcb0Ut1E9sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eBz8jXBwAKOkC6klvoyWnzOAv8yPwpTsqzeeAgeBf0=;
 b=nK2FXzfZfwcAX65ZN4XbOMGcgiCTkd/Yb3kZFlPN/yIMsnloFvtpCq3y1WGDHQQZYSkuhbIzfmpcj6KnvS2INLUpL3jqE32LLx10B5aMX+kMPf62YhXtnMpQ9RQLy+9vRwBmN3vE0fQNw9Ygz81wc6+0NEpWSmrG/Mp7I0RUMbBBhp0yNRp6xeKhol3ksByk8NBK3Q7q22Z+XLXhR8CZl3SCwaa+CyKDYyfL3PcDKnqJDhgMPKdfrmyg+XWH9UQXZp2SvUyHjcq0gbARVQbfdiGFPy7s2CscrL/MHirZ5ikBVOfTplnNWDl/ROmKoee8IDiSi4fIbS0DNQrviVtKnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eBz8jXBwAKOkC6klvoyWnzOAv8yPwpTsqzeeAgeBf0=;
 b=JPbyXWiGAe1yg6UXqB4HvKjT4bSRY73Hhm72GH8CZvmGkbxzZhYI08jJ6lfgkotjQQAq3xIqEmBezeMeJvwbEhK8WM5E7QiNEAg95glqzsDqJPk/jix+hIZie7ui7jWk86tF7gnKh28PR/VFcpn3uv5ND4Rajx0hRrXnVemLABE=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR10MB1416.namprd10.prod.outlook.com (2603:10b6:903:29::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 04:54:44 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 04:54:44 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v3 4/6] vhost-net: fix improper cleanup in vhost_net_start
Date: Thu,  5 May 2022 21:54:32 -0700
Message-Id: <1651812874-31967-5-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
References: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0140.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::25) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c40ea8a-e96f-402a-5cc3-08da2f1c89d9
X-MS-TrafficTypeDiagnostic: CY4PR10MB1416:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1416A9B90C074D687C25F36EB1C59@CY4PR10MB1416.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Ac5e9q1XxAVCzshHKxFvKk5GjhJ5t7ob1w4OkDaC0noJ5BWY+g5gxy9oy/Ar2H2qbbUyjRoeBSZM8tbFyNUnmjOq9fBq0ZSd9tKGuXTiCbz7Y7FVqTY0KWQo805jn6MqbsBwAgOWl5cnpKsv5yW9qfZC4Xhjf0c0hm/cd4TdEiKYQkGdkeo0X8AamEUzokc353XxfZ0PJ9qT9JkwqIvpNjoDrKYx0Y6miwhs5JBxJne6U8KpRqSl7Qkyx/7MjJO/3cuvH7MHeB/dh9dU0N4eXkj4uvsrL3lZbLJKzjsNeoFvr4VBccgjpufHKV0Q82K8Py9WzkGDk3abrn1PW5Mn91BGzUuPzayaeOKd6sjJItegX38Jpj1xgX7FFhz+S4RFAjQJEB2Sz04p9NvY6pkz9j17n7J9uBiWPDduOLnzlQyJGGqkOr8qPbv3yLpWuLtGo59FSnTU+MzXuvl/ZFkGWtHkLXHCHazsP0uuHp4IFaFlxYurchm4UBq0AiAbuyiaUDeEeErea94BpdTMWG7gqnINAmAiGXC0Uc2wqSn9BAdVrTkacf6P7yayo+Wer9lLMhtk5Z4f/j7PMrvb3ATTCIExlhda2+Ub1LG2NN2E27PI3DR7boeOrKnGWM3FBNsa63N7W+YmtGTcJUPCrntOAVJCMaQh+iHgp+hGqT9/tZ1yag24C4wGdzDhv+we1lbj9aC6KBQQ4ipRJjXsMmYsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(316002)(6916009)(5660300002)(8936002)(186003)(2616005)(38350700002)(38100700002)(107886003)(6486002)(52116002)(6666004)(6506007)(36756003)(66476007)(66946007)(66556008)(83380400001)(4326008)(8676002)(508600001)(86362001)(6512007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A2RPKY4b/3uw3YZihSdktCCRXUDf/YoUCDv1T3xZ4MR54+ln8icAd9QCeuq4?=
 =?us-ascii?Q?cRHxq07XvBPYIoztw1v15vuvXWa3mpbBQNivUbv+aXqo7/o94S2u8S55XHzi?=
 =?us-ascii?Q?KFHHJOytX1or+CPXgtvaCeVw86tArji8jdfepwS8YKlWA8oCkJrpVvE2GFlG?=
 =?us-ascii?Q?VjQtfMqHfUmBN5RhSFXdPbi+dTJ8JebLVJ6DT2n/jiDf7wOzQ3hHjrIkxvIf?=
 =?us-ascii?Q?oC4iJBnrj8cIZYbKOR8mNXWDMleom4JrHLMDI19PNAZ12Pw8rLLJkVqr7xWg?=
 =?us-ascii?Q?a1NO50iX5qby6/fnXiSamybr+b/xe1uBvQTEsM/fl4Knnwq1DxTcUQ6/+8TT?=
 =?us-ascii?Q?mYbKBNbBmoz7r0FQWvNCYUmMEvY/JdpdxgMrnf6CgOITj6uk7S/GK/F/bOxt?=
 =?us-ascii?Q?gwpnGgoKJnYEvtn24+qGXb8Zwe+qUYDvR4To0HUq4KWjySmHtNnp1/phpnzR?=
 =?us-ascii?Q?KrmyeJaFwVRKgKboNuzQ8js6K7lGymJzrzgzrnkrQwRrc5G5XSMo92YYZTGb?=
 =?us-ascii?Q?TKPvBX9SnE80c3TqcDyjUIysvCGvUTe/bTI4bzm58ibmTi5BAiQDso01v87m?=
 =?us-ascii?Q?WM3lhJCTiIXqTqU5xWSxgXkzxdxBRyZWM0kHjTM02gJMzqt3W6NQUzV52E4A?=
 =?us-ascii?Q?HEKvTLsexfJhrqAyLdAK/NgtTwWLToHY31r/QpR5YF3CS+c6OumdB4WfP6Zy?=
 =?us-ascii?Q?ooVagK3hhxz4EANriv1rv2ITcFapGEg1wteYzi+yAcD7TVUJQ92kGBMzGY9I?=
 =?us-ascii?Q?uQ5VJh9SXo7b+BkDo9gavBt2XkrTKQXOrPUY76zgkK5bFvTwpcM22GWl128C?=
 =?us-ascii?Q?FPgegl+Wi9kZEcN5+crpEnhDw2atUY20Is5TjQuW7FzLNG1NrXrQkT23b8NP?=
 =?us-ascii?Q?ClgmlzeuDzND3ln6TT2ANcpEUDyhKEVn4mM4nGbsclvmAyLZ7Kqfl9MGe/uS?=
 =?us-ascii?Q?OiMS6i/7OVhuDzVLuwhdgKdBuUO7eZALWYpabmvTZ1hH1CBOeRVgxYIz3/Sk?=
 =?us-ascii?Q?UhIg00FOKgFZFx5Czc5DCqfYdxCAII67eRn+bkxSo/Waix9y5CBqaXlPkZzG?=
 =?us-ascii?Q?1ezUEgFRzD+QnArCaV6mZJS5tDaDmKYA/7ALsV519LS68+u18lHKl6iqlXVy?=
 =?us-ascii?Q?ebG3Xgoyi/HXAqchcFFHgCtIFCXEJHcf7tkyh7Q8YQB3YeCTPtK4DCxFXksQ?=
 =?us-ascii?Q?BZEx17WwPPzxMo8ypnoj2vzN04ixSulHobzIxPod1Ywm7XTdBdjxq37UjgRz?=
 =?us-ascii?Q?0fBwHrNiHzTpZEC39rtXj0ZfKpCKw7qYIw0YzdGwbkSqulvfsoFxOlX8gRYu?=
 =?us-ascii?Q?4PoSkvUU4HU1cKoRyMwYm+yo4Ie+BGxo8VvP86Ile4YYaM4SuP9XFDyv/Byl?=
 =?us-ascii?Q?GLoh2+t4Hx5uuffWw1+E/AgWmhEB6RMarCKZD+0n0cZwCK04kcKbvgGuEsVK?=
 =?us-ascii?Q?fQD8GutUDufN0R/Zsj1Ye83y/csdWw7c+mDEhMag8ly7z//mD1jDvXlFrn+C?=
 =?us-ascii?Q?kGbycAJ2jJ3Q1EQy7GvGz1wEk7A2vqOiaKs5N/rK9t1MRWwIAuffrzbmUl0W?=
 =?us-ascii?Q?AxBLt8CMbSTKDECZBoPezzO6MHEOhtxhPBGxoZ6sbMWF8bbOHWaOMOc+nljZ?=
 =?us-ascii?Q?TM/tPGK9d76yNU8oEDNjDJCbYblRSVGzYPPz0DAmvt0K1/ij5VoYxrxyKDaR?=
 =?us-ascii?Q?3R++l/UFfjuDFFoSYmkXXWAua/aCK4C2iJ9fpEEHLD983xB242waqRUnTa7Z?=
 =?us-ascii?Q?ippyv7Nhys/Lh6BY+dZwnfmK3VqQo2w=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c40ea8a-e96f-402a-5cc3-08da2f1c89d9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 04:54:44.7784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3nU+7sUsenOTdrYIbjzCUcmnhoalE1yqDQF2EvOEqdGOdf/aTyeVSRaliS7NB/N5drrPNj9EqE1vsQMtCld4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1416
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_01:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=936 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205060023
X-Proofpoint-GUID: VLs5i74F_nQ0nDaf0AOfMNI_pzCcbUrX
X-Proofpoint-ORIG-GUID: VLs5i74F_nQ0nDaf0AOfMNI_pzCcbUrX
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

vhost_net_start() missed a corresponding stop_one() upon error from
vhost_set_vring_enable(). While at it, make the error handling for
err_start more robust. No real issue was found due to this though.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/vhost_net.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 30379d2..d6d7c51 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -381,6 +381,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
             r = vhost_set_vring_enable(peer, peer->vring_enable);
 
             if (r < 0) {
+                vhost_net_stop_one(get_vhost_net(peer), dev);
                 goto err_start;
             }
         }
@@ -390,7 +391,8 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
 
 err_start:
     while (--i >= 0) {
-        peer = qemu_get_peer(ncs , i);
+        peer = qemu_get_peer(ncs, i < data_queue_pairs ?
+                                  i : n->max_queue_pairs);
         vhost_net_stop_one(get_vhost_net(peer), dev);
     }
     e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
-- 
1.8.3.1


