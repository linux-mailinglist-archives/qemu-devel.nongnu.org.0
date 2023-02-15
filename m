Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08D7697A9D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:23:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFs1-0000Tn-Qj; Wed, 15 Feb 2023 06:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSFrz-0000TO-0j
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:22:39 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSFrw-0000gH-6H
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:22:38 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PGwbY1ZjSz16NgD;
 Wed, 15 Feb 2023 19:20:09 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Wed, 15 Feb 2023 19:22:29 +0800
Message-ID: <35b48b06-ec67-e18f-c1d3-14ba3347730b@huawei.com>
Date: Wed, 15 Feb 2023 19:22:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 12/18] tests: Add test case of APIC ID for module
 level parsing
To: Zhao Liu <zhao1.liu@linux.intel.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
CC: <qemu-devel@nongnu.org>, Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi
 <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo
 <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Like Xu
 <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-13-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213093625.158170-13-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

在 2023/2/13 17:36, Zhao Liu 写道:
> From: Zhuocheng Ding <zhuocheng.ding@intel.com>
>
> After i386 supports module level, it's time to add the test for module
> level's parsing.
>
> Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> Co-developed-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   tests/unit/test-x86-apicid.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/tests/unit/test-x86-apicid.c b/tests/unit/test-x86-apicid.c
> index f21b8a5d95c2..55b731ccae55 100644
> --- a/tests/unit/test-x86-apicid.c
> +++ b/tests/unit/test-x86-apicid.c
> @@ -37,6 +37,7 @@ static void test_topo_bits(void)
>       topo_info = (X86CPUTopoInfo) {1, 1, 1, 1};
>       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 0);
>       g_assert_cmpuint(apicid_core_width(&topo_info), ==, 0);
> +    g_assert_cmpuint(apicid_module_width(&topo_info), ==, 0);
>       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 0);
>   
>       topo_info = (X86CPUTopoInfo) {1, 1, 1, 1};
> @@ -74,13 +75,22 @@ static void test_topo_bits(void)
>       topo_info = (X86CPUTopoInfo) {1, 1, 33, 2};
>       g_assert_cmpuint(apicid_core_width(&topo_info), ==, 6);
>   
> -    topo_info = (X86CPUTopoInfo) {1, 1, 30, 2};
> +    topo_info = (X86CPUTopoInfo) {1, 6, 30, 2};
> +    g_assert_cmpuint(apicid_module_width(&topo_info), ==, 3);
> +    topo_info = (X86CPUTopoInfo) {1, 7, 30, 2};
> +    g_assert_cmpuint(apicid_module_width(&topo_info), ==, 3);
> +    topo_info = (X86CPUTopoInfo) {1, 8, 30, 2};
> +    g_assert_cmpuint(apicid_module_width(&topo_info), ==, 3);
> +    topo_info = (X86CPUTopoInfo) {1, 9, 30, 2};
> +    g_assert_cmpuint(apicid_module_width(&topo_info), ==, 4);
> +
> +    topo_info = (X86CPUTopoInfo) {1, 6, 30, 2};
>       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 0);
> -    topo_info = (X86CPUTopoInfo) {2, 1, 30, 2};
> +    topo_info = (X86CPUTopoInfo) {2, 6, 30, 2};
>       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 1);
> -    topo_info = (X86CPUTopoInfo) {3, 1, 30, 2};
> +    topo_info = (X86CPUTopoInfo) {3, 6, 30, 2};
>       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 2);
> -    topo_info = (X86CPUTopoInfo) {4, 1, 30, 2};
> +    topo_info = (X86CPUTopoInfo) {4, 6, 30, 2};
>       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 2);
>   
>       /* build a weird topology and see if IDs are calculated correctly
> @@ -91,6 +101,7 @@ static void test_topo_bits(void)
>       topo_info = (X86CPUTopoInfo) {1, 1, 6, 3};
>       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 2);
>       g_assert_cmpuint(apicid_core_offset(&topo_info), ==, 2);
> +    g_assert_cmpuint(apicid_module_offset(&topo_info), ==, 5);
>       g_assert_cmpuint(apicid_die_offset(&topo_info), ==, 5);
>       g_assert_cmpuint(apicid_pkg_offset(&topo_info), ==, 5);
>   
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan

