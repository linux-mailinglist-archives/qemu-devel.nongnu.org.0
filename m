Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9007A532D99
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:34:33 +0200 (CEST)
Received: from localhost ([::1]:56092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWYK-0002YI-M5
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWV2-0007sC-TF
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:08 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWV0-0003P8-9n
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:08 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFSBdG001529;
 Tue, 24 May 2022 15:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=BTtlySDlLng/K1IiRZ5NpCjL6JerC3eFuMJCe1bmrmU=;
 b=Ii0uQ03x2be4Cg/FejtsCyVlf/M/MOX5FiNqTkxVR94u4LQu4vmwY+2P1clYxMNRvPv+
 v5ZrZn6mDhFJ7HDe0m80mxdJYrMBZlMEW/STkEb6Yt7N3ES0RGbOdce1qd2nl5rgnw9p
 vB6GHdhYldU+KKen6svxYgCOXa1nQs4EAduTpRvtzVlUsufO2IiM6UMw6d+wxe4On67m
 FVUKMI9D98OpjFTEjZv4XbyUnvv3Hz4X3z0+FuVyWTqMiUYMDpKhZxO6+kEpcQ6Nyjzj
 qEv6nXal/WeLdeWytT5PfsQXJUNOwQBGzTVoyE390zCVPHcSCUbh7XitXAWyYsyjr/Tm 8A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6pgbpq9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:02 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFFYet016795; Tue, 24 May 2022 15:31:02 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2049.outbound.protection.outlook.com [104.47.74.49])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g6ph2k52m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhLVZkUI/rSBA2PTAR9/S6X8pnXVnFjY2aL+m8URxVcqhC9nbp4+w0F/Qf4MGymNgKPRDqLL+1YKQ3CBxfDvvvKNiwmomuKjeBL32dZliP8Z0vTXLv7q2PhXiXzf6FCvMUnAe9xqYv8WDJjbQP4QTKRcEAsjA0mcnut6JQ1C2n+FoB2SZ3z+vEOq4LvLsGQdgsClAQ+Sx8Adb8MsxW9XLpQ95eZIbUV0zbIKNVI7YSR3Agi7QrN+U3sjbfz7sVFTmk6jJSo/I3HHiYH2IaZ5rwnQ31C2trVcI1BcxC7E8eFIwAQWMT/ofRMpJ3Kdq5VhBD7HYQu6oKNVzD8b0rw1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTtlySDlLng/K1IiRZ5NpCjL6JerC3eFuMJCe1bmrmU=;
 b=iE3T4Z5CwGev14+hXQJ5tZgss/OpsZ4Vx3anCu+cTL90SH5MMKCjbOwkmJxwDOksJ2MiZbRT5137CK7X+KQZcs1+D4Laf/Mq2dK2rMX0ZyLw4qwhge8OqU/b/3eZ5S43XUEMvj1/sGydR4jmNHA46bGS3XtzRAyX2ol+O0CeGI2kSOcqvbVWzuvwiXzc8V7wJYdTTjRZTHZ0wqP4S/7OnJmeEEkZi0PljfzzdCuaznlcPfz0J/25khMl4dOv+K0AxDMJWfHCC3cAgU6ZZrkfGYFB1nCsrsGkZWLRiMyAN8U15AGgfC1erKIQPPkX2vYSex3ByaFDvGJXdHxKlFQ5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTtlySDlLng/K1IiRZ5NpCjL6JerC3eFuMJCe1bmrmU=;
 b=ycP1hVgww7LmF4AV95Od1uoIEUZV6npk2uAd3ZT9eznXHSNsW2lEqzmOV41yT0gmC9SqpDXsyyKOOVHLEUDca1KyVTi17KiQqklxHe+yxW8+A5jdGVRwzpyDq/Vm7wy2o3yTHV1qorFjuadNJULNkbRsyAl3lvo7N0kgfVczlos=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:30:59 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:30:59 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v10 06/14] vfio-user: instantiate vfio-user context
