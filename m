Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6549B23A247
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Aug 2020 11:49:18 +0200 (CEST)
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2X5p-000807-Fm
	for lists+qemu-devel@lfdr.de; Mon, 03 Aug 2020 05:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Filip.Bozuta@syrmia.com>)
 id 1k2X3c-0003ui-RB
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 05:47:00 -0400
Received: from mail-eopbgr10121.outbound.protection.outlook.com
 ([40.107.1.121]:11844 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Filip.Bozuta@syrmia.com>)
 id 1k2X3Z-0008SR-Tj
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 05:47:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlXxoFyJ97tcPvrBHvOfiU4pnCQfuTTW4Rznm/dz4jTVbXbm4iZd4L1e1UC2Y3ckft2s7HdN5wOUzY8N+29HQS4GxGCMqpLOff7WlBJjaVolfCsrhQsurQLHpLAZo3fIhhGsUYoS3z2vXmo0y31/w3Kx8bkm5SZsNtTKWRhiz7y1ger/BJhO/mJSI2TQBbqKcCbNHX/J8lDn9NX5hj1zjUvfbySRzFtq0sRoMH3aU8SyVmXTWNkdwEL1Qrp9fdh6O+xmIUcvrrliylHKGosQrCFgi3lixnpSxxqfHPjAO/aGz8M2/bBYY9tWmqKOBE405xQxUq6IezyOB/ToX5NxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLQ6AT20vZenme7soFGwBL6EiHVWwbABlUeDnKNGgTQ=;
 b=b81xAQHdRRa9VdXW1SVZFRpT/o9q+ri5+YhZSiN0SDR3m8rQxPZHhkSslrITyxNJVpCtzU34IPwuh44uMoZVaLcPGkgVJ+QITv+av+PwFDBz/1DpU1H2JxVrFHD+DWRg9BQLsbngt1CHTKN7uHmAWqAeE4XgfE3XJT9wOGwBpkcdbxuCwhxSv0XNt20tnVgh+Wx1hfuSXwQ79S9LnzjQ3ZQptCWfNGOcr1LiDArW2rRU8+VOtd4qrQW5500EuCyi83dVsgZiApg7HvN2ZasHSanev9yGlVLMDwFUj0x367aR1WapXFKAsHkKtAxWgri09Am6l6SmOWT2DPiXorXKJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLQ6AT20vZenme7soFGwBL6EiHVWwbABlUeDnKNGgTQ=;
 b=wwcvSRrtY2scXXh0xuUg6PbEtppIhEh1sbVg9GaOP7svk9ywfTpe8f/p5Q+Qui/2l49qxNcsHYUBCYXNqQr04gaL7HTNmBuZ4I4fNwwpfWS627CfVdDKLpMQG7v0yeaVRY90ixeyfr9B3jBSTd5ajldOhA8A2xgHp8YY5HV6Cm4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=syrmia.com;
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com (2603:10a6:20b:d1::19)
 by AM6PR03MB5457.eurprd03.prod.outlook.com (2603:10a6:20b:cb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Mon, 3 Aug
 2020 09:46:47 +0000
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::98f0:b948:78a8:f618]) by AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::98f0:b948:78a8:f618%7]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 09:46:47 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] linux-user: Add support for btrfs ioctls used to
 get/set features
Date: Mon,  3 Aug 2020 11:46:25 +0200
Message-Id: <20200803094629.21898-5-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803094629.21898-1-Filip.Bozuta@syrmia.com>
References: <20200803094629.21898-1-Filip.Bozuta@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV0P278CA0051.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:29::20) To AM6PR03MB5233.eurprd03.prod.outlook.com
 (2603:10a6:20b:d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (147.91.217.238) by
 GV0P278CA0051.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:29::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.19 via Frontend Transport; Mon, 3 Aug 2020 09:46:46 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.238]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cb3bc21-5a8b-49f9-dfbd-08d837922373
