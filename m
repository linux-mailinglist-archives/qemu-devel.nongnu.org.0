Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74F044BE8E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:27:08 +0100 (CET)
Received: from localhost ([::1]:39480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkot-0005Ap-RL
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:27:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkklw-0002L3-OA; Wed, 10 Nov 2021 05:24:05 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkls-0005Am-D2; Wed, 10 Nov 2021 05:24:03 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AA9Spr6032539; 
 Wed, 10 Nov 2021 10:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=NoBW0BJvUFOtbXLC42HBqw0hmjT+O4LAThXPCacwWV4=;
 b=zN7YF077FF1qsZpK7C4hoYMzPh3BecuSvmK4xzfwl9pXtCgFwXSMCm5H1n6xP/5wECNN
 9Bd18e5cyGyrJRnB3FYdUh1pkrc1tYZ5Vex8HtiapFJaQAS3yLDT+ERULBeIhrKzY93N
 4d+cZvllMC85PqXeYLLUgQ3Gk+5K8JEMsuEJ3zpUQ8jASA2UGFYzZzitgY+qAC01vVaL
 SmPBSAHNvUmQANfpGltqv42Z+ujCm2Id1lt/x1H2eBGM3d3MjevTzP9i+P66cFcxNJo+
 5ntfrk0R0NlXxEcqEiQEy2hRzRcPCRQVJ7bvDp4padX4QcCV8l34YKqc37Oo3OQ73Not 5A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c82vgap7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AAAG1m5191438;
 Wed, 10 Nov 2021 10:23:43 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2169.outbound.protection.outlook.com [104.47.73.169])
 by userp3030.oracle.com with ESMTP id 3c842c1j49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJH+lyc7msRXkWXrwYhExMWciNLJfiSL+VmGtE4tFsIHXdVEgQlqmfw+0VOjSVnPy8Rd6IMbmJZ9TdhYkooVz7NtoYCw/TVu8hW8MMnKSsDRtag1roT1pCV6wv3DqHb0IKlpNVhyLC+Y1Gv8lPgNsxIwBBTJn+Dt1tiEmBo53kOqlxLtp+1BxW6sXn/71ITHdXZfQ06GDzBTSwRa5vfsvrVTVWxSjfxLxzFxyDUNAkD6mZ5B5U2jplAnHY1tEOUUojU6uY/+FTK086JpK/Dyn/QkFK+FL5u+7t/V1rdYjhhMe53TWUZMx4XpDtLb5rwbayjzv/VIscWR+kxcAJCSBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoBW0BJvUFOtbXLC42HBqw0hmjT+O4LAThXPCacwWV4=;
 b=GXUvClCYxUbNuGQ+SQRSBJtp4UyJCSaQGS73ZD6BYeJ8/0wMBN3BA54LXqdBKEv2MrJmNlZSrLslyvZ+/sHlcEIkbt3Ar6eCQc2YKZaDLnVrspxDk/zFwBH9q17faW6ws4ktO+bS7dejs/RjGS3rPr6MUoUx6P48aa9m0FuHeWyJJRhd8JU5Eybu6sl1Btikuq3nnc1xTreBI91yRUpLkNvQ7ZVe3VLD8Uty4EVN/RyPdZ6wCwKQXuapPVX424TdZlo/MBR88MIhnUsYxNc6q1dsgPPB0tBrM6KqM8JCTgiuSXrHgdv15c5a0k0KhtyWLbPl6ER1uUpcwI7Tu6AyMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoBW0BJvUFOtbXLC42HBqw0hmjT+O4LAThXPCacwWV4=;
 b=AnE76IFBkqtukVyP/ZeSYEz6k4f6Y8vwfUeB6xWTJzi4Vg0Q2E1ZW0Rw1vVPjAlnPhZfF/tDLkbT2SJlPlIrzsQ46cmQ8GnhSOs+/K2R/4TWjNNki4XRKrX3+R7tYS1ZE6NadCfGBbN8Rak0uFyUvgNTOTqZeteKXcaYwlRYW74=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4727.namprd10.prod.outlook.com (2603:10b6:510:3f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 10:23:38 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 10:23:38 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 0/8] hmp,qmp: Add commands to introspect virtio devices
Date: Wed, 10 Nov 2021 05:23:04 -0500
Message-Id: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.43) by
 SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Wed, 10 Nov 2021 10:23:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4013090b-4ea7-48c6-2f62-08d9a434292a