Date: Tue, 24 May 2022 11:30:25 -0400
Message-Id: <38676caf167ae5205a4179e6a1256d2586b801af.1653404595.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1653404595.git.jag.raman@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::17) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49a87500-5de2-4b61-38b8-08da3d9a66e1
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3117B5916DB775C3AEA4756090D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4UNESoZUwjVttqSMzjYhai3SYUepJW/OCRKECNYrJmk23ENuE5R1zi6IqfzSzkfEK1UNgJbOHxxx5/5g4kzeAEIsVhKIkCm0vzH+l0mQ4ecVFIdP6hrDDfrZGQpe0+15C1MC4D8R8H5iF3fXx9moMOyOJHj42UjE9yjh0ygFp44YkgotVL86f9UmISYCgyfU39A18DE6h1XM/RerOOxERv4r5QzW+9pfHZd4YhIpGi3qQSRIrwa91IFrdVV1VzL/aIRSTu94HLRg1ESThQZVdiCFvdMJSJ7gwHY2VWn0cC2Ngn4dsd1jzapYDPS2NNfE1+YSHmnlNpVv5dq+aYvPEiVLF6sQxFszX+aPb7Xk7uea3NBqDJTMBSJpFGfqQE/m2TERTxR99Bc/ysVKi83jlfJoEp+1qhluztM+e5w543KFZ2Xy636pojaMt7Y3/rDqLswd0qzyLxRp7yYjqaDrW7tzFGJIGplO5wlMFKMElgvaLR9QClBN0vqjJAuYHAYQqqFAJ6DDF9W0PrlzEUWy7yF5mp0rmMIBpUpbgDcQN2nI/D8uW2qgKn+IrxeY8tWUYFJKNsdv89JJIu3ED03TJKThg1vYUo/qZhJdwFcSx7IJ7nosAIfjWESQQd+4PDAdc9aBVfCkLiLAe5KAEs1v9VSMJjSEJQ+WK/j77pFUsQqhfULaqkNtIt2UpPChpTNPUrzp88dX09oJfazVTkeN/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(83380400001)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zq5XJWXr6Hc3m9gF5ufTEIcjse5II1dh4L31rSYfVpgaBRfDTZjkhHq1hzic?=
 =?us-ascii?Q?t+/b5UdPGQy8D5NUSbr0jBdX8MCYsyUZxfFdzh6RpKOWnqGUmU9cyyD9DGzT?=
 =?us-ascii?Q?qKSORtJOgPxF1l0M4FQOV0UBvbmJuobMG3hJBdsViAgc4knWO4K/F4HENNDB?=
 =?us-ascii?Q?02nyzhd5F0rpJwjRtbXAyCeSt5/jVtWNQJgRMSkf5895k22IPy9b4c9ocOzQ?=
 =?us-ascii?Q?PJ6jcYPi18qMDmconLgd2wt5JtJArhEh3I50OtYIivpb6BB9uhMN8Hs2fg3l?=
 =?us-ascii?Q?KGAlPlkU+DjsCuGcWimIvBjki+ajhI2Nayko5IwjHw76iXNdn5yRbOJvtpIV?=
 =?us-ascii?Q?9jW+Hc5up2ScnnDF9N95FyfDtQk3VWN+swhO8g7K/LN1jpKBSMhU5ZkciQjV?=
 =?us-ascii?Q?UJguDEJvVTJr/NSiGrjRcscV1NpmGYHVzwMVAvEDHbqjpkI14hpMQVY2rrsb?=
 =?us-ascii?Q?SEsBWTnTVUL92ZpinISVej068h9oY1rM1DOEqRyp4VjP6KQUsQ5N8cKM2mX1?=
 =?us-ascii?Q?yC5IQ6PWJMaERhpfFWIDJpPz+fDIB5QVSJVlNB5tmD1VJNmHaPtaycUnNcQw?=
 =?us-ascii?Q?fxNOCbd1qevSl7wjyLFT/bpyBdcmK+H0CcpXyuPfSFVd/udsGenuoTH/cCBX?=
 =?us-ascii?Q?P3oF7JZEQlIN4R1IFGVYcQ1QesHQwb4LXfuekaTT93C1zFAXyzLL8kV5UNPe?=
 =?us-ascii?Q?2J7plN8nO4l7Yc7vqM+v5INu3Sj27pUquf4ihsSaYTcVGx1zrDuA8nPpYpuH?=
 =?us-ascii?Q?s6M1diPqy5OUcNbS1z4TBaVqR+y7ydNid31Lyn/kXPAQGzxD60bwQBW8NXx6?=
 =?us-ascii?Q?xsjCy9f+PI/igp+mw6FvWb0AwumJE+EjhuzS4KswkDljOpBVRyhycJY1NWX9?=
 =?us-ascii?Q?VBYM503tijdctwWSxZNyFscJ/x4JUrJMiytRFWpXyIDvgYa9k6FzI8Y8gkNu?=
 =?us-ascii?Q?fwLB+hpf8CMTadgOCMzlLm24Pm5GxqYMR/PlVoYV2EicPR1EJMMsqUN8ykjN?=
 =?us-ascii?Q?JviE+8lKeCJ92yHONMnLCpFxQbOW73be8K3+EIjPC/5/ovWJ/gLcghEew77c?=
 =?us-ascii?Q?SpQHg30pBii/ODNQdUQulbnKLb0Lzn16oP0ecaUQ9J1ucMB+YG4tjN7nHT+z?=
 =?us-ascii?Q?fc9c89Ko7elams7gmxd/rqcSn48ijzDfOIkUCnL1Av08M/gdJbhTYu/vExrl?=
 =?us-ascii?Q?qBr0tQ6KCGq/0gBfyatkAa/J6kR4OY0U6Wpgko+JssIFO8GQMCQahvx4TjLW?=
 =?us-ascii?Q?0yX8lQU9hSaPuDsjjekfIF9ZHMve67zQCSu3fibQGQ3JUZDHebKbz+mJC5SE?=
 =?us-ascii?Q?1vSHBpIO0KeoDv46wtu9mqkG8dY8lncb2lZ9FuyeDt6guniiSfLBoUj9SSO4?=
 =?us-ascii?Q?t4W43535LyCgqwexhvSAASGJBrIuXtaAZbms8b5gfFEXb3zW/a9CAdtbsPhn?=
 =?us-ascii?Q?S2jHjisYJJ1iUDuN18vzXzGEywmkzF3TzPTEe999QRBGSqOber34SHbd78MF?=
 =?us-ascii?Q?p3Udc5XZHmB1/LPXLpSJznroFaNRvYilr+3SOD3nVd2xWS9EU5TAGQnhpnGK?=
 =?us-ascii?Q?oIviNXQviB+tLPRSTnUTjjabQchnJqtNWE3wggM+mEcMb1qUYZfE82wDZ7hf?=
 =?us-ascii?Q?gqUzN+Cy17nVJrW4VBbM4qAA8wl08bkRyE+aKfky+672BMnGu+1Qs57kUf4Y?=
 =?us-ascii?Q?C04/l32mgZ2m3aLiiK2Fd34TGTfp5L30I2FVhpigds3jtopsUsKU52V2ENjY?=
 =?us-ascii?Q?88+pXkI0gw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a87500-5de2-4b61-38b8-08da3d9a66e1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:30:59.8202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8Pn/NHFtRfvFvjE2CyHzBLeYmSqpw7mqZRapNutWED5EgWANmAB8HL76rjtQmPLpQVxQn3X5AWYmgVYjXcWjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240079
