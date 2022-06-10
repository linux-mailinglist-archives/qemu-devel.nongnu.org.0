Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B64546DC5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 21:57:38 +0200 (CEST)
Received: from localhost ([::1]:45382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzklF-00005k-Nn
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 15:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkez-0000AU-7c
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:09 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkeu-0000Nm-Sv
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:08 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJhr41003365;
 Fri, 10 Jun 2022 19:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=PEYd92Oj4S4zXZHW4xEXu9y46a7Vp5wnXLld9qaD9Ys=;
 b=RodLz/GXKsoI739LjdbeczDbY0BetOTwp2y7R5UgWnUdFJ3ODp+SpDRknmy2/4rs8dRn
 8v2IQcD3jxN8KWYOEr8rJSNmJNcKZqLcCtZA0wkC7q7XB7MQvLqJxyjiIFKxDqxKZ1B3
 BczlENNnE8CfgbIrQwXACGF4IQgv/OzUPTvWykOYFphz+U7pqcFwAxLruiippvHonRfo
 VkUUIm5ePSUXS5mMFVBnpOe4p/Y8FPamVQoW1OOTTu1GBgROLgiXPQlWhj/9rSJoF3Cf
 DNjb/lMBAjr8DLVY+7avNOSrEnWxwzy6S3qmdyxb2jlCHzwDoHSApS3q8E5C28UUXlgl Ig== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfyekpdmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:50:57 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJjLQ9030546; Fri, 10 Jun 2022 19:50:57 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gfwudf2bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:50:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Or/4HNKi+6XWS2P/l47BiL2lQxW4l7cdZ2MjD30tTZsYDBYffv15lSwIKUvZgupYa0ekCuxFrNrDIOEaQQzeusZEN3Gpka7ZiL1t3J4gv1GMrPgD5De/I+Ex1TsdEADoLjsuT8Cc1qd0a5upqtQAl1L2ceBwASyoAuMWqN4L8WJ5Uv7oycVCK5PMXlTwXP04V22w8un6xVG8r8iPfm01zhWz6cb1YIZCP8Clv1yP8xOMnKnNFLqHjwGFs4ximbJojrbYj/9cFexR/zJKzz9khMZouBXgfr8HMK9/5VtMYUOwCFvbDl1/iaKRS7xkJ7Kc7I/ZQ+ewz7aGI7nEr7a0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEYd92Oj4S4zXZHW4xEXu9y46a7Vp5wnXLld9qaD9Ys=;
 b=OVcAOAaM66JiTcj2nO0fGn7X9Kdpa1tac6xX0MOOFB3frRxlaFph6pz3OZy6WRy5IU2PtCju5VLBJgps33Qs+WOXv8u9DRclRqGUBT0f3gni2fAehxpalxr73QXFHrK6KbZ+KSQkoscHmt7LtE4hpi107j4A5FOZdTUPp8lIyZ547RrbKjGlRu40NhFQlMQ8VHK2bniI6EEtcNA5MDbMJQruOBPqFEhR/ofkA4IqZXmpFsZ8VO38ZHXJIvj8nPruRT736iaG6cUp8uBo4o4mPZcdwhiuwWQhB1Tz/6w0aTHyq+wfHz/ASlLgucItEsMU3aDL4n4saYjKAAXbq6h6+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEYd92Oj4S4zXZHW4xEXu9y46a7Vp5wnXLld9qaD9Ys=;
 b=DTljw9JUXZTT7EWKQsJvmqQ1QsAcBekw19ZNVYiHaUdIAZ9oCfzTr1m+KutlnImPx+joyeA3Xgrr2BJ6ZIMT8G0LyjoyKAZULBFSpi34CgH2o4Bmcxq7gqlUtYxOm1I3V39XJAwzxkHgyimdX+EF4pnANe7n2yaZjyXFwja4Sfw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1915.namprd10.prod.outlook.com (2603:10b6:3:107::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 19:50:54 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:50:54 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v11 03/14] remote/machine: add vfio-user property
Date: Fri, 10 Jun 2022 15:50:30 -0400
Message-Id: <3ee846cd9c591b63f06686d5d7bce7ca4b8e3a89.1654889541.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654889541.git.jag.raman@oracle.com>
References: <cover.1654889541.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28ac8131-1cb2-4210-c87e-08da4b1a87c4
X-MS-TrafficTypeDiagnostic: DM5PR10MB1915:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1915FA9DAEF363E50C81E68B90A69@DM5PR10MB1915.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fMh9MAWtTZXJW2zknxm1KeHPRrJQFZe7K3BSg7vjLdC/GieqUKnz2+vkPlph4TxdaG5MZfFLKv+4WVXoiFo7zC447glmUriSErU0sBE46u1kjGvqoDgGcyl5JEca6DfhCvWVhvfvsXNQ4mDdqBz3BtJG3J5GQQGfbK13dXuOOOrX2Gct5OD1SnRE1K4CXCiPWR1ZlktkPf+BM3rBaENLVRKQrPukwNFlYFHEPef830SimR18Igpvy5Dtkh76CP7jfOxCMk+e7KJ2wYyi08yYhKDM0JR6qL3OYA78vHKcf5q9PzvrqEIYNsr196HIKKmW0EBwgC5M5Y3+JlhKgiZ/8jUpppezJdy0ma/O1alwUVHUsIIZdE+0rqEIgJMCiun+2UQ+bW6F4BoKmYkwKm+L885FGAsmZb1zMq3tzT/wz7E4cckn8+ilreoL09JkLvjkfwMjClS50WzL/GTriNGBhaV8IH4V7xsBRFjCIsQV4zJ28N6JZiEWd8CKxKqGsFlxOapCfP9ejyW4uGaSfOfENDW1ODbg/+7jMfD1iPa0xaN1XtWJ+r/mFkjVqy6GijZpJ1OqsW760mFlXbQlRG0nWQGMZPjLCQ4Hg8iyW9nT3Ljya3YZY28CrUkOGG7YrWS7YhEY7DmKwmCPJ+MD3giJO8T8UJjVV7T/s+ncL80dxBZW23sVNFP/ACxbSyoGGwJ/CDmqRd59AjKXS9b6BdG4Vg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6506007)(6916009)(2906002)(107886003)(38100700002)(38350700002)(6512007)(26005)(8936002)(2616005)(86362001)(52116002)(186003)(36756003)(66556008)(66476007)(7416002)(6666004)(8676002)(508600001)(6486002)(316002)(66946007)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9OUTk5AihUPUwfhffEZt42Z/A+zziK22zvCLh2AxVNjBzhv1SVfkFNl/n7ls?=
 =?us-ascii?Q?CWjcxB+pf2Zm2D+KvR07cZkVy4rQu44neyS2lsgwSN4eLhoifJ+tSqJmXB7I?=
 =?us-ascii?Q?m5L0Ol4S/Lh9nikp45jA8IhLaCb78GVEqyT9m4VIUCiTM5WkykXQxGKvpe+b?=
 =?us-ascii?Q?P+JZAzX+O0zFztTg8I+XCtMlghjqyojKxvy6Vl6f1cmcEwg5bZUhDwFivCaH?=
 =?us-ascii?Q?1sU8EYrvzovo7vXUTpem/CUT0iO5kxnhjQyvGfoQErzhcyHBGCyHK6glgHIa?=
 =?us-ascii?Q?Bnqh+vSUaM1NRumdy8ou3zW1TCcCc8lvGfMDAqwCApruANT+3Uo2KLE7r/XE?=
 =?us-ascii?Q?nCAoNDn6HK8s6QerkKn53CQkHpbgCaBQq6D9NlzTCI2CxHXJi72nb4aaWFrj?=
 =?us-ascii?Q?KIKOeNZfLToVxJu+c3iOV0EcNc+OueRHY7svh/JNZHHf0rVwpGUMVHOv5RrZ?=
 =?us-ascii?Q?MPBmxCZWzNdtVTxNIFdSvuGME19aU89Q8kjBUaNvtPuK4WcRMtPGXqFR16ml?=
 =?us-ascii?Q?clYTzxnwR+9GvibFsDGQVJsZ849x1NIG49GUB8XyjWSQu3p/yzIemacGUD1z?=
 =?us-ascii?Q?HRWcnwF4rusbbQH6D+cGdx5b9N1VRv31PQm9FWOKkRtJfku6v4NleWDKpD9p?=
 =?us-ascii?Q?5NHMK8WKf7ugebg2M1S3md9sAGq72TTocLygl85GyZAoY53OhUtfZAQ/JfHr?=
 =?us-ascii?Q?VvRuzrpaL5TwEw8OQfYarNrxjOxpnvG88AxwuSeXR0FhAL+VNpAAEHi4D3Hm?=
 =?us-ascii?Q?omwo88GBu3KUA6hQUCK1m0QeE6izG45YZpHAhXrrL5Ychv+in8oECmrDUjpS?=
 =?us-ascii?Q?A/Kbf9Mz3i/xJx9zgoLebugNZU+fwN6qv8kNz0offNpUqJF98gJEU0ZpwIeC?=
 =?us-ascii?Q?vrKFcOx5WknN92DG4Ey0j38ZVBA1CTLAS6YJYCz6iCTjfeJfIFe7DR5W8toa?=
 =?us-ascii?Q?d/ShevbfOz4yIWOtNQ1WlMCW5HpQx0czoOQlYHfkYFN3RaLSehi3GKZ6CM0s?=
 =?us-ascii?Q?r9Uc29YKGkTrikhIBh7WR4LgktieiTLKeQ+TWJxeU/IEo1EugPViaaj81/GP?=
 =?us-ascii?Q?TwetxA10LDX5fNdaW5Skww252nefMlbgRGd2aOw+hSgKpwEU+9EWQlKsfM0H?=
 =?us-ascii?Q?q6hch+htfvM2uIhuugEXJ7ktVW08z+mKx6Vmq3RlyTY99xRcetJjIpnoRoPC?=
 =?us-ascii?Q?VUeGkyHl9/dQG2UqPD3VhuluHLXIXAzQkoqy61xTjKl8AMN7A5hiffoybapw?=
 =?us-ascii?Q?uF1WAnjOmDaePwS9vWxfzgSTfhpaLUhYR54jKS+ZP1aEStKw4OmRdL65mbqL?=
 =?us-ascii?Q?w1qf9L0gPL5GclwzMOh8XP8NTMGKMz/rOkaeNPLSSWTFAnI2txbrChDCTeCc?=
 =?us-ascii?Q?/1rLW3OozUN6LbKeq6/MfDrorBXcxVkq7qhQ6FhpX9/QbD6KB3Ok8PLayitl?=
 =?us-ascii?Q?JWjYdcmvLsn6y2WPAG6yZJPv0U5w13GbzpWFm0Unb+Jzf0A6lwsamZW+WtUG?=
 =?us-ascii?Q?avmy4nZ6CmEiHueAeZXsT8QvnvKj7oTuQMx6Lj8zD1ePHDFUts164QsMFAuX?=
 =?us-ascii?Q?mU2iN5ODv7YvA+yYrtm1vbUCuVa5YDm1b7Gx5Snzc+JJ2NI+jz6FuaDlmnXq?=
 =?us-ascii?Q?6DrR6apRjBKhz95DTDHV7Xz6BCuRejKiZjCo8H6LWC2BsTfRO5/+/VdGhqVq?=
 =?us-ascii?Q?xuyQm/r80oRlUGIiKPisODfPcgJqMbK2P0+YlJp5peAz6pjUDjiMGxYEbLgF?=
 =?us-ascii?Q?QwOLbXxuvw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ac8131-1cb2-4210-c87e-08da4b1a87c4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:50:54.6806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXWFpX+rEYojFYSSbHm70gkjbW7ZoLJBAe7XA6iauC3O+LUSiVpnDUdB++jyaY4w8SIVjPOOcsyE+/XVGEXekA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1915
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100076
X-Proofpoint-GUID: Qe4CuiAe4ByhQb9VqsjZPwRXzOvl2bsg
X-Proofpoint-ORIG-GUID: Qe4CuiAe4ByhQb9VqsjZPwRXzOvl2bsg
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


