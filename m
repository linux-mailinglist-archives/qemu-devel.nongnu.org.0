Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25ED43C970
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:18:54 +0200 (CEST)
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfhtN-0008LE-Ju
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKy-0001UY-Nj; Wed, 27 Oct 2021 07:43:21 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKu-00073q-Bt; Wed, 27 Oct 2021 07:43:19 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RBg9La012290; 
 Wed, 27 Oct 2021 11:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=sxz008/SYJp7Du6pULrcUMZoiovVSa99pSm+A5xKus8=;
 b=DPbhZiU3UNaj0HR5Ni4brr+2ULU2SdsHNSPbjp6A67znXclHWpJ2qwwl/r4XY4WeMB+g
 bgFtqCGvuwQzb/g4tYFWaA/oDZHHJaMrwxbapVDOgR2Dkw3l+In8ck3bdZ30WJ6OhfbH
 W3STqtTfhz3svkuV3THpCDQZKvhltfCSGP65e2UkdDU/oW0fHzFii+W9m2dWzG28ZHJi
 mK/wZ6jRabWEFqaAFl02bGouqC5mbMANlvND7eV308AT9mYX0g/ZbjeGBw4DvR24WlLw
 GzbnB2QIEe0iY+jm0wFmHmZPsOxsZwT+LmxeWRfeGrh9Lwc0Ak1UalgE5Yn/si2m70Br lA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fg1uwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RBfHRs159521;
 Wed, 27 Oct 2021 11:42:58 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by aserp3030.oracle.com with ESMTP id 3bx4g9sra2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uy7ezxJvcWakG0TjlT6lRBHGkevuRwRfS+1Kc3XtG4Dg04/VygEeyu2gTsT0hVaPsxwzR0JDsyr6lZxKCgn0yHYCkOY0237Zp93dJ11BPpVhbCMEJawGdZa7/SWNpXhwflyNFyWZFy0Q9lRu6tcCdaMwpfTuw5RlSTx6Ivgt2ohcutMimL/6yO7Tfd+qNksrJK0QH/qnzVXCHKK36V4Mz66lJyA+GO0HzrxJCvk4qyZgEEAT36KvXQCXa9VkY2n6HfaiGAIMioWnRCkWUnZdg15DPEW9VNH7YrRR5ZIab+h6OTywqQBpek6CAxUaWnp7+4NqcElrN8t4V7d5QOL/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxz008/SYJp7Du6pULrcUMZoiovVSa99pSm+A5xKus8=;
 b=KOVAcbbAGXNfX+heou02h7NfgnLEpWbm4mrjaPX2S3xmiBZB7K+5C1NQDgF3Qfc8ANPS/qHjqUGh3UxTKCPP6ueTd+hzotSt+S9ntscyzz149Po42Pi650qWfUxtqaO4fFWQbtjgUXZunhRwfS6qFzOkeQ7bmYPpFjptixVtg/EbNEdeuF74z4laEePw8QjwLWTslUnL5AWzYnMfVVFUci2kF55QVo5dgwHVX/Ik85fOpaQUDNer+gEITXoKnRaUzMmMytVmfHw5qi+h6ipVurrUnX7oK1RkN6MPwJhVjRkMfUMgVvR9wVd1ligXnovhF6SDBeyWajLhQsc0xAlSjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxz008/SYJp7Du6pULrcUMZoiovVSa99pSm+A5xKus8=;
 b=rRqw2JLJWNxhuEOS+NwnjdE1Ut/eWbjjA2gzfzcrFSQNdlkLk8D1WHwnUi/jO+6pU3aC+9xR8pBJGdAF59/U/IHFG/T79i211YpfdE28io8v2+ia6c6E8j5SRVNFt99aPjV+ryoKRbwoAY1Haj8b3WpUjPq2uMf9QYvlZvLc/HI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4744.namprd10.prod.outlook.com (2603:10b6:510:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 11:42:55 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 11:42:55 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 8/8] hmp: add virtio commands
