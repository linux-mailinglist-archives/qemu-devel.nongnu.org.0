Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518654E7A65
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:24:10 +0100 (CET)
Received: from localhost ([::1]:57784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpXd-0006A8-Dm
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:24:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTn-0007MQ-Gz
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:11 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:58812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTl-000349-GW
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:11 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHJa1G031491; 
 Fri, 25 Mar 2022 19:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=knAUhec0MZfs+BQEeOok0aa3RG+yTNRzFlP3XMvR1zE=;
 b=s1ETEdCV7yMlxrXQHMlqEEnEy1V0S3jYYTKDVB1CZLcgVUbRAi6oKISh6x8bwNmjTgKA
 N3synRlkqH72OHFjXTtBO0GvXyj7lRqtMrzzOwlfs18nNglH8juDCVnHFj1lr2CTzDMO
 CEUNGEchtyXXyzir90wwXI2NTwDlYGmsPeb/5BB2SqtcfcxbIXUWL22n9Sj/AIrRYDTg
 HVMjHTpJY2QMwc/t2ZWZ4F1RaR0BPBCiGCN4NrPH/jP6dpgFrh/jQpsCWz9ocDgN/8I/
 uid3i0rljgKAXqD4XkruwKH/NKKWAImZBf7dNd83P6FAecE2zYvSlck9ZzCz70JgOEyn lw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew7qtgb21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJHNPG125579;
 Fri, 25 Mar 2022 19:20:03 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2046.outbound.protection.outlook.com [104.47.56.46])
 by userp3020.oracle.com with ESMTP id 3exawjj7xy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqrGcfzCEF4lj+EZkHi5HJl4YzZhF0zjxPJCeIAUrLQ8ftaWPv2Avn2IW1jh6TI/R9vxY6bKKPPLmWUcujDwwq/DQhyUn682IedWJhwtBW3abbSKWhZ514zv508y2mQinL/UF8PLRXJ5Wn96qA0w8c1QJF3P+3apNOi+9AE0sjB8H7pvR4nBTiZH4xmhV9WmrtPDRUMffxuagLnsyxAwFuWTbLCKPfDCpN0iS1uNEb+xKxvXOoyRiBJ8JGeM2jMzTlHeFJ/9ApHmMxfqv/yX1TMb+3tloaO5XXUvftlbxsEMzUGMSZjadSjK4rB7ZKoj+0RcgK9oI8rlWYmBU4Nwqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knAUhec0MZfs+BQEeOok0aa3RG+yTNRzFlP3XMvR1zE=;
 b=UvCEQbchQa9Bt3RNAcj6tw28a94inqrFPn9DguV9bJ64OEzhJ6PofrB16R6Vz2fpdgPQKOglHVtrEU2uO5seRgksfE9ZVM1aRjCVSHRWcdDSoSeiCtoTdv3a5+gwBBh2g7PcRsYm6T0MAXfNZ9wjd3ZfEhGQ9nBcv1VUxtwU3j9TM7mKVOd0DKVM3l19TUHIG29xqrQXfpiNjpXQZEM2UfpYvLcwUvZMHGmXyRG1a6xP5sCwV8vhgU1WWIBEG2wxmLnXimFhSObkcCY5ahV+ad5Epqvc0WQ1HRDvt2LySAOaW+1A54LWUwgOfKuztJdg8H1lzi7A18zKvPW3cGcQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knAUhec0MZfs+BQEeOok0aa3RG+yTNRzFlP3XMvR1zE=;
 b=ATTTDPmx7fDbon2wkiv2422EaudIl+FVnlLQ2UQxSO1UBMsTvrX/oBfSWHzlHdPR2GdSAljS0PbeAoLdTFbPQlRh8bG4OCAsgVpq3CG1bf4G/DLr9n7TDankMvUtFxZK8rnco8DIKrp2Wy3V2GRe5Jzszmi0l7h8olvaG63LhuE=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:20:01 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:20:01 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/17] remote/machine: add vfio-user property