X-MS-TrafficTypeDiagnostic: PH0PR10MB4727:
X-Microsoft-Antispam-PRVS: <PH0PR10MB47276528C02D1BA59B6262B8E8939@PH0PR10MB4727.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 93BQir7Nmqqc2i62DlHZwY1iVChSjqY6v/hzOtVsI0x03PhQdRhIW/ENJzJQ9/s1d6DF6GJPRHabIP//Ajub5uDWwBT7qadQ/Zlp9GXPvHd5tgW97sp+UuUbuDSAjV2yyfRGvQ6R1U5NF+INWbv0j62rycmu7XkYhkKIjDknD1ycj3B+HuShigcqxJV5DQ9PTXL31L+WHjM1DJK6X6tTDL/x2l336LBJtl/ndN9MzOerJHpVCccxhVZVGSLyyuQ/JstjGth6v3Ud/7QivGiieHpyrhyD8o66Iyvl6JkrrJZs+XMj11xe7ZK0bSPKNrUJqxRQONf4Q6GRZx/VZfeNQwomRYF+qJlZUCqHOpT7eEpf+r17xKSpWUGJvqfdmCul5OUV9NEZPgFLUuFXXw/HGg4dIEbhhhglHE2ms5vmuwffHEC+OlnxETi9iNS4AsJO9jtdHpSFZvKYsOSaxofgfveaY1ptoiCYh3JhL+lGadXqvGa5cEPff/UIigpLKh8dHwnYD6w8bfbNjHXxLA59Hmckcd9IzV3DHZK67m6btPaHjOJpjwTdmcK+xCK2lu5xUhGeouCAfNEsSYNMBHq34ge0sCNt1nVStpDwsEsEkue6oa2YXwNyQzUN2B2smf//9VrbSDII8CRNas65j3MRNlPMKfzaqvPmYOSQNSSmGafySmVa7DRSUHoDU/FK7f4YRKrDuXswrUMgCNF8Xo3uvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(30864003)(36756003)(66556008)(8676002)(7416002)(6486002)(66476007)(26005)(5660300002)(66946007)(83380400001)(186003)(4326008)(44832011)(86362001)(7696005)(38100700002)(38350700002)(6916009)(52116002)(2906002)(508600001)(8936002)(956004)(6666004)(2616005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OuCov2pnWcU96K4LhI+8reyYjYhSBdVBDMh3QkClEs0JnE2OKJ58JYv2WXUU?=
 =?us-ascii?Q?+NltX52/8ENq93xLEVQu/YtboUuZcLacKbZ03gnOjihxAjbZSG67slpvBeBC?=
 =?us-ascii?Q?Xa6UKsLsXOTJc2TmU8yal98XryCMMakIQ00gsCNuCqYwY4HwowdSZRuJlY/h?=
 =?us-ascii?Q?/lTerG15r2awSug9NpN8zXNE5q53ziCVU3XY7oa8T2emS8j4gHWbH870HYy0?=
 =?us-ascii?Q?XAexacDAGKihEy/RAd2Iig4hiibQBK75rEtmaHmU25lUZE27nJNfeeTF2vMr?=
 =?us-ascii?Q?oxzxB7iB9GAnpMhERQh+l1FFOgUpiWllBjFa69HfcvuOVACnDlbk9kNadeRp?=
 =?us-ascii?Q?QCA+jd79hFJqiPV1JePmfcLnfrJ9QCwxFFVNyCvZyosl5gzjVSeRPsIqhXKu?=
 =?us-ascii?Q?8gSGata8lNQoWB9DTKANBXZyUcpj4MwYaDavIi7ywkDKAJT+MRRTXqI85tEe?=
 =?us-ascii?Q?nYo/F9egn4ZhYSI6YLTxar0RCtM01/4klJs4gMyPNuhHteMzGIwyAZlFAPJY?=
 =?us-ascii?Q?m38g2KzMrvGRFU94iqIi/yKi83POsRrm4JL05weHgGZGG5Jj4jzyIbK3CDF8?=
 =?us-ascii?Q?BbvFlxYdlVD9+E0WMoRdn+66NwbYyu/kIzeQzMHo1GI54sUzsHpTm9iEyGsf?=
 =?us-ascii?Q?QBmspWO+FopXLknl+owdWmaLZdCfWUe06DbSjLakg3vr5N5X/tFI8LK8Bjb8?=
 =?us-ascii?Q?WqAurUWmVBtjAZ56BG54JWG1iB3WlsXJRpz3YC/YUHIZhJuzzRIAIsMazGwX?=
 =?us-ascii?Q?8rYZTXaBlfLDgoec3aMTLJ9Xk5bPNYcwV7D3ajUHAr+PVU+gkOH7i6Vz0cvs?=
 =?us-ascii?Q?wFWgNd6WgGZe32aD2pM8eox/vNPyWertm4NukZw/WPtmwmGfcEbRmIq+1EZr?=
 =?us-ascii?Q?J9FMe7CBVovUbjgiuw9upIOp6Gg+v7HfPSvae5B4mglfur61pl1omy35dzPM?=
 =?us-ascii?Q?KFpJ3CqjirMiZdogGTdpgL9D/L3F/je+oK+6hRTLfbcJsi+JlM14WickoXpD?=
 =?us-ascii?Q?Jp5zd9TlmE2Wsq+6XDHRrM99dKsF/IU/JvF+fGqNp8vZkmIoi36cgGSxL7Z5?=
 =?us-ascii?Q?dJD3o8doaz8IULDnZt0mdo7iJxxkovXJ9BefxBl8zKIQfeEGDzy++51VVfhr?=
 =?us-ascii?Q?0QHfx7CGvJW1mNRxJi/Ml0CuU9R82iK3qgvXKvfXZ03Irg5392r0JTldRXB6?=
 =?us-ascii?Q?/t9nOu3NG3qj3oNb+ueQCNDR/TPjQ0CQZohmKf2JSPq5/JrWpE8v7iBekyxK?=
 =?us-ascii?Q?LjnMpWXsDJQxUWRsWzyXFQVNi3Y7PvYAvZCGh+qRlVts7LYf3b1cIPyEG+l/?=
 =?us-ascii?Q?VTIs19Hx141JRJlWWy1xj+jA8tLGiay8gB7yJGEALtSRKphtyhirGlO9SNhM?=
 =?us-ascii?Q?a8CyYDh+WszQmIN8Y3FhwK3Qot0LNNkPTGWEyug1+KLSFQtHrIR6UKvhHu2Y?=
 =?us-ascii?Q?ArJTIC2gM28h5hTsPnvQdvaFw5vxiv7ppscW/tsH0+cKZGPOdRrORcTRT3lh?=
 =?us-ascii?Q?RiNG5e1AtJv83Wp4npW8QmoZYT5bKOT622E+WCPjmFp4T4pVevcpS1jO/AV1?=
 =?us-ascii?Q?sx9r4z2yJ8AwzcQPGBo5cwHD7if/myuhl4Jv5b1uiZS9rNrjP9FLVN+/cX8b?=
 =?us-ascii?Q?ZoWE5ZO1qhpfmEOFRvFvstg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4013090b-4ea7-48c6-2f62-08d9a434292a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 10:23:38.7104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgB2bO2m52HwRJi6h/KBjHO0Cv81ct3ze4swL0Rc2jpBEC3lZ1OiZbwLOM5ADq8lqcXOHJjr+ClWsm7VQHcJNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4727
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10163
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111100056
X-Proofpoint-ORIG-GUID: 2ozSUAmw1AqVS4Pa0gLkSm5_-fNOExUC
X-Proofpoint-GUID: 2ozSUAmw1AqVS4Pa0gLkSm5_-fNOExUC
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

