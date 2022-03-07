Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A604CFFB8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:13:36 +0100 (CET)
Received: from localhost ([::1]:60224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDB9-0001zT-SW
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:13:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7g-0007Sf-Po; Mon, 07 Mar 2022 08:10:00 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:50152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7Q-0000SK-4l; Mon, 07 Mar 2022 08:09:57 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227C4lqX009900; 
 Mon, 7 Mar 2022 13:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Jmlg8kLLObSjMw65EBnpH+hE3PgRU8IKLMQ1Dfr/fQw=;
 b=HHHPiOydmJrBg9fqCNNOjL1rnl518ggAinPc3vzIwCJTyeJ68kApaaVjUu+O7BGQPIqX
 viaW7xFLZiYaF5RBVYH7xawBVeiW2zVKD8YCtsAFW3F5pGLRjRvJ4JBAdjKYhT3InSyY
 GWnk4ZPLNoE2IMaePtVpuXuUCROrKJZ27J8EdwKpRNRjCXWYDIqrgoYhYheQhy0aet8X
 odA2PZ1LbgiF5VgirkgmT9A+KnPckDzwjs9ABqKVBUYMWDkNyRwCEjxIbUuwRZqS/x0z
 GouPkIsuVYy1HpoZD3msGXFXpuJSmaKjwmbaOQMqIUmrbzMGxzzfXBF+Q83CI//XzJ00 ug== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekyraknm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227D56sQ070204;
 Mon, 7 Mar 2022 13:09:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by aserp3020.oracle.com with ESMTP id 3ekyp15pbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RveugmoZwhLLhy6Y8c6FODN2vB2d9n2C/LgLWXQDSmoXQ1GXNcfsap4QKYyig+cTjsThFNgrg/YXqXJ6wHwEQTpnS5hebIXQ1B0EEOuudQv9RhjPlO/gYFkN7zCmnYwxW95uYDTiNnId3nIoMKzkLcS9tinCD9j5ksM+bZJhEwOqsAs8lI1Cuvh2lnIcET67+Nh1q6m5oFfQBJKrVNXC+3h3T/wLUEY+tc8fUosuuXR8Wy5eP7gVYx9ZNDcjdluhtzZhtgApO3l6dtZoH4GTnYP12P2Aqo4MHXToB+LuahA+lStNxeQG+xJk3puTkN57cyGJ8xW8yul3u/owYsFsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jmlg8kLLObSjMw65EBnpH+hE3PgRU8IKLMQ1Dfr/fQw=;
 b=f1XA6ZDfNUDV3v9IQFDXwvSl7XlqzrYcf8mhnINFLRIRUKrScdhnIUgXbn4gtgf7pnJmsF2oCarCzlNWEbFoYcCEtjTvb7O/5jXz2ZNXI6GHk8JdkZLGKRvh6Bi2rsOI/CDAPjXLSzwTOlZzajjuSXFwEs4D3ctTdUNUtGKS3qYMWa9D+WsfZK0OjztsFefKb7Oj2xeuAFNq3CTnKJrPbkGhhfekr8OyUiDOVT9mzaqTpr5AeBqAMKryDrEVJEwdfgA6x2+gNnfbJ7FP4gC8TxIgoOv1ymTnIz5eWGFDFHRV5X1H7ZluStL60uBLbYHpHaNZiCdfI4Q0icdy7hSGKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jmlg8kLLObSjMw65EBnpH+hE3PgRU8IKLMQ1Dfr/fQw=;
 b=VZtW/5F8So2e/T/iLIT/wHDzR+f3HTg0rLtx0mBVZ4rUB8FsW/R6wLI8j3OVstl9dHB11uIfp2qP8PFgAqcfYKqPacDkIQ/7jWm8PZS3jqs9re2odgWIkhzqKNXbnJXl/k3xe4aRkLeaAeyuJWZKelaLI70C803opBTimcr0HqM=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM6PR10MB2619.namprd10.prod.outlook.com (2603:10b6:5:aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 13:09:22 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85%7]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 13:09:22 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 3/8] qmp: add QMP command x-query-virtio
Date: Mon,  7 Mar 2022 08:08:36 -0500
Message-Id: <1646658521-31652-4-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
References: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0034.namprd07.prod.outlook.com
 (2603:10b6:803:2d::15) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e01055f-49a6-4c6b-97f8-08da003bb2a2
