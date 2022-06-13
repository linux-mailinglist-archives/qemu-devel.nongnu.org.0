Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A83549F28
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:32:43 +0200 (CEST)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qjq-0007lH-65
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfG-0008ES-Mb
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:01 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfE-0001s9-0s
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:27:57 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJdPie004110;
 Mon, 13 Jun 2022 20:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=yfvTV6vlX9EDqMW8rNGhZe3NOqy+Kyc+RI+1Wm67LXs=;
 b=hauruMwmw+q+IKREg7TRCzwMHuh7cJkyWCF+uATC1tdPQ0fcKOZx2I42i85VjwMyBGx0
 XEyqVRek2ovnZd3kE3oaSHTrYosAdD3RXFr3cdG8xFN/5jpzukGryeIbXzum5GeMXbh/
 4+DwlK0BCUNC7qhlOu7xTaYa8yLP6xAPtKZG4Yq3WOma50mV/jCvxiSErvYfA2ue0PFb
 RBrdKGmjZX/rfGZMTSbix3pkcfVYk7TMrx8S3ThzVsO5imS6em+nIRZzbhrGqyXnVKdW
 pbljXL7FWjlHjkBsfLKmwoZFAzwFt1sN9hPKpftHDIaGkgn6NSI9WOeN4A/oaozCWlsf 4A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2m56j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:27:53 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DKGPxL000729; Mon, 13 Jun 2022 20:27:52 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpc4hr9ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:27:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jh00T1BMwk8++lEyi9fB2nBvFVznvYqNNw3+4sUqd1heHVmFMu+2ocrYUH28/06l/ctr8J38LH8XtZwHZ3rhTkRdaPWANCACVczcdRHCFGjNNCEU5K48z1hnwG/uakAQJiTteJ4Ge6gQFva4B+T9oKgVG8WUGyH+z6cCqWaAxBIDZKh8dLEHA0H53COcjj1IL8esFQwqTTxvh/T/75rxZ6/rnxS8/WscFy3jsJhZulwEceK1ACOFOeOCv5pJLWP11Z9CV+K6RRkj5UAP4Nm0Hc8KLAIsAlge6GRYfTlQOrqZ9QlhURuKQxa3lUKoqggomYTnUI0xf/lC8nR6lmTYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfvTV6vlX9EDqMW8rNGhZe3NOqy+Kyc+RI+1Wm67LXs=;
 b=XsC+yVRYlAek4gGi6KoGXKo+qWtdj/vZQWMQP7GkCJjW3PaGPuUdv0DcHR8KvZdC/xE9Lg6l5RuwY8hzFLuKN7aHM9GIP4xadpnbTmnkytKm41C1VCI2OZg3xSJqGG+SIuw7lV+0z3p+2EwgCJ7ua5Rp5Z1gKnbtvsJfDQN9u94LzzEeYQv5TKyuWBNuJ+74SkCP2UgdpaQv+YACw0h0NszAg83/nIRZWEsaC549sRppStIqyYKP17BsWR/f6DvSwNFq/Ai5aFeTO4GFoJ7AY30MEhTpiByGAGA1PeqjJVmmr3wfhIU34xRS6mZ31o7FqIlo1o6eZnrKkJAX2kwzvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfvTV6vlX9EDqMW8rNGhZe3NOqy+Kyc+RI+1Wm67LXs=;
 b=S9UJYW7tZw3k5kABfJ2xgziLeQ2coq3iKFvxv4yCZU+SIxtOOb+4eDPZHWPwBeKaDg17V9c3u609WIDsGI4XbpdQ4+g2zJVPdK+FkkgIF6DQSP+JjbcCsRjZx/wFnkvsVG/lnS0upgFzrG9NchI+B65kNHTueqmFMw+yKbiK2jQ=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by PH7PR10MB5723.namprd10.prod.outlook.com (2603:10b6:510:127::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 20:27:19 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:27:19 +0000
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
Subject: [PATCH v12 06/14] vfio-user: instantiate vfio-user context
Date: Mon, 13 Jun 2022 16:26:26 -0400
Message-Id: <a452871ac8c812ff96fc4f0ce6037f4769953fab.1655151679.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655151679.git.jag.raman@oracle.com>
References: <cover.1655151679.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48a30acc-57eb-4f24-1c20-08da4d7b1ced
X-MS-TrafficTypeDiagnostic: PH7PR10MB5723:EE_
X-Microsoft-Antispam-PRVS: <PH7PR10MB5723F771AD933987DE22785890AB9@PH7PR10MB5723.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eVt7ZCVaJQJRRtpeyst6XgtMVABP6GZdbiQuxS2jkDaxCGArEIT/ruV6noVJxoJvZv093Ln+60hrXJd8mGjg7LlNZdB6lI2vDgHgoQx6yx1pME+VvI0PlOS5PwEfMlE4qh+MNPjPHKkciZruhJI8hGGwVGo2Fwua3ARay066264Bn9Txyz8CePai+drszTAmBrkxOjxr4ZC3/4NAy/eupPNqc6U0NutwTxYY9t6cVBMtIyPS80lKAFOsLdSg4GpprPakepDbOTHsG7RlB9yDKI8Zz+qbEUQJkvGA1H2GoT5JPQR9C5LDsPraoG25TXU39HFCr8Sjc2K2zjlPhu7F0jy/J20tGgv7ZPNEtyeaBS6lPh3ZPk0ljobBKC6B0kGkKRoQ1OsjwKEnMpxwXtLwfmlha9qpFB1cYa1na7uJ2+dNZkAV4MhSL2IYrDvSidHjQS9K2EaBTMkQlwNLSegzpcGyaVwqrUBXYFAe6YOLfTNP4SXr6PljpxH0J9Rv5+1lM6mf3uhYpRGzBemJOC60T//0nXdZ9ktMbuFBiJK7GT1Q5WkY6+Cz7C/sgSJq3cVqQwjxaDCaNdDzbrQJub6AuRsHD0jXKx5PHwbBfRGmei/pfT8Ded50tIq3b5AfMtkz6QdCyOy41sFEbzvgo0I7F9iRH72nIsQV74Yjr1w01Sq5qPDV0+u1xEjbME/w4LF3+KXyTiF8Aqf5O64bLmHsuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(8676002)(36756003)(6486002)(4326008)(6506007)(6666004)(8936002)(5660300002)(38100700002)(508600001)(86362001)(316002)(7416002)(2906002)(107886003)(2616005)(38350700002)(83380400001)(52116002)(66476007)(6512007)(66946007)(186003)(26005)(66556008)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sSUAV/TiDU8aczYlbLBrweJBNI3+hr1mRHPwert/jWeH6lQVnDGwgWEoFl8h?=
 =?us-ascii?Q?O+NgQYfsEgutwoV2IcyDoulYhaEMfc9YmJ0QVCBMZjWEwd3WjQInL5ACNxwP?=
 =?us-ascii?Q?P2SIQxUNJmTsGkpTYRpIht8YOR6oj8N4wt2YjLSzjaWo6ZJg+R1AHnTtyNi5?=
 =?us-ascii?Q?WKZHmtCWYKlizrAcvEwp3JzrtRS07l4B+inttkpT3hFNnAPLvhXaJSgqHZ7s?=
 =?us-ascii?Q?67IFkMEjwfoTwojakVAlw/CAyUAB0EwyxOTY+0QId0+IG3vnDZH1INvuoUTB?=
 =?us-ascii?Q?2Vfle0wR64JbLklzqmciURwacqMfi6bgLxdktXOPU6dYIiBFU4meCcZGy5fZ?=
 =?us-ascii?Q?ZJY93YVGdfL0chS+OcWCRO7eOcf3cpiov19oL33PcJCowJ+XxfkDl2GNngyt?=
 =?us-ascii?Q?g93aLhJ6HvAYj8p1LOsoGtldEmC5zUWnr1ASUdqA21VFgAeCQlTo+wbkKsyF?=
 =?us-ascii?Q?KPaGNeYR1UeMY+bGRd8nctxMeMqtVBuKl/1PLXINzNcOb40Ac3SDlMDXyaZr?=
 =?us-ascii?Q?Ta1E0RGBeFnJraGFXStUtBt0hlUpH+UJ6rZOthKz2xgjkivq4D1mEGBHTAvS?=
 =?us-ascii?Q?vyRAMMuBg0IoxrLyMHFfoPQ78UKonkT0kQNTwLx6KQ068gSeodPHJ6Naqp3O?=
 =?us-ascii?Q?tp4WzQJLTZAVnxHS1KoY0LMejMQyV6t4xL7bqrrh9AB6IbhMQPePJ8SEcfhH?=
 =?us-ascii?Q?vWwbaNngVgdvQbwe0uqte5WRF5d8dlUBY7xU9ZsIO1uLHh24YZoMQgM3ngzZ?=
 =?us-ascii?Q?JjpV8+f6jCCuRaxZlFzubPU6GRFghc2KyDN7B3qDkaiG+NoOruUTFNn38VbF?=
 =?us-ascii?Q?KbM1CqtbaAKmov4836OKEAoDEmyoApWGL2rAB9JZnFg2hKutbsO6uWSXpmH4?=
 =?us-ascii?Q?/skppJ3PNoFxeEKdgiwORb0sCTsVlOAdH3jXjiSA5Acc/nCJiI3/fT5I5Q5A?=
 =?us-ascii?Q?+HB38aLT/0w4OJORt/Pv5gQ3kc3JKSwySdgyf5bHMR/qH35Cino5/5Td0WsA?=
 =?us-ascii?Q?kvJCQxTjG2tVHUOR+moMnfLFvgJx331z4ZnhHAYWR/htTRJ/5qQJajD9omRk?=
 =?us-ascii?Q?fJsHXrXAU/VV/kUHfSrxYhIq4MmnUYbkvEwzoLBX2vmmY3CgvCpeoqO5gcGw?=
 =?us-ascii?Q?C2KJNlxpHoYjRxCbQAG3xuRkqDubcYZrAaf7bZ6RltH6LgQx/NiyybRoPjFd?=
 =?us-ascii?Q?p+nDuD8aompD0StXliIIDYFTtQyPejNPePYsCmclV/bSuudQjvqeWM3OEndE?=
 =?us-ascii?Q?1zoZaZ42NlhdDxd8lYmgFXcSBnwlilXfakQU2QNcBkFRuLnEPUym4V42CYux?=
 =?us-ascii?Q?aFPL+tE8R4NvgEa4aVb98A/+WTxKowKb8+EF5sPaqdWToyL2z+ZRwSl2KHwH?=
 =?us-ascii?Q?MIYzOQJXDLmX+faer8PWuZ1kRnS6FBku6hojGNiMf4zynftdyuv9MX+gQ+Eu?=
 =?us-ascii?Q?NMZakeAdDfyiAnoAUTPBD5DBm+a8Jw4Me95oFMY1xaPPeOZCIw/lvmZHCxP1?=
 =?us-ascii?Q?IJK+lgWbE2kvFptnSzTDOkgxegmphJqA5ip+dNH/tSuAmyTBciRUUgcYafsf?=
 =?us-ascii?Q?iJ8wAd5fnXe9yvx37IuxzUUANi0j3oELF5q5l3Qx3kiyAJo6mcWi0xJFdiWM?=
 =?us-ascii?Q?Y/VrTsDLeszh3jKf2MatCPCFE5tV4G+R8Gcny0BltGpjRmyslUGSXm2jk+th?=
 =?us-ascii?Q?BA4nrRvVrX+ts0t1NPcDhiZdSsX6loAEtfUfyXgyRItlsyl7eetqriMLMC75?=
 =?us-ascii?Q?JgU3ib9gqA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a30acc-57eb-4f24-1c20-08da4d7b1ced
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:27:19.0307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bsuteyT4/8PPt2v1GWzv5xrkdpwhznAbINbyJ7syQq4mPIWIEtbtbaSuPtGjIWX1bLUhUyNTcs3IGP2ZA/ythg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5723
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130082
X-Proofpoint-GUID: J9axoV9iT7XwrsRfBuivBRGTt06kOaG3
X-Proofpoint-ORIG-GUID: J9axoV9iT7XwrsRfBuivBRGTt06kOaG3
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
 hw/remote/vfio-user-obj.c | 82 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index bc49adcc27..68f8a9dfa9 100644
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
@@ -122,17 +136,69 @@ static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
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
@@ -147,6 +213,12 @@ static void vfu_object_init(Object *obj)
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
@@ -160,6 +232,11 @@ static void vfu_object_finalize(Object *obj)
 
     o->socket = NULL;
 
+    if (o->vfu_ctx) {
+        vfu_destroy_ctx(o->vfu_ctx);
+        o->vfu_ctx = NULL;
+    }
+
     g_free(o->device);
 
     o->device = NULL;
@@ -167,6 +244,11 @@ static void vfu_object_finalize(Object *obj)
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


