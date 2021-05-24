Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6717238DF7C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:01:13 +0200 (CEST)
Received: from localhost ([::1]:55140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0q8-0003Kt-DS
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0jN-0007a0-Ir
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:54:13 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:55103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0jK-0003VR-Ly
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621824839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=76b8Wqy6Zml+C01NGUHz1nC9/DYmMhOCnRk/jxZzevA=;
 b=F2TJCOHneMpi4ZToOL/N1crrVEKJAGqGOvOpafhfATjymaPMDt5UfsjCzDcF9IbHgYkdh0
 nt3n6dCK3Ni1ZW2woNLFB99AafA1V8J7XJKScX/0IYzWGqy0XeGk+O7TxCjOSJKBFZ1SAe
 bOsbgOSQl+mGf8WLPXcAJRPB8NJ78Bs=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-KcmUPtLWPmOJ2QVDbOP9rw-1; Mon, 24 May 2021 04:53:58 +0200
X-MC-Unique: KcmUPtLWPmOJ2QVDbOP9rw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCpPj2mKeggJYRElhrUdEVtuCDE6kfZw2SEt1JVEjBOD4jhD85FZ6pBVZyOe8KPox9iXgPmHZLRNQN81F8wMCROc7X5+8JCUuNKSUIdH/QrxvapLppSzooDjzgeG6eSgBipxInVH1eWc3wjai+Jjs8NV8yd62Gu5hyzYVlow7xPXVDLtTQPuL/R3DvS9J7P2Rm5aCp1e9E/h8/DlVzqyguycNbdG2nLB5Tc0xWVBUEyGU5VH0Kg3lQmgtl81Efbs70VZqfMemu+WiP0EPcSxtULkDeeoxywK4G9RFBqv6acj3SNik+HIkxrFQeNk+tPN8P2wRvoX5ySYcfmw4RGopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qqggl0VRmi388Te4TqDKqGG0BgjdcmaeFMrbkNgwbeo=;
 b=EbaU41Tq/geA0hKNU0sd/2UI8UUizNRh+/LsEBsDctQHme/o76siGRU6riQk0MUD0+l/00n1bicQUogzVjgrgYhYoGWSuhA6rS2efOnMnP6K3uEXJCr7rJgq7Nh+pbQAq4EhfzYEtJYkxKbiL0jnGzGF4DHAQDAyjYvJXgj/pqoXiLpzvO54oCwz1lpjuwqqJqL1WGA35i2vqK1Gc0QI32mbK1jIwvGgYilX2tZhP/2HOu/gKL1GX3WMfzlzfWlo+D+F0oZAYZNlXdhUEuJV9X1i5iO9o7iIL8qNDH75OsrJrQ0Eamgcu8VwRw0HKaZXiNIvZTZJkhP8PSmZf5w7ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4126.eurprd04.prod.outlook.com
 (2603:10a6:803:47::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 02:53:57 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 02:53:57 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 11/14] target/s390x: remove kvm-stub.c
Date: Mon, 24 May 2021 10:52:53 +0800
Message-ID: <20210524025256.22252-11-acho@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524025256.22252-1-acho@suse.com>
References: <20210524025256.22252-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [114.24.18.39]
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (114.24.18.39) by
 HK2PR04CA0057.apcprd04.prod.outlook.com (2603:1096:202:14::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 02:53:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b34ced6-6ae4-4fbd-d013-08d91e5f2c9d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4126D04F1285CC813F1902C4A0269@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ensamxm/HoC7VNFZga/l3EulffK9ewoW2j885dnQof476kyFfMG+qeC1c6obl4C2Gb+lhJdbCAp3hJbcd4ZckgIZtRFDTHD86Ax5R7i/VEk1AVXRKAK+Kwp/tliT1Nfs0N6aVvYcsoS/Fi23xdNwPfA7gNeKTBrjI3Ix5Tuq9lgnBnLPFIaYwbpFefrX85hKiDNUlBhkIVh0qJXi+skGF1OJAhwe850yNn9N4SY5ERyakNb4gOGv98gZ3NRPEkCx64CVEZyCtJ/r27kjzwqqRHfRR+ox70czS2TX0FnwziE4gWkWsbtAAMMGTVw8glcLYhI/Hmwj6EaeWqPmqewa59Ud42uhJjRbEgjJPUwxLDWbwIWwsLiRIUgg1JwniI9Ti/vNGQwqRyOLwH5cfLORNemiicJWbbw0fCdOPo318jgsQG+U934Rk22X5OiaNNGA05Ppn0MefK5kWyoYRrJE9Q+a0Bq5kIYdlfDzjjxj4lB83xs/hFnMwbN1ltxbaD+EjlmbY7b1+2nyTpzQr6zpY9d9/fBvRAmWl/hOuzzHAATtEliKy5RWJ9hBIAWAGUBzoa5yleeiNKVnMFZv7yZ8boKufxh+KUaESSZW0VKC2n5pfepSQCY8fJhw2raGvZ3gSQ/D/dS0Z4M5DQZYWir8+XE127Z9oJh2VXx4ZSeBmspCg/41Qvwg9tH+AFuzSOL6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(376002)(396003)(39860400002)(36756003)(316002)(66476007)(38100700002)(8676002)(38350700002)(86362001)(52116002)(478600001)(66946007)(8936002)(1076003)(2906002)(956004)(26005)(6512007)(16526019)(6506007)(186003)(83380400001)(2616005)(4326008)(7416002)(5660300002)(6486002)(107886003)(66556008)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1+lrDHIPrOmPzoB7ZCh8Tk8i0Q462koQH6rrzhRy+Mnh9KtUpkFSQI8YYHc8?=
 =?us-ascii?Q?mN9k3FE3i/mBTQhU7Y8ud/LD84gw21CL+bMks78bCf4Fa+RQI1OF4rMkYo1x?=
 =?us-ascii?Q?j91/Zre878hV+mjOKmTYh688IaElCaWHrwvHTO4dqrkVfGr/s4Wrj/qk8kz8?=
 =?us-ascii?Q?dvmXhUCnQmE2PftA6Xcln2BdQ4Yt9T7HP/HZDqxgq4DWq1rN7vhtF7WK+VyE?=
 =?us-ascii?Q?Z0lwptTBnyBtVMlC2aLvBL5sBt3FKpQsskcHiY7BWa4nQ2zyCghC6l/XiaNf?=
 =?us-ascii?Q?A5Uz+jjLD1oQhUaB1P4TYg0+loTtUuA7uuqghMiM6D7qpMjDcE2v0ROhy/EE?=
 =?us-ascii?Q?4BHwcdm48Uagy4Ho0KIQFhNjIxYVld76ylP3O+ZJ8IMrahdwllKHUPl3l1qo?=
 =?us-ascii?Q?hoZA8T9a2ITbj8BkALElmn1zmaYkRNE3BvjEzGN/XsOsUgNhwTpbHFP/XcZE?=
 =?us-ascii?Q?eVnTzI+Azl5wVLHAejKFEBbA0122yjGViKRMas7SGZwB5CmKvMBh4+Da7GM8?=
 =?us-ascii?Q?nv/0BzAZ6wQiJtNYjfSqbG8WeYuFR4lYFwnQ0e7E4pXvWyyCbLNBFmla5AWz?=
 =?us-ascii?Q?0TMncX40WxmFSBEywxOZs7DzZI+t+3k//ET1QLqvhxin6uv42w9+4bbx/Y+q?=
 =?us-ascii?Q?RaXamXe5ysdA9Elw3Q7pVeHnRjOmEOPTpmO4eKgbJLtHUYGyp4NRALWuiTyy?=
 =?us-ascii?Q?c7BHUGwtIvCVhPl3O/EQGUUn5ooDAoJmXxk9fuXmmZQFE4PVTSd1zEvOkiRX?=
 =?us-ascii?Q?U5swnEmrMbJ78RUmunqPbDyKq2iJKy1Lx6lYs6M4sgXTLUUrp++kVvT4/qi6?=
 =?us-ascii?Q?Wa5j1FMBCC8QwsHXDA8X5MiTjF9bvTj566+3kvsiFG0AgsbrR09oxtD+RWcl?=
 =?us-ascii?Q?FyU8flVR6meBmdV9F6313p9QtiaGlFuKNtTl+q0P/gJMZGMcCNa3OGgWx7hx?=
 =?us-ascii?Q?dH/hOsPJhru8VON6rMxVcZhuVqQS3WtFfALN7//NCgUfoX3kH8zYc25CTq6i?=
 =?us-ascii?Q?zNddAosgcypBJGpBpFcOi4tyuJE43XgJaqAtfzpBMmFIhl60Rnwmo3/7pqKy?=
 =?us-ascii?Q?OcLbwGDNcWhkCTwb3uIz7lVz8aLmuQFBb2SdB3dU9JajHbnRgql8hRIKTInU?=
 =?us-ascii?Q?UgmiWWzBcswvEXaiHFSDSn6JeW4eVYMJepcql+8Iv0BeepQozKjLqqnibADn?=
 =?us-ascii?Q?y2DSEyTahWQQGRWJM8+f32/r6LHyEMLGArUeuzFYKbhOHrzc3Zp6EhrhqE2g?=
 =?us-ascii?Q?sjy1dKL+kSydPUQV+zh0JEqlwHu6xP0XLtkKSVwgPPchpDSeF5Llhzy/SRtr?=
 =?us-ascii?Q?aoLkzH6X8Hqu7m0hadcrZrVB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b34ced6-6ae4-4fbd-d013-08d91e5f2c9d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 02:53:57.0461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iy6f/yMV4hiTVwPwYJoVeiAICjjPdHm9owo6SH4PoBOGxoVpMdhJgCmbzHDQfmFS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4126
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

all function calls are protected by kvm_enabled(),
so we should not need the stubs.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 target/s390x/kvm-stub.c  | 126 ---------------------------------------
 target/s390x/meson.build |   2 +-
 2 files changed, 1 insertion(+), 127 deletions(-)
 delete mode 100644 target/s390x/kvm-stub.c

diff --git a/target/s390x/kvm-stub.c b/target/s390x/kvm-stub.c
deleted file mode 100644
index 9970b5a8c7..0000000000
--- a/target/s390x/kvm-stub.c
+++ /dev/null
@@ -1,126 +0,0 @@
-/*
- * QEMU KVM support -- s390x specific function stubs.
- *
- * Copyright (c) 2009 Ulrich Hecht
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
- * See the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "kvm_s390x.h"
-
-void kvm_s390_access_exception(S390CPU *cpu, uint16_t code, uint64_t te_co=
de)
-{
-}
-
-int kvm_s390_mem_op(S390CPU *cpu, vaddr addr, uint8_t ar, void *hostbuf,
-                    int len, bool is_write)
-{
-    return -ENOSYS;
-}
-
-void kvm_s390_program_interrupt(S390CPU *cpu, uint16_t code)
-{
-}
-
-int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state)
-{
-    return -ENOSYS;
-}
-
-void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu)
-{
-}
-
-int kvm_s390_vcpu_interrupt_post_load(S390CPU *cpu)
-{
-    return 0;
-}
-
-int kvm_s390_get_hpage_1m(void)
-{
-    return 0;
-}
-
-int kvm_s390_get_ri(void)
-{
-    return 0;
-}
-
-int kvm_s390_get_gs(void)
-{
-    return 0;
-}
-
-int kvm_s390_get_clock(uint8_t *tod_high, uint64_t *tod_low)
-{
-    return -ENOSYS;
-}
-
-int kvm_s390_get_clock_ext(uint8_t *tod_high, uint64_t *tod_low)
-{
-    return -ENOSYS;
-}
-
-int kvm_s390_set_clock(uint8_t tod_high, uint64_t tod_low)
-{
-    return -ENOSYS;
-}
-
-int kvm_s390_set_clock_ext(uint8_t tod_high, uint64_t tod_low)
-{
-    return -ENOSYS;
-}
-
-void kvm_s390_enable_css_support(S390CPU *cpu)
-{
-}
-
-int kvm_s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch,
-                                    int vq, bool assign)
-{
-    return -ENOSYS;
-}
-
-void kvm_s390_cmma_reset(void)
-{
-}
-
-void kvm_s390_reset_vcpu_initial(S390CPU *cpu)
-{
-}
-
-void kvm_s390_reset_vcpu_clear(S390CPU *cpu)
-{
-}
-
-void kvm_s390_reset_vcpu_normal(S390CPU *cpu)
-{
-}
-
-int kvm_s390_set_mem_limit(uint64_t new_limit, uint64_t *hw_limit)
-{
-    return 0;
-}
-
-void kvm_s390_set_max_pagesize(uint64_t pagesize, Error **errp)
-{
-}
-
-void kvm_s390_crypto_reset(void)
-{
-}
-
-void kvm_s390_stop_interrupt(S390CPU *cpu)
-{
-}
-
-void kvm_s390_restart_interrupt(S390CPU *cpu)
-{
-}
-
-void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
-{
-}
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index bbcaede384..6c8e03b8fb 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -8,7 +8,7 @@ s390x_ss.add(files(
   'cpu-dump.c',
 ))
=20
-s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files(=
'kvm-stub.c'))
+s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
=20
 gen_features =3D executable('gen-features', 'gen-features.c', native: true=
,
                           build_by_default: false)
--=20
2.31.1