X-MS-TrafficTypeDiagnostic: DM6PR10MB2619:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB2619472BB9FFE89A1B82FA19E8089@DM6PR10MB2619.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QDgBGMjwVkBdjg68YNqru1DM/2rACWecPLgZeyYmgw+AV98akLZhApbfqCnWQHGbXCogm7d+XkR5eApIIAmLerUa7Csf2IqZSAZf4m77QWVilIDJdybCXrayzLWeXSFe7X95eaMTYwdvyL6EOpMKABlmRjQzAdXchIhIVKULr7Tab+Hp/XKU/SlKevcnmkcn+ayrT2tOGM/AYV24S+2S/jMbaF/saKKw5ptw5r0eXSDodQOWIj2slg/eDF+1YNjrPpCYyQ6Efe1ItwxQ30FBmW7GThRIynikV2o41PvpX1JKj7SR5ck4fH7X3naSlxtMN34AGjuO4kNvFO5plOiifPX/ujxYqFsTNJi5q8XXgoHSUJLj60xA3QlbfloQ7jOf6zmJYJuzoaayHdH3qq4nL2mzwPLhmymoLvJRsHoTFHNSzCgTpgMx4tjES/R6Wl9RsIKIrl+KrAHj9/VSNQxtgrQ0hg1/YcBc3FqMk4kzeAe78EMroUNKnAumkS0HVV9MbXiBv7zO/PrnNWe+0ElUOky89v4AIcaKGNHYMLfBHz+hAo4wRXQL5HRb4ZK9xt2LeeBGeV0IXXvg4b5DpFTx5eNv0Gf7kH73zueApJunC3TIk8Faq1x79S3U1kFqCUfy9fLeDInpkGKuwFMXqUOBAejUGBhWLIQhlgFrlka03NCmDKnQKjABmARVV7gO6XcJNh3CdD3EBBlE8cVmU6GQqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(66946007)(508600001)(66556008)(66476007)(8676002)(6486002)(83380400001)(5660300002)(8936002)(6506007)(6666004)(36756003)(52116002)(38100700002)(26005)(38350700002)(44832011)(7416002)(86362001)(316002)(186003)(2906002)(6512007)(2616005)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M3AauvrHP4kch3WJobkDL0MwgJhSehbjrpK6eRreMfqOf1kvNT+rWDKhHwVk?=
 =?us-ascii?Q?dV1rWsnLTdJoNDRORbPEkYXC5nYl60dLyp0+hataZYUs/SYMhY5DLeDjscFY?=
 =?us-ascii?Q?sO2F9STQsrbDC60J1iuKenViFIlQavV8v8raPV0/EorzzCWTFd/TyRwJCmQc?=
 =?us-ascii?Q?CL4q72CpWHlv17t64gPNHmToFo1ggI18ZAO5tl7EUnKIglVLMVDta72qqBgx?=
 =?us-ascii?Q?oyvepSSaRq3m8wGShpG1Q72KWxNXiQiscPk+YCPFq1UuwjtqCNfUdQHOXv66?=
 =?us-ascii?Q?Hjel7LaalTk0+cOG21PykmlU+Y68HGlm5St7u0BubwfswNdFJBkYa2GnR6Iy?=
 =?us-ascii?Q?b6BkXtiL9dc6y25bp6zlcnMqp0NmpDa3WNQxCyQ72UtguZzhvpCVjgTg/xa6?=
 =?us-ascii?Q?U/+Q55khRB8h5yuUgvPLK2M9/XX6tQJyR5qkzIqxKc8BN2Cd88bPzy6GtABf?=
 =?us-ascii?Q?xdYNeZqq+yiPWdhh/ucGMv/JuwwDdoQgDmycqDcGhxOGWTHZTpqPTMLv+Rkb?=
 =?us-ascii?Q?NmVt7s6gQh2IBPxRAYcDMcFgnWaxu26OGOHLOR7fW675Ym8M0pPPpTS7S8gk?=
 =?us-ascii?Q?PkiOzq2UJA7VitZK7o+7fV33IG4OGxPCrEvTlXwgTURdES0oIXqfS+OCkoQ6?=
 =?us-ascii?Q?jqw6qUDTb8OZixn8hp4lYAD0rLkHSDtKglAzx/ltZEnexmixNCmVz1rzDrJO?=
 =?us-ascii?Q?yNZ200PrhGkLf/NsV2rJnLEvdxG2HXTYO/q7X4VIuXfTQ4TAk1KZ7ZZWn72q?=
 =?us-ascii?Q?hEmM3inKSQnb9/e3zdbzZU/2EliTXG4hxCsy0F2g62fA5SmU1MLJmVNnXoSi?=
 =?us-ascii?Q?iJZWDgcZJM1auLGHHQI3QlW4IvK2qVvgK0trNUj5KqUvUXWk4PQKKGauTP8x?=
 =?us-ascii?Q?uDxBgYinO7Fqwlwhlntqm5VNvFNt7RLeWqEscluu3/ubUjRlbNUreTCJ1Mpd?=
 =?us-ascii?Q?UKENeD20balPYYtp1P+b60ZTVP5Om/VkYs/0pKyOTA8CSbcZ2UF5zEKRbDTU?=
 =?us-ascii?Q?2CCpFkji99MhX+RJxHb2JnK0b1Lxpt7YCKiYpHdgKSZdi0X9xw/TZ28TTo6/?=
 =?us-ascii?Q?j1I0LIH/mWiScGzGlCQG2sw9L9kyMXqznu7SrIXV40RzAEvWe4BPw5unw+jC?=
 =?us-ascii?Q?3w6AaN+FYcsNKOULZ+UljaERHWICjNcA9B4l2NM3KLZN1bEbnX6JEkstzdcy?=
 =?us-ascii?Q?tR33sRrGcga7A+JegVOpeI5LrXFSdDwJRJd8WZgAJsA49hOvcLfDrEyGfllR?=
 =?us-ascii?Q?3DZ6+QWz8nFXdBaEidQAw2+wpOFZbUcsNKx4EECcgwBGgQhlLGVn50PlquUA?=
 =?us-ascii?Q?NsnoZUQjgl+PfRMuDnZo4dDFuC3br2FwpmQd688q0pfLEltDkib0Tvnj+67i?=
 =?us-ascii?Q?jL66cRMfqYVC5kEtJaC4QDfIlRaGpTYkk8RDB8hLXSUsePk4Yt9grXv9dTEP?=
 =?us-ascii?Q?g1/2PYRXUythJWlXzYJqBPBJaT1T+KWIa4ZVqTnFEk4iu0oe/0rygWl66En7?=
 =?us-ascii?Q?pdjACgFu5jmXSgIhHMD3qObxfxlr4silHy+wT4ktHjPDBR+CbEeV6Azv6N5g?=
 =?us-ascii?Q?TBTm+FSf4Yj7F+1gkxOwge0cy+lhjMlt4Qt75XDlyxDovjwOV3KEJIB2uOAy?=
 =?us-ascii?Q?lZkrm/iKX33XCjUBkpJsuQk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e01055f-49a6-4c6b-97f8-08da003bb2a2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:09:22.7666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwGBJATHwovn3o0Y4wtgEIopfHWrOG8E0nCJksGIgdc/Zu6xdbEnLFFOWqMX50CoDIZZiRr4EZOsE2L8hOMqIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2619
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070076
X-Proofpoint-GUID: ZQv_I4AWe0uRkbcrUdWj_jqBS_UBPgFv
X-Proofpoint-ORIG-GUID: ZQv_I4AWe0uRkbcrUdWj_jqBS_UBPgFv
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
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

