Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C1449CC77
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:37:54 +0100 (CET)
Received: from localhost ([::1]:43796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCjQm-000588-Fs
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:37:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nCjJD-0005po-P9
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:30:03 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nCjJA-0000ax-PW
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:30:03 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20Q9Zbog006704; 
 Wed, 26 Jan 2022 14:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=q6GIqEWBw8dkFczAKY1OZpajCY6J7AQ07pmX9IS1j54=;
 b=IUfKy1y9v3tWjkxYl8BNKtaT+IcPLJ+hB0Z4B/kfjjCh7BxIZWmf+mB5cK+1wHdLZKnM
 gqlGr5iUQneHkbHMMFpoMjTEqp71M2MlSyRYvKp+hJ3Yj7rbAZUgxjXGK3Lr2id7Vdoi
 p0Vcl25NaL9pQxJGS78O3XY8nhHbK7Ro/8GINdaSB0OUxVp2kUOTqDce7lQNN7QKGeKG
 Jm2jNKoFVMmfhZgZ/OTtUJ+13fSvKPB2nIU8DeTUxdHCpjnlIV5hdbZ/0wrwR6c4Swej
 w3j3C1tLL+hGLtYfEgfbFZoneikCjiquJltup4nNsLfjRg5z3+emT+0PD0F0dBJfJNcC yw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsvmjeray-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 14:29:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QEQoxI181401;
 Wed, 26 Jan 2022 14:29:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by aserp3020.oracle.com with ESMTP id 3dtax8fy4y-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 14:29:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DATKgPPJSTbvj9KYtuL6eumL1eu5FXzhe8fc777UOoYJC8Sa3wY73K2N6/AdwLLm0Po6yMXyhKvN2qPxfSsSWia1Jd5IRkwcd660T8e9aLtadxBFzvdtzZ7iUTEjPKaQyfgBh3Sg2YfWwOUULyuBnakvruLR/yz1grevVkWbCmiI9RqovU/5zaUEs42fJzPtaZuM2kgxXvGZbceEpsPN0YWNqjyXpwSYgVKd0ZlAdP23Og6h/iRqzKSKGu+tYBXJ3Yi56Ntrt1W8SNQQjwkJTYPIq4cAJR3om8Vw3GQ4uGiAUmBjOX5htU6msmhgcOKzxbANgvOTw057vdsfM6ItIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6GIqEWBw8dkFczAKY1OZpajCY6J7AQ07pmX9IS1j54=;
 b=AdVXK57TUCynooJo+NHKaXmL+fFQmUDk0PCru5dkU+a1niSTyKH9oXaLA7hFu8B3fjWvuspniSZ002i+EZZOmCspjEcMpMjUh8V+aU2cjVKmkxvk6gPz1SbueslynvVCpNn2PyzSajOpUvGpt+51/A6wduy64p0noriO5gTi0eW1KxA+KIiTvTtsraLCUSwigICoOZuZfiH12HKskoazXiF8K1PfQdQVG/8CVIaJejUbJ3uYqVC2cVAL7GLZK2pe3uP1LaznQl5V0mHkzBtqLb4qPoKvATyScs3XSbgiTa5cNMFZovYLHNtjAjOrhoOGiINzTVE55Tt19s5VowstKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6GIqEWBw8dkFczAKY1OZpajCY6J7AQ07pmX9IS1j54=;
 b=oGn08maH5mOFfKPqTOu/A8+A6e5NnA1kqw60zKuK2oP5uPRR9Bf+qSFK3CWMZUVFjV1cCheAaUcfrKQh1KDAxUEIUuw4MYQfK2Y1prPit+Sg9LvwygP4p/CalljscB/+jV2DgVsRMB/Q3N0WZGVpDZ1uz01/YPUnuoTS6SxRjQs=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by CH2PR10MB3990.namprd10.prod.outlook.com (2603:10b6:610:11::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 14:29:54 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0%7]) with mapi id 15.20.4888.013; Wed, 26 Jan 2022
 14:29:54 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] softmmu/cpus: Free cpu->thread in cpu_remove_sync()
Date: Wed, 26 Jan 2022 08:29:43 -0600
Message-Id: <20220126142946.667782-2-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220126142946.667782-1-mark.kanda@oracle.com>
References: <20220126142946.667782-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0019.namprd05.prod.outlook.com
 (2603:10b6:803:40::32) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02d76edf-7c8e-4652-288a-08d9e0d851d8
