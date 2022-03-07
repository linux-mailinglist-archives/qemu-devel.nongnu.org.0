Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF21F4CFFB7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:13:36 +0100 (CET)
Received: from localhost ([::1]:60164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDBA-0001xO-0V
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:13:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7b-0007Qm-Pt; Mon, 07 Mar 2022 08:09:56 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7Q-0000SD-4z; Mon, 07 Mar 2022 08:09:46 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227C3YUf028616; 
 Mon, 7 Mar 2022 13:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=ny284f2sjWWYRqm9nxupTZdQD4AiNwt/HrjLlqqykxE=;
 b=d41v7TrEQ5DmIqjpvmzm8/ft+Gx2eUHhB7FDy9wTTBo9PpzE/HmF8fC8Xjtvpa3fu/u3
 TMqHxpHZFVC2V0IByJIjO+c589fWAz/0eH5kYaAFZfWdiYRtjbiQdi5Suw1tutzed+c3
 oiTfen4GnDoH9sVhrIw5FuxPxiji8D0P4PwH61saoaWqF6Rir9br5WJAvjGKUrwookpS
 vUHcL9gFKOwb6rM44N641MALhksYF30zH5MjuPD57mxxrcHpvIWH+CFQC8wj9ZUNnaDI
 MrwR2xVtrJ5Pap5lY1FgqWPCt/um5sLK2XgTRMIUrx67ID/wt7K6UiI1+TIViWlEIKuF zw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekyfsbpgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227D6JRU145522;
 Mon, 7 Mar 2022 13:09:16 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by userp3030.oracle.com with ESMTP id 3ekvyth25a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwYh0JOjm+a3eRnu7DWy3Xt51ccSZ6wLNpTJxGkIa9gWcrLS87gt5nTJhnBJQG5fDST9wJKoJ7YT8p5wAbxUFPmxlXU71G6XVrpa58wLZU16UVkanOACVPrkGGDDzOBfIz6PLeWRS02K+gCj6vrEe3DFZALruQ9C/Jot+MRfQZgBxdMLeDL7pLTxr3PfM/zjRTLFcUp+xYgdxHk7fNIuO9c5IwE+9Up3wt2PSMMetTvuzDqXa/Q+NfBNH1trTGamOi8xxrDGnN08eFt9B70Ayz+SNHR7LXuQFAGs5QVqeTh1aJblgNV1bOE4gX6dS3gbKTSkCb2mtR1rubRqboSdCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ny284f2sjWWYRqm9nxupTZdQD4AiNwt/HrjLlqqykxE=;
 b=dYWjHwkQNf0C979/725XT/zhvXTxhNsWU/NxtCJgHeNMemjijzg0h0/PBdxe3z9tpEioUz1z/8dB1/d90a+BS7x39Xc4ILpk6Sl7EpZjQ6RwarQnMNUdf0H4+fyzQ7VaZzL+hdzLL4qlScgtMW/hz0dOGw0jLgBWr5dDI3eBHNP6uTkiivs8QzCegjiPyeVkeiVVD1j+jwRY3fGhJ4wfQks3ZJtrP0WNpRMhddj4ZWDl1SVE2wSjEMnWmBL/KB3gfZmo7q6T5A6tBHAKIcgESKf3uWZihjoBdsBqJWb7li8f0bCsniyexydSYqGPofdauPQuAlsnc1Fot9NDYUCAvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ny284f2sjWWYRqm9nxupTZdQD4AiNwt/HrjLlqqykxE=;
 b=eHbeWNjgatfSyaYfGYsiyihpx97qJKLzOuGTk9OU4/BQTQrELbKeIOle5WZTUiDdK8lYGjDZk3M4BKBOwmCsPWzXXGOd0OsmGjZpxARRv5xYy3HDNWgighLR+y8KhRS4qwXnkvnfrvMiVfEfv+uFKwoU4gz29AYMUc+giBvllNY=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM6PR10MB2619.namprd10.prod.outlook.com (2603:10b6:5:aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 13:09:13 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85%7]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 13:09:13 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 0/8] hmp,qmp: Add commands to introspect virtio devices
Date: Mon,  7 Mar 2022 08:08:33 -0500
Message-Id: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0034.namprd07.prod.outlook.com
 (2603:10b6:803:2d::15) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 439e583c-4ae7-4912-a09d-08da003bad23