This new command lists all the instances of VirtIODevices with
their canonical QOM path and name.

[Jonah: @virtio_list duplicates information that already exists in
 the QOM composition tree. However, extracting necessary information
 from this tree seems to be a bit convoluted.

 Instead, we still create our own list of realized virtio devices
 but use @qmp_qom_get with the device's canonical QOM path to confirm
 that the device exists and is realized. If the device exists but
 is actually not realized, then we remove it from our list (for
 synchronicity to the QOM composition tree).

 Also, the QMP command @x-query-virtio is redundant as @qom-list
 and @qom-get are sufficient to search '/machine/' for realized
 virtio devices. However, @x-query-virtio is much more convenient
 in listing realized virtio devices.]

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/meson.build      |  2 ++
 hw/virtio/virtio-stub.c    | 14 ++++++++++
 hw/virtio/virtio.c         | 44 ++++++++++++++++++++++++++++++
 include/hw/virtio/virtio.h |  1 +
 qapi/meson.build           |  1 +
 qapi/qapi-schema.json      |  1 +
 qapi/virtio.json           | 68 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 132 insertions(+)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 521f7d6..d893f5f 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -6,8 +6,10 @@ softmmu_virtio_ss.add(when: 'CONFIG_VHOST', if_false: files('vhost-stub.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
 softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
 
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
 
 virtio_ss = ss.source_set()
 virtio_ss.add(files('virtio.c'))
diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
new file mode 100644
index 0000000..05a81ed
--- /dev/null
+++ b/hw/virtio/virtio-stub.c
@@ -0,0 +1,14 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+
+static void *qmp_virtio_unsupported(Error **errp)
+{
+    error_setg(errp, "Virtio is disabled");
+    return NULL;
+}
+
+VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 443475b..dd02909 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,12 +13,18 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-commands-qom.h"
+#include "qapi/qapi-visit-virtio.h"
+#include "qapi/qmp/qjson.h"
 #include "cpu.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
+#include "qom/object_interfaces.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
 #include "qemu/atomic.h"
@@ -29,6 +35,9 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 
+/* QAPI list of realized VirtIODevices */
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3686,6 +3695,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
     vdev->listener.commit = virtio_memory_listener_commit;
     vdev->listener.name = "virtio";
     memory_listener_register(&vdev->listener, vdev->dma_as);
+    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
 }
 
 static void virtio_device_unrealize(DeviceState *dev)
@@ -3700,6 +3710,7 @@ static void virtio_device_unrealize(DeviceState *dev)
         vdc->unrealize(dev);
     }
 