Date: Wed, 27 Oct 2021 07:41:49 -0400
Message-Id: <1635334909-31614-9-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.40) by
 SJ0PR13CA0088.namprd13.prod.outlook.com (2603:10b6:a03:2c4::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Wed, 27 Oct 2021 11:42:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ebce783-4d6d-4715-06ec-08d9993eeacb
X-MS-TrafficTypeDiagnostic: PH0PR10MB4744:
X-Microsoft-Antispam-PRVS: <PH0PR10MB474472D2AEDA867899F2D170E8859@PH0PR10MB4744.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:312;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m/Z1J6QgNN8cnqo7jGc1sBTsUv45eptlkZuHJdi+kqCAspcF+7ro7D6t+kH2knFUshcGR7Q0eGfwGJ1s66ONeYZIvqa4VgPbgv3QfxIlLk+pXO/LQi5iW62XKAmTg7D8VI+FCkq2nm8QrDd763rl6W/H5S7QtJ4KKpT6f0ESsYRZjz1iy3LZdKLpqoSICRzXEV7HLtSJKNi5Y3CxHbYJOoMPTN+LRAe1f/yadffTPJRfKaOy4nNLqKe7LfKZ+UAS8V0W/njVO72zbXCvUN2fm7mT/W5KW1rFEMyQYW6h/2pfYBU8ljOPO7X9BhfeMtDyJd1X+/v2ELSq0L1VHLb6sU7zp2p7p7FkPhniuwxINzRduPj5TCgAlCKN1pjzKurkej8SJECB2+q6XMmvAS+UHniNGmEIPRlvWLXAfxAhKFv/Efbx0fAMereX1+y+gRt6yy2VbyDSQCSAfvtgTv3HEhPtG4P5z2dHigkYTV7XmzYD8O+Jdpn0b5t9fNN7W0PV09O9QfGvR3mHfgmwbD2HNgQlRBP9aRXnbF77CPU/C3Sh+208kEOm0D6rNTqZfxhVV/KbW+UA1xGm2R6QE3Dpo0dJ7JwJ3R9hWtvdixC9xNcCNxu4iT2y7R9Hz7WDG3zkFIh/TqwZcSlVfzxFvBRhY4X07weUqQcdB6yt51RtOTeFbmqSVPluFr+Ba85IQ3Bkq8nEtYaITRgjkqk7qwiMNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(44832011)(26005)(4326008)(316002)(38350700002)(38100700002)(8936002)(6916009)(956004)(36756003)(2616005)(2906002)(30864003)(86362001)(83380400001)(7416002)(5660300002)(52116002)(508600001)(6666004)(8676002)(186003)(66946007)(6486002)(7696005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+qQivth5UZqL6oKPi6/crLBy16senha/YwFQ90FkU41TzvAZV3XLiONBK92L?=
 =?us-ascii?Q?NH/AxxMY7ghGjRTO6LcHjss5/hFq7q7oqY6Sr2j8KokfXv3AYPDd8Q0QmEoZ?=
 =?us-ascii?Q?vyI62JJdLpLR7+VODGUsaOWKrfUuTGb+ZAg7WftZ/eK752C1jr5St+7wvrHM?=
 =?us-ascii?Q?+x+6OERoBz4kLH3OqEFm8pF+IMnTJ/GaxXcHH+3LbIR/x6J2LHj5lQD3UFKB?=
 =?us-ascii?Q?hj4WyvMVOBBSoCZJlMssfcpychdkMn5Bjf5sQ7LJmN2dvCDuajnpHvdmLTxh?=
 =?us-ascii?Q?LvreZ9cSqUR545YHD5g72d/uwLVZgt/6mnS19pLlJ79PMPhAvFzGEdzqINCU?=
 =?us-ascii?Q?z1+UoJV5UoY8hHr3OnnOuol+TB95sYg/101fCGNE3okGHaHxm22pMxMwLOi4?=
 =?us-ascii?Q?2iDzKkdp4j/fsUlbJKydVnXvhK84v05QyTBA6L3kQrI0/ZB5BjhggsKoRt6U?=
 =?us-ascii?Q?mzwKiEIoAlmKpydcAFvyASPxtjfvLfe7yrmIpEa6Dz131yGjhrNSb7XCkn5c?=
 =?us-ascii?Q?6FGs6zlekaMteh6SwqZMSTX2OWzNb1/Pk2icSPSy4nBfN5EuTtKvs6Eg7K1R?=
 =?us-ascii?Q?w19tBS5rjbuigzsEgI4OghebLdX0+bztjKHZnQh0ZN0UvpWi1bnfX91D8F0e?=
 =?us-ascii?Q?5Ri7zgzS/gyt9lN3V+4ERq6/5/UmzfToELRRxeh6yy/x1haxi2OvpLRl569q?=
 =?us-ascii?Q?G5WzyFB4lVkb9i3yydZCijEMTTZ0i7cQfcyVm+HciCtXPePC4B3noqDbWYxj?=
 =?us-ascii?Q?ow8dCTRvAFkX3A1mIBoVXwDODUgDa3L5N32spNrNbz4RHVNCozg414EXeYs3?=
 =?us-ascii?Q?X/X1HtxqXPc4Rah5OQEn/iiQSaNnex9kYDHw0m0oJY8AJZmtWI3jzU87kVos?=
 =?us-ascii?Q?B7ZneWzN2exlWZgbVmVGGIUErO4M1Sj5RBcj05w3T3AS1gKZzpv8Es2Fyobb?=
 =?us-ascii?Q?U5/Hqq8lA0dFTqUM7liC65RwCu4Bo5csHnqn9Y44Cu78VXQuXxhpNnaxTSnd?=
 =?us-ascii?Q?wfId0okYJBaBareoF7HM8alNfVuQl+w4BAnw5GlvE50qwumJd7bcViMePNos?=
 =?us-ascii?Q?7njrcHT+yGJrCk0qSuGuUFA1SnbSl2wyBl3D4ZtcDAomUhXSrZfEZ0SxCBwp?=
 =?us-ascii?Q?GZ8pZszyoi3zIC01KaSw7AYvoFFUnNJFazEZDQBw9LJMGEz/hjJO0TVw7p5M?=
 =?us-ascii?Q?K0i6gIfvJlTBccocInRFUP+VBCMtpnOjGwjEiAjvduXC2qUWvI5RyeElb9Fd?=
 =?us-ascii?Q?dbhfIVwyAWCBtEYkBSm7pl8owTVqFdifpmWRv+pxMFuaZF0xYwPKDmB06l23?=
 =?us-ascii?Q?d5YVxofxj/q2m9OTtbz0jL+9ClG/O33iNzRxDf+8p6SdrHIATne3mKhgyhhC?=
 =?us-ascii?Q?HzMLBV2GFn7OcRK0y6OG5nm29OX4kf1QtpjIgqQvld+1NAqffa3hvvKLQcy3?=
 =?us-ascii?Q?tSZ3E1hDUH3lwfyF9g8E4lmRf4fcLrGfTWV3Ey2MmXJ7uyzwWjSfmeiV6e7O?=
 =?us-ascii?Q?ZmH8E4S4sPDaCZ1F54RYe/osyyL1NCiO3CocqDcDKAGzrN35pH4BObCZEp52?=
 =?us-ascii?Q?Z9Tbspi4/o4qxjIxS8H7I9P/oqLShm0JaItRRztDHAuL0apaV4M7A+lrH+9y?=
 =?us-ascii?Q?i3yL1NTgmms4I5II5CVHG6w=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ebce783-4d6d-4715-06ec-08d9993eeacb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 11:42:55.7295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UN3BGmTnSjr+7enGJrJzvbeYg2cRfWE4zFU5Es2W2ms+FqywSzNUpmVcYJxAJwxM3Iv5aj5MLHPFqjtrMSymoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4744
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270071
X-Proofpoint-ORIG-GUID: Oe39SHbIS0R51TNSDXCSYSHBzP04UqRz
X-Proofpoint-GUID: Oe39SHbIS0R51TNSDXCSYSHBzP04UqRz
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This patch implements the HMP versions of the virtio QMP commands.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 docs/system/monitor.rst |   2 +
 hmp-commands-virtio.hx  | 250 ++++++++++++++++++++++++++++++++++
 hmp-commands.hx         |  10 ++
 hw/virtio/virtio.c      | 355 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/monitor/hmp.h   |   5 +
 meson.build             |   1 +
 monitor/misc.c          |  17 +++
 7 files changed, 640 insertions(+)
 create mode 100644 hmp-commands-virtio.hx

diff --git a/docs/system/monitor.rst b/docs/system/monitor.rst
index ff5c434..10418fc 100644
--- a/docs/system/monitor.rst
+++ b/docs/system/monitor.rst
@@ -21,6 +21,8 @@ The following commands are available:
 
 .. hxtool-doc:: hmp-commands.hx
 
+.. hxtool-doc:: hmp-commands-virtio.hx
+
 .. hxtool-doc:: hmp-commands-info.hx
 
 Integer expressions
diff --git a/hmp-commands-virtio.hx b/hmp-commands-virtio.hx
new file mode 100644
index 0000000..36aab94
--- /dev/null
+++ b/hmp-commands-virtio.hx
@@ -0,0 +1,250 @@
+HXCOMM Use DEFHEADING() to define headings in both help text and rST.
+HXCOMM Text between SRST and ERST is copied to the rST version and
+HXCOMM discarded from C version.
+HXCOMM
+HXCOMM DEF(command, args, callback, arg_string, help) is used to construct
+HXCOMM monitor info commands.
+HXCOMM
+HXCOMM HXCOMM can be used for comments, discarded from both rST and C.
+HXCOMM
+HXCOMM In this file, generally SRST fragments should have two extra
+HXCOMM spaces of indent, so that the documentation list item for "virtio cmd"
+HXCOMM appears inside the documentation list item for the top level
+HXCOMM "virtio" documentation entry. The exception is the first SRST
+HXCOMM fragment that defines that top level entry.
+
+SRST
+  ``virtio`` *subcommand*
+  Show various information about virtio
+
+  Example:
+
+  List all sub-commands::
+
+  (qemu) virtio
+  virtio query  -- List all available virtio devices
+  virtio status path -- Display status of a given virtio device
+  virtio queue-status path queue -- Display status of a given virtio queue
+  virtio vhost-queue-status path queue -- Display status of a given vhost queue
+  virtio queue-element path queue [index] -- Display element of a given virtio queue
+
+ERST
+
+  {
+    .name       = "query",
+    .args_type  = "",
+    .params     = "",
+    .help       = "List all available virtio devices",
+    .cmd        = hmp_virtio_query,
+    .flags      = "p",
+  },
+
+SRST
+  ``virtio query``
+  List all available virtio devices
+
+  Example:
+
+  List all available virtio devices in the machine::
+
+  (qemu) virtio query
+  /machine/peripheral/vsock0/virtio-backend [vhost-vsock]
+  /machine/peripheral/crypto0/virtio-backend [virtio-crypto]
+  /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
+  /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
+  /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]
+
+ERST
+
+  {
+    .name       = "status",
+    .args_type  = "path:s",
+    .params     = "path",
+    .help       = "Display status of a given virtio device",
+    .cmd        = hmp_virtio_status,
+    .flags      = "p",
+  },
+
+SRST
+  ``virtio status`` *path*
+  Display status of a given virtio device
+
+  Example:
+
+  Dump the status of virtio-net (vhost on)::
+
+  (qemu) virtio status /machine/peripheral-anon/device[1]/virtio-backend
+  /machine/peripheral-anon/device[1]/virtio-backend:
+    device_name:             virtio-net (vhost)
+    device_id:               1
+    vhost_started:           true
+    bus_name:                (null)
+    broken:                  false
+    disabled:                false
+    disable_legacy_check:    false
+    started:                 true
+    use_started:             true
+    start_on_kick:           false
+    use_guest_notifier_mask: true
+    vm_running:              true
+    num_vqs:                 3
+    queue_sel:               2
+    isr:                     1
+    endianness:              little
+    status: acknowledge, driver, features-ok, driver-ok
+    Guest features:   event-idx, indirect-desc, version-1
+                      ctrl-mac-addr, guest-announce, ctrl-vlan, ctrl-rx, ctrl-vq, status, mrg-rxbuf,
+                      host-ufo, host-ecn, host-tso6, host-tso4, guest-ufo, guest-ecn, guest-tso6,
+                      guest-tso4, mac, ctrl-guest-offloads, guest-csum, csum
+    Host features:    protocol-features, event-idx, indirect-desc, version-1, any-layout, notify-on-empty
+                      gso, ctrl-mac-addr, guest-announce, ctrl-rx-extra, ctrl-vlan, ctrl-rx, ctrl-vq,
+                      status, mrg-rxbuf, host-ufo, host-ecn, host-tso6, host-tso4, guest-ufo, guest-ecn,
+                      guest-tso6, guest-tso4, mac, ctrl-guest-offloads, guest-csum, csum
+    Backend features: protocol-features, event-idx, indirect-desc, version-1, any-layout, notify-on-empty
+                      gso, ctrl-mac-addr, guest-announce, ctrl-rx-extra, ctrl-vlan, ctrl-rx, ctrl-vq,
+                      status, mrg-rxbuf, host-ufo, host-ecn, host-tso6, host-tso4, guest-ufo, guest-ecn,
+                      guest-tso6, guest-tso4, mac, ctrl-guest-offloads, guest-csum, csum
+    VHost:
+      nvqs:           2
+      vq_index:       0
+      max_queues:     1
+      n_mem_sections: 4
+      n_tmp_sections: 4
+      backend_cap:    2
+      log_enabled:    false
+      log_size:       0
+      Features:          event-idx, indirect-desc, iommu-platform, version-1, any-layout, notify-on-empty
+                         log-all, mrg-rxbuf
+      Acked features:    event-idx, indirect-desc, version-1
+                         mrg-rxbuf
+      Backend features:
+      Protocol features:
+
+ERST
+
+  {
+    .name       = "queue-status",
+    .args_type  = "path:s,queue:i",
+    .params     = "path queue",
+    .help       = "Display status of a given virtio queue",
+    .cmd        = hmp_virtio_queue_status,
+    .flags      = "p",
+  },
+
+SRST
+  ``virtio queue-status`` *path* *queue*
+  Display status of a given virtio queue
+
+  Example:
+
+  Dump the status of the 6th queue of virtio-scsi::
+
+  (qemu) virtio queue-status /machine/peripheral-anon/device[2]/virtio-backend 5
+  /machine/peripheral-anon/device[2]/virtio-backend:
+    device_name:          virtio-scsi
+    queue_index:          5
+    inuse:                0
+    used_idx:             605
+    signalled_used:       605
+    signalled_used_valid: true
+    last_avail_idx:       605
+    shadow_avail_idx:     605
+    VRing:
+      num:          256
+      num_default:  256
+      align:        4096
+      desc:         0x000000011f0bc000
+      avail:        0x000000011f0bd000
+      used:         0x000000011f0bd240
+
+ERST
+
+  {
+    .name       = "vhost-queue-status",
+    .args_type  = "path:s,queue:i",
+    .params     = "path queue",
+    .help       = "Display status of a given vhost queue",
+    .cmd        = hmp_vhost_queue_status,
+    .flags      = "p",
+  },
+
+SRST
+  ``virtio vhost-queue-status`` *path* *queue*
+  Display status of a given vhost queue
+
+  Example:
+
+  Dump the status of the 2nd queue of vhost-vsock::
+
+  (qemu) virtio vhost-queue-status /machine/peripheral/vsock0/virtio-backend 1
+  /machine/peripheral/vsock0/virtio-backend:
+    device_name:          vhost-vsock (vhost)
+    kick:                 0
+    call:                 0
+    VRing:
+      num:         128
+      desc:        0x00007f44fe5b2000
+      desc_phys:   0x000000011f3fb000
+      desc_size:   2048
+      avail:       0x00007f44fe5b2800
+      avail_phys:  0x000000011f3fb800
+      avail_size:  262
+      used:        0x00007f44fe5b2940
+      used_phys:   0x000000011f3fb940
+      used_size:   1030
+
+ERST
+
+  {
+    .name       = "queue-element",
+    .args_type  = "path:s,queue:i,index:i?",
+    .params     = "path queue [index]",
+    .help       = "Display element of a given virtio queue",
+    .cmd        = hmp_virtio_queue_element,
+    .flags      = "p",
+  },
+
+SRST
+  ``virtio queue-element`` *path* *queue* [*index*]
+  Display element of a given virtio queue
+
+  Example:
+
+  Dump the information of the head element of the first queue of
+  virtio-net (vhost on)::
+
+  (qemu) virtio queue-element /machine/peripheral-anon/device[1]/virtio-backend 0
+  /machine/peripheral-anon/device[1]/virtio-backend:
+    device_name: virtio-net
+    index:       0
+    desc:
+      ndescs:  1
+      descs:   addr 0x1312c8000 len 1536 (write)
+    avail:
+      flags: 0
+      idx:   256
+      ring:  0
+    used:
+      flags: 0
+      idx:   32
+
+  Since device[1] is a virtio-net device, we can see the MAC address
+  of the NIC in the element buffer::
+
+  (qemu) xp/128bx 0x1312c8000
+  00000001312c8000: 0x01 0x00 0x00 0x00 0x00 0x00 0x22 0x00
+  00000001312c8008: 0x06 0x00 0x01 0x00 0x52 0x54 0x00 0x12
+  00000001312c8010: 0x34 0x56 0xe6 0x94 0xf2 0xc1 0x51 0x2a
+  ...
+
+  [root@guest: ~]# ip link show eth0
+  2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode
+  DEFAULT group default qlen 1000
+    link/ether 52:54:00:12:34:56 brd ff:ff:ff:ff:ff:ff
+
+  And we can see the MAC address of the gateway immediately after::
+
+  [root@guest: ~]# arp -a
+  gateway (192.168.53.1) at e6:94:f2:c1:51:2a [ether] on eth0
+
+ERST
diff --git a/hmp-commands.hx b/hmp-commands.hx
index cf723c6..315e629 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1719,6 +1719,16 @@ SRST
 ERST
 
     {
+        .name       = "virtio",
+        .args_type  = "name:S?",
+        .params     = "[cmd]",
+        .help       = "show various information about virtio",
+        .cmd        = hmp_virtio_help,
+        .sub_table  = hmp_virtio_cmds,
+        .flags      = "p",
+    },
+
+    {
         .name       = "info",
         .args_type  = "item:s?",
         .params     = "[subcommand]",
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 8c8a987..20e1dcb 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -15,6 +15,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-virtio.h"
 #include "qapi/qapi-visit-virtio.h"
+#include "qapi/qmp/qdict.h"
 #include "cpu.h"
 #include "trace.h"
 #include "qemu/error-report.h"
@@ -31,6 +32,8 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/vhost_types.h"
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
 #include CONFIG_DEVICES
 
 /* QAPI list of VirtIODevices */
@@ -4035,6 +4038,31 @@ VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
     return list;
 }
 
+void hmp_virtio_query(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    VirtioInfoList *list = qmp_x_debug_query_virtio(&err);
+    VirtioInfoList *node;
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    if (list == NULL) {
+        monitor_printf(mon, "No VirtIO devices\n");
+        return;
+    }
+
+    node = list;
+    while (node) {
+        monitor_printf(mon, "%s [%s]\n", node->value->path,
+                       node->value->type);
+        node = node->next;
+    }
+    qapi_free_VirtioInfoList(list);
+}
+
 static VirtIODevice *virtio_device_find(const char *path)
 {
     VirtIODevice *vdev;
@@ -4074,6 +4102,116 @@ static VirtIODevice *virtio_device_find(const char *path)
         list;                                       \
     })
 
