Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B9A43C94B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:11:49 +0200 (CEST)
Received: from localhost ([::1]:33356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfhmW-0002xH-DW
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKs-0001RH-6H; Wed, 27 Oct 2021 07:43:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:8022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKl-000724-MK; Wed, 27 Oct 2021 07:43:11 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RBgKbP010645; 
 Wed, 27 Oct 2021 11:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=H0xgOvoUNS1S1cK/suA8UoJ1TtoWjrxWBi7YcjoisJQ=;
 b=m6Lng2uymjOnL3AVEMP+j+5Qu/y+MHyqbD3HkDM1Lt6dGR4l6NSuhiMhLzFnZPxklNMs
 E+4BwE8Q0faRQ2MOOw30sddlHJEtwTP48+BqcPJhOG+jEbVkheVrGhGEIxfrc4gIxYSV
 vo0GUoXt+7gj++rZkz19vdBjBVsAeuDMtH6x6THYI/TPoab/m7i/edG2pP98pd77SKZN
 uVWj8YZIyS20TIpes/A0Fw+qd5l8TY8QB5EAps36zI8Z2zFVdUC1nVevC6IgLN8QRXtC
 fmUNGhLV6JrIehRxHwEMvfkIUP140BJDC0lYazt/jdA2+lBGOSUGcIeyKxAnFAXyu/te dQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fj324t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:49 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RBg0m1097311;
 Wed, 27 Oct 2021 11:42:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by userp3030.oracle.com with ESMTP id 3bx4h27wps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKKZBqzq1CkIo1VbVxXuj1d6m5alI/s2tp1Ni5yf4lQaPn9n4RgAUsd0lsPAXRQg9Qqkmk90BCbN5j4EegoVUzP8YKbq6bMmjah5ZI94Jp8p2mCIVBuxpE4cwpvJpEMjZsloo0Jje3og9VCJtGycuExyOnkTntTF4Ax0Ko4vbj2jgyKCcMHq2cNB2FAFB8Jt+oABQD7JajZMfHI7r07StSwkhOk40pqm/07yTMrzzD5IUZqCmEwiJxWLgGNnxn2ic9fef2wmy7z2AA4PPXQURCXSEsWmx/NqsJhJWXR5T+opntvCBXPy4ueE5dbLzDnSrVNhbPuVfQzMLYVjWwO9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0xgOvoUNS1S1cK/suA8UoJ1TtoWjrxWBi7YcjoisJQ=;
 b=JvdjhDTZ3bGLU1CQC/GcR4LrE8ODKWbn3Sg+v+9oHoTBRe4/BYfskisRCFY2Kbck2qmf+LnNmocjQ34AQy+XD0NmW8pOHdVAZJtE8YNAVpO3bkwlUFhp9bDDYNp1dscJ2q7nXtUQo+QYYbPDjoK0OmZB9luznEEIy5+YhDq03TJGUXGncsTUwNcvVlY9SzWhR5HwNATz7nTRuDzZ6dZvd4dm4GYQVIncXAIEYFmFhJnn2mDip1JwvAjZah1NZxv3GycUl5vm8E37pSlip6yAxwKZzejl+fq+M+o4WWjpGPKX+cS7bFQIC8SXJgcKK9c9X6z3ipsEfHCPczyY+8Vy6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0xgOvoUNS1S1cK/suA8UoJ1TtoWjrxWBi7YcjoisJQ=;
 b=wgOr8hzOynEHuDMhylj81r81nnziZjhHHeZey9Z/Vewl/VZIU7JnmevBINyPKir/X9m1q0TPGHkV7sTfCqob9m/LvqDj+4PAgAESWm/iqtUWoxgap9mnUTvEq6EGYNOHglcd/jY71b6BC28J3+L7Ueg2ypWRlwJzD4rBUKzi2/Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4744.namprd10.prod.outlook.com (2603:10b6:510:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 11:42:44 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 11:42:44 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 5/8] qmp: decode feature & status bits in virtio-status
Date: Wed, 27 Oct 2021 07:41:46 -0400
Message-Id: <1635334909-31614-6-git-send-email-jonah.palmer@oracle.com>
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
 Transport; Wed, 27 Oct 2021 11:42:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 393b1adf-e3f9-4b6e-3c05-08d9993ee436
X-MS-TrafficTypeDiagnostic: PH0PR10MB4744:
X-Microsoft-Antispam-PRVS: <PH0PR10MB474424C3854A69F55B2CB6D1E8859@PH0PR10MB4744.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BecNAFcCQSNpZobEAn93MaBvwREaMM2cpoDcrBSSdOLMhhrQmZNm/1S7ik86p2wZaCkMRbywr5ty5ifxl80a0CXWP9H6IpNa7S7WY21e/nArdbgut085/gvFNT9FPZQYBPbN9gRNkxgbpRxHQe2GdOzl9oPxPPgtQPxR495TQKAtQq9hk/PqiyRoHHHNYTYXJUPGfHSSOLDp7MyDTjmfTdci46T0Dk5fqnTxezTOOmwq4zXJixNnvGLfs/qy6BbiwGkyINw/VHs8oWxMDPW4pL2nW9XUL4q5cOQwDBJW1NPt0fs3CSdb+z1czXHIeVTmC8oIeysu+0CK38U1fRUGo/drqFSeCEClOO/A3svqYob/eyJYgcCjpONiFCob1MTL+Wc2xNvnvljixAyyoAme5EX8Qsy8S4K0tWTdW6QpLghgCVA9aH3m5psw0KhfDkMijikChJQU2e/a2az2Szp5av/iyXl8vqooLXODqPPWalS1MNzCmGITDrr58AYv/U5s6PZcSKlCRx+S9aulrI3QSe7RkVWryow9qq8FI+D/pumALL6DCxga0AVeluah23KF3xU/9wMg2A2g91oB5iKjvRis8bQP89HmKrrEDHgfuP/eATIyMQGhfnfwkQ2xeZR8nEx45F+GihJMHmea86ihFxRkrEbShzaylt2mZWjcRHKf1gQwLoqK7bxK/2sUVEfWgAwD9ZhlCP94RO49Zih5Bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(44832011)(26005)(4326008)(316002)(38350700002)(38100700002)(8936002)(6916009)(956004)(36756003)(2616005)(2906002)(30864003)(86362001)(83380400001)(7416002)(5660300002)(52116002)(508600001)(8676002)(186003)(66946007)(6486002)(7696005)(66556008)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7vn0jT9bTikCIc/RliNyq6vVJnA7iW9R5wL3LlJiOvgk5ZH8qDuUXF+aW1yI?=
 =?us-ascii?Q?jAC0SRKt4+FDtxgfPLe1HamVYjmlceobV1h70HP675skNw4blV5Gkw6CeNo1?=
 =?us-ascii?Q?ElhsWM3Qh8INZle6p4GXxGY7Te2pNq55m1rieaf6vAlTuZR4mv06DlMnFrKV?=
 =?us-ascii?Q?PcHnJ+pYPgpd8e9fl1OEtT69HM2hqoxAmmnHdQ1DoSYWdzgjBG3ruQti91Am?=
 =?us-ascii?Q?QJbbU1W1QUmhn0ZRB4hA8wtSs8+23SCTc1oNxz9dJj8AFnHSXRj/t+k81993?=
 =?us-ascii?Q?glhMt+O9ISLXIuO5mZQdbsg013NJawYiWBXovzZA0cVKvS06oDpNWWwbUbmo?=
 =?us-ascii?Q?fmed1EvPR0hgeFo0v7KXwgleYaIvxZ+nSIZqFqUbPJyneJaR8kayNpHDDMiC?=
 =?us-ascii?Q?FmN5EU1qwwjVp+5cSsgjsPmPQ+1EUKb9zxjo7S/Bh909SQdrkyyMPiJS25Pq?=
 =?us-ascii?Q?AcKlxACGb0TaM7nOvWYw1XvyBf6Q2pBcMhoumdvsLNt4V8+hUj126EWMpdPz?=
 =?us-ascii?Q?lDsp0gmxW039e1nKJ7kRAhTeXp9dK33QXLMR0ekS4He9HJWfv02BWeU0RkCz?=
 =?us-ascii?Q?tPfiAnSCe5Bn1gA4fzfnWACE8QQvZ8txbjZX1P21+zER7qwpyfdnkdm+lDaQ?=
 =?us-ascii?Q?4lnyVB//yPLDytt2TY7/V/tD57rumcF2OV5bryoptVNAxpTDudNxgebLrVXj?=
 =?us-ascii?Q?+gNNruRf8HDQgQPTlW8xQbYyg9a9B6RqMwWK3GoNDqmZikaS0X5oTQPooWLF?=
 =?us-ascii?Q?hY8eWwLY5QhAl8zBqhBU1HN6VEmf2b3tQF/YifOOtGlkVO9P+c3VDsMppJzm?=
 =?us-ascii?Q?+WPcnZI+WOcEXX6I+I27/eE4gunbBn1yaseOJ3LDXUmbe2odkdCfQa9EEaJk?=
 =?us-ascii?Q?PbhdMyVVkQWU4anj8xSdkoAzuyTws9nKWMAqFbiKlAqOyKUMQ8qBmo6t6BC/?=
 =?us-ascii?Q?nU6ojzgO8cutVjaVllSy0c+EyzVGNqtiqKt7mDywmkA+P1a+EV7Q4LI8dJim?=
 =?us-ascii?Q?61LZN8JP0kOKBTxHyen3UIKsrdaUpVPTQnGTpcLDSJNkvW39QjnktTgHHG71?=
 =?us-ascii?Q?fOfu9XPCQfOLefABO4HmAqD5FzyMl9BxCdOl0aMFJCEZswXqf+jIZmV+qclx?=
 =?us-ascii?Q?tr1G+cTKRpTsDfu3VKXH9aqJGZWoxqrdMzNWaeREe3a6/KIHp0lweJhYC+rc?=
 =?us-ascii?Q?yJ0R5rzBdq/mg0/Ds87lLLaLBCE6hqzplVkXH4Wwzapc8BRUq83ZRMaEOqli?=
 =?us-ascii?Q?4z4FoajngacWqaY1Wh50N0KZlJFDgmfILW3o7qiwvT+knxYQHt9SaM2aaRmu?=
 =?us-ascii?Q?ML5sHMIDV6+k6BRQ2zSg5h6suP4AZGQ+Jh3TELUIe41c0NRLEh1vPW4ad/Cr?=
 =?us-ascii?Q?nv/lR3CyrvlLP8TzWu5/Itds9uuWvBDK5LMIwsfXr9ynQYQ/O1ixYZjDn0nB?=
 =?us-ascii?Q?SC8UgG9ypfImAbjbfUh3Lt93w08B4rocrxKVy/Zu1Z2QSjh1IQ9S8sPC1fN0?=
 =?us-ascii?Q?qtM0rOv9qk2AdohhJi4vIyH4d+rdxd0IkrAlZQsbN0i1VvlbMl5rul5LIj0r?=
 =?us-ascii?Q?bV7g2doZlnBacHxXjcD2AU/v1xgYC/Qfp63zGM8sdaenHw4C2sgqiwABqx+v?=
 =?us-ascii?Q?/zh50cbeIE4QTNWo3/UKTfo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 393b1adf-e3f9-4b6e-3c05-08d9993ee436
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 11:42:44.7448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SfHisGd5VjqaqqRN6bOvFz5S31pMpb8dUEQj7Z0pOToOgtRa405sNjPKTwDPaMn7O8kQiVwlKKNQi4LNQgBpPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4744
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 suspectscore=0
 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270071
X-Proofpoint-ORIG-GUID: zGfky2b6AoTrgMkTzs8bqyd7StUpkW2W
X-Proofpoint-GUID: zGfky2b6AoTrgMkTzs8bqyd7StUpkW2W
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Display feature names instead of bitmaps for host, guest, and
backend for VirtIODevice.

Display status names instead of bitmaps for VirtIODevice.

Display feature names instead of bitmaps for backend, protocol,
acked, and features (hdev->features) for vhost devices.

Decode features according to device type. Decode status
according to configuration status bitmap (config_status_map).
Decode vhost user protocol features according to vhost user
protocol bitmap (vhost_user_protocol_map).

Transport features are on the first line. Undecoded bits
(if any) are stored in a separate field. Vhost device field
wont show if there's no vhost active for a given VirtIODevice.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/block/virtio-blk.c          |  28 ++
 hw/char/virtio-serial-bus.c    |  11 +
 hw/display/virtio-gpu-base.c   |  18 +-
 hw/input/virtio-input.c        |  11 +-
 hw/net/virtio-net.c            |  47 ++++
 hw/scsi/virtio-scsi.c          |  17 ++
 hw/virtio/vhost-user-fs.c      |  10 +
 hw/virtio/vhost-vsock-common.c |  10 +
 hw/virtio/virtio-balloon.c     |  14 +
 hw/virtio/virtio-crypto.c      |  10 +
 hw/virtio/virtio-iommu.c       |  14 +
 hw/virtio/virtio.c             | 273 ++++++++++++++++++-
 include/hw/virtio/vhost.h      |   3 +
 include/hw/virtio/virtio.h     |  17 ++
 qapi/virtio.json               | 577 ++++++++++++++++++++++++++++++++++++++---
 15 files changed, 1015 insertions(+), 45 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 505e574..c2e901f 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
@@ -32,6 +33,7 @@
 #include "hw/virtio/virtio-bus.h"
 #include "migration/qemu-file-types.h"
 #include "hw/virtio/virtio-access.h"
+#include "standard-headers/linux/vhost_types.h"
 
 /* Config size before the discard support (hide associated config fields) */
 #define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
@@ -48,6 +50,32 @@ static const VirtIOFeature feature_sizes[] = {
     {}
 };
 
+qmp_virtio_feature_map_t blk_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_BLK_F_##name, VIRTIO_BLK_FEATURE_##name }
+    FEATURE_ENTRY(SIZE_MAX),
+    FEATURE_ENTRY(SEG_MAX),
+    FEATURE_ENTRY(GEOMETRY),
+    FEATURE_ENTRY(RO),
+    FEATURE_ENTRY(BLK_SIZE),
+    FEATURE_ENTRY(TOPOLOGY),
+    FEATURE_ENTRY(MQ),
+    FEATURE_ENTRY(DISCARD),
+    FEATURE_ENTRY(WRITE_ZEROES),
+#ifndef VIRTIO_BLK_NO_LEGACY
+    FEATURE_ENTRY(BARRIER),
+    FEATURE_ENTRY(SCSI),
+    FEATURE_ENTRY(FLUSH),
+    FEATURE_ENTRY(CONFIG_WCE),
+#endif /* !VIRTIO_BLK_NO_LEGACY */
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_BLK_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static void virtio_blk_set_config_size(VirtIOBlock *s, uint64_t host_features)
 {
     s->config_size = MAX(VIRTIO_BLK_CFG_SIZE,
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 232f4c9..fa57059 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -32,6 +33,16 @@
 #include "hw/virtio/virtio-serial.h"
 #include "hw/virtio/virtio-access.h"
 
+qmp_virtio_feature_map_t serial_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_CONSOLE_F_##name, VIRTIO_SERIAL_FEATURE_##name }
+    FEATURE_ENTRY(SIZE),
+    FEATURE_ENTRY(MULTIPORT),
+    FEATURE_ENTRY(EMERG_WRITE),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static struct VirtIOSerialDevices {
     QLIST_HEAD(, VirtIOSerial) devices;
 } vserdevices;
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 5411a7b..a322349 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -12,13 +12,29 @@
  */
 
 #include "qemu/osdep.h"
-
+#include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/virtio-gpu.h"
 #include "migration/blocker.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 
+qmp_virtio_feature_map_t gpu_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_GPU_F_##name, VIRTIO_GPU_FEATURE_##name }
+    FEATURE_ENTRY(VIRGL),
+    FEATURE_ENTRY(EDID),
+    FEATURE_ENTRY(RESOURCE_UUID),
+    FEATURE_ENTRY(RESOURCE_BLOB),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_GPU_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 void
 virtio_gpu_base_reset(VirtIOGPUBase *g)
 {
diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
index 5b5398b..b4562a3 100644
--- a/hw/input/virtio-input.c
+++ b/hw/input/virtio-input.c
@@ -6,6 +6,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "trace.h"
@@ -13,11 +14,19 @@
 #include "hw/virtio/virtio.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-input.h"
-
+#include "standard-headers/linux/vhost_types.h"
 #include "standard-headers/linux/input.h"
 
 #define VIRTIO_INPUT_VM_VERSION 1
 
+qmp_virtio_feature_map_t input_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_INPUT_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 /* ----------------------------------------------------------------- */
 
 void virtio_input_send(VirtIOInput *vinput, virtio_input_event *event)
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 2449b9c..ece871a 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -35,9 +35,11 @@
 #include "hw/qdev-properties.h"
 #include "qapi/qapi-types-migration.h"
 #include "qapi/qapi-events-migration.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "hw/virtio/virtio-access.h"
 #include "migration/misc.h"
 #include "standard-headers/linux/ethtool.h"
+#include "standard-headers/linux/vhost_types.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
 #include "monitor/qdev.h"
@@ -89,6 +91,51 @@
                                          VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
                                          VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
 
+qmp_virtio_feature_map_t net_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_NET_F_##name, VIRTIO_NET_FEATURE_##name }
+    FEATURE_ENTRY(CSUM),
+    FEATURE_ENTRY(GUEST_CSUM),
+    FEATURE_ENTRY(CTRL_GUEST_OFFLOADS),
+    FEATURE_ENTRY(MTU),
+    FEATURE_ENTRY(MAC),
+    FEATURE_ENTRY(GUEST_TSO4),
+    FEATURE_ENTRY(GUEST_TSO6),
+    FEATURE_ENTRY(GUEST_ECN),
+    FEATURE_ENTRY(GUEST_UFO),
+    FEATURE_ENTRY(HOST_TSO4),
+    FEATURE_ENTRY(HOST_TSO6),
+    FEATURE_ENTRY(HOST_ECN),
+    FEATURE_ENTRY(HOST_UFO),
+    FEATURE_ENTRY(MRG_RXBUF),
+    FEATURE_ENTRY(STATUS),
+    FEATURE_ENTRY(CTRL_VQ),
+    FEATURE_ENTRY(CTRL_RX),
+    FEATURE_ENTRY(CTRL_VLAN),
+    FEATURE_ENTRY(CTRL_RX_EXTRA),
+    FEATURE_ENTRY(GUEST_ANNOUNCE),
+    FEATURE_ENTRY(MQ),
+    FEATURE_ENTRY(CTRL_MAC_ADDR),
+    FEATURE_ENTRY(HASH_REPORT),
+    FEATURE_ENTRY(RSS),
+    FEATURE_ENTRY(RSC_EXT),
+    FEATURE_ENTRY(STANDBY),
+    FEATURE_ENTRY(SPEED_DUPLEX),
+#ifndef VIRTIO_NET_NO_LEGACY
+    FEATURE_ENTRY(GSO),
+#endif /* VIRTIO_NET_NO_LEGACY */
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_NET_F_##name, VIRTIO_NET_FEATURE_##name }
+    FEATURE_ENTRY(VIRTIO_NET_HDR),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_NET_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static const VirtIOFeature feature_sizes[] = {
     {.flags = 1ULL << VIRTIO_NET_F_MAC,
      .end = endof(struct virtio_net_config, mac)},
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index ce71939..9a62d6e 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -15,7 +15,9 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/virtio-scsi.h"
 #include "migration/qemu-file-types.h"
 #include "qemu/error-report.h"
@@ -29,6 +31,21 @@
 #include "hw/virtio/virtio-access.h"
 #include "trace.h"
 
+qmp_virtio_feature_map_t scsi_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_SCSI_F_##name, VIRTIO_SCSI_FEATURE_##name }
+    FEATURE_ENTRY(INOUT),
+    FEATURE_ENTRY(HOTPLUG),
+    FEATURE_ENTRY(CHANGE),
+    FEATURE_ENTRY(T10_PI),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_SCSI_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static inline int virtio_scsi_get_lun(uint8_t *lun)
 {
     return ((lun[2] << 8) | lun[3]) & 0x3FFF;
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index e513e4f..092c3fa 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -15,6 +15,7 @@
 #include <sys/ioctl.h>
 #include "standard-headers/linux/virtio_fs.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/virtio/virtio-bus.h"
@@ -23,6 +24,15 @@
 #include "hw/virtio/vhost-user-fs.h"
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
+#include "standard-headers/linux/vhost_types.h"
+
+qmp_virtio_feature_map_t fs_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VHOST_USER_FS_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
 
 static const int user_feature_bits[] = {
     VIRTIO_F_VERSION_1,
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 665a0df..32feb69 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -11,12 +11,22 @@
 #include "qemu/osdep.h"
 #include "standard-headers/linux/virtio_vsock.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "hw/virtio/virtio-access.h"
 #include "qemu/error-report.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-vsock.h"
 #include "qemu/iov.h"
 #include "monitor/monitor.h"
+#include "standard-headers/linux/vhost_types.h"
+
+qmp_virtio_feature_map_t vsock_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VHOST_VSOCK_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
 
 const int feature_bits[] = {
     VIRTIO_VSOCK_F_SEQPACKET,
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 641a394..532016c 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -27,6 +27,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-machine.h"
 #include "qapi/visitor.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "migration/misc.h"
@@ -37,6 +38,19 @@
 
 #define BALLOON_PAGE_SIZE  (1 << VIRTIO_BALLOON_PFN_SHIFT)
 
+qmp_virtio_feature_map_t balloon_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_BALLOON_F_##name, VIRTIO_BALLOON_FEATURE_##name }
+    FEATURE_ENTRY(MUST_TELL_HOST),
+    FEATURE_ENTRY(STATS_VQ),
+    FEATURE_ENTRY(DEFLATE_ON_OOM),
+    FEATURE_ENTRY(FREE_PAGE_HINT),
+    FEATURE_ENTRY(PAGE_POISON),
+    FEATURE_ENTRY(REPORTING),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 typedef struct PartiallyBalloonedPage {
     ram_addr_t base_gpa;
     unsigned long *bitmap;
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 7d63b8c..f626ba8 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -16,6 +16,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/error-report.h"
 
 #include "hw/virtio/virtio.h"
@@ -23,10 +24,19 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-access.h"
 #include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/vhost_types.h"
 #include "sysemu/cryptodev-vhost.h"
 
 #define VIRTIO_CRYPTO_VM_VERSION 1
 
+qmp_virtio_feature_map_t crypto_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_CRYPTO_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 /*
  * Transfer virtqueue index to crypto queue index.
  * The control virtqueue is after the data virtqueues
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 92c5eb7..9a09293 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -25,6 +25,7 @@
 #include "hw/virtio/virtio.h"
 #include "sysemu/kvm.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 
@@ -40,6 +41,19 @@
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 #define VIOMMU_PROBE_SIZE 512
 
+qmp_virtio_feature_map_t iommu_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_IOMMU_F_##name, VIRTIO_IOMMU_FEATURE_##name }
+    FEATURE_ENTRY(INPUT_RANGE),
+    FEATURE_ENTRY(DOMAIN_RANGE),
+    FEATURE_ENTRY(MAP_UNMAP),
+    FEATURE_ENTRY(BYPASS),
+    FEATURE_ENTRY(PROBE),
+    FEATURE_ENTRY(MMIO),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 typedef struct VirtIOIOMMUDomain {
     uint32_t id;
     GTree *mappings;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 8d13d27..5bac549 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -30,11 +30,100 @@
 #include "sysemu/dma.h"
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/vhost_types.h"
+#include CONFIG_DEVICES
 
 /* QAPI list of VirtIODevices */
 static QTAILQ_HEAD(, VirtIODevice) virtio_list;
 
 /*
+ * Maximum size of virtio device config space
+ */
+#define VHOST_USER_MAX_CONFIG_SIZE 256
+
+enum VhostUserProtocolFeature {
+    VHOST_USER_PROTOCOL_F_MQ = 0,
+    VHOST_USER_PROTOCOL_F_LOG_SHMFD = 1,
+    VHOST_USER_PROTOCOL_F_RARP = 2,
+    VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
+    VHOST_USER_PROTOCOL_F_NET_MTU = 4,
+    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
+    VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
+    VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
+    VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
+    VHOST_USER_PROTOCOL_F_CONFIG = 9,
+    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
+    VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
+    VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
+    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
+    VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
+    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_MAX
+};
+
+static qmp_virtio_feature_map_t transport_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_F_##name, VIRTIO_TRANSPORT_FEATURE_##name }
+#ifndef VIRTIO_CONFIG_NO_LEGACY
+    FEATURE_ENTRY(NOTIFY_ON_EMPTY),
+    FEATURE_ENTRY(ANY_LAYOUT),
+#endif /* VIRTIO_CONFIG_NO_LEGACY */
+    FEATURE_ENTRY(VERSION_1),
+    FEATURE_ENTRY(IOMMU_PLATFORM),
+    FEATURE_ENTRY(RING_PACKED),
+    FEATURE_ENTRY(ORDER_PLATFORM),
+    FEATURE_ENTRY(SR_IOV),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_RING_F_##name, VIRTIO_TRANSPORT_FEATURE_##name }
+    FEATURE_ENTRY(INDIRECT_DESC),
+    FEATURE_ENTRY(EVENT_IDX),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_USER_F_##name, VIRTIO_TRANSPORT_FEATURE_##name }
+    FEATURE_ENTRY(PROTOCOL_FEATURES),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
+static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_USER_PROTOCOL_F_##name, VHOST_PROTOCOL_FEATURE_##name }
+    FEATURE_ENTRY(MQ),
+    FEATURE_ENTRY(LOG_SHMFD),
+    FEATURE_ENTRY(RARP),
+    FEATURE_ENTRY(REPLY_ACK),
+    FEATURE_ENTRY(NET_MTU),
+    FEATURE_ENTRY(SLAVE_REQ),
+    FEATURE_ENTRY(CROSS_ENDIAN),
+    FEATURE_ENTRY(CRYPTO_SESSION),
+    FEATURE_ENTRY(PAGEFAULT),
+    FEATURE_ENTRY(CONFIG),
+    FEATURE_ENTRY(SLAVE_SEND_FD),
+    FEATURE_ENTRY(HOST_NOTIFIER),
+    FEATURE_ENTRY(INFLIGHT_SHMFD),
+    FEATURE_ENTRY(RESET_DEVICE),
+    FEATURE_ENTRY(INBAND_NOTIFICATIONS),
+    FEATURE_ENTRY(CONFIGURE_MEM_SLOTS),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
+/* virtio device configuration statuses */
+static qmp_virtio_feature_map_t config_status_map[] = {
+#define STATUS_ENTRY(name) \
+    { VIRTIO_CONFIG_S_##name, VIRTIO_CONFIG_STATUS_##name }
+    STATUS_ENTRY(DRIVER_OK),
+    STATUS_ENTRY(FEATURES_OK),
+    STATUS_ENTRY(DRIVER),
+    STATUS_ENTRY(NEEDS_RESET),
+    STATUS_ENTRY(FAILED),
+    STATUS_ENTRY(ACKNOWLEDGE),
+#undef STATUS_ENTRY
+    { -1, -1 }
+};
+
+/*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
  * which don't provide a means for the guest to tell the host the alignment.
@@ -3949,6 +4038,164 @@ static VirtIODevice *virtio_device_find(const char *path)
     return NULL;
 }
 
+#define CONVERT_FEATURES(type, map, is_status)      \
+    ({                                              \
+        type *list = NULL;                          \
+        type *node;                                 \
+        for (i = 0; map[i].virtio_bit != -1; i++) { \
+            if (is_status) {                        \
+                bit = map[i].virtio_bit;            \
+            }                                       \
+            else {                                  \
+                bit = 1ULL << map[i].virtio_bit;    \
+            }                                       \
+            if ((bitmap & bit) == 0) {              \
+                continue;                           \
+            }                                       \
+            node = g_new0(type, 1);                 \
+            node->value = map[i].qapi_virtio_enum;  \
+            node->next = list;                      \
+            list = node;                            \
+            bitmap ^= bit;                          \
+        }                                           \
+        list;                                       \
+    })
+
+static VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
+{
+    VirtioDeviceStatus *status;
+    uint8_t bit;
+    int i;
+
+    status = g_new0(VirtioDeviceStatus, 1);
+    status->dev_status = CONVERT_FEATURES(VirtioConfigStatusList, \
+                                          config_status_map, 1);
+    status->has_unknown_statuses = bitmap != 0;
+    if (status->has_unknown_statuses) {
+        status->unknown_statuses = bitmap;
+    }
+
+    return status;
+}
+
+static VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap)
+{
+    VhostDeviceProtocols *vhu_protocols;
+    uint64_t bit;
+    int i;
+
+    vhu_protocols = g_new0(VhostDeviceProtocols, 1);
+    vhu_protocols->features =
+                    CONVERT_FEATURES(VhostProtocolFeatureList,
+                                     vhost_user_protocol_map, 0);
+    vhu_protocols->has_unknown_protocols = bitmap != 0;
+    if (vhu_protocols->has_unknown_protocols) {
+        vhu_protocols->unknown_protocols = bitmap;
+    }
+
+    return vhu_protocols;
+}
+
+static VirtioDeviceFeatures *qmp_decode_features(const char *name,
+                                                 uint64_t bitmap)
+{
+    VirtioDeviceFeatures *features;
+    uint64_t bit;
+    int i;
+
+    features = g_new0(VirtioDeviceFeatures, 1);
+
+    /* transport features */
+    features->transport = CONVERT_FEATURES(VirtioTransportFeatureList, \
+                                           transport_map, 0);
+    /* device features */
+    features->type = qapi_enum_parse(&VirtioType_lookup, name, -1, NULL);
+
+    switch (features->type) {
+#ifdef CONFIG_VIRTIO_SERIAL
+    case VIRTIO_TYPE_VIRTIO_SERIAL:
+        features->u.virtio_serial.features =
+                CONVERT_FEATURES(VirtioSerialFeatureList, serial_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BLK
+    case VIRTIO_TYPE_VIRTIO_BLK:
+        features->u.virtio_blk.features =
+                CONVERT_FEATURES(VirtioBlkFeatureList, blk_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_GPU
+    case VIRTIO_TYPE_VIRTIO_GPU:
+        features->u.virtio_gpu.features =
+            CONVERT_FEATURES(VirtioGpuFeatureList, gpu_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_NET
+    case VIRTIO_TYPE_VIRTIO_NET:
+        features->u.virtio_net.features =
+            CONVERT_FEATURES(VirtioNetFeatureList, net_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_SCSI
+    case VIRTIO_TYPE_VIRTIO_SCSI:
+        features->u.virtio_scsi.features =
+            CONVERT_FEATURES(VirtioScsiFeatureList, scsi_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BALLOON
+    case VIRTIO_TYPE_VIRTIO_BALLOON:
+        features->u.virtio_balloon.features =
+            CONVERT_FEATURES(VirtioBalloonFeatureList, balloon_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_IOMMU
+    case VIRTIO_TYPE_VIRTIO_IOMMU:
+        features->u.virtio_iommu.features =
+            CONVERT_FEATURES(VirtioIommuFeatureList, iommu_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_INPUT
+    case VIRTIO_TYPE_VIRTIO_INPUT:
+        features->u.virtio_input.features =
+            CONVERT_FEATURES(VirtioInputFeatureList, input_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VHOST_USER_FS
+    case VIRTIO_TYPE_VHOST_USER_FS:
+        features->u.vhost_user_fs.features =
+            CONVERT_FEATURES(VhostUserFsFeatureList, fs_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VHOST_VSOCK
+    case VIRTIO_TYPE_VHOST_VSOCK:
+        features->u.vhost_vsock.features =
+            CONVERT_FEATURES(VhostVsockFeatureList, vsock_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_CRYPTO
+    case VIRTIO_TYPE_VIRTIO_CRYPTO:
+        features->u.virtio_crypto.features =
+            CONVERT_FEATURES(VirtioCryptoFeatureList, crypto_map, 0);
+        break;
+#endif
+    /* No features */
+    case VIRTIO_TYPE_VIRTIO_9P:
+    case VIRTIO_TYPE_VIRTIO_PMEM:
+    case VIRTIO_TYPE_VIRTIO_RNG:
+    case VIRTIO_TYPE_VIRTIO_MEM:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    features->has_unknown_features = bitmap != 0;
+    if (features->has_unknown_features) {
+        features->unknown_features = bitmap;
+    }
+
+    return features;
+}
+
 VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
 {
     VirtIODevice *vdev;
@@ -3965,9 +4212,12 @@ VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
     status->name = g_strdup(vdev->name);
     status->device_id = vdev->device_id;
     status->vhost_started = vdev->vhost_started;
-    status->guest_features = vdev->guest_features;
-    status->host_features = vdev->host_features;
-    status->backend_features = vdev->backend_features;
+    status->guest_features = qmp_decode_features(vdev->name,
+                                                 vdev->guest_features);
+    status->host_features = qmp_decode_features(vdev->name,
+                                                vdev->host_features);
+    status->backend_features = qmp_decode_features(vdev->name,
+                                                   vdev->backend_features);
 
     switch (vdev->device_endian) {
     case VIRTIO_DEVICE_ENDIAN_LITTLE:
@@ -3982,7 +4232,7 @@ VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
     }
 
     status->num_vqs = virtio_get_num_queues(vdev);
-    status->status = vdev->status;
+    status->status = qmp_decode_status(vdev->status);
     status->isr = vdev->isr;
     status->queue_sel = vdev->queue_sel;
     status->vm_running = vdev->vm_running;
@@ -3995,7 +4245,8 @@ VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
     status->bus_name = g_strdup(vdev->bus_name);
     status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
 
-    if (vdev->vhost_started) {
+    status->has_vhost_dev = vdev->vhost_started;
+    if (status->has_vhost_dev) {
         VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
         struct vhost_dev *hdev = vdc->get_vhost(vdev);
 
@@ -4003,10 +4254,14 @@ VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
         status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
         status->vhost_dev->nvqs = hdev->nvqs;
         status->vhost_dev->vq_index = hdev->vq_index;
-        status->vhost_dev->features = hdev->features;
-        status->vhost_dev->acked_features = hdev->acked_features;
-        status->vhost_dev->backend_features = hdev->backend_features;
-        status->vhost_dev->protocol_features = hdev->protocol_features;
+        status->vhost_dev->features =
+            qmp_decode_features(vdev->name, hdev->features);
+        status->vhost_dev->acked_features =
+            qmp_decode_features(vdev->name, hdev->acked_features);
+        status->vhost_dev->backend_features =
+            qmp_decode_features(vdev->name, hdev->backend_features);
+        status->vhost_dev->protocol_features =
+            qmp_decode_protocols(hdev->protocol_features);
         status->vhost_dev->max_queues = hdev->max_queues;
         status->vhost_dev->backend_cap = hdev->backend_cap;
         status->vhost_dev->log_enabled = hdev->log_enabled;
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 3fa0b55..2c34cff 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -5,6 +5,9 @@
 #include "hw/virtio/virtio.h"
 #include "exec/memory.h"
 
+#define VHOST_F_DEVICE_IOTLB 63
+#define VHOST_USER_F_PROTOCOL_FEATURES 30
+
 /* Generic structures common for any vhost based device. */
 
 struct vhost_inflight {
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index eceaafc..fc703bc 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -71,6 +71,23 @@ typedef struct VirtQueueElement
 #define TYPE_VIRTIO_DEVICE "virtio-device"
 OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
 
+typedef struct {
+    int virtio_bit;
+    int qapi_virtio_enum;
+} qmp_virtio_feature_map_t;
+
+extern qmp_virtio_feature_map_t serial_map[];
+extern qmp_virtio_feature_map_t blk_map[];
+extern qmp_virtio_feature_map_t gpu_map[];
+extern qmp_virtio_feature_map_t net_map[];
+extern qmp_virtio_feature_map_t scsi_map[];
+extern qmp_virtio_feature_map_t balloon_map[];
+extern qmp_virtio_feature_map_t iommu_map[];
+extern qmp_virtio_feature_map_t input_map[];
+extern qmp_virtio_feature_map_t fs_map[];
+extern qmp_virtio_feature_map_t vsock_map[];
+extern qmp_virtio_feature_map_t crypto_map[];
+
 enum virtio_device_endian {
     VIRTIO_DEVICE_ENDIAN_UNKNOWN,
     VIRTIO_DEVICE_ENDIAN_LITTLE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 656a26f..c820001 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -79,6 +79,463 @@
 }
 
 ##
+# @VirtioType:
+#
+# An enumeration of Virtio device types (or names)
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioType',
+  'data': [ 'virtio-net', 'virtio-blk', 'virtio-serial', 'virtio-rng',
+            'virtio-balloon', 'virtio-iomem', 'virtio-rpmsg',
+            'virtio-scsi', 'virtio-9p', 'virtio-mac-wlan',
+            'virtio-rproc-serial', 'virtio-caif', 'virtio-mem-balloon',
+            'virtio-gpu', 'virtio-clk', 'virtio-input', 'vhost-vsock',
+            'virtio-crypto', 'virtio-signal', 'virtio-pstore',
+            'virtio-iommu', 'virtio-mem', 'virtio-sound', 'vhost-user-fs',
+            'virtio-pmem', 'virtio-mac-hwsim', 'vhost-user-i2c',
+            'virtio-bluetooth' ]
+}
+
+##
+# @VirtioConfigStatus:
+#
+# An enumeration of Virtio device configuration statuses
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioConfigStatus',
+  'data': [ 'driver-ok', 'features-ok', 'driver', 'needs-reset',
+            'failed', 'acknowledge' ]
+}
+
+##
+# @VirtioDeviceStatus:
+#
+# A structure defined to list the configuration statuses of a virtio
+# device
+#
+# @dev-status: List of decoded configuration statuses of the virtio
+#              device
+#
+# @unknown-statuses: virtio device statuses bitmap that have not been decoded
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceStatus',
+  'data': {
+    'dev-status': [ 'VirtioConfigStatus' ],
+    '*unknown-statuses': 'uint8'
+  }
+}
+
+##
+# @VhostProtocolFeature:
+#
+# An enumeration of Vhost User protocol features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VhostProtocolFeature',
+  'data': [ 'mq', 'log-shmfd', 'rarp', 'reply-ack', 'net-mtu',
+            'slave-req', 'cross-endian', 'crypto-session', 'pagefault',
+            'config', 'slave-send-fd', 'host-notifier',
+            'inflight-shmfd', 'reset-device', 'inband-notifications',
+            'configure-mem-slots' ]
+}
+
+##
+# @VhostDeviceProtocols:
+#
+# A structure defined to list the vhost user protocol features of a
+# Vhost User device
+#
+# @features: List of decoded vhost user protocol features of a vhost
+#            user device
+#
+# @unknown-protocols: vhost user device protocol features bitmap that
+#                     have not been decoded
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VhostDeviceProtocols',
+    'data': {
+      'features': [ 'VhostProtocolFeature' ],
+      '*unknown-protocols': 'uint64'
+    }
+}
+
+##
+# @VirtioTransportFeature:
+#
+# An enumeration of Virtio device transport features, including virtio-ring
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioTransportFeature',
+  'data': [ 'notify-on-empty', 'any-layout', 'protocol-features',
+            'version-1', 'iommu-platform', 'ring-packed', 'order-platform',
+            'sr-iov', 'indirect-desc', 'event-idx' ]
+}
+
+##
+# @VirtioSerialFeature:
+#
+# An enumeration of Virtio serial/console features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioSerialFeature',
+  'data': [ 'size', 'multiport', 'emerg-write' ]
+}
+
+##
+# @VirtioBlkFeature:
+#
+# An enumeration of Virtio block features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioBlkFeature',
+  'data': [ 'size-max', 'seg-max', 'geometry', 'ro', 'blk-size',
+            'topology', 'mq', 'discard', 'write-zeroes', 'barrier',
+            'scsi', 'flush', 'config-wce', 'log-all' ]
+}
+
+##
+# @VirtioGpuFeature:
+#
+# An enumeration of Virtio gpu features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioGpuFeature',
+  'data': [ 'virgl', 'edid', 'resource-uuid', 'resource-blob',
+            'log-all' ]
+}
+
+##
+# @VirtioNetFeature:
+#
+# An enumeration of Virtio net features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioNetFeature',
+  'data': [ 'csum', 'guest-csum', 'ctrl-guest-offloads', 'mtu', 'mac',
+            'guest-tso4', 'guest-tso6', 'guest-ecn', 'guest-ufo',
+            'host-tso4', 'host-tso6', 'host-ecn', 'host-ufo',
+            'mrg-rxbuf', 'status', 'ctrl-vq', 'ctrl-rx', 'ctrl-vlan',
+            'ctrl-rx-extra', 'guest-announce', 'mq', 'ctrl-mac-addr',
+            'hash-report', 'rss', 'rsc-ext', 'standby', 'speed-duplex',
+            'gso', 'virtio-net-hdr', 'log-all' ]
+}
+
+##
+# @VirtioScsiFeature:
+#
+# An enumeration of Virtio scsi features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioScsiFeature',
+  'data': [ 'inout', 'hotplug', 'change', 't10-pi', 'log-all' ]
+}
+
+##
+# @VirtioBalloonFeature:
+#
+# An enumeration of Virtio balloon features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioBalloonFeature',
+  'data': [ 'must-tell-host', 'stats-vq', 'deflate-on-oom',
+            'free-page-hint', 'page-poison', 'reporting' ]
+}
+
+##
+# @VirtioIommuFeature:
+#
+# An enumeration of Virtio iommu features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioIommuFeature',
+  'data': [ 'input-range', 'domain-range', 'map-unmap', 'bypass',
+            'probe', 'mmio' ]
+}
+
+##
+# @VirtioInputFeature:
+#
+# An enumeration of Virtio input features. Note that virtio-input
+# has no device-specific features except when its vhost is active,
+# then it may have the VHOST_F_LOG_ALL feature.
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioInputFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VhostUserFsFeature:
+#
+# An enumeration of vhost user FS features. Note that vhost-user-fs
+# has no device-specific features other than the vhost-common
+# VHOST_F_LOG_ALL feature.
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VhostUserFsFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VhostVsockFeature:
+#
+# An enumeration of vhost vsock features. Note that vhost-vsock has
+# no device-specific features other than the vhost-common
+# VHOST_F_LOG_ALL feature.
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VhostVsockFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VirtioCryptoFeature:
+#
+# An enumeration of virtio crypto features. Not that virtio-crypto
+# has no device-specific features other than when it is a vhost
+# device, then it may have the VHOST_F_LOG_ALL feature.
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioCryptoFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VirtioDeviceFeaturesBase:
+#
+# The common fields that apply to all Virtio devices
+#
+# @type: virtio device name
+# @transport: the list of transport features of the virtio device
+# @unknown-features: virtio device features bitmap that have not been decoded
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesBase',
+    'data': {
+      'type': 'VirtioType',
+      'transport': [ 'VirtioTransportFeature' ],
+      '*unknown-features': 'uint64'
+    }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsSerial:
+#
+# The options that apply to Virtio serial devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsSerial',
+  'data': { 'features': [ 'VirtioSerialFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsBlk:
+#
+# The options that apply to Virtio block devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsBlk',
+  'data': { 'features': [ 'VirtioBlkFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsGpu:
+#
+# The options that apply to Virtio GPU devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsGpu',
+  'data': { 'features': [ 'VirtioGpuFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsNet:
+#
+# The options that apply to Virtio net devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsNet',
+  'data': { 'features': [ 'VirtioNetFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsScsi:
+#
+# The options that apply to Virtio SCSI devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsScsi',
+  'data': { 'features': [ 'VirtioScsiFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsBalloon:
+#
+# The options that apply to Virtio balloon devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsBalloon',
+  'data': { 'features': [ 'VirtioBalloonFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsIommu:
+#
+# The options that apply to Virtio IOMMU devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsIommu',
+  'data': { 'features': [ 'VirtioIommuFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsInput:
+#
+# The options that apply to Virtio input devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsInput',
+  'data': { 'features': [ 'VirtioInputFeature' ] }
+}
+
+##
+# @VhostDeviceFeaturesOptionsFs:
+#
+# The options that apply to vhost-user-fs devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VhostDeviceFeaturesOptionsFs',
+  'data': { 'features': [ 'VhostUserFsFeature' ] }
+}
+
+##
+# @VhostDeviceFeaturesOptionsVsock:
+#
+# The options that apply to vhost-vsock devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VhostDeviceFeaturesOptionsVsock',
+  'data': { 'features': [ 'VhostVsockFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsCrypto:
+#
+# The options that apply to virtio-crypto devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsCrypto',
+  'data': { 'features': [ 'VirtioCryptoFeature' ] }
+}
+
+##
+# @VirtioDeviceFeatures:
+#
+# A union to define the list of features for a virtio device
+#
+# Since: 6.2
+##
+
+{ 'union': 'VirtioDeviceFeatures',
+  'base': 'VirtioDeviceFeaturesBase',
+  'discriminator': 'type',
+  'data': {
+    'virtio-serial': 'VirtioDeviceFeaturesOptionsSerial',
+    'virtio-blk': 'VirtioDeviceFeaturesOptionsBlk',
+    'virtio-gpu': 'VirtioDeviceFeaturesOptionsGpu',
+    'virtio-net': 'VirtioDeviceFeaturesOptionsNet',
+    'virtio-scsi': 'VirtioDeviceFeaturesOptionsScsi',
+    'virtio-balloon': 'VirtioDeviceFeaturesOptionsBalloon',
+    'virtio-iommu': 'VirtioDeviceFeaturesOptionsIommu',
+    'virtio-input': 'VirtioDeviceFeaturesOptionsInput',
+    'vhost-user-fs': 'VhostDeviceFeaturesOptionsFs',
+    'vhost-vsock': 'VhostDeviceFeaturesOptionsVsock',
+    'virtio-crypto': 'VirtioDeviceFeaturesOptionsCrypto'
+  }
+}
+
+##
 # @VhostStatus:
 #
 # Information about a vhost device. This information will only be
@@ -119,10 +576,10 @@
         'n-tmp-sections': 'int',
         'nvqs': 'uint32',
         'vq-index': 'int',
-        'features': 'uint64',
-        'acked-features': 'uint64',
-        'backend-features': 'uint64',
-        'protocol-features': 'uint64',
+        'features': 'VirtioDeviceFeatures',
+        'acked-features': 'VirtioDeviceFeatures',
+        'backend-features': 'VirtioDeviceFeatures',
+        'protocol-features': 'VhostDeviceProtocols',
         'max-queues': 'uint64',
         'backend-cap': 'uint64',
         'log-enabled': 'bool',
@@ -190,12 +647,12 @@
         'name': 'str',
         'device-id': 'uint16',
         'vhost-started': 'bool',
-        'guest-features': 'uint64',
-        'host-features': 'uint64',
-        'backend-features': 'uint64',
+        'guest-features': 'VirtioDeviceFeatures',
+        'host-features': 'VirtioDeviceFeatures',
+        'backend-features': 'VirtioDeviceFeatures',
         'device-endian': 'VirtioStatusEndianness',
         'num-vqs': 'int',
-        'status': 'uint8',
+        'status': 'VirtioDeviceStatus',
         'isr': 'uint8',
         'queue-sel': 'uint16',
         'vm-running': 'bool',
@@ -207,7 +664,7 @@
         'disable-legacy-check': 'bool',
         'bus-name': 'str',
         'use-guest-notifier-mask': 'bool',
-        'vhost-dev': 'VhostStatus'
+        '*vhost-dev': 'VhostStatus'
     }
 }
 
@@ -238,28 +695,31 @@
 #          "name": "virtio-crypto",
 #          "started": true,
 #          "device-id": 20,
-#          "vhost-dev": {
-#               "n-tmp-sections": 0,
-#               "n-mem-sections": 0,
-#               "max-queues": 0,
-#               "backend-cap": 0,
-#               "log-size": 0,
-#               "backend-features": 0,
-#               "nvqs": 0,
-#               "protocol-features": 0,
-#               "vq-index": 0,
-#               "log-enabled": false,
-#               "acked-features": 0,
-#               "features": 0
+#          "backend-features": {
+#               "transport": [],
+#               "type": "virtio-crypto",
+#               "features": []
 #          },
-#          "backend-features": 0,
 #          "start-on-kick": false,
 #          "isr": 1,
 #          "broken": false,
-#          "status": 15,
+#          "status": {
+#               "dev-status": ["acknowledge", "driver", "features-ok",
+#                              "driver-ok"]
+#          },
 #          "num-vqs": 2,
-#          "guest-features": 5100273664,
-#          "host-features": 6325010432,
+#          "guest-features": {
+#               "transport": ["event-idx", "indirect-desc", "version-1"],
+#               "type": "virtio-crypto",
+#               "features": []
+#          },
+#          "host-features": {
+#               "transport": ["protocol-features", "event-idx",
+#                             "indirect-desc", "version-1", "any-layout",
+#                             "notify-on-empty"],
+#               "type": "virtio-crypto",
+#               "features": []
+#          },
 #          "use-guest-notifier-mask": true,
 #          "vm-running": true,
 #          "queue-sel": 1,
@@ -289,22 +749,71 @@
 #               "max-queues": 1,
 #               "backend-cap": 2,
 #               "log-size": 0,
-#               "backend-features": 0,
+#               "backend-features": {
+#                       "transport": [],
+#                       "type": "virtio-net",
+#                       "features": []
+#               },
 #               "nvqs": 2,
-#               "protocol-features": 0,
+#               "protocol-features": {
+#                       "features": []
+#               },
 #               "vq-index": 0,
 #               "log-enabled": false,
-#               "acked-features": 5100306432,
-#               "features": 13908344832
+#               "acked-features": {
+#                       "transport": ["event-idx", "indirect-desc", "version-1",
+#                                     "any-layout", "notify-on-empty"],
+#                       "type": "virtio-net",
+#                       "features": ["mrg-rxbuf"]
+#               },
+#               "features": {
+#                       "transport": ["event-idx", "indirect-desc",
+#                                     "iommu-platform", "version-1", "any-layout",
+#                                     "notify-on-empty"],
+#                       "type": "virtio-net",
+#                       "features": ["log-all", "mrg-rxbuf"]
+#               }
+#          },
+#          "backend-features": {
+#               "transport": ["protocol-features", "event-idx", "indirect-desc",
+#                             "version-1", "any-layout", "notify-on-empty"],
+#               "type": "virtio-net",
+#               "features": ["gso", "ctrl-mac-addr", "guest-announce", "ctrl-rx-extra",
+#                            "ctrl-vlan", "ctrl-rx", "ctrl-vq", "status", "mrg-rxbuf",
+#                            "host-ufo", "host-ecn", "host-tso6", "host-tso4",
+#                            "guest-ufo", "guest-ecn", "guest-tso6", "guest-tso4",
+#                            "mac", "ctrl-guest-offloads", "guest-csum", "csum"]
 #          },
-#          "backend-features": 6337593319,
 #          "start-on-kick": false,
 #          "isr": 1,
 #          "broken": false,
-#          "status": 15,
+#          "status": {
+#               "dev-status": ["acknowledge", "driver", "features-ok", "driver-ok"]
+#          },
 #          "num-vqs": 3,
-#          "guest-features": 5111807911,
-#          "host-features": 6337593319,
+#          "guest-features": {
+#               "transport": ["event-idx", "indirect-desc", "version-1"],
+#               "type": "virtio-net",
+#               "features": ["ctrl-mac-addr", "guest-announce", "ctrl-vlan",
+#                            "ctrl-rx", "ctrl-vq", "status", "mrg-rxbuf",
+#                            "host-ufo", "host-ecn", "host-tso6",
+#                            "host-tso4", "guest-ufo", "guest-ecn",
+#                            "guest-tso6", "guest-tso4", "mac",
+#                            "ctrl-guest-offloads", "guest-csum", "csum"]
+#          },
+#          "host-features": {
+#               "transport": ["protocol-features", "event-idx",
+#                             "indirect-desc", "version-1", "any-layout",
+#                             "notify-on-empty"],
+#               "type": "virtio-net",
+#               "features": ["gso", "ctrl-mac-addr", "guest-announce",
+#                            "ctrl-rx-extra", "ctrl-vlan", "ctrl-rx",
+#                            "ctrl-vq", "status", "mrg-rxbuf", "host-ufo",
+#                            "host-ecn", "host-tso6", "host-tso4",
+#                            "guest-ufo", "guest-ecn", "guest-tso6",
+#                            "guest-tso4", "mac", "ctrl-guest-offloads",
+#                            "guest-csum", "csum"]
+#          },
 #          "use-guest-notifier-mask": true,
 #          "vm-running": true,
 #          "queue-sel": 2,
-- 
1.8.3.1