X-MS-TrafficTypeDiagnostic: DM6PR10MB2619:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB261903B0EE9052B7FEA8A057E8089@DM6PR10MB2619.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ynZCNglris83WHhhVkiwwIBCiJzyeT2nPPlz+VRMimV3a1XmP1wibyd/CnVl8wWi93KyQ+vJIzg74OQGq3wkKOxWPyoMzOGp00+bpis/bNKFSobUkxbml+uK0QejpqejXuzPfy5OIiuJhqrZ8Kqx5Eh1SVYi1hKlV1z2i4OgKpdU1r496VNw4BKHAP2yzDIw0xZfAHaszP87oF1aUh7fURvUXR0ihJVIzhe0HGk3dnRcLYLmlHltf2Ze3Ed+EH217G0THri9aaCv5eV7Z6GGMkcEIESp6PGCkgOinM5NOifYdU7YbrHEnbCqS2rbAQbo4AvHgm3OHweVX9TMv6j6fd6s2i+lSCgmBURNXT1veOvHxj8KmxdoWcv7ulnNb7lQC3AC4yzsYoDUBA9a8xEWQf2KK+F6oormzS39b8uOwmigMOhukElQj1+QdctS4muh8c/YEu/byvDWCSKiGZjmJhohmDNwcw9wrt45iop+KFnFyRFNxlysg6Ao6N5QjIvOM+jPouAXpxYGpGhyfJ7xibEAzw3miq4j4/UyAy8CefdaK4uUjRKRBUsazjrbF7BUXQSY+aIAq7rmSNZk2laEnhVfu50LTG4/S9xo2OfGpHFJBh8ux25zOXo0Kk7qC2MLmqz6C+601a2nrsN39fmkbX93YMHB1jETNjywSOM7rC0YSe2E3wut2rls65p1aAxtxfbaN2+eVM1okMHuR2A+/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(66946007)(508600001)(66556008)(66476007)(8676002)(6486002)(83380400001)(5660300002)(8936002)(6506007)(6666004)(36756003)(30864003)(52116002)(38100700002)(26005)(38350700002)(44832011)(7416002)(86362001)(316002)(186003)(2906002)(6512007)(2616005)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WUzZJNFkeNqSzesTu9IxTByTxLUddMYOqSz17J151LMhRCaDIUJBJHuJF0GV?=
 =?us-ascii?Q?Y2ZcAA9Dp4pM20llXuEFnx5vlaUStA5OqY86XxXs3WdVhS1evVtYh6exUzCw?=
 =?us-ascii?Q?/PzdBcsM3eZ1gT4NxHNe6Ol7fFBHNN+V16QtS5JblsR6cf9N+PpF6T7e6Z/l?=
 =?us-ascii?Q?mW/q3j6IqAfqyr+d2bK1pxY+IqbCVUHhvYEfox6Yu6UDBAGsKNsV4D90V7So?=
 =?us-ascii?Q?5O8u8xDMu9h/UKzH+TliJWi7clujUk9SoIrEIRH+pqgLR1IZ/E49Q03es+Sw?=
 =?us-ascii?Q?9S5hJqM/w4Sb4e2D/ySjBfPIj5KsX8ZrgUS4nL93F9pI2/0NWRHRvHqiI0H4?=
 =?us-ascii?Q?xlb6/8txbVoBEnY0ftlXYjbMraRWMLcNbhsbja++mq7PRc/bfSvGUssCUFo/?=
 =?us-ascii?Q?dpFa9O73X7zIYXu3dwqaajHZWfGYW1QUJ9N7IT26pilSjSsnb2oNnEtP/3RP?=
 =?us-ascii?Q?akr7iEafaWuhBEyn1gPvd5owQdjzJveb+sU3J+mzuNQ1cTrsRu2QWhTSEU2s?=
 =?us-ascii?Q?Z6/FGKVYDsHWin1GN0iYQA0Ji7z99z7p5vkQMvoAw0BOhMg97XR4phkWN13E?=
 =?us-ascii?Q?clpBytaQ66G69TFLwxBc73jHLesF4/dPjHly1wslFEUwGJhiKJMXl9n633He?=
 =?us-ascii?Q?PQp7kwpjwi8Mb/34DiOtuxFM+S+zRNm1IajdUvogbXcnaE9a8nXR/S6/RBaJ?=
 =?us-ascii?Q?WminxUeGeXiatWwjuuysmqg0uXff79mOfX6c3pV5keJcCi/mCgCc+IxIfpGg?=
 =?us-ascii?Q?pL7dFrrtK3CthrvI8uBxgWFP4XWtVtY8c35MB/LJ6VhHhksgO28WuUqcFxG+?=
 =?us-ascii?Q?b/83phPbSNaslv+URgQSZRJbVP+23t31ZhbIC+zyuIsM3SCd/YDG74H3/QA0?=
 =?us-ascii?Q?hSkb++DT1CYNZwtwdKuSTExkxnZMU9OT6ow4q4soot/fLSGOZ5A7ff7P6Aas?=
 =?us-ascii?Q?FlideLm/MuzZJp1kI3/prUPHNA5cBJ7BhuI4yk77DeYBNjxNyrQlQWzMtfxE?=
 =?us-ascii?Q?w30qaSOQnnsEn6Gnv6bJDmRqoHajJpqfVTOynlIxjrM4jYUBa+LVIR29o9j9?=
 =?us-ascii?Q?hgW9YuHq1to3WDfcwSq/1j1z0ffQI0y68w6Wsmn6Xpho7YyH8qc55jH62kQc?=
 =?us-ascii?Q?R/CEVYBnuAQ7btoAdCLoJKqKmmQlMYMbiEsE5XIiKCRFN4n1oxkOGDQDah1K?=
 =?us-ascii?Q?9xJ6MHL6lcRh5eFsLJfiT5tM0r3htFn/EgkZlj5vdqvRX1j0Ox/muVRZVclo?=
 =?us-ascii?Q?HtdoDrLWZroo5o4Kt97Wx2dPqrXOUNiLRt62/9GMJuVlj+KKINXDotLs9gc6?=
 =?us-ascii?Q?aBFNdnSzX7OYc5aDRZ4kcsQiziDghDFd/vXtcOhLUKIAfzHm7v8e/bzEbhne?=
 =?us-ascii?Q?2eiaxZf/YC6ovBm1jdi65Z5179yCbr7i0JaCm4rQG6VpMs7jq2Xlminyl19l?=
 =?us-ascii?Q?8SAFTK3g6928oW6V1NeV67W7xJOdfcpdFzxHm71TDb3fKBjtfThSBPQJvIjE?=
 =?us-ascii?Q?DGNzOVTvb43GXYlVcxO/084plJ/l/KFZY+fNyDocYfvyLofYE+dzZZu858KN?=
 =?us-ascii?Q?vxe0Tyd/TrRN1m204gsfmVhyag/Nkt/EWdNgv9pm8scpouTxxPZbrWPskOQF?=
 =?us-ascii?Q?kq8dXT9F4TY0Yd0sgfX+TrQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439e583c-4ae7-4912-a09d-08da003bad23
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:09:13.5772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+AoSqnGAdsxbUSVT5esaKUQYfRpaXZbPG0Pkc0sERIdFx7GiaX+9RGyt4mDpe4lDdK40F55PO0BAqWlePRYMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2619
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070076
X-Proofpoint-GUID: bfFwgBw_ZJmjDo5yo92BMLHf68h5XKKW
X-Proofpoint-ORIG-GUID: bfFwgBw_ZJmjDo5yo92BMLHf68h5XKKW
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
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

