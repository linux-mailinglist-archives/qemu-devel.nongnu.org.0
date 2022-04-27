Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414385113BE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 10:48:02 +0200 (CEST)
Received: from localhost ([::1]:51252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdL7-0000QE-Av
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 04:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njd4V-0005HZ-UM
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:30:52 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:54546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njd4Q-0005vi-UY
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:30:48 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R5rGTQ018608;
 Wed, 27 Apr 2022 08:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=UH8ONQDqwjqYQ4lGiy+B4eQ6Ks2NSI+/jFWft0KaAxI=;
 b=Kgr0YtxpIFHgUv+t60J9e3AJn4tl9r68KrD8t7x84ZJffa221mh2jGJTwlPFKlUYHP70
 tLdIcqnDRsH7MEgOyoPLflqRNAd+15ntuJ+FUk2wIY+unuQdC0c77rzPdl3Q+xw+WyyY
 TLTQVoGtokRKhTYkpnt2yqcu4APmpTDNmTBFyod6OwHE/tsCDVEDPzFI56Hh5KUIzPZq
 rzLL/WfCkFU7uTGWlmL1SPYQ3s6fyBACipXUFMl44suSM3C1r/0G+eEhRk9fPzCJ9ZvX
 90xKJ82PHiQ+7Uoh/EeBF3n7Drz6aHftRh8W4T8yZ+blSmRetCaFezIixX6aP8Fq6OCg BQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb5k0b10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:30:43 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23R8UfWD030459; Wed, 27 Apr 2022 08:30:43 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5ykf12n-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5MJs5orxz4UU0Wx/zS9XbfIJOmKZYU4xjx1tb+QKXC2h61AyGPDYNTTvJn0DpPebiczIrEwb1FptLLBQAjqEDtjKFFttEv/j9dh2sGpzBFpxhmq/buaIKrDHH8T0OSD7YWhO5kODGHj4+lbPK8UPuTDpJGQEILUgLcaFxsRjEFB8UaxVXAIzggiMHz0R5PvhOczRf6bSkYN8zSM+C71bJ/fiIXi4ocPgWPrX+08Uo6NuerePE4ED/qmvHMzQC56qaziKCCuqGi//puepJndGfhpV16A/7809WUJhsVOpeWnMVRkgqcJztm467W7jYGtvNksfaQqC1fSXnzf/PdzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH8ONQDqwjqYQ4lGiy+B4eQ6Ks2NSI+/jFWft0KaAxI=;
 b=kuOsLLxRxGER7RI7CqQvM3Jflok8VZU+TDFaaoOXC7wUFetgMAJx+IvaofC8xUUBdMq7iS81iG9ASsjoMAefICd6JXoQmr1pmR62YBFH/9T8/dtU13e+Is3tev8QItFnAHB6B/tmDcvfA77LOclTUKeQ20cMXPQsC7CsqDpkJsU28rgtwa/XwOJFlTt/Mfh+8uqhh83ZNNUVOQfHS38/SZVTMDWvr24hvaKVGYbOfC044QexKtW8pVC602PWNkC2Yd2WVyKWE/L7xdeGlH+hqP3p3u462c9bLXWwt2Bk7fUM7t9aL6aPU3WxHyeQDVaUHIHO+hMDi22SMDpF5vKIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UH8ONQDqwjqYQ4lGiy+B4eQ6Ks2NSI+/jFWft0KaAxI=;
 b=uvZi2VKYSv03sC2Dwhj/DXTs5TUYYLq9+KiWkQ14XzcrTNZnioV4t47c60BcRD3av5NSGv1tORMQovt9IW0vnlGoMAiRR3EG66Tb8QRUkRMglCDP+FPZ/CgBjDB3NgRXgzThcBfp/s0ktILh3xtdiWPA/UU6Ci1EroBpAV4ZOTU=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR10MB2007.namprd10.prod.outlook.com (2603:10b6:903:123::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 08:30:36 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 08:30:36 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
Date: Wed, 27 Apr 2022 01:30:14 -0700
Message-Id: <1651048216-3365-4-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
References: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eeaf614c-b918-4d48-7da8-08da282833ee
X-MS-TrafficTypeDiagnostic: CY4PR10MB2007:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB200786B41BE414276FC35B66B1FA9@CY4PR10MB2007.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xqmmwTNCV1ugtSfMhYWtKnvKtASg0iJ2riswU5A/ET03+nrBJW/6xBTcGkdg9qGUUmxkTDm+/XAcbwmdWDQnzOZsl3eAfHm0aKsFbo46mtrjevdbJtcD9oPHi+dZlD7nDYS9scOQ218wC1MwmWA08/LjZWu1Za0Mr5IwEwzKLg93aoBwWSua3lOl2fJ71k3Qhx1cETvLIn772eUXgyfezKGQ/DhiqRCKNP3M0oPQwl7+Orn4F5bpW9sSgtt8svWlZEAUBo0LG/23g0cFToJVORvoWp5I8+tj8mA7Me4H/1zEQpMK/LnzotpBsflzL+jOx6B/HdTyy1ZfV/HBnRD9hWFJF2EuSH9GzRdSwU/QtnnpBe2sZU0wkduBv6xqfHTpZ9n07wx07E4ynOW3+gAWEcgZR6z3WxMPeA84Js1KtSBEMn0WKEPPn79Daxfj76griQKynlF5kW59S3uQGXgKscYvN2Q/M96mTVE/8AM3BwdKnz7wTvZuQ6iwxp7CRs6RedsPU4BNoOWwaWMpUWdxN5K98s26lVBD4xNoZGLiTeOTn2Z2wJ3Z/3hNVWXe5VqPaeFyXcFT0Pi6TDMo92gta9UQd37u+QLOxzMp5zXaaYYTewQpMfuIkcSR9AFkyc1OYiezEenXZh39TNnHTo/zTDtB3vP6DYDdYpQWigek5c5u8Wu7d20q8Zkbp26nK7cqKA9sRYPYnoi1JfMzyjAD8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38350700002)(36756003)(2906002)(316002)(508600001)(38100700002)(107886003)(4326008)(6666004)(6506007)(6512007)(52116002)(6486002)(83380400001)(8676002)(186003)(66476007)(66946007)(66556008)(6916009)(86362001)(5660300002)(4744005)(8936002)(26005)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2e3kktCfI5bwC3PLSgZDqd1CXr7f25nV5SypX1voADYrBuX2JlkG1zdgCpLI?=
 =?us-ascii?Q?Mh4SJNcKzc9dLDT7ux9MUgZFoumJxsghxLaK1HDgt9s2/o908ZjKl/hCkn1f?=
 =?us-ascii?Q?iiqzElFbZcsysg+dIMsDLkrkQUDcKKNAnQjmnBuL4woEDfLOd0eJo63WjO67?=
 =?us-ascii?Q?+8sV4DS+eeE4IJMgu29lrv1NH9+PIwVo87+KVkB6hDLAfhvgQYXLXQh0kD2G?=
 =?us-ascii?Q?apadnv/n5kfY4No/HOVnjFefOyVDyJkMnrjUQxuF3z/mFeuTPxRxZzfYFIAR?=
 =?us-ascii?Q?cfJ/ctOL5aPqDvyPETqowfkgeaZ3nNELWQIJa7SkfrPMStYTUeNPYRy8laW+?=
 =?us-ascii?Q?ADVT1L1PEu82dzCOTnNjGZGeBcwgz0JqDunnwUlL6Fo4f2t7TmvWoRBnRpV+?=
 =?us-ascii?Q?XI1CjidRCxT/fGtCe7fdi4+kOshvVv2x1OqLlVgF+Mwd8THnw5ayjsbl5RmO?=
 =?us-ascii?Q?qRGjQT4RWz2yUyYEtLHC669Ea3qc01I1HlRWuWKgiYM38CwIewEdhhM47Kj2?=
 =?us-ascii?Q?YVg8w9DqAzGcQL4MbYDpfqYMjcMnFfEzjpwr2nWqkvVx6FUoZGo9vOxGf/4i?=
 =?us-ascii?Q?DMP36OAWPyYq+rE3weNlnxfJ62mmGeU3dklYXA+m0MIrwmUDtMF2ox+55u06?=
 =?us-ascii?Q?WlIfQxpcRnQxp8K5kSCWGh73dfLQojgjDbTCM1HlsDYxTAqi5od2FnvVx2RV?=
 =?us-ascii?Q?80jAvHbkale4m2lSXzfWVf1HTt92FD1WRZMviuctS52bsVDeWCNtdGw4JD0H?=
 =?us-ascii?Q?L4S4aXoUHrEx1U4Zm1X3PtAteDMVuk5l7D2i923iM80CWukETlL1Efn9jZce?=
 =?us-ascii?Q?PHhS3uToVZ6U7BoMV2ns3Nk4MskItHTRkm/+jlSD7lQH+olwHzXIK3WWJWC+?=
 =?us-ascii?Q?OhFy4AqjLrBvpeuR7rubc7CikBc0tNeQKeN3jwiXQ6v2FhjYAFl+qGwSl4nD?=
 =?us-ascii?Q?HeJqCB+1mUYx7qqM3+bCRnZn5Kkdmjd3sUfOP2+MFfmqzvB6eWEFoF0cLG7l?=
 =?us-ascii?Q?sr7UruqnETutYRJiOdqUMVbEE2/Yu1BZeiMrFahP1ZbD7FVT2SflgD+1C/yE?=
 =?us-ascii?Q?UCYHf46N3J+PeWlrouaCW/CybugKSYwv8IeCatCCMn0fryR8Up3QyJQfSnqn?=
 =?us-ascii?Q?P9mHSajMrRBEt39l0X+iqTcZ2s25xdNaOLzGTRFIyRpCW9rMSG5fmNt+KcWI?=
 =?us-ascii?Q?9o604Wjt3B4KCXcq7C11kEPnDz8MWf+MzuFw5gltoTfUrJYHW31nruAXd3ug?=
 =?us-ascii?Q?ZOdYcl+mHDXOKmw6EPwzaNdkbD1f7Qjz4kJjebsDSGdjY+hVKxtubLSOEXO8?=
 =?us-ascii?Q?LQUt+9csR1Q2T5M8qvRjFFis1Q8oXSnKwp5diid9CkpS2mHGnb32jxLAKdsm?=
 =?us-ascii?Q?cmmQrKJ1PKDGcHfFG5m4AKG3Gug3XzcriS6Rsce6QPbqvawj7xsuMsmlJhog?=
 =?us-ascii?Q?+l6J3Iw0pnE85eCcpN/InWG9ZYup7UXiN0UP7HsLm1F8FntadxQfZHeaZnSI?=
 =?us-ascii?Q?i+Jm830JOs7r0ZSDrgVAs9V+t16uO9OskZ4yYc1fGSNfiYzoL6vfXn1mmhEE?=
 =?us-ascii?Q?sXCpWraqyu9Uu+8OUos7nZHsnofLTHNhh+jB7F53cFNn6wjaRKVcGa7lZE4m?=
 =?us-ascii?Q?tZi8j51Gex9ZBtR1V8fLJJh9bz4dJ4v+4GMxE4t9TEuvUVrWbN/Fq6g4AaaJ?=
 =?us-ascii?Q?BRzvceGZxBpi6rmQCKBZs6W2DvTvfzsGu1jcoh/0gpKKiBrf0dg/qSJBW2DF?=
 =?us-ascii?Q?nrXZ3jOX8TeIxiSDT/riOb/NfGAz9pk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeaf614c-b918-4d48-7da8-08da282833ee
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:30:36.3604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xduYlCNNMWubWNSGkqNAKGFuZyNWCT+8CAwOi/HQgsUUcNGRAdguZ5ZwwC3IPlNmQUtn3pTZGN2B9Gkwqs31pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB2007
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-27_02:2022-04-26,
 2022-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204270056
X-Proofpoint-GUID: A2kMDwNtrwkUxdQrCWjObNPnI6mo1dsH
X-Proofpoint-ORIG-GUID: A2kMDwNtrwkUxdQrCWjObNPnI6mo1dsH
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
Cc: mst@redhat.com, jasowang@redhat.com, eperezma@redhat.com, eli@mellanox.com,
 si-wei.liu@oracle.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

... such that no memory leaks on dangling net clients in case of
error.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 1e9fe47..df1e69e 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -306,7 +306,9 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
 err:
     if (i) {
-        qemu_del_net_client(ncs[0]);
+        for (i--; i >= 0; i--) {
+            qemu_del_net_client(ncs[i]);
+        }
     }
     qemu_close(vdpa_device_fd);
 
-- 
1.8.3.1


