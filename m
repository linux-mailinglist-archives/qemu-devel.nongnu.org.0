Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893B2495142
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 16:17:31 +0100 (CET)
Received: from localhost ([::1]:49134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAZBq-0006Rj-BF
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 10:17:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVey-0005c3-Ps; Thu, 20 Jan 2022 06:31:23 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVen-0006ab-NB; Thu, 20 Jan 2022 06:31:15 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20K9c0Am001411; 
 Thu, 20 Jan 2022 11:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=DSS0yWCFM+yy0zNaf1wF/V5nILO7Ph0jnGOfn6+1v1s=;
 b=NZ2IrV+Ihhd1GW5YgMu8lRftqrN20sjrWn9EfhAj/rdiWZiQ9/Y2VttGcMolnwLIZg4t
 Jq5AydjHvaY1q8IbzCPvt5MGo//83FTHci28aHqtdf/Tlcw3p3JBoFPijNhLk71gl+dW
 K8cKMMXFB0NZcNVCTGjfHrzN3GU6mgjvf+DqLhxmuIm2R1IeXEkPmcWxF7q18QwdO9Fs
 643Ccmhjvw4EWcmeOFZ0Y56UqigZQz/TkArOcUfmetQcoH37Hl/6YI38UehC/JHh0rUp
 1wTDbMQB1q3tlHbc3pUIl1x7i7Q9qAksjBn5hMFWucO/nFbZQO2ThtWZDOaSXoaNnVw8 2Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc5f7wfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20KBGfYn031345;
 Thu, 20 Jan 2022 11:30:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by userp3030.oracle.com with ESMTP id 3dkkd24hb7-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvtmVUw5wBuUhZjHE69Q0Z6sEb0fdRHKbKZL3Xne4nEcQ9Uc9mH8nn/2nS+gaB77MchIJeeOMeAkhkS+Xl9BbV0bgcKBxb0gDrx7rcMr1uPa/hJIZM7uUx4DMljPSHQ16BuYS9D2bRguH+bltkDosvThe685R2kFW8W6MC+BOoafHVZtrJR4NnMFUDYpCSGw2PNKDJOcDoW8ACTUFuqTxY2Cs7cjVcyW8x/JlPgtir8rDoJYWQaUSeAG57SMkwn9bBPzmp90tNkt4D8g/elOum+ww25k8wPeBMxoUZe+4V0Ood51ZNx7vdAjBEf+97Toqal7uqoApXJefv6kUNcaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSS0yWCFM+yy0zNaf1wF/V5nILO7Ph0jnGOfn6+1v1s=;
 b=ic3r1BJDLuBupES53bk8RqhDnxKSvOIi2S/z93bHHLpIpx9Zj8TVa3n96ovbRM76EOYJFTwHuBZw4FVPCgykMo99C9zM2BwIkQjGzfbhvEVfs8ppo8MLb6l4J8mioFljQ4KZCbW0I2xPnTZ9M2vOQftjoAPsj9JtilXtAE6ThZTJS4cltQEfj0khnVpJON30ntRLpGHTCodf0n06IevaCmVNOsy5Aqb4MOADfDxomUIw/PWxC62mxOKNsuQlZHUMsPegksz3veKg77zDiWLr9RH2z7qdFOXkE1xFbUUj5dmItd5K7+ud5HahjPCUex998APvkhRWf/7YlEa9QNkfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSS0yWCFM+yy0zNaf1wF/V5nILO7Ph0jnGOfn6+1v1s=;
 b=tsXd7Fj6uL/c8bas19H+RA6ohmPXoIs9N70cBE7QoAkagNNqfZ3OxCY6TB4/9+JdhB6WSReloj/E+Pu9RqOSgtXKCb9NeMycWxzBQY7iZVkddbXRLEC4IBjnC4fcrBzmobPmo2nHtnQuCcmu0vbUgbFncVNXIEx4ToHUJE8N5IM=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by BYAPR10MB2648.namprd10.prod.outlook.com (2603:10b6:a02:b3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 20 Jan
 2022 11:30:12 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb%9]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 11:30:12 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 3/8] qmp: add QMP command x-query-virtio
