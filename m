Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B682543C8E2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 13:52:58 +0200 (CEST)
Received: from localhost ([::1]:57388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfhUH-0005G9-SD
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 07:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKe-0001Ev-8i; Wed, 27 Oct 2021 07:43:00 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:50034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKZ-00070H-LH; Wed, 27 Oct 2021 07:43:00 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RBgKKD010620; 
 Wed, 27 Oct 2021 11:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=97+SzXbJlcLOJBz4KE8EfI1l6qep8B4n4vjxNjwWSmo=;
 b=jHJGgrwbUuYhkhQ+xVDlAf9UlVJjfg0kSrgaMtSHCL8t7zujhhSzE+p3TtIc+RLio7nm
 UJTJ97P1y0UsECwPWHPToWMwol8Fc77OlMZQW2u4W1v9eG63lAvV/aqTW0VPDCDQV82F
 JfvJ+ze+cWyV1mF8AX2XRqWNsV/H1maBla4DlW3EdDuoyvJjdc6g8P+uh3EKAjx8pAUm
 G01p1cp46xkCcHhxGSvTi+Juky3ncCyCaBhla3j2X2mJ2WOgSRPGrZmJTn0ocm6Rei/1
 Rv2PtdurUWNdXBfWPVA4Bn26D3enfItNHacZskUVtcmaX3+O1JnaKfZEPs105zsUWEq+ 6g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fj323q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RBfxPK097198;
 Wed, 27 Oct 2021 11:42:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by userp3030.oracle.com with ESMTP id 3bx4h27wer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHBsQT1vifKSti5WQ64tfsP1LkXn3nze0X2e2kWbwrmPNsMfTycASAv1qnQMHs7XI4RcvVqdjAyZR2ePjn0ep9Plu8pe+UzFx51VYmr5H/pjMQE0DrIEiGtjwqdKCW8EVYOQKqNNN9k12xRgUWj2K6R83GU/7uyKhWcojcSavxt6AQpBSLfjygqvaI+sPzKPA5joPMPqH0driVA0S/e9DS+N5oJrcRjN4WSehBMh6Qjm/pX7pn/wBOUu6TphyQ15Va6BMoiOhsfAsZn4h0lO6X6tt/HlbTBVvMMlQuDVbxEtcgNJ0NAfNdgEgi/MXGLTbrqUQIaHAoCSDRbzi4lqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97+SzXbJlcLOJBz4KE8EfI1l6qep8B4n4vjxNjwWSmo=;
 b=hAcDPPrmKSHHhShSkSiN3ZmoQ5Uo+8wn/Yn84u1QRTtAMTfxuuAeVFmfncjQTDNp0gLt/YnZ3v9gS1786WlipbaGUsV8qU14upjTRuuauGaDk8bvHDewyJK5fcXQOoy37LgIxqV4G1/5hC2yD/Qq5TBQR1Z7Pv1ewcdQ+iUbyDZknCMNpklcPIFR5koT3rSqgE1lixI+p8VOASmJ2GzbJIsoL3EOtzbSWJ1oQhxabCO2IiejEWQSwLliQw3JPvYuDWcRLI3ZZ9hAwJFn3ev+h4iYuXZn9g6Z595qk6bFX/aUmOlBjC0sdAZPSLJJSk5Lff3VrDrJgFTpIXzTGgyrkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97+SzXbJlcLOJBz4KE8EfI1l6qep8B4n4vjxNjwWSmo=;
 b=JqqNkKlGDymfkIxTaoCgdW8lLPD/+/QDkVQX9D00rLyHm/BjNxrQ+SeJRCuFi6kbebodchWfZj5I6JFpP4G5DsXmaaKjCHqnHZwI9bWDeW81OowiSo1yqKKSKUwr99kEYQqBp8+0GUbpr/nVe/3lXA3T2r3q4iYbvkE9oLHiaas=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4744.namprd10.prod.outlook.com (2603:10b6:510:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 11:42:27 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 11:42:27 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 0/8] hmp,qmp: Add commands to introspect virtio devices
Date: Wed, 27 Oct 2021 07:41:41 -0400
Message-Id: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.40) by
 SJ0PR13CA0088.namprd13.prod.outlook.com (2603:10b6:a03:2c4::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Wed, 27 Oct 2021 11:42:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6e28aa2-2440-42a1-02a9-08d9993ed9b6
X-MS-TrafficTypeDiagnostic: PH0PR10MB4744:
X-Microsoft-Antispam-PRVS: <PH0PR10MB4744B6EF970E12523FA41551E8859@PH0PR10MB4744.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dytkNMo0nkg43je9c51C2posOY6ggzxFQM/YThjtbfpGACsKUQjG6b9at+bd/0p02FdOGtdRPlMc0zQplLL9eWZOUNTepyek/LF9j9dv5LkxTrYUsLWe8JA1MZBieLdtyVFH+Utg5DTalUrWNroQimVkeZfifL/LEuuObmCZR6lX0/RgQYf/SX6u7Q9OlJRhej0IHG/O4DpIIl1lbkfgtadoI+joSBIXOdBOcZGoCLbmK0sMCMMkaQchDXsG+THk5EI9aqSWow8DfHftVBvFuPvFqVW48Y0fsCVfno4+458kWYY07KBmfrkjLGzuIFMQFl9OjShdLm2/1QUsVV4QTa5fKe7501Pq9d6w9t+P+V59oBdzaBpzuONsesGvT3k2YgNhiBXrY7v9dDbXUxV0DUk3VSBtFcqZ0nq2pPc4WrJeDbcCiCHK8nVwYAJIh84Q37lY4pKoBC4zEI519MiO/29R8Z2wwJ1siNRbuCnyvIef4hMVtsGwqyBSb7xjidPytzPCstR1hee2OotK6hLDwHRWVMJEh1zYW7fIlx3ElYvXngu4czLGc1De16z+XJaGHlMywK5ff7MeeY6OcDjzH0W896LLNpX7CB8NspJ0Xz8nuOUJq8CRLdkK6NOw9IFJ2NnLWOJ70lhsoVeyMiul5jk7LF4H+5mBUjwiyssnx2woiEAtVjRIR5vWcIBvUBTcNPpePAtMqjic/XtzBw48cQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(44832011)(26005)(4326008)(316002)(38350700002)(38100700002)(8936002)(6916009)(956004)(36756003)(2616005)(2906002)(30864003)(86362001)(83380400001)(7416002)(5660300002)(52116002)(508600001)(6666004)(8676002)(186003)(66946007)(6486002)(7696005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jE6y+MC328QMwav3A4mqCNFqHZ1Naozl86hwCVKpaUm1cAG+S5sPT0EuPRjX?=
 =?us-ascii?Q?H5fRWnxiDAnGqnuHMwvbDRtZFZ0Vr2TcTuBynwfePUrnMXuRvH7B2TyFLvDn?=
 =?us-ascii?Q?6SB8cPllQxIfy2LMGoIPxoXclTZOmIktkQqJCbCsVXo1HmgRM7LPMXyQvUnA?=
 =?us-ascii?Q?CJqWnOhIsHNLPdp3e4iojjl0RSwNFoLQ7JeD20ZLAeMm79nihYNgqTPvTmuD?=
 =?us-ascii?Q?qhKP7fBPf7D9krwpdpzGx1AQR2s0O5CK8G0lKEhNFMYHkKj6St5DywyZQyfk?=
 =?us-ascii?Q?Sh/gvsy5e7MGFF/2LAQXR606qyr2W3cYJRIA5elNarboMSUNzvxSl3nO0zbu?=
 =?us-ascii?Q?jiCOzeeDpvdQ8OjW8sxqwALTM1ZGfA7FwcTsbveFRxTa5suZxj+y0/qEOvGx?=
 =?us-ascii?Q?jRty9B/9Xj/gnvWJRK1TZHbwXMYsXqs9nOqKMJ3x5ULZq4BPudOLLLV62CKn?=
 =?us-ascii?Q?whk83NcOIV1sXzecxScWkmZUrJs+aCIcZvmB+oo3jyCSt7Ypvh876jpdIMjR?=
 =?us-ascii?Q?grtKY0mLghAuEw/MAFE4fokbdxYbcY78uQupUli+KnsPlJQn+5k31qE8YNFM?=
 =?us-ascii?Q?XFv5JrTPCR/ArBNaoD+g/kS7brRmQV3twFinckqssEHD1UxtnJZ4n4srXWFN?=
 =?us-ascii?Q?EhA8PD/XROfStOh5CEReZSjv/dxYN4IR8vcgK0yJ7WX/JerVoDT67k67yn4m?=
 =?us-ascii?Q?XQwCLdOPGfWSgGCMtYqnmcXyu02tppuxRSmST7CVVDPtHhYdxxDTjGoyItyw?=
 =?us-ascii?Q?ZFVC4XOcwfG4pJLVr7YtmtgWdzkiWe3IMkFHH5TpOfEp8zQR4oA5J400biZy?=
 =?us-ascii?Q?JdcB6WuJhf8pfYXyAEbvlQbOW8P3Oato5lQW7w+/8U2Bn1lW/1cDNn8GHCoG?=
 =?us-ascii?Q?3Co1a/sa11h2Tfv/4KVpDwJx9fnihSoHokygWYQ7+ir7lnI/vZLohZmd/zxq?=
 =?us-ascii?Q?i4d/StDqujyE+ACeolKdMkz3JHowDx4+twNBkFwng0+cgI1zehekE/OLN6nW?=
 =?us-ascii?Q?FkFXaTesYikHdc+XCV6nAv4T67dp4v8DTINCNFCrPp573dON2kKqxWwLa1ws?=
 =?us-ascii?Q?+kQ2EXV0lx4x/T13XXeN9L9l3hhTc0Elu3RMdG/QoWpI9UhmGhhVbm8gDC5y?=
 =?us-ascii?Q?Slas8mtPi9z/HAqCO2nABSIybZ+XLzFB7flmCXcR3YjWipzWlMJ+2qVFkCgE?=
 =?us-ascii?Q?LFTlIE0McB2eVsknc+NLjwNHfv434X5loLvke+0AC/zd+XL96No20m20wJo+?=
 =?us-ascii?Q?yN/8hFyChbwz1fC02lfOLk1krXhu9hizfXHUu9HuUMWZcwNjSfwWBXWNu6YP?=
 =?us-ascii?Q?kQFnAVpAp20Kilx85qAEyjlG5c/aWq0mbJ6cDFgPZLmAmySQ3jFSXJAWDPX2?=
 =?us-ascii?Q?gvjLa5PzkMBtaKnR5aS5SvztGdKHTn3/SMJn3+LMx+tWgUuq6T26NmBKarQN?=
 =?us-ascii?Q?wn9tOsxO2hUaHDXBRfuqA14/guHkbqI5L7UGUMUJ5Xt5bj/VTqoKiHh+qzJn?=
 =?us-ascii?Q?De2UekiXZ6fYvUaijwMzFPr/uaYolu82Qg/QE0Q5DWrkUjutFzRKnTkhEJle?=
 =?us-ascii?Q?VPJQufFzcuMYn31s5T7+c43eazNIFR5+keK2U+xq0M+tmx4t+yl+CK1/sTsP?=
 =?us-ascii?Q?yaNZyIhZ6Ssiq2cX01I/+8E=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e28aa2-2440-42a1-02a9-08d9993ed9b6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 11:42:27.1203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYF8SPnfWuqEnXLysQcKG/z/tWpYho+y/aAqzSgPLHuA3uOX+kMj6/buv6sgDj51hG8KKe4UIE28KK9wBfa9uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4744
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 suspectscore=0
 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270071
X-Proofpoint-ORIG-GUID: TqmngUcD0TWifQsvT8INJULIXJDkkQ4T
X-Proofpoint-GUID: TqmngUcD0TWifQsvT8INJULIXJDkkQ4T
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

This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.

[Jonah: Rebasing previous patchset from Oct. 5 (v7). Original patches
 are from Laurent Vivier from May 2020.

 Rebase from v7 to v8 includes an additional assert to make sure
 we're not returning NULL in virtio_id_to_name(). Rebase also
 includes minor additions/edits to qapi/virtio.json.]

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
  qmp: add QMP command x-debug-query-virtio
  qmp: add QMP command x-debug-virtio-status
  qmp: decode feature & status bits in virtio-status
  qmp: add QMP commands for virtio/vhost queue-status
  qmp: add QMP command x-debug-virtio-queue-element
  hmp: add virtio commands

 docs/system/monitor.rst                     |    2 +
 hmp-commands-virtio.hx                      |  250 +++++
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
 hw/virtio/vhost-user-rng.c                  |    9 +-
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
 hw/virtio/virtio.c                          | 1036 ++++++++++++++++++++-
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
 qapi/virtio.json                            | 1303 +++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c                  |    1 +
 42 files changed, 2978 insertions(+), 43 deletions(-)
 create mode 100644 hmp-commands-virtio.hx
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

-- 
1.8.3.1


