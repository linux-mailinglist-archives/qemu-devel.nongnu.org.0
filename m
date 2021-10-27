Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EACE43C8DC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 13:51:23 +0200 (CEST)
Received: from localhost ([::1]:56540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfhSk-0004a9-MW
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 07:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKm-0001MN-Bf; Wed, 27 Oct 2021 07:43:08 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKj-00071l-B1; Wed, 27 Oct 2021 07:43:07 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RBgA0w012296; 
 Wed, 27 Oct 2021 11:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=tUWUamb44OzGr1g1pX5OXwZI1gpljzlXFwLo8k1Kgek=;
 b=YFEqnsTmVuqXCmnCNqBF+7gcq+T8npX/zVgq5qdseD8uYD627LJSVap/eTiNGI3tV2Y9
 mvbhXXXHZ0eKRa3Js60a/NUqLXsqLVeO9AIXNBQJlFgsCQOQcb+l16TP6FP0TNMYkSDs
 ryJsEacHAqXg7hpVhfqtxIp18LahB49kqEGGfCu+hORRFiBhVk30nXVndbKT22hcSoSn
 e/+fL7Voy09nAcGz6YrLUbPkOszdyF/77b90krWXIOfJqgE+2GGG25kE4HQvojfOvjua
 eC7piAyjI3qhyXwZnMHiooEWM194JS76nVbWS+uklyADoJZlSiDWo8Uo5qGNc6WSDzi7 NQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fg1uwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RBfHRW159597;
 Wed, 27 Oct 2021 11:42:54 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by aserp3030.oracle.com with ESMTP id 3bx4g9sr81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9LkCj/bEibKSY0nLMbrhrbOLQKgQ6UwclvzmnEdRjjdZ7jsa+Pnk+AtXYZf/vMUEnTkToBJ1PYWh4bK3Ed3cL2oAwtV6O5FhCGaB03ccyopbEpTAuAveTYIzznbddMVZlKN4Zt25wvSy64HX9Z1SpHR/ruciwT+JM8jsKk+LsUfblxU9KhMVOmYPqP606AlkANIEtH/g2E5/s8D4IaI7L+xghlyXCve5OalDCUA/Vvf/lqmF/E6Ns4geV4xvlMv6HbwhZpNG0AODfuhvjhsACtIQc0WDbSMElhiIw56qbcNvyYyuEDEA2iL2JvMJSEe+ev7yE+1kjMKV5fKwpszlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUWUamb44OzGr1g1pX5OXwZI1gpljzlXFwLo8k1Kgek=;
 b=ieDk8BIPQocywKUuznoEf2cKgI8imIqqSfXJzn/ikUSQrRtFA4FdzQPUlWHHcw/h5DoG7wA134//rlynMQmw6GwdEFaDUu+UD4AVSNzwQc4I06tEd44NWk+TXDowTb1Kx2IbHdkqP8GYQRDB0lktg08u046DbR103SiWsC3YOZlWMeLpgFDKmJZaI15iJKyaE3A8Gv893ud5hKBy3atR1eDZqSF19Xzc3MJIZs4ZpXYq0+5jhvkEeljv6i+NVAEefXqxP4dQ0HDCxEsHw4bK1pzzqRS9748cWhr1ALTMWD84Zq1O/NkUZ2Fc0CVe8RmCsAExly7/3jNqeRQk0HBD2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUWUamb44OzGr1g1pX5OXwZI1gpljzlXFwLo8k1Kgek=;
 b=QhXgIP1is1q+0vPhS6T0Nkf4bcGCfv4PEpg8o8//o1iuyKHI/nO+NulCIdEcInRmz08bisMRnESEHKgwQAKUnYHIrhV4qljuvRWyBBgrhK+e89bYPV7d/4VEgbMNl1xS7Pu2oNsisPQ9yvTN7uxp5j0E3QruUcOHV6YRU4BPWgQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4744.namprd10.prod.outlook.com (2603:10b6:510:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 11:42:52 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 11:42:52 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 7/8] qmp: add QMP command x-debug-virtio-queue-element
Date: Wed, 27 Oct 2021 07:41:48 -0400
Message-Id: <1635334909-31614-8-git-send-email-jonah.palmer@oracle.com>
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
 Transport; Wed, 27 Oct 2021 11:42:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b2c8df2-254f-4c82-20da-08d9993ee8ad
X-MS-TrafficTypeDiagnostic: PH0PR10MB4744:
X-Microsoft-Antispam-PRVS: <PH0PR10MB4744150886A90CB1C7FE0B80E8859@PH0PR10MB4744.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vOHRi7fW0ZSB+FJl96Ee0lzkjhqDC98cr5BxIPHZyRFdyGkXeXo6BVim8uubEhdqMBZFhJhvXG9Dx1turGsvEwFwluec3cT67OxC84MfLe6GK5zybiJ61FtRK3n1neXei+B8vfoMhBN4CX/SaS74D3gWR7jYKAEWMtf4F5OcuEx1/fx8lnVlZC6JWJFLM80YSWV5GNiTm/xCn3d/YPGvNq8UswQZw+NVRMeLOrCOYHNb6U6oms2fbvcbfHFTgP54ditbwdwbS7EIDF/lk3yMaejHmkndBRFhX8P5HsXNkSYgYsNgvKXLzkB/VpWhr/wWzTVhl68dNaXPOq/5W780wSlu7VFzv5myMdhJ8eJX5JtOzEQpOpvqO503MC40diKNknfpS9PZlShSvcJA+iHGjOlkm1a5LoK+HoPM0HtjhbQyN7RrmWs06EyPc4kcmjm13AFN61y2R+cessoaaXZaEYw6B+a6k9DDBFJL2N+Uiux4HcZLQscs0L5TvyoCsFMDXZhQFJgyk/+8CgFpmSyyPdJiELurPhs3ALkWfpZ8fkXkynawNiWZoiNPZYf+ArA1XzRZNFjocQsKhMUF8BOt02hm6y17LiTyZzYJUT1xkzokB1rpnZtOzGsCGPqv27zn7Ht4YYuoKj21CsZ+uwC5+BVZTwkD992ge/QxMN7Wq3EphU2vn8IUUOHizb3+neVaVyKR4JkFk89dHiZn/379ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(44832011)(26005)(4326008)(316002)(38350700002)(38100700002)(8936002)(6916009)(956004)(36756003)(2616005)(2906002)(86362001)(83380400001)(7416002)(5660300002)(52116002)(508600001)(8676002)(186003)(66946007)(6486002)(7696005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qf77acQUJTCY7sUTpruhJ7MPnOymJxTz3gnYmwxS1CRpQlc7uF8AukHtuIh/?=
 =?us-ascii?Q?/XwiAxk1yBSO3g9C89Y33EMnSblkmn3UX4vQGqbsnLfkmeb3OCyTB2Ez07G8?=
 =?us-ascii?Q?ZAqs+zr/LPYWFCVSlmR3yN9w5SWj8jm/mA8VvGnR44cQJLzWJzMd/rdYa9ht?=
 =?us-ascii?Q?06pc8itL3W57P3Y2kN2E9yFURIEG3c4QlMeFnZI7td3ag3nmAfetUGXaA3PL?=
 =?us-ascii?Q?q6Dfy/zLpPVKnVciJuI9UHBVDlRnRjqkwzz9Oey926q239AZ4Xvf2bSxPaQS?=
 =?us-ascii?Q?e7hLW+/i2lYgEQBz6aAbYIxu4C0/RadEFUpSvE0dotW5YmZHNbLCcWMrxvN9?=
 =?us-ascii?Q?18LfWo/dqE2IwuY4JuDWOKSpm9sxNQZOz93bB/qp9lFxGYf1XPuEcx8xd6TB?=
 =?us-ascii?Q?g5AVJ1ImqAbekLQVVWqSUu18wUVOu0el1GfDA8flKE+E5EIH4RfrtnHftSWE?=
 =?us-ascii?Q?QRAmElG3Y+W9pxqVtFqvaBZv7BQ4ZdvRJULYpC4MC1tvlFg40Zugdlgelq6R?=
 =?us-ascii?Q?ewZY9X3ji1KZGURrLfP79n57p1BcgsBjN5x7cYy/tPhLf1s1OjUW63ujz7cC?=
 =?us-ascii?Q?0gAexaHwafNKxpUOiqwSYqyEmmpIxC36+8/rWqT5wOTVAYN8Z+m1JYl+zZoH?=
 =?us-ascii?Q?bgV7sa6q+dEjVCMeMfW5NV9hPUi7oo2q8aKjOCdWaRWjzPXMaT1ulJErPG2e?=
 =?us-ascii?Q?rx++hPcvORpOiiJVbWAb8p1oD8sZu0mNw+ugYJxIm/DVE1j8u/STbweLWHpx?=
 =?us-ascii?Q?t2JNZGHXoBIUAG7aBAXaBnKTwx0BmOXYEUeHvCVimMbeHQwsQepa13C93sJx?=
 =?us-ascii?Q?5Tqhf9kvIfUftc3+Pr/VEcJcctjuhR9tzeFHBPYCkgXoPivUvmtAmJ9lmLkC?=
 =?us-ascii?Q?VZpHYnF2vpms8o7Cq0Kn24MVaWMtEt/YVHmDV64SYpwgzQO3Tq3jAG1S2W+N?=
 =?us-ascii?Q?fRotnU+pJ8Kfgf5le4KFcqWOKLw0H0zgIpl/sxnzsOwJfJG4PdvUAyYMLPgT?=
 =?us-ascii?Q?y01GZLZOdy0zgJfNhStnUOcYc9nNgqspkPrVfkVTgrd+P3dg1PhXp1rdMW+H?=
 =?us-ascii?Q?k8HhaPqnDOl9DAt1ePnNGYVgODjy9QfIP7ielV1GUbBj2mEc6J0Fi6ogVgXj?=
 =?us-ascii?Q?bbm9pZL/iZkesTgqdmTWUAsQqnHsCEyQENqp/pB3WDHWaUiFuzkIhm4JhO+z?=
 =?us-ascii?Q?GaGvih42Y/ydY+pU7ipEbWAJhgqDTc5cvpIiCYvL8f7rEuL++KWNPFQMz/dt?=
 =?us-ascii?Q?3enKzcraUrCUjZ5Xio7PV4DZkScfshQnUm9GQ0V+W1AE8JQ6LKD44oiFjRcC?=
 =?us-ascii?Q?NClhLSxtRfnTYUiRoRJ1x5BmrCn7RgOoMj2RCjURIruFQYDHKX6B6pcEheml?=
 =?us-ascii?Q?xy9NIJnAvAz+G1xJuBJCTi4DBRpLowfsYV62VjdmFy+RTXGT8vvi67cdkEo+?=
 =?us-ascii?Q?HoLEpYLz5bMozCYhFjtpD7mD0uzZ9SFzkzv9YA+3V3nOXtwruXKrt3WpeOoc?=
 =?us-ascii?Q?PWx00lv3TSjE4JlhYYPN31o9KVlA+NVMQbEFg+443mZx9sbR0/TnS+SUVbP1?=
 =?us-ascii?Q?teg5OcsbM3A8mOPtDGLyY+SWx0Tu6+34fa29fbk69Oy9k89EXqqfkMV3SHwm?=
 =?us-ascii?Q?rR/xfm7Yuj/kKO+jF/Brz18=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2c8df2-254f-4c82-20da-08d9993ee8ad
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 11:42:52.1950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRYi2NZ2EzbCLGgkFX0qm8RFnhi0mk3W9W6BmTW6t0HysUdzft75RA+BBP+C4H3RhcWMDdDxklWchYmZmP0jSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4744
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270071
X-Proofpoint-ORIG-GUID: nN1Xc_pHzhiGucTWuVHLBRmTc58reH1B
X-Proofpoint-GUID: nN1Xc_pHzhiGucTWuVHLBRmTc58reH1B
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

This new command shows the information of a VirtQueue element.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   9 +++
 hw/virtio/virtio.c      | 154 ++++++++++++++++++++++++++++++++++++
 qapi/virtio.json        | 204 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 367 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 387803d..6c282b3 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -31,3 +31,12 @@ VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioQueueElement *qmp_x_debug_virtio_queue_element(const char *path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 7fd98c5..8c8a987 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -480,6 +480,19 @@ static inline void vring_used_write(VirtQueue *vq, VRingUsedElem *uelem,
     address_space_cache_invalidate(&caches->used, pa, sizeof(VRingUsedElem));
 }
 
+/* Called within rcu_read_lock(). */
+static inline uint16_t vring_used_flags(VirtQueue *vq)
+{
+    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
+    hwaddr pa = offsetof(VRingUsed, flags);
+
+    if (!caches) {
+        return 0;
+    }
+
+    return virtio_lduw_phys_cached(vq->vdev, &caches->used, pa);
+}
+
 /* Called within rcu_read_lock().  */
 static uint16_t vring_used_idx(VirtQueue *vq)
 {
@@ -4387,6 +4400,147 @@ VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
     return status;
 }
 
+static VirtioRingDescFlagsList *qmp_decode_vring_desc_flags(uint16_t flags)
+{
+    VirtioRingDescFlagsList *list = NULL;
+    VirtioRingDescFlagsList *node;
+    int i;
+
+    struct {
+        uint16_t flag;
+        VirtioRingDescFlags value;
+    } map[] = {
+        { VRING_DESC_F_NEXT, VIRTIO_RING_DESC_FLAGS_NEXT },
+        { VRING_DESC_F_WRITE, VIRTIO_RING_DESC_FLAGS_WRITE },
+        { VRING_DESC_F_INDIRECT, VIRTIO_RING_DESC_FLAGS_INDIRECT },
+        { 1 << VRING_PACKED_DESC_F_AVAIL, VIRTIO_RING_DESC_FLAGS_AVAIL },
+        { 1 << VRING_PACKED_DESC_F_USED, VIRTIO_RING_DESC_FLAGS_USED },
+        { 0, -1 }
+    };
+
+    for (i = 0; map[i].flag; i++) {
+        if ((map[i].flag & flags) == 0) {
+            continue;
+        }
+        node = g_malloc0(sizeof(VirtioRingDescFlagsList));
+        node->value = map[i].value;
+        node->next = list;
+        list = node;
+    }
+
+    return list;
+}
+
+VirtioQueueElement *qmp_x_debug_virtio_queue_element(const char *path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueue *vq;
+    VirtioQueueElement *element = NULL;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIO device", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+    vq = &vdev->vq[queue];
+
+    if (virtio_vdev_has_feature(vdev, VIRTIO_F_RING_PACKED)) {
+        error_setg(errp, "Packed ring not supported");
+        return NULL;
+    } else {
+        unsigned int head, i, max;
+        VRingMemoryRegionCaches *caches;
+        MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
+        MemoryRegionCache *desc_cache;
+        VRingDesc desc;
+        VirtioRingDescList *list = NULL;
+        VirtioRingDescList *node;
+        int rc;
+
+        RCU_READ_LOCK_GUARD();
+
+        max = vq->vring.num;
+
+        if (!has_index) {
+            head = vring_avail_ring(vq, vq->last_avail_idx % vq->vring.num);
+        } else {
+            head = vring_avail_ring(vq, index % vq->vring.num);
+        }
+        i = head;
+
+        caches = vring_get_region_caches(vq);
+        if (!caches) {
+            error_setg(errp, "Region caches not initialized");
+            return NULL;
+        }
+        if (caches->desc.len < max * sizeof(VRingDesc)) {
+            error_setg(errp, "Cannot map descriptor ring");
+            return NULL;
+        }
+
+        desc_cache = &caches->desc;
+        vring_split_desc_read(vdev, &desc, desc_cache, i);
+        if (desc.flags & VRING_DESC_F_INDIRECT) {
+            int64_t len;
+            len = address_space_cache_init(&indirect_desc_cache, vdev->dma_as,
+                                           desc.addr, desc.len, false);
+            desc_cache = &indirect_desc_cache;
+            if (len < desc.len) {
+                error_setg(errp, "Cannot map indirect buffer");
+                goto done;
+            }
+
+            max = desc.len / sizeof(VRingDesc);
+            i = 0;
+            vring_split_desc_read(vdev, &desc, desc_cache, i);
+        }
+
+        element = g_new0(VirtioQueueElement, 1);
+        element->avail = g_new0(VirtioRingAvail, 1);
+        element->used = g_new0(VirtioRingUsed, 1);
+        element->device_name = g_strdup(vdev->name);
+        element->index = head;
+        element->ndescs = 0;
+        element->avail->flags = vring_avail_flags(vq);
+        element->avail->idx = vring_avail_idx(vq);
+        element->avail->ring = head;
+        element->used->flags = vring_used_flags(vq);
+        element->used->idx = vring_used_idx(vq);
+
+        do {
+            /* A buggy driver may produce an infinite loop */
+            if (element->ndescs >= max) {
+                break;
+            }
+            node = g_new0(VirtioRingDescList, 1);
+            node->value = g_new0(VirtioRingDesc, 1);
+            node->value->addr = desc.addr;
+            node->value->len = desc.len;
+            node->value->flags = qmp_decode_vring_desc_flags(desc.flags);
+            node->next = list;
+            list = node;
+
+            element->ndescs++;
+            rc = virtqueue_split_read_next_desc(vdev, &desc, desc_cache,
+                                                max, &i);
+        } while (rc == VIRTQUEUE_READ_DESC_MORE);
+        element->descs = list;
+done:
+        address_space_cache_destroy(&indirect_desc_cache);
+    }
+
+    return element;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 7b67235..232f0cc 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -1097,3 +1097,207 @@
   'data': { 'path': 'str', 'queue': 'uint16' },
   'returns': 'VirtVhostQueueStatus'
 }
+
+##
+# @VirtioRingDescFlags:
+#
+# An enumeration of the virtio ring descriptor flags
+#
+# Since: 6.2
+#
+##
+
+{ 'enum': 'VirtioRingDescFlags',
+  'data': [ 'next', 'write', 'indirect', 'avail', 'used' ]
+}
+
+##
+# @VirtioRingDesc:
+#
+# Information regarding the VRing descriptor area
+#
+# @addr: guest physical address of the descriptor data
+#
+# @len: length of the descriptor data
+#
+# @flags: list of descriptor flags
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtioRingDesc',
+    'data': {
+      'addr': 'uint64',
+      'len': 'uint32',
+      'flags': [ 'VirtioRingDescFlags' ]
+    }
+}
+
+##
+# @VirtioRingAvail:
+#
+# Information regarding the avail VRing (also known as the driver
+# area)
+#
+# @flags: VRingAvail flags
+#
+# @idx: VRingAvail index
+#
+# @ring: VRingAvail ring[] entry at provided index
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtioRingAvail',
+    'data': {
+      'flags': 'uint16',
+      'idx': 'uint16',
+      'ring': 'uint16'
+    }
+}
+
+##
+# @VirtioRingUsed:
+#
+# Information regarding the used VRing (also known as the device
+# area)
+#
+# @flags: VRingUsed flags
+#
+# @idx: VRingUsed index
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtioRingUsed',
+    'data': {
+      'flags': 'uint16',
+      'idx': 'uint16'
+    }
+}
+
+##
+# @VirtioQueueElement:
+#
+# Information regarding a VirtQueue VirtQueueElement including
+# descriptor, driver, and device areas
+#
+# @device-name: name of the VirtIODevice which this VirtQueue belongs
+#               to (for reference)
+#
+# @index: index of the element in the queue
+#
+# @ndescs: number of descriptors
+#
+# @descs: list of the descriptors
+#
+# @avail: VRingAvail info
+#
+# @used: VRingUsed info
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtioQueueElement',
+    'data': {
+      'device-name': 'str',
+      'index': 'uint32',
+      'ndescs': 'uint32',
+      'descs': [ 'VirtioRingDesc' ],
+      'avail': 'VirtioRingAvail',
+      'used': 'VirtioRingUsed'
+    }
+}
+
+##
+# @x-debug-virtio-queue-element:
+#
+# Return the information about a VirtQueue VirtQueueElement (by
+# default looks at the head of the queue)
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# @index: the index in the queue, by default head
+#
+# Returns: VirtioQueueElement information
+#
+# Since: 6.2
+#
+# Examples:
+#
+# 1. Introspect on virtio-net virtqueue 0 at index 5
+#
+# -> { "execute": "x-debug-virtio-queue-element",
+#      "arguments": {
+#          "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#          "queue": 0,
+#          "index": 5
+#      }
+#    }
+# <- { "return": {
+#         "index": 5,
+#         "ndescs": 1,
+#         "device-name": "virtio-net",
+#         "descs": [
+#             { "flags": ["write"], "len": 1536, "addr": 5257305600 }
+#         ],
+#         "avail": { "idx": 256, "flags": 0, "ring": 5 },
+#         "used": { "idx": 13, "flags": 0 }
+#      }
+#    }
+#
+# 2. Introspect on virtio-crypto virtqueue 1 at head
+#
+# -> { "execute": "x-debug-virtio-queue-element",
+#      "arguments": {
+#          "path": "/machine/peripheral/crypto0/virtio-backend",
+#          "queue": 1
+#      }
+#    }
+# <- { "return": {
+#         "index": 0,
+#         "ndescs": 1,
+#         "device-name": "virtio-crypto",
+#         "descs": [
+#             { "flags": [], "len": 0, "addr": 8080268923184214134 }
+#         ],
+#         "avail": { "idx": 280, "flags": 0, "ring": 0 },
+#         "used": { "idx": 280, "flags": 0 }
+#      }
+#    }
+#
+# 3. Introspect on virtio-scsi virtqueue 2 at head
+#
+# -> { "execute": "x-debug-virtio-queue-element",
+#      "arguments": {
+#          "path": "/machine/peripheral-anon/device[2]/virtio-backend",
+#          "queue": 2
+#      }
+#    }
+# <- { "return": {
+#         "index": 19,
+#         "ndescs": 1,
+#         "device-name": "virtio-scsi",
+#         "descs": [
+#             {
+#               "flags": ["used", "indirect", "write"], "len": 4099327944,
+#               "addr": 12055409292258155293
+#             }
+#         ],
+#         "avail": { "idx": 1147, "flags": 0, "ring": 19 },
+#         "used": { "idx": 1147, "flags": 0 }
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-debug-virtio-queue-element',
+  'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
+  'returns': 'VirtioQueueElement'
+}
-- 
1.8.3.1