This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.

[Jonah: Rebasing from previous patchset from Feb. 10 (v12). Original patches
 are by Laurent Vivier from May 2020.

 Rebase from v12 to v13 is just a small line change in patch 7/8 in
 qapi/virtio.json.]

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

    { 'command': 'x-query-virtio',
      'returns': ['VirtioInfo'],
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio" }
        <- { "return": [
               {
                   "path": "/machine/peripheral/vsock0/virtio-backend",
                   "name": "vhost-vsock"
               },
               {
                   "path": "/machine/peripheral/crypto0/virtio-backend",
                   "name": "virtio-crypto"
               },
               {
                   "path": "/machine/peripheral-anon/device[2]/virtio-backend",
                   "name": "virtio-scsi"
               },
               {
                   "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                   "name": "virtio-net"
               },
               {
                   "path": "/machine/peripheral-anon/device[0]/virtio-backend",
                   "name": "virtio-serial"
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
            status: ACKNOWLEDGE, DRIVER, FEATURES_OK, DRIVER_OK
            Guest features:   EVENT_IDX, INDIRECT_DESC, VERSION_1
            Host features:    PROTOCOL_FEATURES, EVENT_IDX, INDIRECT_DESC, VERSION_1, ANY_LAYOUT,
                              NOTIFY_ON_EMPTY
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
                Features:          EVENT_IDX, INDIRECT_DESC, VERSION_1, ANY_LAYOUT, NOTIFY_ON_EMPTY
                                   LOG_ALL
                Acked features:    EVENT_IDX, INDIRECT_DESC, VERSION_1
                Backend features:
                Protocol features:

QMP Form:

    { 'command': 'x-query-virtio-status',
      'data': { 'path': 'str' },
      'returns': 'VirtioStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-status",
             "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend" }
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
                         "transports": [],
                         "dev-features": []
                      },
                      "nvqs": 2,
                      "protocol-features": {
                         "protocols": []
                      },
                      "vq-index": 0,
                      "log-enabled": false,
                      "acked-features": {
                         "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
                         "dev-features": []
                      },
                      "features": {
                         "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1", "ANY_LAYOUT",
                                        "NOTIFY_ON_EMPTY"],
                         "dev-features": ["LOG_ALL"]
                      }
                   },
                   "backend-features": {
                      "transports": [],
                      "dev-features": []
                   },
                   "start-on-kick": false,
                   "isr": 0,
                   "broken": false,
                   "status": {
                      "statuses": ["ACKNOWLEDGE", "DRIVER", "FEATURES_OK", "DRIVER_OK"]
                   },
                   "num-vqs": 3,
                   "guest-features": {
                      "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
                      "dev-features": []
                   },
                   "host-features": {
                      "transports": ["PROTOCOL_FEATURES", "EVENT_IDX", "INDIRECT_DESC", "VERSION_1",
                                     "ANY_LAYOUT", "NOTIFY_ON_EMPTY"],
                      "dev-features": []
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
      'returns': 'VirtQueueStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-queue-status",
             "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                            "queue": 2 }
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
                   "name": "virtio-net",
                   "vring-num": 64 }
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
      'returns': 'VirtVhostQueueStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-vhost-queue-status",
             "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                            "queue": 1 }
           }
        <- { "return": {
                   "avail-phys": 5168197632,
                   "used-phys": 5168198208,
                   "avail-size": 518,
                   "desc-size": 4096,
                   "used-size": 2054,
                   "desc": 139851654676480,
                   "num": 256,
                   "name": "virtio-net",
                   "call": 0,
                   "avail": 139851654680576,
                   "desc-phys": 5168193536,
                   "used": 139851654681152,
                   "kick": 0 }
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
      'returns': 'VirtioQueueElement',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-queue-element",
             "arguments": { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
                            "queue": 2 }
           }
        <- { "return": {
                   "index": 125,
                   "name": "virtio-scsi",
                   "descs": [
                      { "flags": ["used", "avail", "next"],
                        "len": 1862028160,
                        "addr": 11887549308755752444 }
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

v13: minor text edit in qapi/virtio.json

v12: minor reformatting for monitor/hmp-cmds.c
     use PRI types in virtio hmp monitor printfs

v11: minor reformatting in virtio.json
     added synchronicity check when querying virtio devices

v10: rebased for upstream (Qemu 7.0)
     reformat virtio.json for better consistency
     removed all enums from virtio.json; replaced with string literals
     removed @ndescs from VirtioQueueElement
     removed examples in hmp-commands-info.hx (to fix 'inconsistent
     literal block quoting' error from Sphinx)

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

 hmp-commands-info.hx                   |  70 +++
 hw/9pfs/virtio-9p-device.c             |   2 +-
 hw/block/vhost-user-blk.c              |   9 +-
 hw/block/virtio-blk.c                  |  31 +-
 hw/char/virtio-serial-bus.c            |  14 +-
 hw/display/vhost-user-gpu.c            |   7 +
 hw/display/virtio-gpu-base.c           |  20 +-
 hw/input/vhost-user-input.c            |   7 +
 hw/input/virtio-input.c                |  13 +-
 hw/net/virtio-net.c                    |  58 ++-
 hw/scsi/vhost-scsi.c                   |   8 +
 hw/scsi/virtio-scsi.c                  |  20 +-
 hw/virtio/meson.build                  |   2 +
 hw/virtio/vhost-user-fs.c              |  20 +-
 hw/virtio/vhost-user-i2c.c             |   7 +-
 hw/virtio/vhost-user-rng.c             |   9 +-
 hw/virtio/vhost-user-vsock.c           |   2 +-
 hw/virtio/vhost-vsock-common.c         |  22 +-
 hw/virtio/vhost-vsock.c                |   2 +-
 hw/virtio/vhost.c                      |   4 +-
 hw/virtio/virtio-balloon.c             |  17 +-
 hw/virtio/virtio-crypto.c              |  22 +-
 hw/virtio/virtio-iommu.c               |  17 +-
 hw/virtio/virtio-mem.c                 |  14 +-
 hw/virtio/virtio-pmem.c                |   3 +-
 hw/virtio/virtio-rng.c                 |   2 +-
 hw/virtio/virtio-stub.c                |  42 ++
 hw/virtio/virtio.c                     | 742 ++++++++++++++++++++++++++++-
 include/hw/virtio/vhost-vsock-common.h |   2 +-
 include/hw/virtio/vhost.h              |   3 +
 include/hw/virtio/virtio-gpu.h         |   3 +-
 include/hw/virtio/virtio.h             |  26 +-
 include/monitor/hmp.h                  |   5 +
 monitor/hmp-cmds.c                     | 311 ++++++++++++
 qapi/meson.build                       |   1 +
 qapi/qapi-schema.json                  |   1 +
 qapi/virtio.json                       | 841 +++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c             |   1 +
 38 files changed, 2335 insertions(+), 45 deletions(-)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

-- 
1.8.3.1