X-MS-TrafficTypeDiagnostic: CH2PR10MB3990:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB3990A9AC07CD164F7088AE23F9209@CH2PR10MB3990.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M/OqPF7F7dtvpYhtnp8LSTy25b9F7tlHnC9H8E26mVjfLnpmhlAkLEtAbYuFYEi1Ii4v7+9ShoSBRKZvfYRoXke9gvNl9wIPJej0WuRGoUXILgT8h7WgfHUSTMPOQ86yZjQ3SQTQMc05eJ2BLW37WY1RQBw3ziFVvpuV3rRRgxXmE1wxoahCSlVC13eYtLz3iIo8Sris0hf1VtPlA34Yo2yZ/psxjyAPrWAKmklO/oLgm5HipXKWKi5kVDfM7FbvnhgYczpVxH3VbQL1JjgceTOaz+DFiyNto+4o1z+s/AfDIkIDRihliTjtrQnETbOsjfJA6pnJfcCsBFZapQxixzGIGTAdwNXRLsmcFIHLwnWL6PFAzDdJYMvzyopeCns3RTzEFpv/we22LczDp41iQMuUxWs+foFsCX5lo2IqLD92hNjO3fcQ9lGoO0OKyjbGFTSEAOpaNOxfXO7hYhtNMPhdUyJb3zzFkKLHTbs006HrNDDkK2HCv/EVQflgX6wiHe0g8ACKW1oS4JpUgrK0gqCv3EAqGqZrSTaF/GGy0mxnLF0AXLFic/ooVwBxcU/bcwjVKj+DwodeMkQ70FrXxgikSmngb7TNizfUJ1zr/4n+v82Jood+ji/u8c3IHA8j3Vze8eTl92C04rQexOnH5V6bcHhutwYCJs4fuqC/f5IFdEj7iZNJ5nHe7qg48TUSvuCj6HxtvBC80kOpfyhv9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(83380400001)(36756003)(26005)(6486002)(316002)(66476007)(1076003)(186003)(66556008)(6916009)(66946007)(2616005)(107886003)(86362001)(6666004)(6512007)(6506007)(44832011)(52116002)(4326008)(8676002)(5660300002)(38100700002)(38350700002)(8936002)(2906002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k+a4TW3uQ469lNud812O3Rsf2be0xhW7Oabk2SYI2Ftf53b8FyzJQWD0e34M?=
 =?us-ascii?Q?3kMaZMNZnuU9T4pQ+i/KqbZKUla+kR97vlI88l9yg3W1cQ4x3Dp/MoXAcaJ5?=
 =?us-ascii?Q?SbMcJiboeejNnZ2en0BX020NzMV8UmTnXMgyW5w8OHVLO7BkKA/aS0SCZ/CY?=
 =?us-ascii?Q?zzd00makZjANEEZJzvHKjx4Q1h1sWmkblg6HTSVucqc1AcaSU43Dz57uFmGx?=
 =?us-ascii?Q?9lDQpYLfRSQ4WMtf4oVLirNQ7EENoBMsAD2OJDDYsDx30L31YozP66pePB64?=
 =?us-ascii?Q?50fZydWxlxNvLvlq6KGjSquF9N92ZPNt55cU3xk3YAjAd1Lo3uUR+1jmsJo5?=
 =?us-ascii?Q?C8r766m7XQ6hT2MrQak0uEemlnRQO7UkoRaeXfOqAX/C6XHZvkTE/kXSCBVE?=
 =?us-ascii?Q?J0fFXRuLvZP9HWg74chcPRU//IgswiPn+u+IGELEHMNCe3VujNlg8eIdEBWu?=
 =?us-ascii?Q?6mx9aIujX7NcWcq3pZaktzigC+waToLIeGkSgkWqatVbHaFRA7dGmJMB1PMw?=
 =?us-ascii?Q?C3RrlNl15ZHuLLLSMhJtrnZ9u8zeCeDpwkmmmYDCkjn8EvasZ/nSra9+jll9?=
 =?us-ascii?Q?LHmG9sQwD6HG8MYDKcLsCsOi+alSAQYzsZuhLEeCPgwAFcDbhwBUdtolc0oe?=
 =?us-ascii?Q?wO8QEYsjma1Gb8nmYR3ijeHijIRZXnOyOX02BOuf5i3LP7fg+wggAMIipXBm?=
 =?us-ascii?Q?UFlheOy7MY2mgPK2JX/puXZSSShjEJ/0HVFnw1EfUaDRSx/YMmFsx24st+ck?=
 =?us-ascii?Q?7yKe8cUN6e1DBht2e3kfZwnMPYUlXSzy8qQfez3w8fSIwHL08VcAGx24C+qy?=
 =?us-ascii?Q?0Thr4SXzhPPK4utBMnPjXL4KcaPQ4NEr0Q3udFpEZzpipdWezyUawKdKi7Ie?=
 =?us-ascii?Q?Pv7ICs/UnqO2e4wmxxiPrC0RikGJX0psNzzAc/QyDj2p/FZydPVMZ6x7YdBS?=
 =?us-ascii?Q?Bcqu5agG2MYSfXLZPZV1EY6HPMBNlLTAVs+ddqWoRAkHz/RdzD50CoLu89TY?=
 =?us-ascii?Q?8RyugL+pkiAOc5tq/HczanYn678ua0PX23PN8K0eaSTFc60WINrpDlR4FuNL?=
 =?us-ascii?Q?B7yu4tcRnBpoofL5aARC38V1FQmflPyVf+vZCsIY1eCWbq8N4k5J5xVRXP4L?=
 =?us-ascii?Q?K3vhy+6V0X/ZBSMslaxgqWsYYRHKkUHJOBIynJxS//mBbSfNFFANbPxrU2dD?=
 =?us-ascii?Q?Px2pGotdR3bXDCfKMEQ/VzywhjgqBU5OM3OffMk2WsZnLtrhcpjT6VGWmfHa?=
 =?us-ascii?Q?oI3I5AVdwTnMNucTRPFA8bBLmqR+1cTm9aD+GF/NAnO1aOKJU+hjweGxn8r8?=
 =?us-ascii?Q?w0T+Y+OKb2JZQNO7oMQRA0CveL/sCcq0pfyYlgjTBUbmsiQiXfbkmMVi0pPW?=
 =?us-ascii?Q?v5pP1eG9/ss4ZVgji8Hda8Z00tz94ZQ7TUmUhNG2yaq0goz21D++kAze82zU?=
 =?us-ascii?Q?N/Acg4iojjE2cyvMA0VLK/PdoooH+qIpKzHLv7KC9ckqMhLq2szWrubH3B/I?=
 =?us-ascii?Q?JY8gB97Rae7mtO9zTUfhIs+wt5c1TTjGZoCeCEAZW0xydMZXjqenzXWUn47M?=
 =?us-ascii?Q?hZwZX0DdtGdpCs8Eh3fZM+aNhhuea/bDhEip8G7/rJFi9lKzKBMZwGwrYl4Q?=
 =?us-ascii?Q?QGMkq8za72hYGqY773mEzFI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d76edf-7c8e-4652-288a-08d9e0d851d8
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 14:29:54.1564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pkLHV/XqgJLBfRwYwrzNqKCS2+FPSH1VMsdFM/8C3lPg/PAegsCe3R50LOHFJMM4PjLhKJAS4jpYEr55gmZRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3990
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260088
X-Proofpoint-GUID: 3DKwDWvzFIY905x89yfV_Doz2VGVMg9Y
X-Proofpoint-ORIG-GUID: 3DKwDWvzFIY905x89yfV_Doz2VGVMg9Y
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vCPU hotunplug related leak reported by Valgrind:

==377357== 8 bytes in 1 blocks are definitely lost in loss record 1,029 of 8,471
==377357==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
==377357==    by 0x65C14CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
==377357==    by 0x8B5AC8: kvm_start_vcpu_thread (kvm-accel-ops.c:68)
==377357==    by 0x7817AF: qemu_init_vcpu (cpus.c:634)
==377357==    by 0x7185A3: x86_cpu_realizefn (cpu.c:6447)
==377357==    by 0x8E46B7: device_set_realized (qdev.c:531)
==377357==    by 0x8EE36F: property_set_bool (object.c:2268)
==377357==    by 0x8EC3C5: object_property_set (object.c:1403)
==377357==    by 0x8F075D: object_property_set_qobject (qom-qobject.c:28)
==377357==    by 0x8EC72C: object_property_set_bool (object.c:1472)
==377357==    by 0x8E3F7F: qdev_realize (qdev.c:333)
==377357==    by 0x43F3A2: qdev_device_add_from_qdict (qdev-monitor.c:711)

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 softmmu/cpus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 23bca46b07..1d8380d4aa 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -603,6 +603,7 @@ void cpu_remove_sync(CPUState *cpu)
     qemu_mutex_unlock_iothread();
     qemu_thread_join(cpu->thread);
     qemu_mutex_lock_iothread();
+    g_free(cpu->thread);
 }
 
 void cpus_register_accel(const AccelOpsClass *ops)
-- 
2.27.0