This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.

[Jonah: Rebasing previous patchset from Oct. 27 (v8). Original patches
 are from Laurent Vivier from May 2020.

 Rebase from v8 to v9 includes renaming of 'x-' prefixed QMP commands,
 adding the 'unstable' feature to 'x-' prefixed QMP commands, fixes to
 odd indentation in qapi/virtio.json, support for virtio-mem features,
 and moving HMP 'virtio' sub-commands to 'info' sub-commands.]

1. List available virtio devices in the machine

HMP Form:

    info virtio

    Example:

        (qemu) info virtio
        /machine/peripheral/vsock0/virtio-backend [vhost-vsock]
        /machine/peripheral/crypto0/virtio-backend [virtio-crypto]
        /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
        /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
        /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]

QMP Form:

    { 'command': 'x-query-virtio', 'returns': ['VirtioInfo'] }

    Example:

        -> { "execute": "x-query-virtio" }
        <- { "return": [
                {
                    "path": "/machine/peripheral/vsock0/virtio-backend",
                    "type": "vhost-vsock"
                },
                {
                    "path": "/machine/peripheral/crypto0/virtio-backend",
                    "type": "virtio-crypto"
                },
                {
                    "path": "/machine/peripheral-anon/device[2]/virtio-backend",
                    "type": "virtio-scsi"
                },
                {
                    "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                    "type": "virtio-net"
                },
                {
                    "path": "/machine/peripheral-anon/device[0]/virtio-backend",
                    "type": "virtio-serial"
                }
             ]
           }