X-MS-TrafficTypeDiagnostic: AM6PR03MB5457:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR03MB54571B28AC1EE946E5C80678EB4D0@AM6PR03MB5457.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 42HcRfhI08PiJdBYu3RBjlSvjOtbiBLEnCKq+dPDQHKIhKlkOJnUKu9xcjh5DpYPIX7lr2WSgYvjl++27G8hyLvDzC2eEG60/nxdFvmg+PBMK6xZOBxosHpL0K3ftJ4PvmsucykoHh8B4LN5NsX8je5jDOShru7ecEz+fQMXT+uD10Ncr1TFGHxYGgnFYzTWIK7TJx/xKj4E/YGabxvjfKiuAMnNSKdt2XJrt/B7fnvmRhXx1OBdD5IRPU4QThlWeYAgMK9t1XUMauYTQ/5KlVjgN1FMpLsjryV8gV2g6N+/FRtOPX9fLViyYPITxxitHA43NbjQ4LkoMG0H37IKRnztI2ilOKGw9p1nYQztlLmAJjcE1h8XZnrF4ozmWOfAeuTGntAgImsWh44633KXeXzJJ0sszOSRTS+jrtKuhNk8QX1icRlQsFxyiIs4zv2Ypv+xT6rXp7PpANaBf0GkRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB5233.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(376002)(39830400003)(346002)(136003)(366004)(66946007)(6486002)(6512007)(6506007)(66556008)(66476007)(1076003)(6916009)(86362001)(186003)(8676002)(2906002)(316002)(26005)(69590400007)(8936002)(16526019)(36756003)(107886003)(956004)(2616005)(52116002)(54906003)(966005)(6666004)(4326008)(5660300002)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: kZv+ceJDFFAButMYgUzVE/KFXKbGUOL5Lhs5anc4e06EVonWzU2L7mRzBZNSode3c4k+ygOYIV7QDUfrIq8bZUQZUke7UedQOFOwad+TD+y501n0fYBr2j3XAgXLW84lpGXfRTeJ/RYVWeyBb+E6eowWx4rTCCh3esFGPlp8Et8Ie4rKYFlUlJJYbYeL7oXFFIltMKJMrxka3NggDwSoeA+Nm38MBu59T1NdthBEX7Bv9jUH/EeSZK9hNVBaWbPXaHhmzjaRHLCyy1wwrIpLGFzmHjtar0SxRmrlx8XpAuiIhAcF+CmR/IZMxOKeb5owY34s8W18UqpzyTDdeZ9pBHVZvCQfGPErupQuhB5QLW+xhPM7dfOU9Ss+FDGRK1xp0PqeiKSh3VlMjN/zeqyoZdgHw1VBVGgCW7xVLAXUW0aJLwZDE2lBfYfIcWDEGh7BIWTpxI3rHBcptVAANESNbOis+/xKgcHGySghBSmVymADI3WVnpduqi+jEX/zM4c0vBeAGfkUy0StHJmiuvV6X29QAABUmG/F8o7297+iHf/AprwuVXUlwruFejt/hhtvFsXDEkh3lQd4QhnORGy+uR8DpJde+10SkE4NHBTFIOSO9X4apmA5as5KsMig3OhsM8sXqPzVu1H25UGWvKTkTA==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb3bc21-5a8b-49f9-dfbd-08d837922373
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 09:46:47.3923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCmaef+sVydbRJzJGn0dRXljuhosT+3Wa+qVIpBLmmYUEoVjHG+IzKUwyOt/2xCwotx/UbZ/Y7cGPeIFAUn+ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5457
Received-SPF: pass client-ip=40.107.1.121;
 envelope-from=Filip.Bozuta@syrmia.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 05:46:49
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-1, RCVD_IN_SBL_CSS=3.335,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 Filip Bozuta <Filip.Bozuta@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements functionality for following ioctls:

BTRFS_IOC_GET_FEATURES - Getting feature flags

    Read feature flags for a btrfs filesystem. The feature flags
    are returned inside the ioctl's third argument which represents
    a pointer to a following structure type:

    struct btrfs_ioctl_feature_flags {
	__u64 compat_flags;
	__u64 compat_ro_flags;
	__u64 incompat_flags;
    };

    All of the structure field represent bit masks that can be composed
    of values which can be found on:
    https://elixir.bootlin.com/linux/latest/source/fs/btrfs/ctree.h#L282

BTRFS_IOC_SET_FEATURES - Setting feature flags

    Set and clear feature flags for a btrfs filesystem. The feature flags
    are set using the ioctl's third argument which represents a
    'struct btrfs_ioctl_feature_flags[2]' array. The first element of the
    array represent flags which are to be cleared and the second element of
    the array represent flags which are to be set. The second element has the
    priority over the first, which means that if there are matching flags
    in the elements, they will be set in the filesystem. If the flag values
    in the third argument aren't correctly set to be composed of the available
    predefined flag values, errno ENOPERM ("Operation not permitted") is returned.

