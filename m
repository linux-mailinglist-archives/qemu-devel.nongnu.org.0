Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3479422F6E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:53:56 +0200 (CEST)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXodX-0004uH-Ko
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnag-0002up-KK; Tue, 05 Oct 2021 12:46:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnad-0005mS-VP; Tue, 05 Oct 2021 12:46:54 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195G8Zlt029448; 
 Tue, 5 Oct 2021 16:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=8cWLXo/0cn3nM6pfumvMJ3EWN/dAIlzHHesUkAh+FXo=;
 b=WWO+sM6A950bnuKIEyNl5ru6wdPCPUxW/toiCKgV4lruJnft6anyKceQ9OgYakktMuCw
 3GAHjpoILckVWF+6c5BhK91kzNbRWA3gQ8D6lHA+o1BdCaZLqVl2zuXmwI6EMxhSK3N0
 XRTyAdM/YwWrmuKq8CUm2Hv28LUAHssqhR3ygX6pWHWkgbED9XoQwYY55Q5LkOwDKYOi
 TeKv7lS3OAMji5piNsrMt0NRdDXgLwNox0E1FLEzyhjObgIhrgngYcbGMkDnuFyzH6I8
 HwBsuyMrr7H8Ny2dHkbAbTHTPvhUWxPX8DHPopWjnWsSO69wHFvZ6n8ca40QPZyW3w/N 9g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg42ks72a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:46:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 195GifwY158737;
 Tue, 5 Oct 2021 16:46:29 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by userp3020.oracle.com with ESMTP id 3bf16tbcnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:46:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHZqXM8TphwGHGeUaP/bcEPVP0rPRsa3W8TUvUVlokOfKcdEZ62TUhDaQ/4q10x18vO2ix+l0iHTdTX6Jdu+w+lgChog+G0FYZK9BvHtRdb5dxqBHjqUOfWeNEOWrYH9SFP5WP5OnBorvfsst98jS3lPbrgGMdZcKEJgyj4fmbJFlFJmx7afOCs+Xo+AcosH+H7CtY6j/TEqHgett46wkWz9aTMfhje+iIwzPVQ9+/quoogPcrlMl8HoaLOBLi0ImZn3yG9jNRZSjRHaIE6BGbNWrLxAFGrbzhrbgSVayFiveqkBdXZ8YfhAhAyH7oCZGWW7SygIfIfCm1N6pej+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cWLXo/0cn3nM6pfumvMJ3EWN/dAIlzHHesUkAh+FXo=;
 b=fbxkJ1P5vB+9GRDeBwXhmePVXog3J7rPcsiXDYBZyjblVWPskupO2WG/Y0H01Dp9JCDAzY0YZo6I3rCLKFPZOTTzHEvpf8k18dddfig+qwn8fwvw3htDnSovajqHKreofaeP5YsoZUNno3uqMUrj1Kn1afpzVmlcH5hS4WzU0B7qt44tl/pIi9jRMWZ7j9YGGfkpQjPjbFe9HexAnIMsuQZ2TGObhndHZCtiGJjyf+GvIp7rBt5Th05028CKwXv2uUx/C5gXrSXbjgg1bnjSuSLwdqRnIFM/BQVdej+sqc7wvmYyFKv5Lyvy7DaFDtsjgEpZN1ynPY9TvqEBRVlQlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cWLXo/0cn3nM6pfumvMJ3EWN/dAIlzHHesUkAh+FXo=;
 b=epB5aDIwNIGoBwu8k31UPSfmyjHj9Wmh5woDyH3dI4zCKO1RWuQqeKP3N/l8azSVZsfXFgjJXOKI6OgENXesqTsxyzbn3X9T06xv09Okr9x1fqjvZmpvvjo2q2ODHD53vZ6iMiENIkhCb72ikBVp+bfFOFXfskvk4L0fg9MVZxk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21)
 by SN6PR10MB2942.namprd10.prod.outlook.com (2603:10b6:805:d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 16:46:26 +0000
Received: from SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9]) by SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9%8]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 16:46:26 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 0/8] hmp,qmp: Add commands to introspect virtio devices
Date: Tue,  5 Oct 2021 12:45:45 -0400
Message-Id: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:806:122::10) To SA2PR10MB4667.namprd10.prod.outlook.com
 (2603:10b6:806:111::21)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.39) by
 SN7PR04CA0095.namprd04.prod.outlook.com (2603:10b6:806:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 5 Oct 2021 16:46:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3ced11a-5fe5-4479-1bb5-08d9881fac1d
X-MS-TrafficTypeDiagnostic: SN6PR10MB2942:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR10MB2942D99B6E019A011272366BE8AF9@SN6PR10MB2942.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XQM9h0VPkPLBoC+MRMlQBQrZRyOBCPb8Ha+Mw1JsZBFUKlp3tm5sVRTPyP7gWCaAjT7gFl2Rfu3mOpfvhFDYMuhfmiciQ6IqtZAggzyqp5u5fHtzTWkgrPB5PdUGvb+ayyj7GoKuB5YBhK9t15KbgBO/QQdym7JJxvz5ZIi8XrW75RwHRIfK94AaReB+eQkai9Evy9eXJX1MILuGzDA1tCdynotvjNBY9JYDR4yieEi6vBim0xqAQVYERWR0Id9jXJnxg3WJvTgmKLLLk3OLOW8cJA5l3rljyRXSDd8TepHSRzXBPT4L6P843SmcrplNuQTh0gaEHbaJtl6N+iOaJqqNztA0NMXMz0AsRMl1OgSEtlpbf3ergnJ2y/u0ul/dD8QPma/3j4JT0ybFDXju3x4ehicy0SpMFi0P62LO0BW65nfsTgyXeOmiR2XWFPej/H8QCJFeElMstYk2uGLjcjBCP67h7Nojqozz8uBgY9bjKwRD8lvnlB5h42uErSlw/LTMh5hFWut/BaOG+G334EufbYRfMNenmW0E7SUL44iyN314qx8U+vhmA27Z7ynQrEldQVb8ueFZQSZqBTpumhGU8JZVF8tvGLfJUKX521QjfHrAXFO/gwYVDheHrE1bsGEaM6jqGMkFSgoW+cyiXb1c1qQcmCSf2tAq+h/SsztRtUCADAwZ+CeCWo1xP0ENF1cqAV7HSKynlYrDd+HLPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4667.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(5660300002)(66476007)(66556008)(83380400001)(6486002)(508600001)(6916009)(4326008)(66946007)(8936002)(7416002)(86362001)(956004)(2616005)(26005)(316002)(7696005)(52116002)(44832011)(2906002)(8676002)(36756003)(38350700002)(38100700002)(186003)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GQ6PXgWxcZXnUArb9OtdEwhOp7GX45+PyJ7k412HNmQ8Q1CjFSHtjCN/7Q/U?=
 =?us-ascii?Q?GXmqLSaEPimMMU3HsEuiY4TS88ngo2jkQAJWbFXOViOiQwMLW5mpFXdSWVz6?=
 =?us-ascii?Q?VsKQAIvHu2eK4x3UCnEC9XoBZ6U22n1vicGUbsbG+7oHUYkW6Dwe+tkmcYTK?=
 =?us-ascii?Q?6xbgVdCw0QfBrqlWHvXk/DEJW8iai+9z3Tmr6DMjOfwsQeyC/xSprGBsZslA?=
 =?us-ascii?Q?YI+PZgpZZnOfoonK6YOjXb48FGPddOOmSJLwanf/xzGfN7At2lVVGBSBSZ8G?=
 =?us-ascii?Q?pvdpf1s9xGRb7FyLgAtxzRgVXImtwgnGmvpJUko+eQlrDHD+APBIPrPGib4+?=
 =?us-ascii?Q?H68QErO04Ds6O11Mf+2Hz3omhpxclxXr3hZ009rTYNJZ6pjE4/WTrXQmn/YT?=
 =?us-ascii?Q?rJl2880JNMCCWK11Aev6Iqp9Oq8e31LPoVl3IzW/tkS3Utgp5aY7uPtVBfUX?=
 =?us-ascii?Q?dtM97i+SzIfYMozYBdzu/Hf0sA+s7LbjLcfk7/OO0WxZn0zvdWz84smzWU9I?=
 =?us-ascii?Q?a6rmTQN1xxJkV9NE2SU0R3eaB2USBCvpveFyHqQjf5vVuqBTR3YL6X/TCdHq?=
 =?us-ascii?Q?2toFVZqWMh+g4GPHbqlcjWh/7Gkq0ccvGMyU/Q5DOYytNR9SP4TJh4oY44KO?=
 =?us-ascii?Q?+NAt0bI43GmFlf6JLUXB4YNH5E5pI8rrPfRltfkYH5tVLDzBsq0qvZc2jaTS?=
 =?us-ascii?Q?7bTlsz1MSe7hDfvy8O5y8vyVOnkGCvq470CQUTyl/943EIoeol0kF2BsYJw+?=
 =?us-ascii?Q?exbDfED8mbN+r0iUG/LUu/GKxKyYvPDuQXQUyCj07FcBou9aFdGEFn+m5LXn?=
 =?us-ascii?Q?bnBRSbE+cGite/XghejYPUUAn3wq2GIsDeRYbQ+ockYYNoVLPkSOUmwbMu/r?=
 =?us-ascii?Q?Y+NgId2u5gM1ImxGmzM0VUoO7vRwul85OlsekneccXcqxEcIIG1Jn+5+lS6X?=
 =?us-ascii?Q?6JVJHi7W7gDBZHNXvJLkZ7vsn4Y1s9fQ+cCUYzARkbeHGeSRVATauCLhSuKw?=
 =?us-ascii?Q?EVHylYNPMem6d/81w4qVN9GArl2JDxCHucKuPr7QPgt7jbE2JMIFw/0f7fdz?=
 =?us-ascii?Q?aOhNlauWXMYUCfi8/M6IJY+zznQZHsVv2WpK6FV1oqE1n76ZXjdn88h2ywuv?=
 =?us-ascii?Q?zlSyLVZA9N3138tz5jpVvAXJL6hbYVM1W3z68OAuQh7AIbbvXFglTxx5tF70?=
 =?us-ascii?Q?NCEJioI3XGblX1No/iADBbWMFC3w5FLGh//HJy0RZYbZ5ieL602H1nxV3u0b?=
 =?us-ascii?Q?PvGJ0QLdM95rKZ30FZIFlFmW2pkaWol8j3ThXgYQDDO/w6ymqkcQVfx/b0Nm?=
 =?us-ascii?Q?N//g6xJzywp42nI5fgo4qV6T?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ced11a-5fe5-4479-1bb5-08d9881fac1d
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 16:46:26.4957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KGiNzJt5NUmCEhvghrdY+VzG8uwIr5rLwEQRMb6oYnhl3lQZylaNE4AL1IDkXeWHb/AvPOCq8TxaGCJh9euFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2942
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10128
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050100
X-Proofpoint-GUID: 2yVv_fiFCsicU2iux4_fxuBu-4gEfOrM
X-Proofpoint-ORIG-GUID: 2yVv_fiFCsicU2iux4_fxuBu-4gEfOrM
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
Cc: fam@euphon.net, mst@redhat.com, kraxel@redhat.com, si-wei.liu@oracle.com,
 joao.m.martins@oracle.com, raphael.norwitz@nutanix.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, kwolf@redhat.com, laurent@vivier.eu,
 mreitz@redhat.com, jasonwang@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.

[Jonah: Rebasing previous patchset from July (v6). Original patches
 are from Laurent Vivier from May 2020.

 Rebase from v6 to v7 includes adding ability to map between the
 numeric device ID and the string device ID (virtio device name), a
 get_vhost() callback function for VirtIODevices, display more fields
 of a VirtIODevice (including it's corresponding vhost device),
 support to decode vhost user protocol features, support to decode
 virtio configuration statuses, vhost support for displaying virtio
 queue statuses including a new command to introspect a vhost device's
 queue status, and lastly support to display driver and device areas
 when introspecting a VirtIODevice's virtqueue element.]

1. Main command

HMP Only:

    virtio [subcommand]

    Example:

        List all sub-commands:

        (qemu) virtio
        virtio query  -- List all available virtio devices
        virtio status path -- Display status of a given virtio device
        virtio queue-status path queue -- Display status of a given virtio queue
        virtio vhost-queue-status path queue -- Display status of a given vhost queue
        virtio queue-element path queue [index] -- Display element of a given virtio queue

2. List available virtio devices in the machine

HMP Form:

    virtio query

    Example:

        (qemu) virtio query
        /machine/peripheral/vsock0/virtio-backend [vhost-vsock]
        /machine/peripheral/crypto0/virtio-backend [virtio-crypto]
        /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
        /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
        /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]

QMP Form:

    { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }

    Example:

        -> { "execute": "x-debug-query-virtio" }
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

3. Display status of a given virtio device

HMP Form:

    virtio status <path>

    Example:

        (qemu) virtio status /machine/peripheral/vsock0/virtio-backend
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

    { 'command': 'x-debug-virtio-status',
      'data': { 'path': 'str' },
      'returns': 'VirtioStatus'
    }

    Example:

        -> { "execute": "x-debug-virtio-status",
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

4. Display status of a given virtio queue

HMP Form:

    virtio queue-status <path> <queue>

    Example:

        (qemu) virtio queue-status /machine/peripheral-anon/device[1]/virtio-backend 2
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

    { 'command': 'x-debug-virtio-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtQueueStatus'
    }

    Example:

        -> { "execute": "x-debug-virtio-queue-status",
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

5. Display status of a given vhost queue

HMP Form:

    virtio vhost-queue-status <path> <queue>

    Example:

        (qemu) virtio vhost-queue-status /machine/peripheral-anon/device[1]/virtio-backend 1
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

    { 'command': 'x-debug-virtio-vhost-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtVhostQueueStatus'
    }

    Example:

        -> { "execute": "x-debug-virtio-vhost-queue-status",
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

6. Display an element of a given virtio queue

HMP Form:

    virtio queue-element <path> <queue> [index]

    Example:

        Dump the information of the head element of the third queue of virtio-scsi:

        (qemu) virtio queue-element /machine/peripheral-anon/device[2]/virtio-backend 2
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

    { 'command': 'x-debug-virtio-queue-element',
      'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
      'returns': 'VirtioQueueElement'
    }

    Example:

        -> { "execute": "x-debug-virtio-queue-element",
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
  qmp: add QMP command x-debug-query-virtio
  qmp: add QMP command x-debug-virtio-status
  qmp: decode feature & status bits in virtio-status
  qmp: add QMP commands for virtio/vhost queue-status
  qmp: add QMP command x-debug-virtio-queue-element
  hmp: add virtio commands

 docs/system/monitor.rst                     |    2 +
 hmp-commands-virtio.hx                      |  250 ++++++
 hmp-commands.hx                             |   10 +
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
 hw/virtio/vhost-user-vsock.c                |    2 +-
 hw/virtio/vhost-vsock-common.c              |   21 +-
 hw/virtio/vhost-vsock.c                     |    2 +-
 hw/virtio/vhost.c                           |    3 +
 hw/virtio/virtio-balloon.c                  |   17 +-
 hw/virtio/virtio-crypto.c                   |   22 +-
 hw/virtio/virtio-iommu.c                    |   17 +-
 hw/virtio/virtio-mem.c                      |    3 +-
 hw/virtio/virtio-pmem.c                     |    3 +-
 hw/virtio/virtio-rng.c                      |    2 +-
 hw/virtio/virtio-stub.c                     |   42 +
 hw/virtio/virtio.c                          | 1034 +++++++++++++++++++++-
 include/hw/virtio/vhost-vsock-common.h      |    2 +-
 include/hw/virtio/vhost.h                   |    3 +
 include/hw/virtio/virtio-gpu.h              |    3 +-
 include/hw/virtio/virtio.h                  |   24 +-
 include/monitor/hmp.h                       |    5 +
 include/standard-headers/linux/virtio_ids.h |    1 +
 meson.build                                 |    1 +
 monitor/misc.c                              |   17 +
 qapi/meson.build                            |    1 +
 qapi/qapi-schema.json                       |    1 +
 qapi/virtio.json                            | 1270 +++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c                  |    1 +
 41 files changed, 2935 insertions(+), 42 deletions(-)
 create mode 100644 hmp-commands-virtio.hx
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

-- 
1.8.3.1