2. Display status of a given virtio device

HMP Form:

    info virtio-status <path>

    Example:

        (qemu) info virtio-status /machine/peripheral/vsock0/virtio-backend
        /machine/peripheral/vsock0/virtio-backend:
            device_name:             vhost-vsock (vhost)
            device_id:               19
            vhost_started:           true
            bus_name:                (null)
            broken:                  false
            disabled:                false
            disable_legacy_check:    false
            started:                 true
            use_started:             true
            start_on_kick:           false
            use_guest_notifier_mask: true
            vm_running:              true
            num_vqs:                 3
            queue_sel:               2
            isr:                     0
            endianness:              little
            status: acknowledge, driver, features-ok, driver-ok
            Guest features:   event-idx, indirect-desc, version-1
            Host features:    protocol-features, event-idx, indirect-desc, version-1, any-layout,
                              notify-on-empty
            Backend features:
            VHost:
                nvqs:           2
                vq_index:       0
                max_queues:     0
                n_mem_sections: 4
                n_tmp_sections: 4
                backend_cap:    0
                log_enabled:    false
                log_size:       0
                Features:          event-idx, indirect-desc, version-1, any-layout, notify-on-empty,
                                   log-all
                Acked features:    event-idx, indirect-desc, version-1
                Backend features:
                Protocol features:

QMP Form:

    { 'command': 'x-query-virtio-status',
      'data': { 'path': 'str' },
      'returns': 'VirtioStatus'
    }

    Example:

        -> { "execute": "x-query-virtio-status",
             "arguments": {
                "path": "/machine/peripheral/vsock0/virtio-backend"
             }
           }
        <- { "return": {
                "device-endian": "little",
                "bus-name": "",
                "disable-legacy-check": false,
                "name": "vhost-vsock",
                "started": true,
                "device-id": 19,
                "vhost-dev": {
                    "n-tmp-sections": 4,
                    "n-mem-sections": 4,
                    "max-queues": 0,
                    "backend-cap": 0,
                    "log-size": 0,
                    "backend-features": {
                        "transport": [],
                        "type": "vhost-vsock",
                        "features": []
                    },
                    "nvqs": 2,
                    "protocol-features": {
                        "features": []
                    },
                    "vq-index": 0,
                    "log-enabled": false,
                    "acked-features": {
                        "transport": ["event-idx", "indirect-desc", "version-1"],
                        "type": "vhost-vsock",
                        "features": []
                    },
                    "features": {
                        "transport": ["event-idx", "indirect-desc", "version-1", "any-layout",
                                      "notify-on-empty"],
                        "type": "vhost-vsock",
                        "features": ["log-all"]
                    }
                },
                "backend-features": {
                    "transport": [],
                    "type": "vhost-vsock",
                    "features": []
                },
                "start-on-kick": false,
                "isr": 0,
                "broken": false,
                "status": {
                    "dev-status": ["acknowledge", "driver", "features-ok", "driver-ok"]
                },
                "num-vqs": 3,
                "guest-features": {
                    "transport": ["event-idx", "indirect-desc", "version-1"],
                    "type": "vhost-vsock",
                    "features": []
                },
                "host-features": {
                    "transport": ["protocol-features", "event-idx", "indirect-desc", "version-1",
                                  "any-layout", "notify-on-empty"],
                    "type": "vhost-vsock",
                    "features": []
                },
                "use-guest-notifier-mask": true,
                "vm-running": true,
                "queue-sel": 2,
                "disabled": false,
                "vhost-started": true,
                "use-started": true
             }
           }

3. Display status of a given virtio queue

HMP Form:

    info virtio-queue-status <path> <queue>

    Example:

        (qemu) info virtio-queue-status /machine/peripheral-anon/device[1]/virtio-backend 2
        /machine/peripheral-anon/device[1]/virtio-backend:
            device_name:          virtio-net
            queue_index:          2
            inuse:                0
            used_idx:             27
            signalled_used:       27
            signalled_used_valid: true
            VRing:
                num:          64
                num_default:  64
                align:        4096
                desc:         0x00000001342b5000
                avail:        0x00000001342b5400
                used:         0x00000001342b54c0

