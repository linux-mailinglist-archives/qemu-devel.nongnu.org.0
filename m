Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA60255BD6D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 04:23:44 +0200 (CEST)
Received: from localhost ([::1]:55920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o60tD-0003uV-Ie
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 22:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o60qz-0002Ug-Og
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 22:21:25 -0400
Received: from mail-os0jpn01on2126.outbound.protection.outlook.com
 ([40.107.113.126]:53927 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o60qx-0003mD-D9
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 22:21:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMBVdFMCIsSFWZBWLudKmSyb704egy0d4yzcEooMwuKhc4sXwPaKpkcaFFb3qr5oGNjq4s32NjL4FD1mpHgUrZzx4aa0rJjFvowfpXH4jMIb3cbqqDcD0PNs3mrHTAlDIH3+xJKuccmVkWmbdtifbnIGLgYr5RIlHPBV23G0iy9X9e8xhx76TU1JYuTbPTkpSFeqY6OzmUoWgW2Nh7apb5/OmvqFoO9SbH4a5ANnU2P4vYxHNPRG3OpFpE59ublGcBYiGqc7hyEoZYogCHfCkeauRoPgCJB6Yp2nATsLiKUBZ0FhEdpziaDOeX6gpJZsgpA+BU+7o1Zu0s9xnFid/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdlPEt1ns/k0jLmivbbgLTsXRJJdoBwDRBheBV6YjLo=;
 b=jFZre0VW18QeCxWFDue4Kcf9rZ08w0x5wBvkq6I9nN1xBDcyUPvFaTWkc+i+jPAon5vxyHURh1ODGkIB1OJ6D2cb0GDQN5aOGH5V6jyW85PuTSwgIMhwupCVv1R5dUjpYBFny/+0dUR7A8fgv63WCTAH3kxamjrvkVW9vtcame4MGFwPxzDQOzEl7JV4wwtUblB1BrPJB2Fr9k6t0NPtxxpZoL1RfJrr3KkNiUaUtmJxsN5ZF4SXF5t7lYUZU95qhBL91rrEvpw88+AOFmxM+hdIt+sFppR0zBqavxawTx6dVCKHhUzGj4oNcGvz3pToYMYHDxxuGEWaS9wwjlJ+2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdlPEt1ns/k0jLmivbbgLTsXRJJdoBwDRBheBV6YjLo=;
 b=OqPMHIa50E/i+SVgCNEjl5aA3gdZF7bNU0JxHn4OCl6LP1GMKcohNFV4Lc/lxudIn8COTs1F65C1uMoLyT0M1CB3XAln9Aul29xV6T16GSGQGkZsvhfiviEzdXN7zSjFl9AFhxMO4yb76guuENIIu6XnijNvvu+8A2WMf+dv6CY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0317.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8025::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.16; Tue, 28 Jun 2022 02:21:11 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 02:21:10 +0000
Date: Tue, 28 Jun 2022 10:21:03 +0800
From: Hongren Zheng <i@zenithal.me>
To: MkfsSion <mkfssion@mkfssion.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Canokeys.org" <contact@canokeys.org>
Subject: Re: [PATCH v4] docs/system/devices/canokey: Document limitations on
 usb-ehci
Message-ID: <Yrplj2sAB+i9QCv4@Sun>
References: <20220625142138.19363-1-mkfssion@mkfssion.com>
 <20220625142651.19546-1-mkfssion@mkfssion.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625142651.19546-1-mkfssion@mkfssion.com>
X-Operating-System: Linux Sun 5.15.26
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BY5PR17CA0055.namprd17.prod.outlook.com
 (2603:10b6:a03:167::32) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fff9f78f-0e3b-457c-17e8-08da58acddae
X-MS-TrafficTypeDiagnostic: TYBP286MB0317:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ll0dQoin+q+KKmB/YTsPbmSA1ChMsjQgMDqnkF/OSKPsbgHQ7RIL53o8HKZ/OeZDc5aqgnWgEQpD6h9P6YNaflp5zqoaFPNCA71yIZWRT/BTcfus81y0DJ/4UYlwNdGUEdf5UZGJgj7i0cy5vmJPDrnujVMIiXrTQ8xdoo0+Gq6+EEWwxjsjaN8t4H9xLwM7Djg/9Uz5l90Pb8cdI4jpoN26MzSr0N5FN6KJ4k86iA6dUV1ZzAyyzTZIUjIsnefHl1jjPLM///wPXvOQAjf9sgdys9ysrkLgzBfRY/NiWCKglXUs3jk8Z04u1J/H3xQaHtmzwCBY4sDAtc1ivVyw+ikoc9IbLUflN+JjtZjQsa+5488L5u1XX2Okd2mCXsQFYPYbhJQXmjjGsLQw1vDaPzOhm0BbH2rPfZ4kD50Ha9q3BBlmbb/uFIbmf3NQzz8jbMdA3pZs8YroQXDNjAvMydd6YfrKX/0f5SjueGtdoP137NAw+Ufc8SWOVx0TRdw8UTLzRSjx2gLrKi33ReTOo4z8FNvCF/RDTUJxqxIkrZzFXnfWTIoZOGITqLS3CULVj87y+C2vl4a8Ap1y289jUzV5ir4kSLtDofR4YH0oLdqjm95jYQ/qtWCARVALS+9eni5vg4RgGfsmYHUATr+Z2WSIbVdKWZAXRc4VMR3H/Ftg/sAOH5rdCdr1ufwdm4wmqUXNU2xIwk3S4lv2zcdQQrKPN2JgDoEyMH1VMa8QoVxgDhldt1+eCnjcGVpJR79XI0053H3pTFA33wd0kIVvWT9qMhNVw2T52CQK7hs1yk3D/xB333dlANvIxUCv/ofR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(346002)(396003)(39830400003)(376002)(366004)(66556008)(41320700001)(66476007)(8676002)(66946007)(6512007)(478600001)(6486002)(5660300002)(33716001)(4326008)(86362001)(9686003)(6506007)(8936002)(2906002)(41300700001)(786003)(6666004)(186003)(83380400001)(38100700002)(110136005)(316002)(52116002)(49092004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?571uHhYo1j51OJIBmikNyNEyRkihLwaqz2ow6O0D79bxrJoosZ/ktSAGVCzK?=
 =?us-ascii?Q?u093I/BxKjWaXiWTKmuA4DMLXKUeT+K5AaSmY3G90mgI1fQ1FhX5IErVfG+A?=
 =?us-ascii?Q?GyYg0/YjfTyAHPmUojiLS9FjBwBnWoqTm8Uo9uIUwtvg/rk3B8Wt8MiRI3/6?=
 =?us-ascii?Q?IXn5WliCkbi7pE+VszH9LPn45EagJ849z9mmlTeFCXASmBahnqAoCjVBMqIW?=
 =?us-ascii?Q?8dHq5r5K609771nj01kZg3buSFO9y9LSbZmKKL8m4RdxCCYBLT7cB1eJP5O4?=
 =?us-ascii?Q?sIvXo4rKBVJnWZl1c05Ta+tHi39V47mRqT9p8Ec4yFMNcZe4D1NfsaG7+8fT?=
 =?us-ascii?Q?WT5pXk4sFi57nInBVaDAdfWxjQeIlnlXFU0XGOwO1QDHf5/sR9R/x5iG1Vb9?=
 =?us-ascii?Q?5GdOS2EZmBKcRoP4iIksJuJYgjblOVjl8/vwbkdHiuLCjIAuHlUeivjPmX4n?=
 =?us-ascii?Q?glLBs8SGSocQIpIOQ8yn/Rx+2YBClAwUYVKTEXfRCd5J7lEigAuUk7wGoslv?=
 =?us-ascii?Q?Z/0tP6vMQLyOySZ9JWyYx/LFc21F8ql1WAnvCur3fE6RlH3VWV5VVejydzGE?=
 =?us-ascii?Q?aXOnQnoB2PJRT/pRbW/iD12ws3QifqWODn8GmMPDc504egszgjWDkgXPJ3G2?=
 =?us-ascii?Q?EtQuFefPIUzAxLwO7Ztv2VeK5TSBjB9F5yKnvkmR+/DsITSISFg8BBjIlAE0?=
 =?us-ascii?Q?Ij6omQI/SyOQldCmcp+Ypmwru4JMu+3pSKmSnyDJMgH2aWrjI0lizhKBfiCn?=
 =?us-ascii?Q?hj5ul1d1ecmQaiQq7+9ZEQeou+pjp/1acRp6d4fT4QgAHnJor27eL/hiaYc0?=
 =?us-ascii?Q?aTFt21HPZwS7vqqk6nYrJP/ctjnprrKE22mQM7VvhcB4pNbVXp6wMtgMwU9h?=
 =?us-ascii?Q?WrgtZlAthHF1BrT91W5Lk6gGfcK80pHvQGoVBCuYadQlusi6w9jOsVsjHdZe?=
 =?us-ascii?Q?teEYDhy6OEkgqgSwKZH2NA6SbjO2QzfTllYPUWLDE/nJxYbMNi6oMLBqOwOu?=
 =?us-ascii?Q?R8JBkIV9UYtwYI/s9wm/Ia/4VAmvHgSFYpcvTHSNO8Y6fvNNx0I2pT5i6t5G?=
 =?us-ascii?Q?PLaptVe+DFVc6cTs4ejtJkUvoaMHIdgwEqJmGu8YpZBYDkMmQ4dki86r5k0c?=
 =?us-ascii?Q?V8gGgya6ie1AQggwU6jehNDCUd63rKlyePHsFnvtMB0AfrS+bZP/YfQy/+hi?=
 =?us-ascii?Q?Nly3w3dCUYuMlSlLFu4GUzWMjuVeNMw3v5T6fgxrjHGv7jO+TbG5V5O4RrUJ?=
 =?us-ascii?Q?5iMgzwh24u6AiBV5p0XKm8W0fSnf0d0xb+BKMxrVOJvVAyN1jEgdbxKk+ts1?=
 =?us-ascii?Q?JS0+l3Df/479y9d+fQsa9SLcHs0kkyx6VwQX6Hts7ewTCQZbx1pBndJEZ6bl?=
 =?us-ascii?Q?ulty/eaLhDQlBm/Z+Yq3w70MT8NiG+CXVI9gH6YMkaKC6e8Zd1nmKFs4BfL9?=
 =?us-ascii?Q?GYh0T+a7nYozE2gny+vFMmzBq9yi8DmKsVtHJDbx427vc639MfjLQa51Mcdk?=
 =?us-ascii?Q?RFS/gLuKXIAgLsv5qtjH0EI7l936Mrp6ndRKXIa+ODq0g1vPjvABkBXMksOL?=
 =?us-ascii?Q?O1KvVK+Mj8esEgdW8wDfFqsleu9AKHJ5+G2ZM+xc?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: fff9f78f-0e3b-457c-17e8-08da58acddae
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 02:21:10.9217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqSlVDH4tMJLpt9G3ej75tfEF6gUNedjiyU8/GI4lpA5DuuJItcT8nwx0k6qlTHN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0317
Received-SPF: pass client-ip=40.107.113.126; envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

On Sat, Jun 25, 2022 at 10:26:51PM +0800, MkfsSion wrote:
> Suggested-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> Signed-off-by: YuanYang Meng <mkfssion@mkfssion.com>
> ---
>   v4:
>     Adopt Zenithal's suggestion of repharsing the limitation 
> 
>  docs/system/devices/canokey.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/docs/system/devices/canokey.rst b/docs/system/devices/canokey.rst
> index 169f99b8eb..db33b59e9a 100644
> --- a/docs/system/devices/canokey.rst
> +++ b/docs/system/devices/canokey.rst
> @@ -156,6 +156,11 @@ to it, for example
>  
>     |qemu_system| -device piix3-usb-uhci,id=uhci -device canokey,bus=uhci.0
>  
> +The other limitation is that this device is not compatible with ``usb-ehci``
> +since the device only provides the full-speed mode. However, when a
> +full-speed device attach to a high-speed port, ``usb-ehci`` would complain
> +about speed mismatch.
> +
>  References
>  ==========
>  
> -- 
> 2.36.1
>

Reviewed-by: Hongren (Zenithal) Zheng <i@zenithal.me>

kraxel could you please also queue this up for PULL, thanks!