+#define DUMP_FEATURES(type, field)                                        \
+    do {                                                                  \
+        type##FeatureList *list = features->u.field.features;             \
+        if (list) {                                                       \
+            monitor_printf(mon, "                    ");                  \
+            while (list) {                                                \
+                monitor_printf(mon, "%s", type##Feature_str(list->value));\
+                list = list->next;                                        \
+                if (list != NULL) {                                       \
+                    monitor_printf(mon, ", ");                            \
+                }                                                         \
+            }                                                             \
+            monitor_printf(mon, "\n");                                    \
+        }                                                                 \
+    } while (0)
+
+static void hmp_virtio_dump_protocols(Monitor *mon,
+                                      VhostDeviceProtocols *pcol)
+{
+    VhostProtocolFeatureList *pcol_list = pcol->features;
+    while (pcol_list) {
+        monitor_printf(mon, "%s",
+                       VhostProtocolFeature_str(pcol_list->value));
+        pcol_list = pcol_list->next;
+        if (pcol_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (pcol->has_unknown_protocols) {
+        monitor_printf(mon, "  unknown-protocols(0x%016"PRIx64")\n",
+                       pcol->unknown_protocols);
+    }
+}
+
+static void hmp_virtio_dump_status(Monitor *mon,
+                                   VirtioDeviceStatus *status)
+{
+    VirtioConfigStatusList *status_list = status->dev_status;
+    while (status_list) {
+        monitor_printf(mon, "%s",
+                       VirtioConfigStatus_str(status_list->value));
+        status_list = status_list->next;
+        if (status_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (status->has_unknown_statuses) {
+        monitor_printf(mon, "  unknown-statuses(0x%016"PRIx32")\n",
+                       status->unknown_statuses);
+    }
+}
+
+static void hmp_virtio_dump_features(Monitor *mon,
+                                     VirtioDeviceFeatures *features)
+{
+    VirtioTransportFeatureList *transport_list = features->transport;
+    while (transport_list) {
+        monitor_printf(mon, "%s",
+                       VirtioTransportFeature_str(transport_list->value));
+        transport_list = transport_list->next;
+        if (transport_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    switch (features->type) {
+    case VIRTIO_TYPE_VIRTIO_SERIAL:
+        DUMP_FEATURES(VirtioSerial, virtio_serial);
+        break;
+    case VIRTIO_TYPE_VIRTIO_BLK:
+        DUMP_FEATURES(VirtioBlk, virtio_blk);
+        break;
+    case VIRTIO_TYPE_VIRTIO_GPU:
+        DUMP_FEATURES(VirtioGpu, virtio_gpu);
+        break;
+    case VIRTIO_TYPE_VIRTIO_NET:
+        DUMP_FEATURES(VirtioNet, virtio_net);
+        break;
+    case VIRTIO_TYPE_VIRTIO_SCSI:
+        DUMP_FEATURES(VirtioScsi, virtio_scsi);
+        break;
+    case VIRTIO_TYPE_VIRTIO_BALLOON:
+        DUMP_FEATURES(VirtioBalloon, virtio_balloon);
+        break;
+    case VIRTIO_TYPE_VIRTIO_IOMMU:
+        DUMP_FEATURES(VirtioIommu, virtio_iommu);
+        break;
+    case VIRTIO_TYPE_VIRTIO_INPUT:
+        DUMP_FEATURES(VirtioInput, virtio_input);
+        break;
+    case VIRTIO_TYPE_VHOST_USER_FS:
+        DUMP_FEATURES(VhostUserFs, vhost_user_fs);
+        break;
+    case VIRTIO_TYPE_VHOST_VSOCK:
+        DUMP_FEATURES(VhostVsock, vhost_vsock);
+        break;
+    case VIRTIO_TYPE_VIRTIO_CRYPTO:
+        DUMP_FEATURES(VirtioCrypto, virtio_crypto);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (features->has_unknown_features) {
+        monitor_printf(mon, "  unknown-features(0x%016"PRIx64")\n",
+                       features->unknown_features);
+    }
+}
+
 static VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
 {
     VirtioDeviceStatus *status;
@@ -4297,6 +4435,86 @@ VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
     return status;
 }
 
+void hmp_virtio_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    VirtioStatus *s = qmp_x_debug_virtio_status(path, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:             %s %s\n",
+                   s->name, s->has_vhost_dev ? "(vhost)" : "");
+    monitor_printf(mon, "  device_id:               %d\n", s->device_id);
+    monitor_printf(mon, "  vhost_started:           %s\n",
+                   s->vhost_started ? "true" : "false");
+    monitor_printf(mon, "  bus_name:                %s\n", s->bus_name);
+    monitor_printf(mon, "  broken:                  %s\n",
+                   s->broken ? "true" : "false");
+    monitor_printf(mon, "  disabled:                %s\n",
+                   s->disabled ? "true" : "false");
+    monitor_printf(mon, "  disable_legacy_check:    %s\n",
+                   s->disable_legacy_check ? "true" : "false");
+    monitor_printf(mon, "  started:                 %s\n",
+                   s->started ? "true" : "false");
+    monitor_printf(mon, "  use_started:             %s\n",
+                   s->use_started ? "true" : "false");
+    monitor_printf(mon, "  start_on_kick:           %s\n",
+                   s->start_on_kick ? "true" : "false");
+    monitor_printf(mon, "  use_guest_notifier_mask: %s\n",
+                   s->use_guest_notifier_mask ? "true" : "false");
+    monitor_printf(mon, "  vm_running:              %s\n",
+                   s->vm_running ? "true" : "false");
+    monitor_printf(mon, "  num_vqs:                 %ld\n", s->num_vqs);
+    monitor_printf(mon, "  queue_sel:               %d\n",
+                   s->queue_sel);
+    monitor_printf(mon, "  isr:                     %d\n", s->isr);
+    monitor_printf(mon, "  endianness:              %s\n",
+                   VirtioStatusEndianness_str(s->device_endian));
+    monitor_printf(mon, "  status: ");
+    hmp_virtio_dump_status(mon, s->status);
+    monitor_printf(mon, "  Guest features:   ");
+    hmp_virtio_dump_features(mon, s->guest_features);
+    monitor_printf(mon, "  Host features:    ");
+    hmp_virtio_dump_features(mon, s->host_features);
+    monitor_printf(mon, "  Backend features: ");
+    hmp_virtio_dump_features(mon, s->backend_features);
+
+    if (s->has_vhost_dev) {
+        monitor_printf(mon, "  VHost:\n");
+        monitor_printf(mon, "    nvqs:           %d\n",
+                       s->vhost_dev->nvqs);
+        monitor_printf(mon, "    vq_index:       %ld\n",
+                       s->vhost_dev->vq_index);
+        monitor_printf(mon, "    max_queues:     %lu\n",
+                       s->vhost_dev->max_queues);
+        monitor_printf(mon, "    n_mem_sections: %ld\n",
+                       s->vhost_dev->n_mem_sections);
+        monitor_printf(mon, "    n_tmp_sections: %ld\n",
+                       s->vhost_dev->n_tmp_sections);
+        monitor_printf(mon, "    backend_cap:    %lu\n",
+                       s->vhost_dev->backend_cap);
+        monitor_printf(mon, "    log_enabled:    %s\n",
+                       s->vhost_dev->log_enabled ? "true" : "false");
+        monitor_printf(mon, "    log_size:       %lu\n",
+                       s->vhost_dev->log_size);
+        monitor_printf(mon, "    Features:          ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->features);
+        monitor_printf(mon, "    Acked features:    ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->acked_features);
+        monitor_printf(mon, "    Backend features:  ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->backend_features);
+        monitor_printf(mon, "    Protocol features: ");
+        hmp_virtio_dump_protocols(mon, s->vhost_dev->protocol_features);
+    }
+
+    qapi_free_VirtioStatus(s);
+}
+
 VirtVhostQueueStatus *qmp_x_debug_virtio_vhost_queue_status(const char *path,
                                                             uint16_t queue,
                                                             Error **errp)
@@ -4341,6 +4559,41 @@ VirtVhostQueueStatus *qmp_x_debug_virtio_vhost_queue_status(const char *path,
     return status;
 }
 
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtVhostQueueStatus *s =
+        qmp_x_debug_virtio_vhost_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s (vhost)\n",
+                   s->device_name);
+    monitor_printf(mon, "  kick:                 %ld\n", s->kick);
+    monitor_printf(mon, "  call:                 %ld\n", s->call);
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:         %ld\n", s->num);
+    monitor_printf(mon, "    desc:        0x%016"PRIx64"\n", s->desc);
+    monitor_printf(mon, "    desc_phys:   0x%016"PRIx64"\n",
+                   s->desc_phys);
+    monitor_printf(mon, "    desc_size:   %"PRId32"\n", s->desc_size);
+    monitor_printf(mon, "    avail:       0x%016"PRIx64"\n", s->avail);
+    monitor_printf(mon, "    avail_phys:  0x%016"PRIx64"\n",
+                   s->avail_phys);
+    monitor_printf(mon, "    avail_size:  %"PRId32"\n", s->avail_size);
+    monitor_printf(mon, "    used:        0x%016"PRIx64"\n", s->used);
+    monitor_printf(mon, "    used_phys:   0x%016"PRIx64"\n",
+                   s->used_phys);
+    monitor_printf(mon, "    used_size:   %"PRId32"\n", s->used_size);
+
+    qapi_free_VirtVhostQueueStatus(s);
+}
 VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
                                                  uint16_t queue,
                                                  Error **errp)
@@ -4400,6 +4653,51 @@ VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
     return status;
 }
 
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtQueueStatus *s = qmp_x_debug_virtio_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s\n", s->device_name);
+    monitor_printf(mon, "  queue_index:          %d\n", s->queue_index);
+    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
+    monitor_printf(mon, "  used_idx:             %d\n", s->used_idx);
+    monitor_printf(mon, "  signalled_used:       %d\n",
+                   s->signalled_used);
+    monitor_printf(mon, "  signalled_used_valid: %s\n",
+                   s->signalled_used_valid ? "true" : "false");
+    if (s->has_last_avail_idx) {
+        monitor_printf(mon, "  last_avail_idx:       %d\n",
+                       s->last_avail_idx);
+    }
+    if (s->has_shadow_avail_idx) {
+        monitor_printf(mon, "  shadow_avail_idx:     %d\n",
+                       s->shadow_avail_idx);
+    }
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:          %"PRId32"\n", s->vring_num);
+    monitor_printf(mon, "    num_default:  %"PRId32"\n",
+                   s->vring_num_default);
+    monitor_printf(mon, "    align:        %"PRId32"\n",
+                   s->vring_align);
+    monitor_printf(mon, "    desc:         0x%016"PRIx64"\n",
+                   s->vring_desc);
+    monitor_printf(mon, "    avail:        0x%016"PRIx64"\n",
+                   s->vring_avail);
+    monitor_printf(mon, "    used:         0x%016"PRIx64"\n",
+                   s->vring_used);
+
+    qapi_free_VirtQueueStatus(s);
+}
+
 static VirtioRingDescFlagsList *qmp_decode_vring_desc_flags(uint16_t flags)
 {
     VirtioRingDescFlagsList *list = NULL;
@@ -4541,6 +4839,63 @@ done:
     return element;
 }
 
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    int index = qdict_get_try_int(qdict, "index", -1);
+    VirtioQueueElement *e;
+    VirtioRingDescList *list;
+
+    e = qmp_x_debug_virtio_queue_element(path, queue, index != -1,
+                                               index, &err);
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name: %s\n", e->device_name);
+    monitor_printf(mon, "  index:       %d\n", e->index);
+    monitor_printf(mon, "  desc:\n");
+    monitor_printf(mon, "    ndescs:  %d\n", e->ndescs);
+    monitor_printf(mon, "    descs:   ");
+
+    list = e->descs;
+    while (list) {
+        monitor_printf(mon, "addr 0x%"PRIx64" len %d", list->value->addr,
+                       list->value->len);
+        if (list->value->flags) {
+            VirtioRingDescFlagsList *flag = list->value->flags;
+            monitor_printf(mon, " (");
+            while (flag) {
+                monitor_printf(mon, "%s",
+                               VirtioRingDescFlags_str(flag->value));
+                flag = flag->next;
+                if (flag) {
+                    monitor_printf(mon, ", ");
+                }
+            }
+            monitor_printf(mon, ")");
+        }
+        list = list->next;
+        if (list) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    monitor_printf(mon, "  avail:\n");
+    monitor_printf(mon, "    flags: %d\n", e->avail->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->avail->idx);
+    monitor_printf(mon, "    ring:  %d\n", e->avail->ring);
+    monitor_printf(mon, "  used:\n");
+    monitor_printf(mon, "    flags: %d\n", e->used->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->used->idx);
+
+    qapi_free_VirtioQueueElement(e);
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 6bc2763..cc80686 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -94,6 +94,11 @@ void hmp_qom_list(Monitor *mon, const QDict *qdict);
 void hmp_qom_get(Monitor *mon, const QDict *qdict);
 void hmp_qom_set(Monitor *mon, const QDict *qdict);
 void hmp_info_qom_tree(Monitor *mon, const QDict *dict);
+void hmp_virtio_query(Monitor *mon, const QDict *qdict);
+void hmp_virtio_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict);
 void object_add_completion(ReadLineState *rs, int nb_args, const char *str);
 void object_del_completion(ReadLineState *rs, int nb_args, const char *str);
 void device_add_completion(ReadLineState *rs, int nb_args, const char *str);
diff --git a/meson.build b/meson.build
index 2c5b53c..179f64a 100644
--- a/meson.build
+++ b/meson.build
@@ -2342,6 +2342,7 @@ if have_system
   hx_headers += [
     ['hmp-commands.hx', 'hmp-commands.h'],
     ['hmp-commands-info.hx', 'hmp-commands-info.h'],
+    ['hmp-commands-virtio.hx', 'hmp-commands-virtio.h'],
   ]
 endif
 foreach d : hx_headers
diff --git a/monitor/misc.c b/monitor/misc.c
index ffe7966..5e4cd88 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include CONFIG_DEVICES
 #include "monitor-internal.h"
 #include "monitor/qdev.h"
 #include "hw/usb.h"
@@ -219,6 +220,15 @@ static void hmp_info_help(Monitor *mon, const QDict *qdict)
     help_cmd(mon, "info");
 }
 
+static void hmp_virtio_help(Monitor *mon, const QDict *qdict)
+{
+#if defined(CONFIG_VIRTIO)
+    help_cmd(mon, "virtio");
+#else
+    monitor_printf(mon, "Virtio is disabled\n");
+#endif
+}
+
 static void monitor_init_qmp_commands(void)
 {
     /*
@@ -1433,6 +1443,13 @@ static HMPCommand hmp_info_cmds[] = {
     { NULL, NULL, },
 };
 
+static HMPCommand hmp_virtio_cmds[] = {
+#if defined(CONFIG_VIRTIO)
+#include "hmp-commands-virtio.h"
+#endif
+    { NULL, NULL, },
+};
+
 /* hmp_cmds and hmp_info_cmds would be sorted at runtime */
 HMPCommand hmp_cmds[] = {
 #include "hmp-commands.h"
-- 
1.8.3.1


