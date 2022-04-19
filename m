Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AD2507B51
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 22:53:55 +0200 (CEST)
Received: from localhost ([::1]:38354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngurC-00015I-7g
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 16:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngujO-0006oj-Gn
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 16:45:50 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:58404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngujL-0003RU-T5
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 16:45:49 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JKasAZ020195; 
 Tue, 19 Apr 2022 20:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=GUQ5QDWOmp+enRKeOvoZKWGIddBaI7qXeYk0N6srFlk=;
 b=JKBvNbeUmbWS+udIwHsBI2Oaw22dR8y4KLG6r43EQ82b5dr004aQ7GoYJfQsrLcYa3yn
 DvB9VoF5C5M3r6JWgc0nJ3AH2n5gLVyp9IDq9k/9YO0jJO5DjyV+knTKtuOVCC/Omvdz
 Pm4NrTwjYIikkxOEgE5aRU6pPCSarrJq3BIaOVBMxKXm0ZKQzANnbQGA6lkYq08eignx
 bIUKxOaCdFxjvPss/aMJbDLy7J4wkm28RwrP7gBysBteGfawKe99P5GPEw6sO+BeWCio
 lWoHGg8RQZOMSVPClIPJlhjb+i7pjut7xn3T1ZM+jbYXXZE13vrL3TbTLb0CWSVzJ1Wx bw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmd1794x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:43 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKa5X5011256; Tue, 19 Apr 2022 20:45:42 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm838at0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J69QNvlJZfGBz317E30NmfIOMGZon5NxayOD2DSrrd15fAWMx/NuVlt/dROsLfMSX2dVIxSg9AYZ0KzPjBs4OVhzEssmeZ+N+nWFy5jpijaFfIH/l7TquXG8ScKwh5kxd/LxhVCSaAEuGKYlpDQKHMGq8Ukd9fzraSyjYZuwbpWdQFs2FA1dojPR9Abpvqi23KpyOPbK4WeJqWHg+yJP4E7k460pVrKdAXc6gg4qpIu0921xlS9rowkQ/z74d3pJz73Fb1bF9COUY30+YhXIEj17rjR/+xV7DqRhiLad+Tci4gdNC4xX4wrjr4eyJLaj+wDJvCrGigrWY1UrtBtWSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUQ5QDWOmp+enRKeOvoZKWGIddBaI7qXeYk0N6srFlk=;
 b=ZxSaobsCPODpBxZe8mClku5RtYWqXnKjREVkp2LyBuQB4lq8gqqQScIAS5gr0PpTMdV25to0UEWwvT15CXf/3liYAa1J8xQSQ+M4zZVMI2OTudHRAZEhyOWv1kKC3zk3ViisBAxso6M9SX9D5T9bp/2x0JODFBTN88r0vCyZQemxs8Kx8BpsuLzLOk83tJEpVEP8WyVhrj8V4WZ8IR6b2/jUbuZhyxR2jePqi4N1Xqa6qq+UZhPJrtD8bnVf/wl9GG4HidTawRSXI/0zmkIF4WKuC/otPOG/45fNNSQNseUuudTQ1tBZ3gBwiqAQsvefnTZALKVnBm5UKhXOBVKJVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUQ5QDWOmp+enRKeOvoZKWGIddBaI7qXeYk0N6srFlk=;
 b=q/vNsJ+wRS9GM/Dl38Yr9YQzha8v6sK3qcYbIHFsMkcLE/US0rINLIwqv80i8qftgSgqevAslUIyAINDTZZi1bDwmmw6EykmAeL5fPYU2I9eI2mcP8fRUOUK/6wsJG8aYnIu7wm8QePiw5x6SaRVHfvqSQROtVgRYct93GIFaAc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SN6PR10MB3006.namprd10.prod.outlook.com (2603:10b6:805:cf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:45:39 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:45:39 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 17/17] vfio-user: avocado tests for vfio-user
Date: Tue, 19 Apr 2022 16:44:22 -0400
Message-Id: <76de4c8c901073750bac314877626be51682711a.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed71acb6-b931-4c3d-c62a-08da22459002
X-MS-TrafficTypeDiagnostic: SN6PR10MB3006:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB30061A803A9A95F9DD9B6CC990F29@SN6PR10MB3006.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bFQe/L25Oun+NO8X5BoqPu/NirrMWToFVg9eqFByWddwucwz1G+0KjkWEG0ClRtHORAaes39G6WYDH1RMBWq7MDBABll1Lmb0VnUi/USsU+ILfdNub6FK2xNKzvj250+V7GPhxfgxFjJv3/IewhUp4sBU379JMEY/7omIGgeRCWAPhGJzfTIFL/XHNlmplxUc2tvBceHh0ZmP6PlLIVb5cPQrWGLk57LARIFsVgIEdZ7TccHRhojKpwv/LfoPNsLb/R66bUTyO4gEYniNdwKGXUM2cYWxIbh9nLTH1RR36fhF9WMB5y0Boy6ndqyKVe4noiL4J1EPxadOJS5YPQRcIhVaKRfVuTdJdiI1z6L/qTLcS8N4YBopqz/TaPjEVL3sSnY2SguaC8tqTlWDjsuc1KUdb+q/RpEPsCVf6fvSkTw1UlE7JwttdLkUv23zZVQC7Y5YCI7aqcn6TMciP4rLnqOb1cvqCEfgW7ORKdOqbWam1gByNRpyhbPsJ9rB8NMik+FhnGN3GMMHTUxnm0dkAs9V11iY9nk1E/ue/QaAiFyK1agw3n27MW1toM6RmwrGrXJJtAy2IVuTca38+ZvCcyLhKboerYV8Fs3qEMUwk+ajbMCekHIzJL4mXyxsDQ7xCpRCUzhJVjA1R9wF2Cu3d6Yf4UjLfodW/VlElV7TSfA2nTNjxeZJx0LrsWlzYdFHOK0fGZnKseyAdYgYZpac35CRdMmtpVXm8d9KBFUvrqKSw2X7gcgFTjf2SdNRBlA/QD11+X5iw2R7r834OxCrtbfiPYn7a5Y3yVdWx2mH2k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(66476007)(508600001)(107886003)(8676002)(5660300002)(6506007)(66556008)(8936002)(83380400001)(6486002)(316002)(2906002)(6916009)(36756003)(6512007)(4326008)(52116002)(26005)(86362001)(2616005)(38100700002)(186003)(38350700002)(7416002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z/vPbXPkpa3/II0edgE3xw8ntF/71f+uUWp9rYS4rOxO4sYyVBLLxZFxEE4r?=
 =?us-ascii?Q?6nEAiVZgGUmWWprGUWqErZ15bqpd7ULkUztzRx8gb5AWlDGj9Obs123/VJ6H?=
 =?us-ascii?Q?CgpmZckiRsLJA7N8I58Z6FDjni25pyQ/dIBli/zovue35y5yaY/13ebyasIr?=
 =?us-ascii?Q?KX4mOxCiKWQugEtyceGduOSbW5MdykRvd1MgQT04BISJ3NElZc1F0Q9VlOdB?=
 =?us-ascii?Q?KfWuXR5YWmVxGxelr37u4o0/1eMTebBAJs2Pyuu6AjrgK/l2Dg8viB1BIiad?=
 =?us-ascii?Q?0bEihAH2ijOmCznMlwxMXDKfDmn3R6YEyLmSVhCBJ1BPrLW6WRSknAP95qtr?=
 =?us-ascii?Q?qIxRRyZAv316/I+n7NmLqGizIw/V9I0TXNvhqcO0Nue8METu41ei6eFrjiVe?=
 =?us-ascii?Q?F+skVXb/Eq389jrD/9njOtQCIo1ZOYTnXdPQnBAZ/ElTOAWjKspaEhEDYmly?=
 =?us-ascii?Q?sz3RsN7pmsAaOqQjXPjXfMxBaq+WrCb4pInJogf5wyBb2t2sucRgBHL7y7rW?=
 =?us-ascii?Q?z9ZrbDfx3uD5M7Dkm46cGIFf+9Iy5a0OaKMOI/flg7TzazxBjqlVLMTC0pci?=
 =?us-ascii?Q?DJnIvCoZYedQEptwMZQ5o4JcS+NR2TwRlfZpMivChbR19W95rnXoUOH8TXuC?=
 =?us-ascii?Q?qmJe/irU2U0QoPJGSFMxLvK2UoDViQVu9TXOaq6wA25ytswh8BGUgksIE4bF?=
 =?us-ascii?Q?p1OBwyTW9s7PoXWWHsMsBX3lfUMackMvKHvwaeIw1NyhhH2WJuILwZcPI+29?=
 =?us-ascii?Q?MmG9iRjCyzJYesMB5tXiBUevuWELIGoJwlr9O6NYFSwX/wBa7ut7QZV3XylP?=
 =?us-ascii?Q?v2Ssi2aSJxWnMta1DfZdrSf3p0KXS9y01R2ckn7iPKjcpkjEYZ19Rba2OzKa?=
 =?us-ascii?Q?yRqM7ax0Oinc7hts1Dr7NQTp5G0yvfyfSafNEdsNZFHObzN8untixcgpNQLJ?=
 =?us-ascii?Q?4Y/UslUgBr6W7md0HDkLts1H13BMWNUwWJh5ZiEBc7kTqb3Jibl4R3Ssm2UN?=
 =?us-ascii?Q?8uKL3zjLcJC/aNP1MmVL2CmfQvxVKTQOuC7I7tJun5AsLfXlx2JOdpn0OqVR?=
 =?us-ascii?Q?CQ9byzrutbTeogSL0D9arLIVEnLhWzualckURFZhSuJv1ENEjYi7md4nvD98?=
 =?us-ascii?Q?RnUL3UvbkHfLHKMcl3sfvLzS61qJOm6Qn5WIh5C3pUoSIo7Bvp9cSQrLP08E?=
 =?us-ascii?Q?dzp75jwjjlXT8vCFqok/afVnKAc3nRBWCJvTsWBg0iBjPicO69NIZWs62u+9?=
 =?us-ascii?Q?+xb6+iYRFW9kR4/60KZqlBWfKJRH/zlywh2oeYLnVG5W7Agc2R0Tntpi7ro6?=
 =?us-ascii?Q?g9insNS7JUrrXRYxaQCTiC3Mv22ahhv0PHIwj4BInujn6UCs28OAhFo+Ndju?=
 =?us-ascii?Q?v3Th40jYxxnc8ycbssWwlHi1mC31bIw1ITHojYkf3a4MnKMAe7qBt+1R+BdY?=
 =?us-ascii?Q?s6RLj/R4B5bncap1ySeffe7uOWQH5nVorNy63jlrmPBwXNxjvKwU2uWXVj9W?=
 =?us-ascii?Q?8ZRnTldfOSRpIovIBL/EfgnvyoiYi/gHWDlAY67AECcprEqnAdX5Mt+kgPA7?=
 =?us-ascii?Q?b6rCkKIjgEh2tekc0zK6QpTdzaDqoOsLJ6xl2sm7+wZCx/ppU2VXgmMPA0My?=
 =?us-ascii?Q?vOsuqAdJs0eHLU+/pffw2UgYwXbydIRe0jU9H9QTOXtzgtohr9Kos5ki6W8k?=
 =?us-ascii?Q?JjZsN3B26+BaQ119kyO39eYNt+jHgWVz32TI3YUk9olp2ATc+ZzWLSiNXs5D?=
 =?us-ascii?Q?OVo/EIqYGw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed71acb6-b931-4c3d-c62a-08da22459002
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:45:39.1941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfTy5b1Ixe/PWSzOXLlUKkenBvtUwVdoS5iNsCRdae8nEJKVj/EdDfIHUT3JEPKqkYKbIdoVy5NKXg7FNl/OGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB3006
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204190115
X-Proofpoint-ORIG-GUID: arJEvMRAY39RkbuX_c8FEzlJMDJstKCH
X-Proofpoint-GUID: arJEvMRAY39RkbuX_c8FEzlJMDJstKCH
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avocado tests for libvfio-user in QEMU - tests startup,
hotplug and migration of the server object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 MAINTAINERS                |   1 +
 tests/avocado/vfio-user.py | 164 +++++++++++++++++++++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 tests/avocado/vfio-user.py

diff --git a/MAINTAINERS b/MAINTAINERS
index ad51ec0dc8..8676f546e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3602,6 +3602,7 @@ F: hw/remote/vfio-user-obj.c
 F: include/hw/remote/vfio-user-obj.h
 F: hw/remote/iommu.c
 F: include/hw/remote/iommu.h
+F: tests/avocado/vfio-user.py
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/tests/avocado/vfio-user.py b/tests/avocado/vfio-user.py
new file mode 100644
index 0000000000..ced304d770
--- /dev/null
+++ b/tests/avocado/vfio-user.py
@@ -0,0 +1,164 @@
+# vfio-user protocol sanity test
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+
+import os
+import socket
+import uuid
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
+from avocado_qemu import exec_command_and_wait_for_pattern
+
+from avocado.utils import network
+from avocado.utils import wait
+
+class VfioUser(QemuSystemTest):
+    """
+    :avocado: tags=vfiouser
+    """
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    timeout = 20
+
+    def _get_free_port(self):
+        port = network.find_free_port()
+        if port is None:
+            self.cancel('Failed to find a free port')
+        return port
+
+    def validate_vm_launch(self, vm):
+        wait_for_console_pattern(self, 'as init process',
+                                 'Kernel panic - not syncing', vm=vm)
+        exec_command(self, 'mount -t sysfs sysfs /sys', vm=vm)
+        exec_command_and_wait_for_pattern(self,
+                                          'cat /sys/bus/pci/devices/*/uevent',
+                                          'PCI_ID=1000:0060', vm=vm)
+
+    def launch_server_startup(self, socket, *opts):
+        server_vm = self.get_vm()
+        server_vm.add_args('-machine', 'x-remote,vfio-user=on')
+        server_vm.add_args('-nodefaults')
+        server_vm.add_args('-device', 'megasas,id=sas1')
+        server_vm.add_args('-object', 'x-vfio-user-server,id=vfioobj1,'
+                           'type=unix,path='+socket+',device=sas1')
+        for opt in opts:
+            server_vm.add_args(opt)
+        server_vm.launch()
+        return server_vm
+
+    def launch_server_hotplug(self, socket):
+        server_vm = self.get_vm()
+        server_vm.add_args('-machine', 'x-remote,vfio-user=on')
+        server_vm.add_args('-nodefaults')
+        server_vm.launch()
+        server_vm.qmp('device_add', args_dict=None, conv_keys=None,
+                      driver='megasas', id='sas1')
+        obj_add_opts = {'qom-type': 'x-vfio-user-server',
+                        'id': 'vfioobj', 'device': 'sas1',
+                        'socket': {'type': 'unix', 'path': socket}}
+        server_vm.qmp('object-add', args_dict=obj_add_opts)
+        return server_vm
+
+    def launch_client(self, kernel_path, initrd_path, kernel_command_line,
+                      machine_type, socket, *opts):
+        client_vm = self.get_vm()
+        client_vm.set_console()
+        client_vm.add_args('-machine', machine_type)
+        client_vm.add_args('-accel', 'kvm')
+        client_vm.add_args('-cpu', 'host')
+        client_vm.add_args('-object',
+                           'memory-backend-memfd,id=sysmem-file,size=2G')
+        client_vm.add_args('--numa', 'node,memdev=sysmem-file')
+        client_vm.add_args('-m', '2048')
+        client_vm.add_args('-kernel', kernel_path,
+                           '-initrd', initrd_path,
+                           '-append', kernel_command_line)
+        client_vm.add_args('-device',
+                           'vfio-user-pci,socket='+socket)
+        for opt in opts:
+            client_vm.add_args(opt)
+        client_vm.launch()
+        return client_vm
+
+    def do_test_startup(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+        socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(socket):
+            os.remove(socket)
+        self.launch_server_startup(socket)
+        client = self.launch_client(kernel_path, initrd_path,
+                                    kernel_command_line, machine_type, socket)
+        self.validate_vm_launch(client)
+
+    def do_test_hotplug(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+        socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(socket):
+            os.remove(socket)
+        self.launch_server_hotplug(socket)
+        client = self.launch_client(kernel_path, initrd_path,
+                                    kernel_command_line, machine_type, socket)
+        self.validate_vm_launch(client)
+
+    def test_vfio_user_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test_startup(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
+    def test_vfio_user_aarch64(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=distro:ubuntu
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'rdinit=/bin/bash console=ttyAMA0')
+        machine_type = 'virt,gic-version=3'
+        self.do_test_startup(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
+    def test_vfio_user_hotplug_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test_hotplug(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
-- 
2.20.1


