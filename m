Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0935EAA1B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:17:45 +0200 (CEST)
Received: from localhost ([::1]:41988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocprb-0000NQ-UZ
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2614d53bb=anthony.perard@citrix.com>)
 id 1ocpmi-0004Qr-4b
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:12:40 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:58356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2614d53bb=anthony.perard@citrix.com>)
 id 1ocpmf-00031E-Hv
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1664205157;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4+KUqU+9CAtbfjChi+D4mEsIJGFoW6NPw08ltA9spcI=;
 b=VJmJOGiGeTEydo0Zt8rFktqN3qYHLffHfJoGtD1pjywlRpzi8HWNDpSf
 //H8obWALBF+mRWKnLx9sHXrNSfwg2UNxanM/hCi2SYkF/2Xw8j4lRhu7
 Pm3gN/AdNVNcXsofphgwbBokO1gZkxzSYx9PSY5T9cBU5Yq0PGLV6NWHs k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81369131
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AAu96BKD9UGdILhVWkefolMmz9B7EJm4KOza0Y?=
 =?us-ascii?q?r1iHsd0qlYWITP7ivRmursOg1RaVHW/uuFi29+PlETaafmaaFYuqqsnc2D1I?=
 =?us-ascii?q?1PZok8YW9R2PU7FMtdq1hCG7yAiTRsnYKPO4nSWulj24AwU7jP47Wn+xJD6F?=
 =?us-ascii?q?ju4E6D3tEzYW/z2TnUEZOJ5zJ4ibYkTprSPgRFEfeMpqtmYS2Q6KHB/v6ztx?=
 =?us-ascii?q?Oti8+X+BxXqGZI0ZcPbG9XgpkaEj4wdLoYgNe1tIAwoHLyR7Mv3xQUW0KQwb?=
 =?us-ascii?q?Ijk/Qe63VwJi9rZyRy5xpNnHTOooCAgiuPt4gWNlC078xbfnzhCveTlLsuIX?=
 =?us-ascii?q?kJwiKdTSH3e/2LuYWfAWZ4pKXqLShx3TynLIsM4ifMHxqHlVgoJkSZp7e9d6?=
 =?us-ascii?q?qLUiWwzlv/dz2tcDoFSmxEqFpdfQcb982PEEIEQGRicMOym5j312duukAAw5?=
 =?us-ascii?q?ayVHbT8Ye8XrjWAsfGKSNlkR5Xn8eRosrmtSVcdOygM21CU1/3jXLnM+xJSN?=
 =?us-ascii?q?4mr7Z4c1sxdn4PWKRT+VX6waLg7173KnFHlU1Y/mm0l+piGdBxX+neBf3j5e?=
 =?us-ascii?q?SAHDHhtjMUyPX2hgjmT0Ki3UN0bM9NTzDBgBKhfZBVCEdB3pRcvJ7IDffQD6?=
 =?us-ascii?q?JghGs6fRi3iCFdBeZvY3XkdvgSU34J/2HybWDYVXrtWZUP1tOY2NZKVnW3dZ?=
 =?us-ascii?q?dOfscLMlQeYyAHBTMnLPrG4QJYSS5gBitgC11J6Ir3+9YEMcm5wdZWhGmMbV?=
 =?us-ascii?q?Xc8ygpRYDUV3QGXb7tS1IpGNBopaJS6aT+ukSO4BF2M7ePWwtw5ypF2XuyMy?=
 =?us-ascii?q?7J9LIuntXbPw2kESCiux/FTPTu6IjPQ9wwQ27bkHFhzoIptH4TtMxlC4WzmO?=
 =?us-ascii?q?Ox8hqykwA38x1keTMgg/y/Teyzotdwlbtvi98XS6t56IfkNLhTd/gNOpiwK7?=
 =?us-ascii?q?5BgOQ0ZCiJP0uvEckRNKv7S/e1EwcsH35Wh8NMZ1j3z5k4zJAq6JAFnJXqLr?=
 =?us-ascii?q?DUMtjX82ON5dbqBLh7csr29ZJKOpKK3zsXrFjcEIcW384AgppdZUeFFlLWHO?=
 =?us-ascii?q?upebl9QIPCwNIpL9c7ILC4LFbuRU3bEToMpNTf9gQeHuehZqbO10vrM4CJ6f?=
 =?us-ascii?q?pCM9G2rpixtBinOGuyXjV1570dGSnvOwapS6gX6kq034lOxoPiBYDmL94Zk7?=
 =?us-ascii?q?bziQtXRkYjJMTmTTsujadxcPJ0g/cblVL1XDffHq15sddW2p6KppDkLQzsUp?=
 =?us-ascii?q?vhfnlniGZ/0GQZfdjC5ZPXHAJpJtb8U8Ywe+F97NaHVFb9lgtlp1FKBNCWQg?=
 =?us-ascii?q?BXVDVJUspt6T24txzzZHl2D9VWaBwrVVLtbBEr4oOsBsiU2XUqpwMR1g7t34?=
 =?us-ascii?q?PjhCuit8fv/MKxzroETSbXAYR1C13fq/F0kdKNDiP5cVeIdQv9l5hm6iu1JU?=
 =?us-ascii?q?HKxwzojXygstS+j8oDf2CenntV5hBS0x24/KMbAH6jcwZJfszr8okDkoktX4?=
 =?us-ascii?q?/7zbUbbTrAwbHA6eFx+/KSGayxqShn/GdXMrJ3dqAsVvaaoFGpgsAOCaFLSi?=
 =?us-ascii?q?vsO/km0x/LNMIrXXrOrAg8EqCZa8aQpLaWhf6IBOQOy2cYGUeyedNQpQGi80?=
 =?us-ascii?q?cqwxsBgrbmVIu3d+P5VzyNEfb2x9XhYtA3ZL/eGDQr5EEkpYlNO5ERBBua+l?=
 =?us-ascii?q?QcuzNNsoTRhHahNtQ6qMfzmj8Oz4WKvnGzB2eHXqRtu9YUIPTQ3o64Xt2oTc?=
 =?us-ascii?q?K4yiN+vKcH75PpHjdizz6q9pNC+4h6QB+xMhHc/OPUq7Tu23DYgm9YSa2fH5?=
 =?us-ascii?q?5OYav7MdP54aSG39CC1qJhlZwlD/X76g8PGfZhJmllM2qIUBGiycuIenXApJ?=
 =?us-ascii?q?vpXr5ZwCWRuqZ/RJ9/fNPNkambfvqmLPEuIXc6FRC/PRI14YLrrjik0mFefC?=
 =?us-ascii?q?HAXIqRnFo+Inei63fXX/Osh5Ww3loFQwRWJ0o/NVh5p7b9usnar5cxCg/sgI?=
 =?us-ascii?q?yfmyzR9GCp0F8G69lvAvQuY47PskD9tpGrrC4O6miC0a2cvvLOTKk/pzalYu?=
 =?us-ascii?q?QuzoR3BWEnqGLHpetvAoPqSGr82h1irojVGrzs3KUMSWv96gy10JKiRpPceN?=
 =?us-ascii?q?u1ybIZXeQ3hjUhCUbHLZUe2SPslXTZz9BkP9gm8uKQopFmTZqMs0tCmW0DxG?=
 =?us-ascii?q?00OIoiIJfkI+HjPPk/LhvaJPc6Hxin+ohSTbI1TctGoNpKJXD+KSY5fBXjlW?=
 =?us-ascii?q?CLHp18QzdRZ2qQxw6Lb5pcfjGj5f8M5t2uVA7756FU3H6N9it4oZw7zKpBmo?=
 =?us-ascii?q?zKtWGK+q3aGlCmE1adf9ZltzKKl5q4EQfPZCk+cPaMGHqHMH9VVRqRPRVE4K?=
 =?us-ascii?q?O2NhvgRQAcMyh6rWfwXXiL91ITEskIcdvwtrBUp+5GVaEEQZXNpHRblpRhFh?=
 =?us-ascii?q?uTR8tocMsS8PZw282Gg2x8TDT0HP93nXX4AcGqVw3c7LKg+h+9gJRQZa2Fq8?=
 =?us-ascii?q?LsTsygH2WcMUnYxXxCRN9Ntkiz1fE1SWCLgT9M9E6L+ZBrD0JBd1K5FCTZMv?=
 =?us-ascii?q?J7c+flxn+5HuohpsIOgbFTSw68HA4BAOVDNdkVS/Nem4yKQ4Gm7eKooYGUsf?=
 =?us-ascii?q?dNPRTIEEK6U+k8FO2rt3iS0Zeaxr4FnSVSWVaJGq9Q511krytA4CuOt5v2Cc?=
 =?us-ascii?q?6PPy2fTxPNQhbanlNMvCOGiO4QJ44YYvsns5gpyihm9fA6unc5D4OsIFW/kM?=
 =?us-ascii?q?ocWiOzhA1bKe4mng7zBn2xn+EJn?=