+    QTAILQ_REMOVE(&virtio_list, vdev, next);
     g_free(vdev->bus_name);
     vdev->bus_name = NULL;
 }
@@ -3873,6 +3884,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
     vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 
     vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+    QTAILQ_INIT(&virtio_list);
 }
 
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3883,6 +3896,37 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
     return virtio_bus_ioeventfd_enabled(vbus);
 }
 
+VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+    VirtioInfoList *list = NULL;
+    VirtioInfoList *node;
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+        Error *err = NULL;
+        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
+
+        if (err == NULL) {
+            GString *is_realized = qobject_to_json_pretty(obj, true);
+            /* virtio device is NOT realized, remove it from list */
+            if (!strncmp(is_realized->str, "false", 4)) {
+                QTAILQ_REMOVE(&virtio_list, vdev, next);
+            } else {
+                node = g_new0(VirtioInfoList, 1);
+                node->value = g_new(VirtioInfo, 1);
+                node->value->path = g_strdup(dev->canonical_path);
+                node->value->name = g_strdup(vdev->name);
+                QAPI_LIST_PREPEND(list, node->value);
+            }
+           g_string_free(is_realized, true);
+        }
+        qobject_unref(obj);
+    }
+
+    return list;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 90e6080..8f4e4c1 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -110,6 +110,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    QTAILQ_ENTRY(VirtIODevice) next;
 };
 
 struct VirtioDeviceClass {
diff --git a/qapi/meson.build b/qapi/meson.build
index 656ef0e..10c54d6 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -48,6 +48,7 @@ qapi_all_modules = [
   'sockets',
   'trace',
   'transaction',
+  'virtio',
   'yank',
 ]
 if have_system
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..1512ada 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -93,3 +93,4 @@
 { 'include': 'audio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
+{ 'include': 'virtio.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 0000000..aee0e40
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,68 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+
+##
+# = Virtio devices
+##
+
+##
+# @VirtioInfo:
+#
+# Basic information about a given VirtIODevice
+#
+# @path: The VirtIODevice's canonical QOM path
+#
+# @name: Name of the VirtIODevice
+#
+# Since: 7.0
+#
+##
+{ 'struct': 'VirtioInfo',
+  'data': { 'path': 'str',
+            'name': 'str' } }
+
+##
+# @x-query-virtio:
+#
+# Returns a list of all realized VirtIODevices
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: List of gathered VirtIODevices
+#
+# Since: 7.0
+#
+# Example:
+#
+# -> { "execute": "x-query-virtio" }
+# <- { "return": [
+#        {
+#            "path": "/machine/peripheral-anon/device[4]/virtio-backend",
+#            "name": "virtio-input"
+#        },
+#        {
+#            "path": "/machine/peripheral/crypto0/virtio-backend",
+#            "name": "virtio-crypto"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[2]/virtio-backend",
+#            "name": "virtio-scsi"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#            "name": "virtio-net"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#            "name": "virtio-serial"
+#        }
+#      ]
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio',
+  'returns': [ 'VirtioInfo' ],
+  'features': [ 'unstable' ] }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 7f103ea..fd00ee2 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -103,6 +103,7 @@ static bool query_is_ignored(const char *cmd)
         "query-gic-capabilities", /* arm */
         /* Success depends on target-specific build configuration: */
         "query-pci",              /* CONFIG_PCI */
+        "x-query-virtio",         /* CONFIG_VIRTIO */
         /* Success depends on launching SEV guest */
         "query-sev-launch-measure",
         /* Success depends on Host or Hypervisor SEV support */
-- 
1.8.3.1


