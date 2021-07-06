Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4314F3BDBC7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:58:45 +0200 (CEST)
Received: from localhost ([::1]:48680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oPE-00057F-AQ
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJY-00008M-Qu
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:58242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJT-000821-A8
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:52 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166Gq80v003088; Tue, 6 Jul 2021 16:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=QhPmNEo8Udv6nULKwGaoX2jO/mdAhF+3Ey3l5YUtqiY=;
 b=ZbfXuSZTL1QE8hUDJYkE9++AeuaZ6ObEYA0miCvMOO6aUrr/LxOZE5x24tWOQIzVdH+e
 w7LX58VYb7a6MxZh1kpKad1ZuK07/7UtPoAcJkSxonx9Dfc5qPealr8EWNiC3dJSDfBZ
 OfZ5q11slpgFaXM8Emqbmqhae8pI38QjZpKGgB57cEuGCejs8iZEXOE2E5d7u1IjwkIH
 MozfeiqqF5POH3YmkKUy5CEIxHy5Fch5ssZAj7oyl5sOv7kpQB1jXw5zC+5U7yxWEDb9
 bqg+QXCoYEiCKG6iwJrF8HI1mJ+4BvezMyN2dqJgE9ji4PsuxeIqL9es+e7VDeJy2hQx jw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m3mha8et-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoUNT084689;
 Tue, 6 Jul 2021 16:52:40 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2040.outbound.protection.outlook.com [104.47.73.40])
 by userp3020.oracle.com with ESMTP id 39k1nvcpph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmwDctTmvA2/O7CY+QAzU1zaRJBWR033iN1MP+6CZLQc/kMmmO3X3KG7Jr2R26WDOv06+6jKPtHe4l2u8hIcPNzBD6dgHjtEJ7azomxz4A0mOilD7D6hlrCiL9m1+5htsBwu7QjoUNRSdrY5RZEjJ4+DC7LaZB8WYtfdk6ldlIR0z8GgGs5dqd7d0iKm5HM7HLEzGUYhSS3zhz9yoKP9s6jx9Ae3cgmMi8MBNi7Mlh4mCdVEpRvDlKkelrHbhzYx4SvIXyWNAmpREL+GjzMWm85CNr8bDHRtlH9StJzPBnrEWTw891A4JtWZPBcoq/2pO+kjhSuaiOSiXYlTGDLTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhPmNEo8Udv6nULKwGaoX2jO/mdAhF+3Ey3l5YUtqiY=;
 b=eaDSseVZ/6df5c06FAfkF0KALQwYo/3ubPh/TWPp5xRpsasMO5u6DEUT9GC6MadOClByCQn0yb73gj9ZFq2LfadZIy2b0YdSNQhqxvoXTGkxiR6t9DEG6qjPml2toyBbpLhFQx8MfnbZMcXUmV04i1qIxkZ/ug1AoO9CVfVb1hypcK+9RRjOZDV3On0C0sA7efem5AXtPRPPsuaIBPQYNQ9jdhIwtcfaDe84wbATvxWt369PGalgFBYJOrvuCc04InEFto7RdlpDP50XcnZwEVR5hEqWvhUwYkeh/duT+uGYkIIrUzZIXCD9TIkQoiu/0eUyeDswKz02pXYN7rvicg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhPmNEo8Udv6nULKwGaoX2jO/mdAhF+3Ey3l5YUtqiY=;
 b=KkqpfVnYvOYenwojT6lFOHieSfIrA8FdUXJFzEk/sQdcSDSbcermh0/d8Yd/t3wqj3ua5tG9sVSdBuuxHOh2/RrT//LhyTMqz1N0zk6udYs6yZrhyCMSKoKqZUaRHwFqTr666KJgoqRpyXRsS3MxF9BWI002tvvaCXlNpux0o0c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2982.namprd10.prod.outlook.com (2603:10b6:a03:8a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 16:52:36 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:52:36 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 00/25] Live Update