Date: Thu, 20 Jan 2022 06:29:23 -0500
Message-Id: <1642678168-20447-4-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
References: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ddb4787-9b91-4b47-5d1b-08d9dc0838bd
X-MS-TrafficTypeDiagnostic: BYAPR10MB2648:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB264824C7ECDE40C7BA3F5ADCE85A9@BYAPR10MB2648.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2L2k/I1EI6YiV7P9FU1IqUBVx8vJIQOQrERiIkV/Ys0dNYtDXgOM1FwmQZe8JBeA1bLiG5MSy4Dq5UOrLG1zmH1F8+NWxORIhbXtL7sCisk854lZfsPj1zZMhpgb4DOVTXnxLeRkeiDuuSLkJna/H0bom+3+I+mxCL0D5LePxF97tBTBYUg9/7zo68jNGikmrMRIpiNsPqeRnSQXbsLAAofSGhMuvlwcYgee79ufCDUyC0vt5h45gKgvQzEaty9L0pDeCs0quUM1kXx92EddyXqfAPtPzobm38LUvjQ6eBLvIDHv6xwnGrgVIJZZIMMQ/gZAyJgs0Af+b5c2U/obD32NJdqxuCMOPRynAW3nZQBexgaGD4YU9g970y7JrQDEnbBZQUekpKjci2xU14DX4RX8gCTecgYyaa4kUC8ALRAzO9vRkeASN9+73VmOi7BoPjFEmIRnweqVLPYkeIAYjJlAiwAR16X2Cbd8TM8Xm65k4tKRGQyQZbxBx9oJD8bRRrf5R98b2NfptWQMV8Ck4Rk9/0M7le0emOQmQOMI80zf+ZEvVRu+jfTqrl6xB3NOyf+RKrR1xFRYnDXaygIt1kMd8DFO/6l5f6wxC3hRZFZjUI4xpksWQ9KJVF6ZIfyvCO1S3EwotvHLU++Dg090tCJNEAjXSx78+wMtmeZXEENEibvIu4LDdtH3NxyRevwam9at4aUOlx+GlJexiDNZsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(66556008)(6512007)(6486002)(8936002)(66476007)(6666004)(2616005)(66946007)(44832011)(186003)(316002)(36756003)(7416002)(86362001)(508600001)(38100700002)(26005)(6506007)(6916009)(38350700002)(52116002)(5660300002)(4326008)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?COYs9q3Y1uahelVbvDntv6UwnxwvSDK8C5HHauj9KRn50GPLkG/HD/Td8lRn?=
 =?us-ascii?Q?ZI/AhJF/8mKjYO1B8wwFuqlcYWTV5Y+Hdk4yYkJWL6EivTV6f11zOdlC7Spp?=
 =?us-ascii?Q?fzKhqfEacAt6zjKvL8wgTMiYMUlD9fUIBBfYvT+IPgIRrribCnbYbKl1FV37?=
 =?us-ascii?Q?zXRoR9gKhign5fOpst/2CIshDLS2W/MHS68/7facwRZMPwR/wy+/mJJc8pi4?=
 =?us-ascii?Q?fCcrc0iKySpgop9gmjKq/jVRg5Ol3ICGlnkClAsKudrQy0gZ2WdqmKxG29ld?=
 =?us-ascii?Q?FrYbJ0b1Av6H13nQ0dHCRdao856hpZhJawVART9lNiaXCRXvAhgSRc8hvjT4?=
 =?us-ascii?Q?E029x9IBpFgGHadYeVqjCLu4l4nFqAZrpEOk477fIkdQHjTeUEEsC8aKwJFE?=
 =?us-ascii?Q?mxl5pW7XWluLB/A0f63FDU2Ti14YJhTsjsQ2OP2v62Hd9uU96HkSawSH6U0P?=
 =?us-ascii?Q?AD+QcQRpY8auevXMRxN2GpXHQ5dMhnIDV1BCualStz+uJ9W+P2AFzhPHSfxg?=
 =?us-ascii?Q?Wp88Pi9ptZx3wj1X/aPqzu8EQqbcWvKQX4OaUVsMHoCJgAQgAUnVE8eDmfWc?=
 =?us-ascii?Q?WEYS9gtsfhoj7hEVR0wpznwYvNPXA7UW2tmWzx1gMWiKWZAy82WQCfcUDSrj?=
 =?us-ascii?Q?JxiSjaFolLaPTO16MdJ5FFSH6GMPrwZqVzltQmdhiy9gA26nSEU9mTFKANqF?=
 =?us-ascii?Q?TMioHoHYPu4PuWL0tq7dazVczF1Bb/3yr/SBEaquO2rm9X9hOoycFmWH7GQ8?=
 =?us-ascii?Q?LxUfVTz5F8oMyZIBFWCo3V10Cntz5m089UCCkw7m4cEMykrN6rzV6Ou7S/oO?=
 =?us-ascii?Q?Xd8Oa+ziGpKBDzpGC+aVTbM4STNDXZZuqnSfTsUk/l9t3nLdDm6JX25CFkia?=
 =?us-ascii?Q?dW8zHEGJVTB3l//ByQUTx+LG2Gg3Ca3dvPC8sJQFAUE0dU//t5F5//v+gwMv?=
 =?us-ascii?Q?o1D4PN36uNnxlqPiAM0zTe6XP9S+Vzv4/xbIZuxifRb3IEtB0UydWziIqD1A?=
 =?us-ascii?Q?vVmnAU6ZdmdF94K87KrFIncamaJSJ4Ef9qncNZfM8CkrlkIETXRGU3x6wZK6?=
 =?us-ascii?Q?ZYmmVsJvwQXNXhO1daHYLygd+jndaWkZkm6vGArDLQqNzrVqnZhJeP/GVrwE?=
 =?us-ascii?Q?PRZqJ7oqetthef6a46I3q3XIqzk7okLQze6sbURCnqzomwINVOxWBZDwygW4?=
 =?us-ascii?Q?q/BIPS4sr1SdnkwqV/0xXIuFwJ1DXtbZeXlsQslQ5iZYqeFPVYWMYDlwFRyt?=
 =?us-ascii?Q?8tTB2o7y0xcAeK3x/Sw3wjJdmJEPNnVcHBCi+SjRk3n004QT6t3Ti0ji8mHg?=
 =?us-ascii?Q?nEVi4q/U1YhB6mzYXLxdNmohUFIQRLnFQU0ig2/2jw16AYJEo1YcNO4M5DnG?=
 =?us-ascii?Q?RkQqzKAMkinfje5v74TJWPC7N8HC9zyZZWH4IYgO5WuI2p0PXL2Xj4zKIwp6?=
 =?us-ascii?Q?1LhT+1n8tprwQrkx2EPOHuBIwgNShEZmSfJNxE6lCEtgF60i7u0UlToi3/HW?=
 =?us-ascii?Q?refdr/EZH+HtE0nI3Qgbs3q1k7bvsX7iRcjspVbLB/boUXUme7MHWziFLlEo?=
 =?us-ascii?Q?0dMTIQhsltG/mwuCYZtk5/iDLOUyExrOdRFzgxz0WAJrz0Ap+ITuOv6cieCy?=
 =?us-ascii?Q?hG2X9QjyyFmoI+sF/SLiRZE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddb4787-9b91-4b47-5d1b-08d9dc0838bd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 11:30:12.0668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TI8D/xZ8pZnrr0c37N4pt/l+VclFwgvNL8Xv9ZzLJXv97PNhwJqe3HzLgkoyq3O0qPRZW5A3u2dmzCRvsbopvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2648
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200058
X-Proofpoint-GUID: FDqywvB9S6roZ3NG2wJFx5AHB5z_qZzN
X-Proofpoint-ORIG-GUID: FDqywvB9S6roZ3NG2wJFx5AHB5z_qZzN
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 7c1b1dd..e59f0d7 100644
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
@@ -3687,6 +3696,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
     vdev->listener.commit = virtio_memory_listener_commit;
     vdev->listener.name = "virtio";
     memory_listener_register(&vdev->listener, vdev->dma_as);
+    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
 }
 
 static void virtio_device_unrealize(DeviceState *dev)
@@ -3701,6 +3711,7 @@ static void virtio_device_unrealize(DeviceState *dev)
         vdc->unrealize(dev);
     }
 
+    QTAILQ_REMOVE(&virtio_list, vdev, next);
     g_free(vdev->bus_name);
     vdev->bus_name = NULL;
 }
@@ -3874,6 +3885,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
     vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 
     vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+    QTAILQ_INIT(&virtio_list);
 }
 
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3884,6 +3897,37 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
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
index c0c49c1..e332f28 100644
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


