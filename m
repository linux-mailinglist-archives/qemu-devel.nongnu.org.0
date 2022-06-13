Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5762548547
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 14:49:18 +0200 (CEST)
Received: from localhost ([::1]:54586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0jVN-0006A8-O6
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 08:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0izF-0003zF-8m
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:16:05 -0400
Received: from mail-tycjpn01on20723.outbound.protection.outlook.com
 ([2a01:111:f403:7010::723]:46096
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0izC-0008LQ-NL
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:16:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUj+nJtXUAZRnqLZiYKQmDcOH1iBFa5asNYslFzH5bG2ZEd+4ZXllIsprz6ZXd9AZ927Qjdt46SdHHpMgrW3tx+eRpEpVqmBqq8Yo6DoZi9AeiVdvD+AlJUmtyp73ZJ2+lMOkqAjy8Ceq5M9Q3ukvoLFjiZF0TPZn8m4k7enazq1kismI7Vn+yrJ/R/uc9ceXTMk5IDTsSYmmgLMxdePkMk+fyv6ofHFHQv5sWp2jKAG6KFzuwbmUDmZ/IPsCINlW7c+st9QpgsVDrxCYoxv6LOAGb39S7WojhA2n1AvJEfOZe2g6rdgkpOESt16fLvCbx+WT3tHuHNqPPyq2B/ilA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28fPQPq5fYzVswU/w4rX/n8olAyXvdyvQZ01xyy0j+U=;
 b=DAPTMnn16ax7D88NQLYvW8s1Eag3Zj2Qur/Q6jlOcmuAak1H1v9nb+42Di5GSizButRlkBbrCt47QXXiCt4rit/uy8w1Hhu0CD6an2Tf9Hdw1Da0AJRk0hlIN4KxZ9ZTgWztT0rErf93liy6A9c3AbTacgt8POtmffNcicFky6cGpsxXgoArZ5D9t+sP7m416kW4WDYAxXc/xZUULxaPHRgm+56EHdy7GFp1gyR2jDT1ebTsz/Z53EO06EHWwaKRGFSGu81YWhlnJWDW5r4Z3X2zWH4+CsiEuU1GpdTBu+o9yFPuySsAIO07YMpyZn5RSwTaRmEG3N2vrcCV/i0JzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28fPQPq5fYzVswU/w4rX/n8olAyXvdyvQZ01xyy0j+U=;
 b=S3991ql30Vl7E8lD1zwRm3X+iI4CqAFW5XC4sIedlFWMEYCXNZfr0YmBeU561eB8UCsksOEKVzKyVdM30LuQfgLsLPm7cJkUJlSJpGVSJmfD7GpHFQZFjnh/XqcdfFvbtBTd7/dxB12RlbyQ+FRso1KjVhw0HNEIxKwV3UFP564=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS3P286MB1494.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:17b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.13; Mon, 13 Jun 2022 12:15:58 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 12:15:58 +0000
Date: Mon, 13 Jun 2022 20:15:52 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org,
 MkfsSion <myychina28759@gmail.com>
Subject: [PATCH v2 3/3] docs/system/devices/usb/canokey: remove limitations
 on qemu-xhci
Message-ID: <YqcqeIpY4h7ZQPWH@Sun>
References: <YqcptnhfCtUn2+T6@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqcptnhfCtUn2+T6@Sun>
X-Operating-System: Linux Sun 5.15.26
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BY5PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::19) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3742138-7b61-4a48-c820-08da4d36795c
X-MS-TrafficTypeDiagnostic: OS3P286MB1494:EE_
X-Microsoft-Antispam-PRVS: <OS3P286MB1494587DC1BCA8823422D877BCAB9@OS3P286MB1494.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d1Ug5ulSdKQIGhIkTeB2Sez1MYyUpze3dbB0X9Dg6V67CjR0vdzjLmptUFFdrS3c+DLHAjgVgbEntCAVZhj31CxXA1KXkQOavVvH1KO+MDZFbHcKQOwe0U5ZIFe0wPUl69PHLT+I4TyGcwUsikdrOUO6dWQxfdSHkNB5fcdSWkt+o4z2l5fzWnAQcRZgWS/jIjIxq48A/PcQEu8jmK7p3AUZTD/7qlxb73WKcTTbPyNOzjHs7qC92CKgfKcMbW8IRU6w6rBnSVixZgQOpbxe5VkdBic4bqmPysFz+FlwqBY95qpTZJHvI0dYRpMagMkbvVOAM6qaUvwIZbWol7m0g0aRmxvfSwM3yMbMgi5nXOOWAoFS8K3JKgfcEeaSDwTto861ptWZZwT70Wg9vcu4sVAv0oNkASaxYSAhYKdxxRpLlULzvCPr33o8uPftOugphK9+cMdz/6QDk+70Ol2cGE/4nPWNsaa4gV9/vX2OiN0YMM8ALbqna/cGpabyRc5zLJQkDQFvXKhRFODayHVWk7R0AimwOHtEzihptQGLIgwJjkQJezc1/HWceUBgeP1oTemFjyIKwPrC27E54pjVL5Di5AfJpP7W6GOiMFHczK9SqQZ5B+Jo+pHr+/P3qFoF7dWiUzk9jiWi2R6frlf7P15PwXNsA2g1EeW1y2Tp+hmnjLp9UTansxcnlc84yQAg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(136003)(366004)(396003)(39840400004)(38100700002)(6916009)(316002)(786003)(33716001)(52116002)(41320700001)(6506007)(4326008)(41300700001)(86362001)(5660300002)(66556008)(66476007)(66946007)(2906002)(6512007)(8936002)(508600001)(9686003)(6486002)(6666004)(4744005)(186003)(83380400001)(8676002)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wFlcBqcCWR02RJSwfjok9xA/GDrMYh/OSYQ6AOFnm3MFQvDGso+9+6mf9L8s?=
 =?us-ascii?Q?rgKF7WFXqKhopYT3Y8hEKC/5yzMNoxq2NjXtY4LqgEE5trHpAQBGC4QzbuCO?=
 =?us-ascii?Q?meLeZqTahNpHSAvZmLq80OClvQvnsEsDXDG8n6z90gbRczeD4QE9hZnXCVLG?=
 =?us-ascii?Q?jyqF/+FJB6V+2StyvmwR1cIHHCxOX2WUuOtKZWfZvBy4QwRnWmCL86AyeDD5?=
 =?us-ascii?Q?GYn/5aqyk25+7IRsWvTC/kVuSyTWLV6pJOFqEGl3I34igpHZ34QGQvzR+1ci?=
 =?us-ascii?Q?6UwlruCoIH0bm/YqvaEr0OgmZjRFBdX0QvWmJtpDs8KFquqzvN05+FXZnAMe?=
 =?us-ascii?Q?BgqI6UcKnbQEUAehs3oe9f3wsehy3w6ZwhRrjHQ537ol28BMIER1Fzai74p4?=
 =?us-ascii?Q?EJewoXgigLEN95Vu1DV65rJthWWggMDSTnflEcNZb0jGYqeInM4e8KLZEXGA?=
 =?us-ascii?Q?A7oxshLuSKuvImsi/AfQarnSwdccJ0mIdFmkgvHqGfaonPRfAiACVREnReuj?=
 =?us-ascii?Q?/HBJpXHNbE/ptY8Z5NTN4zIhMkqPTHQT2KIwBqCReGTcnsRnNZsq5mw9WuRB?=
 =?us-ascii?Q?cDrRxj9GeYuJJiaBBPqiTBGHvhsizIe9olOL5umx3MJxK6qLwykesQ5q6swD?=
 =?us-ascii?Q?13cAyhSMPzF4WikIWTehabfPXSSxajDph4reI1U9dE4mgChPGHZ83MBk0tqE?=
 =?us-ascii?Q?rGrpihU8gqZXqOI+yju737dgI3OwFvz8Kg9/R8YKMq2IEVxlOfQJATV7exrq?=
 =?us-ascii?Q?Yr6kGkhvln2l0IDT1lzlNWLvjZ+KSTfSRiXsJd3igD2xqv9ijT+Gy5YYAwce?=
 =?us-ascii?Q?IGcc42AkUWt4wnk/9BGysfZatHIjejKb2i+tUoSIf9arg0yhHlSqU1lPp58h?=
 =?us-ascii?Q?3jITv36vNxa00Bl18JLwTiUZIT2Po4PTw80QrkJEyV8D82k774cXZmLvJAFW?=
 =?us-ascii?Q?ChdI3bWg3tLxshLxw5ZT949yPzc+x0uYCGW5ovXoCSnj3OBFm75zh4esZUXU?=
 =?us-ascii?Q?hbc+Ajs+cxawF0U393UegOqhCV3HxL4VSGyRZIvuWabelv+WxQezP0X8kp0o?=
 =?us-ascii?Q?4BaiSMzLaGvvVHEVZ2R/E6UmoPsFhuB0eyy1o/ULWfZwTNivMjnr1oVCzWTn?=
 =?us-ascii?Q?wO5LC6LdD9DiS6a31q7EGSbJ9bccDbvv+XkEUdh7zwWYWCp5RKTXdzv+t5bH?=
 =?us-ascii?Q?i4LGZnPKRwE3xlDY/cDQQrSkUZZuYHiSF3tZREXSEcrcOIn2bzgr7C848JMV?=
 =?us-ascii?Q?fxDKowMxte0yjJdc4GhFDixT7juWPhxLag5xQHHRAv65Il7QZRQ2VWAu0QL4?=
 =?us-ascii?Q?CwgEQMHxl7N8LCW1UxyWUwBa1ktg9HFxG4SPQSR+JWs8CV6EvrUDG6YY+bOt?=
 =?us-ascii?Q?wRV4AMwPsxBLscE6yCqanlCoDPAeaqvOGDdBOdC3nVDi+GtvTZsr0hhO+VTo?=
 =?us-ascii?Q?hAS6bNsLtk4S0XRGoObf8z/S88f25FkAABBjjdXjS/5+8/+T8vaBSjrcRK5P?=
 =?us-ascii?Q?ZAEn46Cu2SJA51fVksNPCvkYzcaPpt57d6/qo1e6a8I/0BnHgorb1qaYGn2A?=
 =?us-ascii?Q?SMtjWPU0lq6rSoJkbtFwDHsAWcb63AoWKFK5H1S1STmK3XNvbjwvFjxqfMtm?=
 =?us-ascii?Q?avy9XVJCo5bhxPJBSjOINNMYOlzclaViNJXq8moEFcjihArTLouvGZJpq8KG?=
 =?us-ascii?Q?9wOtycY+taFZeiFZzkJCnv7BNgszZupkfZz52gB0ut11Rbkt1hcD7sQKDsYf?=
 =?us-ascii?Q?WDBm7AzItQ=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: b3742138-7b61-4a48-c820-08da4d36795c
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 12:15:58.6667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73bouKejfifEfjzweMskxbTYoalOlNFDXh3znrs4DrWrPCeACrmTqt8ldmHklWat
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1494
Received-SPF: pass client-ip=2a01:111:f403:7010::723;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 docs/system/devices/canokey.rst | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/docs/system/devices/canokey.rst b/docs/system/devices/canokey.rst
index 169f99b8eb..c2c58ae3e7 100644
--- a/docs/system/devices/canokey.rst
+++ b/docs/system/devices/canokey.rst
@@ -146,16 +146,6 @@ multiple CanoKey QEMU running, namely you can not
 Also, there is no lock on canokey-file, thus two CanoKey QEMU instance
 can not read one canokey-file at the same time.
 
-Another limitation is that this device is not compatible with ``qemu-xhci``,
-in that this device would hang when there are FIDO2 packets (traffic on
-interrupt endpoints). If you do not use FIDO2 then it works as intended,
-but for full functionality you should use old uhci/ehci bus and attach canokey
-to it, for example
-
-.. parsed-literal::
-
-   |qemu_system| -device piix3-usb-uhci,id=uhci -device canokey,bus=uhci.0
-
 References
 ==========
 
-- 
2.35.1