QMP Form:

    { 'command': 'x-query-virtio-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtQueueStatus'
    }

    Example:

        -> { "execute": "x-query-virtio-queue-status",
             "arguments": {
                "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                "queue": 2
             }
           }
        <- { "return": {
                "signalled-used": 27,
                "inuse": 0,
                "vring-align": 4096,
                "vring-desc": 5170221056,
                "signalled-used-valid": true,
                "vring-num-default": 64,
                "vring-avail": 5170222080,
                "queue-index": 2,
                "vring-used": 5170222272,
                "used-idx": 27,
                "device-name": "virtio-net",
                "vring-num": 64
             }
           }

4. Display status of a given vhost queue

HMP Form:

    info virtio-vhost-queue-status <path> <queue>

    Example:

        (qemu) info virtio-vhost-queue-status /machine/peripheral-anon/device[1]/virtio-backend 1
        /machine/peripheral-anon/device[1]/virtio-backend:
            device_name:          virtio-net (vhost)
            kick:                 0
            call:                 0
            VRing:
                num:         256
                desc:        0x00007f31c032c000
                desc_phys:   0x00000001340c6000
                desc_size:   4096
                avail:       0x00007f31c032d000
                avail_phys:  0x00000001340c7000
                avail_size:  518
                used:        0x00007f31c032d240
                used_phys:   0x00000001340c7240
                used_size:   2054

QMP Form:

    { 'command': 'x-query-virtio-vhost-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtVhostQueueStatus'
    }

    Example:

        -> { "execute": "x-query-virtio-vhost-queue-status",
             "arguments": {
                "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                "queue": 1
             }
           }
        <- { "return": {
                "avail-phys": 5168197632,
                "used-phys": 5168198208,
                "avail-size": 518,
                "desc-size": 4096,
                "used-size": 2054,
                "desc": 139851654676480,
                "num": 256,
                "device-name": "virtio-net",
                "call": 0,
                "avail": 139851654680576,
                "desc-phys": 5168193536,
                "used": 139851654681152,
                "kick": 0
             }
           }

5. Display an element of a given virtio queue

HMP Form:

    info virtio-queue-element <path> <queue> [index]

    Example:

        Dump the information of the head element of the third queue of virtio-scsi:

        (qemu) info virtio-queue-element /machine/peripheral-anon/device[2]/virtio-backend 2
        /machine/peripheral-anon/device[2]/virtio-backend:
            device_name: virtio-scsi
            index:       125
            desc:
                ndescs:  1
                descs:   addr 0xa4f90f1d0653b5fc len 1862028160 (used, avail, next)
            avail:
                flags: 0
                idx:   2936
                ring:  125
            used:
                flags: 0
                idx:   2936

QMP Form:

    { 'command': 'x-query-virtio-queue-element',
      'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
      'returns': 'VirtioQueueElement'
    }

    Example:

        -> { "execute": "x-query-virtio-queue-element",
             "arguments": {
                "path": "/machine/peripheral-anon/device[2]/virtio-backend",
                "queue": 2
             }
           }
        <- { "return": {
                "index": 125,
                "ndescs": 1,
                "device-name": "virtio-scsi",
                "descs": [
                    {
                        "flags": ["used", "avail", "next"],
                        "len": 1862028160,
                        "addr": 11887549308755752444
                    }
                ],
                "avail": {
                    "idx": 2936,
                    "flags": 0,
                    "ring": 125
                },
                "used": {
                    "idx": 2936,
                    "flags": 0
                }
             }
           }

[Jonah - Comments:
 Note: for patch 8/8, checkpatch.pl gives the following error:

    ERROR: spaces required around that '*' (ctx:WxV)
    #374: FILE: hw/virtio/virtio.c:4107:
             type##FeatureList *list = features->u.field.features;
                               ^
 However, adding a space between the asterisk gives a similar error
 telling me to change it back to the former representation... so I
 just left it as this.]

v9: rebased for upstream (Qemu 6.3)
    change QMP command prefixes from 'x-debug-virtio' to
    'x-query-virtio'
    add 'unstable' feature to all 'x-query-virtio' prefixed
    QMP commands
    fix odd indentation for qapi/virtio.json
    device features support for virtio-mem
    move HMP sub-commands under 'virtio' top level to 'info'
    top level