X-IronPort-AV: E=Sophos;i="5.93,346,1654574400"; d="scan'208";a="81369131"
Date: Mon, 26 Sep 2022 16:12:28 +0100
To: "Ji, Ruili" <Ruili.Ji@amd.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Liu, Aaron"
 <Aaron.Liu@amd.com>
Subject: Re: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device
Message-ID: <YzHBXHFkefLkQJMe@perard.uk.xensource.com>
References: <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
Received-SPF: pass client-ip=216.71.145.153;
 envelope-from=prvs=2614d53bb=anthony.perard@citrix.com;
 helo=esa2.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

On Tue, Sep 06, 2022 at 07:40:25AM +0000, Ji, Ruili wrote:
> From: Ruili Ji ruili.ji@amd.com<mailto:ruili.ji@amd.com>
> Date: Tue, 6 Sep 2022 14:09:41 +0800
> Subject: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device
> 
> Make guest os access pci device control 2 reg for passthrough device
> as struct XenPTRegInfo described in the file hw/xen/xen_pt.h.
> /* reg read only field mask (ON:RO/ROS, OFF:other) */
> uint32_t ro_mask;
> /* reg emulate field mask (ON:emu, OFF:passthrough) */
> uint32_t emu_mask;
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1196
> Signed-off-by: Aaron.Liu@amd.com<mailto:Aaron.Liu@amd.com>
> Signed-off-by: ruili.ji@amd.com<mailto:ruili.ji@amd.com>

Hi Ruili,

I believe both signed-off-by line aren't formatted as expected (I think
a name is needed with the email address), may I change them to:

  Signed-off-by: Aaron Lui <Aaron.Liu@amd.com>
  Signed-off-by: Ruili Ji <ruili.ji@amd.com>

The second line would be the same as the author of the patch (From:).

Thanks,

-- 
Anthony PERARD