Date: Tue,  6 Jul 2021 09:45:31 -0700
Message-Id: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0041.namprd02.prod.outlook.com
 (2603:10b6:803:2e::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.4) by
 SN4PR0201CA0041.namprd02.prod.outlook.com (2603:10b6:803:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 16:52:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd10c4b3-ac4d-401a-11e7-08d9409e7541
X-MS-TrafficTypeDiagnostic: BYAPR10MB2982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB29828A3FECE6E456C394701AF91B9@BYAPR10MB2982.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZKXdCLqsKuAyunCAMMuEF8Xu2rwDTs3V4S8XCdyaoxYbRagffPpynI2y0zy6xBmP0I5TexH5bKHGPXafhlpcjomsntOmdiXXdBlRqCr124bYI3Uzau/w49J9EAjYpnQMKCZneP49T9v1zAHl1R+fA9dB+nuz5pnpJmyHOYnVrFDb694isCbFR/2E+JxWKM0228m8Uq/wk/7H7WnZrBLq6002GLRX2qPYLw8K5okDycgbgBe23vyp1Bj1EegvT2LZ+HHHoRtphjcbGsMZ52iSuY1Mgmrj2WNOvzbJb1w3u6+qHmqgVpquOYFeqEnUutpO2bpv9EqMw7ajQBhjqPMsqDZfQ4PTg99bDB7BW88qOaCnvCVK9FkoF6mz/JDy9F07elCqvkrTjRUTXUQEOfCkwMKP6cu88Xf8RuhH8oQ8g8/kt8xpTjMG/1CF71U2pqozpA0eb7HFmwuiINdGNHtiJDRZ88j9PvbBwB97AWkZXTP0hWWH3T96ufVd1pqY+npsO5iYYRSA19ccEWElS3D2KtLY4QbAeebIzoJH8x+RjSD8PwSjqUFdXaf+pFx+jndaMA0rONhXW78eBqLwq7YSp7wm9iL7suBjx4EvWTmQ4DZoY8RJMMH+cxchL5cFyDNxw5KwsiMJEIgQphxiah2KVFmRDxi0DFeoVT0ryeWr8d93bdrTzm5SMe/DcB6JfjLsTOXwnLX2FUCkDWYCY0B4uvychoXfjUSFUtxCZlZ54FG7TkHDQssIWGZ0LL2NiFXWpqkGXpzwyIJKq15s+FdT05UD+VzRxTwStPhSWLIJEYniWyX4khgK7CYxcZynonS4e5cMjawBOIlE/XNw6uA6MA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(8936002)(83380400001)(2616005)(7696005)(316002)(52116002)(6666004)(478600001)(26005)(8676002)(15650500001)(38350700002)(38100700002)(186003)(36756003)(86362001)(6486002)(7416002)(66946007)(54906003)(2906002)(107886003)(4326008)(66476007)(6916009)(66556008)(5660300002)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z2TPfELO+ZaxIBXC5NRitFziqG3nKaPx/GNyM06O/aVSM3r+kg30VqavPE0f?=
 =?us-ascii?Q?tKs9h9coHKF5k5spFBYb34L/8eYsX7r54fFXAreA4elsLpODeeZliOLeTQnD?=
 =?us-ascii?Q?nRSgwxy46J+B+AGyPUlDbogoyQShiPlMDo+JrxJd+2h+iVsmImSHlKUNRnN8?=
 =?us-ascii?Q?6PNKfaVHdnTs6t7KpHMPeWL4QBLjEmJKobCuPNH2X1qbqD9TM3pLGeEpP5oh?=
 =?us-ascii?Q?yR5+j5UV7n7Y4NdEWYyutEjav2n/TFqa7Ei6QmGm8tMddUPGrsBPGIzfz1E/?=
 =?us-ascii?Q?eK+LjU4ipPBYMjvSXhAAM2ih2fFSfgnBD6MlfLVQwjpF9s8TgB65Inp7ebNo?=
 =?us-ascii?Q?GLkj5V1wOjwwp+wfI9XJ4eyo9yplvIJ081n45aRW2khgXWdpxBLUgrRCaHLx?=
 =?us-ascii?Q?xggO9kS6OgQSbSuMIlmrJa0pipfTq9r18rEwZeFkfH4rYhi+kNQi+RQkH+8A?=
 =?us-ascii?Q?2D7HweY7HeRklrEeCXcSvgrfX9TdWHcV7YJBEk12ohHFO8bN5L+f7aUU2JpF?=
 =?us-ascii?Q?rKYY9yErvf4DUP0sfrDS8G1GQDXolvjD6oEBAuJxUYy6AcduSEcZGqYfr9mQ?=
 =?us-ascii?Q?lS6SXL7ufIlxHgeG734ncjh4uDBEaJTAeP2CeIdax7KgniMsfRL0vBDv7R2y?=
 =?us-ascii?Q?Mozp83Ob0m/57BuM2cJlnlb/99wzpbOcmcyPaqeYkqUsC6h4c2cPRYjv2V24?=
 =?us-ascii?Q?QFXs24ynId8oC2fI1YCFU6v9mntXrIO9F2BhUcj7rfTWhQLonwuaHPQhtHWw?=
 =?us-ascii?Q?Xn4rp71goSQqcycCNDdev0f3nfCFOKNqJAWdRcnzGFqhuI9fCrZdyqBLska1?=
 =?us-ascii?Q?zpaqAVrm0UztkLHZWbT9NDLAazmRtHcyhkjttIq2YpdApCMQM6bRaJ1ZyThd?=
 =?us-ascii?Q?xHJ/e5OhY1A1KvS52CO77lA0NufPNSyeLbTjaHzGP6A0FFy+1R+toS0HwxDU?=
 =?us-ascii?Q?cMH0BWC0lRBVeN3lyfHZF7PgOY1iYzoSvUgzzvuUHbe15D1CSZLtRvo0efUV?=
 =?us-ascii?Q?feqxuwZgxhITFjOm8pAXyta0QO5RMXYzuBWZ6ku37CbKXpy0CIvYzv5t1/O+?=
 =?us-ascii?Q?L1iP0UU8sInB2oRicUlQfDpk5VvRCPu2kJzkTlMSXTMeyA3zeputJ/xLr1md?=
 =?us-ascii?Q?Vf4w8+uhDdqRg2339BgYXqpuKoZGMrBDBe6qVJ2kx4kh4mt1RutEEUx/ciH/?=
 =?us-ascii?Q?HxF8rdoNH3RLmzF9eh/n/TT5uMZ8Oa8KyByVjrF6xfYI0XpyRcvcM6svHOPt?=
 =?us-ascii?Q?dEDZcYOeljgxAPSZ9xTz07Qc2+oDVnby79mpa6r3dCr5n0il4AXcrWxwVigr?=
 =?us-ascii?Q?bFkuigDrA/ywr5OuxH1EoaTK?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd10c4b3-ac4d-401a-11e7-08d9409e7541
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:52:36.7404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKlqZoLn1mWYzIAnGUl6Lr3B56a6DQUgqEk1TzD9E96ppSaM20jfOBMekB9Po+H7x/GrZOYAF/5FasHE+J3EQ5dlLT5KoLXYgqjTkTBrs8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2982
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-GUID: AV7TtnXCtyNPPPwucOxFE9dRGE36h6yc
X-Proofpoint-ORIG-GUID: AV7TtnXCtyNPPPwucOxFE9dRGE36h6yc
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the cprsave, cprexec, and cprload commands for live update.  These
save and restore VM state, with minimal guest pause time, so that qemu may
be updated to a new version in between.

cprsave stops the VM and saves vmstate to an ordinary file.  It supports any
type of guest image and block device, but the caller must not modify guest
block devices between cprsave and cprload.  It supports two modes: reboot
and restart.

In reboot mode, the caller invokes cprsave and then terminates qemu.
The caller may then update the host kernel and system software and reboot.
The caller resumes the guest by running qemu with the same arguments as the
original process and invoking cprload.  To use this mode, guest ram must be
mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm
PKRAM as proposed in https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com.

The reboot mode supports vfio devices if the caller first suspends the
guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
guest drivers' suspend methods flush outstanding requests and re-initialize
the devices, and thus there is no device state to save and restore.

Restart mode preserves the guest VM across a restart of the qemu process.
After cprsave, the caller passes qemu command-line arguments to cprexec,
which directly exec's the new qemu binary.  The arguments must include -S
so new qemu starts in a paused state and waits for the cprload command.
The restart mode supports vfio devices by preserving the vfio container,
group, device, and event descriptors across the qemu re-exec, and by
updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
VFIO_DMA_MAP_FLAG_VADDR as defined in https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com/
and integrated in Linux kernel 5.12.

To use the restart mode, qemu must be started with the memfd-alloc option,
which allocates guest ram using memfd_create.  The memfd's are saved to
the environment and kept open across exec, after which they are found from
the environment and re-mmap'd.  Hence guest ram is preserved in place,
albeit with new virtual addresses in the qemu process.

The caller resumes the guest by invoking cprload, which loads state from
the file.  If the VM was running at cprsave time, then VM execution resumes.
If the VM was suspended at cprsave time (reboot mode), then the caller must
issue a system_wakeup command to resume.

The first patches add reboot mode:
  - qemu_ram_volatile
  - cpr: reboot mode
  - cpr: QMP interfaces for reboot
  - cpr: HMP interfaces for reboot

The next patches add restart mode:
  - as_flat_walk
  - oslib: qemu_clr_cloexec
  - machine: memfd-alloc option
  - vl: add helper to request re-exec
  - string to strList
  - util: env var helpers
  - cpr: restart mode
  - cpr: QMP interfaces for restart
  - cpr: HMP interfaces for restart

The next patches add vfio support for restart mode:
  - pci: export functions for cpr
  - vfio-pci: refactor for cpr
  - vfio-pci: cpr part 1
  - vfio-pci: cpr part 2

The next patches preserve various descriptor-based backend devices across
cprexec:
  - vhost: reset vhost devices upon cprsave
  - hostmem-memfd: cpr support
  - chardev: cpr framework
  - chardev: cpr for simple devices
  - chardev: cpr for pty
  - chardev: cpr for sockets
  - cpr: only-cpr-capable option
  - simplify savevm

Here is an example of updating qemu from v4.2.0 to v4.2.1 using
restart mode.  The software update is performed while the guest is
running to minimize downtime.

window 1                                        | window 2
                                                |
# qemu-system-x86_64 ...                        |
QEMU 4.2.0 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: running                              |
                                                | # yum update qemu
(qemu) cprsave /tmp/qemu.sav restart            |
(qemu) cprexec qemu-system-x86_64 -S ...        |
QEMU 4.2.1 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: paused (prelaunch)                   |
(qemu) cprload /tmp/qemu.sav                    |
(qemu) info status                              |
VM status: running                              |


Here is an example of updating the host kernel using reboot mode.

window 1                                        | window 2
                                                |
# qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
QEMU 4.2.1 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: running                              |
                                                | # yum update kernel-uek
(qemu) cprsave /tmp/qemu.sav restart            |
(qemu) quit                                     |
                                                |
# systemctl kexec                               |
kexec_core: Starting new kernel                 |
...                                             |
                                                |
# qemu-system-x86_64 -S mem-path=/dev/dax0.0 ...|
QEMU 4.2.1 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: paused (prelaunch)                   |
(qemu) cprload /tmp/qemu.sav                    |
(qemu) info status                              |
VM status: running                              |

Changes from V1 to V2:
  - revert vmstate infrastructure changes
  - refactor cpr functions into new files
  - delete MADV_DOEXEC and use memfd + VFIO_DMA_UNMAP_FLAG_SUSPEND to
    preserve memory.
  - add framework to filter chardev's that support cpr
  - save and restore vfio eventfd's
  - modify cprinfo QMP interface
  - incorporate misc review feedback
  - remove unrelated and unneeded patches
  - refactor all patches into a shorter and easier to review series

Changes from V2 to V3:
  - rebase to qemu 6.0.0
  - use final definition of vfio ioctls (VFIO_DMA_UNMAP_FLAG_VADDR etc)
  - change memfd-alloc to a machine option
  - Use qio_channel_socket_new_fd instead of adding qio_channel_socket_new_fd
  - close monitor socket during cpr
  - fix a few unreported bugs
  - support memory-backend-memfd

Changes from V3 to V4:
  - split reboot mode into separate patches
  - add cprexec command
  - delete QEMU_START_FREEZE, argv_main, and /usr/bin/qemu-exec
  - add more checks for vfio and cpr compatibility, and recover after errors
  - save vfio pci config in vmstate
  - rename {setenv,getenv}_event_fd to {save,load}_event_fd
  - use qemu_strtol
  - change 6.0 references to 6.1
  - use strerror(), use EXIT_FAILURE, remove period from error messages
  - distribute MAINTAINERS additions to each patch

Steve Sistare (21):
  qemu_ram_volatile
  cpr: reboot mode
  as_flat_walk
  oslib: qemu_clr_cloexec
  machine: memfd-alloc option
  vl: add helper to request re-exec
  string to strList
  util: env var helpers
  cpr: restart mode
  cpr: QMP interfaces for restart
  cpr: HMP interfaces for restart
  pci: export functions for cpr
  vfio-pci: refactor for cpr
  vfio-pci: cpr part 1
  vfio-pci: cpr part 2
  hostmem-memfd: cpr support
  chardev: cpr framework
  chardev: cpr for simple devices
  chardev: cpr for pty
  cpr: only-cpr-capable option
  simplify savevm

Mark Kanda, Steve Sistare (4):
  cpr: QMP interfaces for reboot
  cpr: HMP interfaces for reboot
  vhost: reset vhost devices upon cprsave
  chardev: cpr for sockets

 MAINTAINERS                   |  12 +++
 backends/hostmem-memfd.c      |  21 ++--
 chardev/char-mux.c            |   1 +
 chardev/char-null.c           |   1 +
 chardev/char-pty.c            |  15 ++-
 chardev/char-serial.c         |   1 +
 chardev/char-socket.c         |  35 +++++++
 chardev/char-stdio.c          |   8 ++
 chardev/char.c                |  41 +++++++-
 gdbstub.c                     |   1 +
 hmp-commands.hx               |  62 ++++++++++++
 hw/core/machine.c             |  19 ++++
 hw/pci/msix.c                 |  20 ++--
 hw/pci/pci.c                  |   7 +-
 hw/vfio/common.c              |  78 ++++++++++++--
 hw/vfio/cpr.c                 | 154 ++++++++++++++++++++++++++++
 hw/vfio/meson.build           |   1 +
 hw/vfio/pci.c                 | 230 +++++++++++++++++++++++++++++++++++++++---
 hw/vfio/trace-events          |   1 +
 hw/virtio/vhost.c             |  11 ++
 include/chardev/char.h        |   6 ++
 include/exec/memory.h         |  25 +++++
 include/hw/boards.h           |   1 +
 include/hw/pci/msix.h         |   5 +
 include/hw/pci/pci.h          |   2 +
 include/hw/vfio/vfio-common.h |   8 ++
 include/hw/virtio/vhost.h     |   1 +
 include/migration/cpr.h       |  20 ++++
 include/monitor/hmp.h         |   4 +
 include/qemu/env.h            |  23 +++++
 include/qemu/osdep.h          |   1 +
 include/sysemu/runstate.h     |   2 +
 include/sysemu/sysemu.h       |   1 +
 linux-headers/linux/vfio.h    |  27 +++++
 migration/cpr.c               | 195 +++++++++++++++++++++++++++++++++++
 migration/meson.build         |   1 +
 migration/migration.c         |   5 +
 migration/savevm.c            |  21 ++--
 migration/savevm.h            |   2 +
 monitor/hmp-cmds.c            |  75 ++++++++++++--
 monitor/hmp.c                 |   3 +
 monitor/qmp-cmds.c            |  36 +++++++
 monitor/qmp.c                 |   3 +
 qapi/char.json                |   5 +-
 qapi/cpr.json                 |  88 ++++++++++++++++
 qapi/meson.build              |   1 +
 qapi/qapi-schema.json         |   1 +
 qemu-options.hx               |  39 ++++++-
 softmmu/globals.c             |   1 +
 softmmu/memory.c              |  48 +++++++++
 softmmu/physmem.c             |  49 +++++++--
 softmmu/runstate.c            |  58 ++++++++++-
 softmmu/vl.c                  |  14 ++-
 stubs/cpr.c                   |   3 +
 stubs/meson.build             |   1 +
 trace-events                  |   1 +
 util/env.c                    |  95 +++++++++++++++++
 util/meson.build              |   1 +
 util/oslib-posix.c            |   9 ++
 util/oslib-win32.c            |   4 +
 util/qemu-config.c            |   4 +
 61 files changed, 1525 insertions(+), 83 deletions(-)
 create mode 100644 hw/vfio/cpr.c
 create mode 100644 include/migration/cpr.h
 create mode 100644 include/qemu/env.h
 create mode 100644 migration/cpr.c
 create mode 100644 qapi/cpr.json
 create mode 100644 stubs/cpr.c
 create mode 100644 util/env.c

-- 
1.8.3.1