X-Proofpoint-ORIG-GUID: GET_f6etv10SDt93r90XlvS_SX8VU9j4
X-Proofpoint-GUID: GET_f6etv10SDt93r90XlvS_SX8VU9j4
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

create a context with the vfio-user library to run a PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 96 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index bc49adcc27..68aac0c2b9 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -40,6 +40,9 @@
 #include "hw/remote/machine.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qemu/notify.h"
+#include "sysemu/sysemu.h"
+#include "libvfio-user.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -73,8 +76,14 @@ struct VfuObject {
     char *device;
 
     Error *err;
+
+    Notifier machine_done;
+
+    vfu_ctx_t *vfu_ctx;
 };
 
+static void vfu_object_init_ctx(VfuObject *o, Error **errp);
+
 static bool vfu_object_auto_shutdown(void)
 {
     bool auto_shutdown = true;
@@ -107,6 +116,11 @@ static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
 {
     VfuObject *o = VFU_OBJECT(obj);
 
+    if (o->vfu_ctx) {
+        error_setg(errp, "vfu: Unable to set socket property - server busy");
+        return;
+    }
+
     qapi_free_SocketAddress(o->socket);
 
     o->socket = NULL;
@@ -122,17 +136,83 @@ static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
     }
 
     trace_vfu_prop("socket", o->socket->u.q_unix.path);
+
+    vfu_object_init_ctx(o, errp);
 }
 
 static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
 {
     VfuObject *o = VFU_OBJECT(obj);
 
+    if (o->vfu_ctx) {
+        error_setg(errp, "vfu: Unable to set device property - server busy");
+        return;
+    }
+
     g_free(o->device);
 
     o->device = g_strdup(str);
 
     trace_vfu_prop("device", str);
+
+    vfu_object_init_ctx(o, errp);
+}
+
+/*
+ * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
+ * properties. It also depends on devices instantiated in QEMU. These
+ * dependencies are not available during the instance_init phase of this
+ * object's life-cycle. As such, the server is initialized after the
+ * machine is setup. machine_init_done_notifier notifies TYPE_VFU_OBJECT
+ * when the machine is setup, and the dependencies are available.
+ */
+static void vfu_object_machine_done(Notifier *notifier, void *data)
+{
+    VfuObject *o = container_of(notifier, VfuObject, machine_done);
+    Error *err = NULL;
+
+    vfu_object_init_ctx(o, &err);
+
+    if (err) {
+        error_propagate(&error_abort, err);
+    }
+}
+
+/**
+ * vfu_object_init_ctx: Create and initialize libvfio-user context. Add
+ *   an unplug blocker for the associated PCI device. Setup a FD handler
+ *   to process incoming messages in the context's socket.
+ *
+ *   The socket and device properties are mandatory, and this function
+ *   will not create the context without them - the setters for these
+ *   properties should call this function when the property is set. The
+ *   machine should also be ready when this function is invoked - it is
+ *   because QEMU objects are initialized before devices, and the
+ *   associated PCI device wouldn't be available at the object
+ *   initialization time. Until these conditions are satisfied, this
+ *   function would return early without performing any task.
+ */
+static void vfu_object_init_ctx(VfuObject *o, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (o->vfu_ctx || !o->socket || !o->device ||
+            !phase_check(PHASE_MACHINE_READY)) {
+        return;
+    }
+
+    if (o->err) {
+        error_propagate(errp, o->err);
+        o->err = NULL;
+        return;
+    }
+
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+                                o, VFU_DEV_TYPE_PCI);
+    if (o->vfu_ctx == NULL) {
+        error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
+        return;
+    }
 }
 
 static void vfu_object_init(Object *obj)
@@ -147,6 +227,12 @@ static void vfu_object_init(Object *obj)
                    TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
         return;
     }
+
+    if (!phase_check(PHASE_MACHINE_READY)) {
+        o->machine_done.notify = vfu_object_machine_done;
+        qemu_add_machine_init_done_notifier(&o->machine_done);
+    }
+
 }
 
 static void vfu_object_finalize(Object *obj)
@@ -160,6 +246,11 @@ static void vfu_object_finalize(Object *obj)
 
     o->socket = NULL;
 
+    if (o->vfu_ctx) {
+        vfu_destroy_ctx(o->vfu_ctx);
+        o->vfu_ctx = NULL;
+    }
+
     g_free(o->device);
 
     o->device = NULL;
@@ -167,6 +258,11 @@ static void vfu_object_finalize(Object *obj)
     if (!k->nr_devs && vfu_object_auto_shutdown()) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
+
+    if (o->machine_done.notify) {
+        qemu_remove_machine_init_done_notifier(&o->machine_done);
+        o->machine_done.notify = NULL;
+    }
 }
 
 static void vfu_object_class_init(ObjectClass *klass, void *data)
-- 
2.20.1


