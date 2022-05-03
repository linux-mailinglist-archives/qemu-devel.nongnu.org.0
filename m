Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E441E5186A4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:27:35 +0200 (CEST)
Received: from localhost ([::1]:33936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltV0-0004zN-Tv
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltL9-0007is-Ua
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:23 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:19974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltL8-0001NW-4O
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:23 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243B5TcT030007;
 Tue, 3 May 2022 14:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=PEYd92Oj4S4zXZHW4xEXu9y46a7Vp5wnXLld9qaD9Ys=;
 b=APxzVfYTCw36/FZNBDN9epQxaxw17a9aTs3XSZ5mRHtM68S0gC4wb4TOnS3oRS+xfosz
 R6CR1vP0fykpCfUNy7GnQUCRbVZtkAvKF/eKOjxdymerpc7ED2yfcPiNJPqj579JfxPh
 PkhzqhfLIGV7d7pe+X0c3p0i1/ZdyU0JVk8rI2BeaV3cZ5m2RzkOe0lvCri6NBDr5DBU
 F113PsxVoWDzMrpFrKo0LzN9C7hU87wX0VcaOTigRd09RNv1NVrZl6x28SbU4ZAvuhLA
 65Oy00TsL1/0aYuJqepnx1vJud+XQayqxySTXSubGIiChKbO+Kir8vU/KO+g6e2RLq7s oQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0dtnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:17 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EFIao031973; Tue, 3 May 2022 14:17:16 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fs1a4r3ny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5Ycxv6SbRqTZjhog+fTVG+M36L5ql83pirLtCx/6hSfveSsqzopLQ+6NzQY2lJRe5abtYiOznB2UO3fu7kSt0c0Sdwm/OYQ+r2xEo4Qt5V39VabVxiD3pYJHQGhgUNK9HnrHnKImlGYfkGFFdxjQHlr2WRPBW/cZLlSb+LXWM5EjQNi1hPLtrEidVuVyQhksbH6F5o31UI81PADhhwILJmxkpwlN9uDNRyddOHoMnADmclHqz5NyC3wsQkGPvXDSuBfTZa7xT6qdkWNdX6nit+oV8Z1PF39AYh1Bw3UQ/rP8fEe0o/w0S6Cm0mfUjPfqsPoluxZGwUrU9iUDGrJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEYd92Oj4S4zXZHW4xEXu9y46a7Vp5wnXLld9qaD9Ys=;
 b=FxlV8laQEg/Dqzh1OpYCZgP1RUpiUnSBb/9bc8XnpuazYx9UuQEO7G2rsvYIJEWoV237CY56xm5pEPCAE/KB9PzxAEl9SFPePHndyNjE3HNYw+xOzU+Kp4Bl4f0BxnrPoiZJ09vpRG9QkiBTRjibaTrzeYUJzCDzrI+ZuXakB7PPAPwcqAHeIQCNaEWZX1Giut9RXNxMDRWGRqo0IOoxRrhqNRsi+UsrAkTUQXMQEASR18kkFVwAdlMnotKiPN7qfbPFvwI8tz3z3bbFiDyUPIBtzhEqR89snFr+YbBW0qCv9oq8f7isSrqKEgEC0Rx+ixgKzFI2uU3oPJimLsj+hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEYd92Oj4S4zXZHW4xEXu9y46a7Vp5wnXLld9qaD9Ys=;
 b=x7lXYNk/Crfbz4ycoMv9FgRDkAl0E72xmttkxmpuYFHAyvZzJ+vKKPTNVuju83XkBt2faM+W8QXaiPhvfw3xGi/VW3eFPsPzaA8b/yrEq4bp4AREyf9B+7jBSZMh4LHcHR1t5eVW218evgksTcZE9JGTl2oZvuUXUC740bv3fj8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3358.namprd10.prod.outlook.com (2603:10b6:208:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:14 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:14 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 04/17] remote/machine: add vfio-user property
Date: Tue,  3 May 2022 10:16:45 -0400
Message-Id: <e390bdf1305aa6294b782423980a36aa4909427e.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06168dca-4e90-4530-2e25-08da2d0f9eda
X-MS-TrafficTypeDiagnostic: MN2PR10MB3358:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB33586CD39543F979D9D552FA90C09@MN2PR10MB3358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XjZQRYK2FealI8GOSDVN0UEwgQe8S3gdLRGVnS+JcbFL1Ev0HUC2FSIpgXCoIaESvhzbuJHhicBS8ZVI5ea+EZsdxYXD7ftXwCrq3ITKdBQe8LRAOn9aiDl24/dxPmOjS7N9Mu6U6aOwPFeM4fgeLHUBiswH2D2Gadxn5GL6tknzYVowcVSmnpZNfX5OJZA7s4xpwE7tTXkGqpB/dy0EZ45KsVHI9OpxloX0KvUOh1Oa68AQBWVAC2wU9zPuylAbWUwOV/ktFsfTIH6dwmKCEV7DT/g4PZwd1v7+6qomrbH+CaUr9On82CUaws4XH+kvxCWxfSLjIJUmACe7SstN83k5lxa8O7MqD7ZkgFxGBbOFqW3o6MijD+6TQtErHVksVYD9J+Pwac2NqcdlghS8MuvKW24S2+kiP/qllLFwCPhGuYXLl4VPRNFvbQnqpx4/y6O9mShJ23FE7WipglJN/wJzBNVubJpow4KTOhm/zN1oT8gQamtS0g5xWq5fzsPuFwYZ405PRtQSJ+Uk71NFqAxRGNBNAlin5diEvaKVPITrOK2QGR8c4RKVs98yzMy6abeKSHhAvvIUPlJqLsQvmkXpP1+11ObkwqnGeXGR65f9qVTd3mK7QZSA0goYfqrayK9+bLkpVtK3AEoKsCCujWNXrqnFykp6s67KbuUAlfoGKxYn5cgrg5bLFiMo3lYnkIsK+TCQHq2yW5rqznrSPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(66946007)(2616005)(6506007)(186003)(107886003)(2906002)(6486002)(6916009)(316002)(38350700002)(38100700002)(7416002)(5660300002)(8936002)(6512007)(86362001)(4326008)(6666004)(52116002)(66476007)(508600001)(8676002)(26005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lM3HvzLSRVpw2LXRYCZ8c1xfnodLJwk9cL3U+seegmgzuOqgAGgRhdSkDE++?=
 =?us-ascii?Q?+bApjvT1Spw0MWeqPyZ3Sp+iw5Y/WoK3yd6cMH299qp9NieB/tV3Zs3nMzQv?=
 =?us-ascii?Q?1neMiy74TBM1ePVBJb6pseIFQ30JfDIEo2d3u8WqqomAXJBbAn9KPuwV873I?=
 =?us-ascii?Q?FQuP7DlRhe0dP18RwIx6T+CBvWbbdml4EusWh74S5FgRj2ZhMCWC/ohr564N?=
 =?us-ascii?Q?cgJ7aSY2S4GX+GBYEwxusQJXBtzU6/hYonSMVeCzNrnBDrb8cwoecTUTfOGT?=
 =?us-ascii?Q?acnNrz1u83+LsSOdyLH64TJH4X16G2o6LIE0aGfoyFfUNn/+apilkXqPHeBE?=
 =?us-ascii?Q?bD7sjeWHH3u48daYKmzyWfWGTNetO26bQ79vNvE9K3zw6ef4onCFTu4yLd3n?=
 =?us-ascii?Q?A/5uM53T8ocX9hmSvvr4U8bxDn9f9N5y5aii2ER5Cg8aV/y8gMCFetOT2k7/?=
 =?us-ascii?Q?FFlvqjUVL+5DYH4h0fsiDm05YExWaLaZgUTNImG6wTLrEwLdMvTPvfPCOJ9h?=
 =?us-ascii?Q?NaO3LoqC+UpCpwehBKv3TuszoBF/6lAUaqX/haMg/w7Xe/uZOgnujADeXMJJ?=
 =?us-ascii?Q?2ke5mVZggsQtRuEtJo1oTnaHTorqr81lii/jftMqBbwcxczgCpdmjoZgWcB1?=
 =?us-ascii?Q?b1/XfraxwgPsM4fQzQXPPyQg42jKJRtQdGLJQYGN9LsrVRGVAWobgBV2zsfn?=
 =?us-ascii?Q?+IAhohfPVTmCcAPA+tL7H702jFGaiabVwyNCvnKMTwsodRACekaGhuBFgRZk?=
 =?us-ascii?Q?jNpvW8k8zW74rXAoJuBTBtQ4uLCtSYXNDapUrYVpYj5f979BXY+53Tbn43o5?=
 =?us-ascii?Q?YQ3CTwJpct5ZFDQD10jIavHeohvisFfa71YuBqgRYtzIxb20pgT0V8abC0vW?=
 =?us-ascii?Q?XH/aGGubLuDuK7dShbICvgAWx2x3GzG2OwdwblEJPPK56hMCJf/d6bVPZ8zr?=
 =?us-ascii?Q?3zjjLY+4Vi+4Wayy3WnXb2EdbIZvCy0/MX3ATj/5aCfzcZHaUyk+hmpLFqAL?=
 =?us-ascii?Q?Et8/PoC5RBATTC2QRGs0wnzT5aBHsgqT7QzQWUG9bjKzB3PS0cjAG5ntQoM0?=
 =?us-ascii?Q?UNwYamhTqq5WxLt5A7pV/0QVcbEJ1LQmwV1UjN9C6uOk9Je6QkS4bDBaLzHn?=
 =?us-ascii?Q?1YqLkWy9Y23ki0iA+prR1ToDvnG5F4FtgKlJywmmX8BybxSDJkaYoIvDdhls?=
 =?us-ascii?Q?lvwqwYp1EO7jbU4+a9H5E8d449fqHWcED4aS4F5yFQGG9Nq+5gVF9tDcHZ4h?=
 =?us-ascii?Q?1HGsmEw+vy05c6RjBCFfhOPrYhqvZ5V0f4a96Lshiz5+vMI5zyTUbzaegnkE?=
 =?us-ascii?Q?94H/P2KylTkVEeNuGiHJQit7UaTb2vaf/HecZPBkuQ5skCVLDSPaGD8bw9x3?=
 =?us-ascii?Q?Z5HQp2uWniDdy69Il0dCVFQ89kJ8fVIYd4BkAOekZ4r7fPmgopdAuqaCpNYD?=
 =?us-ascii?Q?azQyLrI6tWuadOeswRKQpodvm+HdONTnulO4gpriDyRTqHev4M8yvPK+P4XF?=
 =?us-ascii?Q?nUKPZOAjsGri76ygxPLCE9PuoAAocrOMskUhD5Bns2Q2Cfz2l5euMogyAflf?=
 =?us-ascii?Q?W22sUS1exYnaJGkU8HqX6kvd5qZ95z+zmQQHIREitMwI1gQ8UACHv+1zRPIg?=
 =?us-ascii?Q?TM5oskHxZh/LytqSOPK05Onr6AuWzhuCNoqJzox20mKhasLlRKXMKlKmiEb4?=
 =?us-ascii?Q?Vsq/a2we/EH2e8AhOoJZRzg5bwxJmP+CinC4DtArYzh3xVWl66BWcKao1NQx?=
 =?us-ascii?Q?R7mpjuURJQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06168dca-4e90-4530-2e25-08da2d0f9eda
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:14.1079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whht5obX78ZoJtuWIWxP/ceqI7gNTNjGKLQqllSovYWxhgjpzLEaUTnrRzcVFUtgay9Cbl6OyWtMxYmaojTMRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205030103
X-Proofpoint-ORIG-GUID: DhSDRVyzl3VB56RqDA_Ac2WtXYx_vwbA
X-Proofpoint-GUID: DhSDRVyzl3VB56RqDA_Ac2WtXYx_vwbA
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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

Add vfio-user to x-remote machine. It is a boolean, which indicates if
the machine supports vfio-user protocol. The machine configures the bus
differently vfio-user and multiprocess protocols, so this property
informs it on how to configure the bus.

This property should be short lived. Once vfio-user fully replaces
multiprocess, this property could be removed.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/machine.h |  2 ++
 hw/remote/machine.c         | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index 2a2a33c4b2..8d0fa98d33 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -22,6 +22,8 @@ struct RemoteMachineState {
 
     RemotePCIHost *host;
     RemoteIOHubState iohub;
+
+    bool vfio_user;
 };
 
 /* Used to pass to co-routine device and ioc. */
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index a97e53e250..9f3cdc55c3 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -58,6 +58,25 @@ static void remote_machine_init(MachineState *machine)
     qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
 
+static bool remote_machine_get_vfio_user(Object *obj, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    return s->vfio_user;
+}
+
+static void remote_machine_set_vfio_user(Object *obj, bool value, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    if (phase_check(PHASE_MACHINE_CREATED)) {
+        error_setg(errp, "Error enabling vfio-user - machine already created");
+        return;
+    }
+
+    s->vfio_user = value;
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -67,6 +86,10 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "Experimental remote machine";
 
     hc->unplug = qdev_simple_device_unplug_cb;
+
+    object_class_property_add_bool(oc, "vfio-user",
+                                   remote_machine_get_vfio_user,
+                                   remote_machine_set_vfio_user);
 }
 
 static const TypeInfo remote_machine = {
-- 
2.20.1