Date: Fri, 25 Mar 2022 15:19:33 -0400
Message-Id: <086b693fe9c44cfbe06a1c4eedf08f17ae72762d.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99ac563a-09ab-4342-0204-08da0e94757a
X-MS-TrafficTypeDiagnostic: BN0PR10MB5206:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB520655DBA2A5DAE1A5810ED7901A9@BN0PR10MB5206.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ecXD3WZHvlVyV1UowqGsy6GHdvMltBQV9izwD51bKANL1O9+xpczqHPtiFpjHsWWPjKjXENNz53rKgc69qg8MGA/zRfmHbEBtQqKPmA1GAlspVUfDwpAdgJw6Rw/nB3whsIBbo1i3hwMPrVoaRYTCxgsH7St56FzKc0+J4px4471z2B4fsawzy+sc989MjMx99rskTn0Q8C9UiONCHLhV1iA15Y8VDMvRdR6H7lw3zKmXVz5tE+GGgkihibs9XNJZxavDSjEVHY7KV9oORjZ0+KzK/sGCYTRrrMg0pPtdSKvHThdm7QbVj71lJXLHsHV4EzQh6Do9zvAdxapIZJ/1x+2MSHlIFVtRwf8iBG1XhxNwOMP2iKUOag7woAFl896EWWG67p3bQmmBa4ooA4uMlBP++Y7D78hlCPJDodRsM082Ct3O4qsRPvw362/sKkA8Y1GWYL6uQf/Cyei7uRpFOFN1FwUK/sUSLpaeV/fMhsj5gqcz1d7Wemc9SpcpKgqlNWVZGI2D99FfVznsEXwsfSS0hd0833Rp8RE7fHORa/y8qQwkm8yRU7gLKwIeW5bCoKT7rebWgsNdhILocMH+SG2/+MUyczktp80/UOsFT+fknZSF3Eo6ZZ0H+SeB+eAC9hI5icUwJkwjYMnJsLvzW4dUUy6QsbUr3BOpGp6FkPNK876fnhHOz8+e74ahkNcxr9ALSSCgx55X8h1pl5kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(316002)(2616005)(26005)(6486002)(36756003)(6666004)(6512007)(6506007)(52116002)(66946007)(2906002)(86362001)(508600001)(38100700002)(38350700002)(6916009)(66476007)(8936002)(7416002)(5660300002)(66556008)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nh7saTJQbgDnZAVQ+pQzAWG137EJo4hfH8/2T0zdJLnKjMZSC9oxRmBA6KnP?=
 =?us-ascii?Q?/o3ZN6MjYuq30GYhnXSRh+S/S9O5kqNBx5co1zVo+XcybdbE6NwGXIhEBO4k?=
 =?us-ascii?Q?XPF6v2VZIkMtqg/HHyX8VrjKBjIB9HWcKpnOHXxI3mCOMMO2gu8eZPWkSR/D?=
 =?us-ascii?Q?vPUDmhDeunF67f0AHzgXCT38lFCtPjSNQ8DIdfQ/HZ1pibX2fEDysalxl2m1?=
 =?us-ascii?Q?oayVLZWfzmqVM9fzAol/W7AS6wDXTczVkimM8SO/y/i22Oi2EV2ulkxUX+um?=
 =?us-ascii?Q?UUVeAbEvlSz/J4bzC2TXQIjJuJmUu01tQhG2jY+rDPSrmenKTn6BeokRVspt?=
 =?us-ascii?Q?pp4MINqYkNOtjb1jxwweJ+9LYGXt8rWEmurrOsnhC1b1OpLj8luIgPItxTCk?=
 =?us-ascii?Q?nq3vC1e1BxYOAW0qzb96zJULzz9aZJXqhE2Z2u3M8cjPODYVrtWyUOplkDFF?=
 =?us-ascii?Q?/kZicPRCz9ErYXIeC5xUNnhamB9xdW75KwuB6irwHT0WfOqyHI6NXBDhtDF1?=
 =?us-ascii?Q?UlBoL0dBdJAbkXJF/NE/XC2V8J3D0nL0BrsmDLxiVnpM1BN4zoYCr8mg6viH?=
 =?us-ascii?Q?y2HkMuSN1T0iH1JW9Injo8zYA39OnMVx4T7s8knbzcRB2qIstukiJPDh/M+R?=
 =?us-ascii?Q?kW40BF2KECN6+CDUz43J6p0hF0tdq0GFXkNhwPtR+t6rauHxhqwZ8nmtafn7?=
 =?us-ascii?Q?IexZ0hd2LHpdE/Xxx2GRiOcqDWM95F6+JfJlsZ3NSJwR3xXinzBBF0WIN1FG?=
 =?us-ascii?Q?2miZaUcGzhMeQlqsfR/Ph/Pn/psBHtc53N2t+ejUAMMLod3SPXTb/q8EoL+x?=
 =?us-ascii?Q?beHaSXYYx4XV/22D03vtFMusFVnuoI/hFKwxCzTzR4MOQkWB3KK2z1uGeEBs?=
 =?us-ascii?Q?l96K4f2HiRMqd+LMKLh59mffOqCxfCFai/rMotuAG/9Fl4Ih7pkHaOXVbqgi?=
 =?us-ascii?Q?kL2rHWXmgN6nKZ/DdHOa5fiicfahvqYUdhJlBVHbIwGisi4mmPVQfSicim3Z?=
 =?us-ascii?Q?rJ/kTrWIcMYWJG2zcijv05bYjPz5z55ibvR2+sVmTdEyHG7moiNy+qky4npl?=
 =?us-ascii?Q?s431+jPbTgVJgEuzU82BBHvLfHbz/qM+9Kjpl3PnUPudUsI1vGpKgamuHSQS?=
 =?us-ascii?Q?49a8mZMhPhVXsjISRa0kec0/5dEt5aMo3DrZCIiGFpJ2QUlmHLYnpQ92zMyr?=
 =?us-ascii?Q?cF8vwBUSomP/W4UTGh7HJtBzuRBHynCGNNAbbb2MPfDd7vjfOSZFmqUOq8mF?=
 =?us-ascii?Q?PSquGt33vb82ADY4wuVY27Z+CHiJgjz1MDBPfHyDF6V/2oIrnnjn7sdqt4fR?=
 =?us-ascii?Q?RA5FS/JgfYk9bJLmNnS2Isya2iHhqwFp0FqAZzRHSyBfkIPgXgTMnXaaEA1+?=
 =?us-ascii?Q?YEMzGZufyUiyA4XezCz0u7R1fbxsSJuyOtyqogNttORV1/nrbT4amqmGqfjc?=
 =?us-ascii?Q?4PwrWVStux8Ga55kyIA0ZN6tQyK03qCskluY+2cb1x6GdOpZAAU2jqVunYn2?=
 =?us-ascii?Q?OFk85Oqe+IBpV03Se9GlHAxht8UHL0BSkNjBnDEz2v0LNm/RMxCQwh6K4yk2?=
 =?us-ascii?Q?E/82mQSat4qsR4x9EnFDOo2NXJh6AGmjNXu1eUvun3oRp4oiL/rLMJvxaZEb?=
 =?us-ascii?Q?lDcval5vYBfYiiamwzOicLvVejob9yXhIoPRvEWl+piGLJd6ap/iUs/uvFY5?=
 =?us-ascii?Q?52Sww/xu+vO+5zryywXV8+MFPJKWLumi3Gn7LqkPamCaDT4kQkrbopN+BEnt?=
 =?us-ascii?Q?42mPlCTYNA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ac563a-09ab-4342-0204-08da0e94757a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:20:01.7100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8uecNIx289L1UtcW72oHLvS6sBnmb99n0idekbtCwCInIISVZ9ok6Wt/lduR9156xUSk4YcIjp4YrUnbUC1yDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250106
X-Proofpoint-GUID: 2bs8e6H0tO8JkNmfjBSKRfHgnvNmXlZp
X-Proofpoint-ORIG-GUID: 2bs8e6H0tO8JkNmfjBSKRfHgnvNmXlZp
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
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
index 0c5bd4f923..a9a75e170f 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -59,6 +59,25 @@ static void remote_machine_init(MachineState *machine)
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
@@ -68,6 +87,10 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
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