v8: add assert in virtio_id_to_name() to make sure we're
    not returning NULL
    minor documentation additions to qapi/virtio.json
    add virtio introspection support for vhost-user-rng

v7: rebased for upstream (Qemu 6.2)
    add ability to map between numberic device ID and
    string device ID (name) for virtio devices
    add get_vhost() callback function for VirtIODevices
    expose more fields of VirtIODevice
    expose fields of vhost devices
    decode vhost user protocol features
    decode VirtIODevice configuration statuses
    vhost support for displaying virtio queue statuses
    vhost support for displaying vhost queue statuses
    expose driver and device areas when introspecting a
    virtio queue element
    changed patch attribution

v6: rebased for upstream (Qemu 6.1)
    add all virtio/vhost types in same order as
    include/standard-headers/linux/virtio_ids.h
    use QAPI_LIST_PREPEND in qmp_x_debug_query_virtio rather than open
    coding

v5: rebased for upstream
    add device name, used index, and relative indicies to virtio queue-status
    HMP command
    add device name to virtio queue-status QMP command
    add new virtio device features

v4: re-send series as v3 didn't reach qemu-devel

v3: use qapi_free_VirtioInfoList() on the head of the list, not on the tail.
    Prefix the QMP commands with 'x-debug-'

v2: introduce VirtioType enum
    use an enum for the endianness
    change field names to stick to naming convertions (s/_/-/)
    add a patch to decode feature bits
    don't check if the queue is empty to allow display of old elements
    use enum for desc flags
    manage indirect desc
    decode device features in the HMP command

Jonah Palmer (2):
  virtio: drop name parameter for virtio_init()
  virtio: add vhost support for virtio devices

Laurent Vivier (6):
  qmp: add QMP command x-query-virtio
  qmp: add QMP command x-query-virtio-status
  qmp: decode feature & status bits in virtio-status
  qmp: add QMP commands for virtio/vhost queue-status
  qmp: add QMP command x-query-virtio-queue-element
  hmp: add virtio commands

 hmp-commands-info.hx                        |  218 +++++
 hw/9pfs/virtio-9p-device.c                  |    2 +-
 hw/block/vhost-user-blk.c                   |    9 +-
 hw/block/virtio-blk.c                       |   30 +-
 hw/char/virtio-serial-bus.c                 |   15 +-
 hw/display/vhost-user-gpu.c                 |    7 +
 hw/display/virtio-gpu-base.c                |   20 +-
 hw/input/vhost-user-input.c                 |    7 +
 hw/input/virtio-input.c                     |   14 +-
 hw/net/virtio-net.c                         |   58 +-
 hw/scsi/vhost-scsi.c                        |    8 +
 hw/scsi/virtio-scsi.c                       |   20 +-
 hw/virtio/meson.build                       |    2 +
 hw/virtio/vhost-user-fs.c                   |   20 +-
 hw/virtio/vhost-user-i2c.c                  |    6 +-
 hw/virtio/vhost-user-rng.c                  |    9 +-
 hw/virtio/vhost-user-vsock.c                |    2 +-
 hw/virtio/vhost-vsock-common.c              |   21 +-
 hw/virtio/vhost-vsock.c                     |    2 +-
 hw/virtio/vhost.c                           |    3 +
 hw/virtio/virtio-balloon.c                  |   17 +-
 hw/virtio/virtio-crypto.c                   |   22 +-
 hw/virtio/virtio-iommu.c                    |   17 +-
 hw/virtio/virtio-mem.c                      |   14 +-
 hw/virtio/virtio-pmem.c                     |    3 +-
 hw/virtio/virtio-rng.c                      |    2 +-
 hw/virtio/virtio-stub.c                     |   42 +
 hw/virtio/virtio.c                          |  686 ++++++++++++++-
 include/hw/virtio/vhost-vsock-common.h      |    2 +-
 include/hw/virtio/vhost.h                   |    3 +
 include/hw/virtio/virtio-gpu.h              |    3 +-
 include/hw/virtio/virtio.h                  |   25 +-
 include/monitor/hmp.h                       |    5 +
 include/standard-headers/linux/virtio_ids.h |    1 +
 monitor/hmp-cmds.c                          |  358 ++++++++
 qapi/meson.build                            |    1 +
 qapi/qapi-schema.json                       |    1 +
 qapi/virtio.json                            | 1240 +++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c                  |    1 +
 39 files changed, 2873 insertions(+), 43 deletions(-)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

-- 
1.8.3.1