BTRFS_IOC_GET_SUPPORTED_FEATURES - Getting supported feature flags

    Read supported feature flags for a btrfs filesystem. The supported
    feature flags are read using the ioctl's third argument which represents
    a 'struct btrfs_ioctl_feature_flags[3]' array. The first element of this
    array represents all of the supported flags in the btrfs filesystem.
    The second element represents flags that can be safely set and third element
    represent flags that can be safely clearead.

Implementation notes:

    All of the implemented ioctls use 'struct btrfs_ioctl_feature_flags' as
    third argument. That is the reason why a corresponding defintion was added
    in file 'linux-user/syscall_types.h'.

Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/ioctls.h        | 12 ++++++++++++
 linux-user/syscall_defs.h  |  3 +++
 linux-user/syscall_types.h |  5 +++++
 3 files changed, 20 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index c20bd97736..c6303a0406 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -216,6 +216,18 @@
      IOCTL(BTRFS_IOC_GET_DEV_STATS, IOC_RW,
            MK_PTR(MK_STRUCT(STRUCT_btrfs_ioctl_get_dev_stats)))
 #endif
+#ifdef BTRFS_IOC_GET_FEATURES
+     IOCTL(BTRFS_IOC_GET_FEATURES, IOC_R,
+           MK_PTR(MK_STRUCT(STRUCT_btrfs_ioctl_feature_flags)))
+#endif
+#ifdef BTRFS_IOC_SET_FEATURES
+     IOCTL(BTRFS_IOC_SET_FEATURES, IOC_W,
+           MK_PTR(MK_ARRAY(MK_STRUCT(STRUCT_btrfs_ioctl_feature_flags), 2)))
+#endif
+#ifdef BTRFS_IOC_GET_SUPPORTED_FEATURES
+     IOCTL(BTRFS_IOC_GET_SUPPORTED_FEATURES, IOC_R,
+           MK_PTR(MK_ARRAY(MK_STRUCT(STRUCT_btrfs_ioctl_feature_flags), 3)))
+#endif
 #ifdef BTRFS_IOC_GET_SUBVOL_INFO
      IOCTL(BTRFS_IOC_GET_SUBVOL_INFO, IOC_R,
            MK_PTR(MK_STRUCT(STRUCT_btrfs_ioctl_get_subvol_info_args)))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 23f966d552..13a444356b 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -981,6 +981,9 @@ struct target_rtc_pll_info {
                                                            abi_ullong)
 #define TARGET_BTRFS_IOC_DEV_INFO               TARGET_IOWRU(BTRFS_IOCTL_MAGIC, 30)
 #define TARGET_BTRFS_IOC_GET_DEV_STATS          TARGET_IOWRU(BTRFS_IOCTL_MAGIC, 52)
+#define TARGET_BTRFS_IOC_GET_FEATURES           TARGET_IORU(BTRFS_IOCTL_MAGIC, 57)
+#define TARGET_BTRFS_IOC_SET_FEATURES           TARGET_IOWU(BTRFS_IOCTL_MAGIC, 57)
+#define TARGET_BTRFS_IOC_GET_SUPPORTED_FEATURES TARGET_IORU(BTRFS_IOCTL_MAGIC, 57)
 #define TARGET_BTRFS_IOC_GET_SUBVOL_INFO        TARGET_IORU(BTRFS_IOCTL_MAGIC, 60)
 
 /* usb ioctls */
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index b5718231e5..e26ab01e8f 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -365,6 +365,11 @@ STRUCT(btrfs_ioctl_get_dev_stats,
        MK_ARRAY(TYPE_ULONGLONG,
                 128 - 2 - BTRFS_DEV_STAT_VALUES_MAX)) /* unused */
 
+STRUCT(btrfs_ioctl_feature_flags,
+       TYPE_ULONGLONG, /* compat_flags */
+       TYPE_ULONGLONG, /* compat_ro_flags */
+       TYPE_ULONGLONG) /* incompat_flags */
+
 STRUCT(rtc_time,
        TYPE_INT, /* tm_sec */
        TYPE_INT, /* tm_min */
-- 
2.25.1


