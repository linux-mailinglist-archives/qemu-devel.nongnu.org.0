Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE16BEE88
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 17:38:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdD5I-0005ma-Sh; Fri, 17 Mar 2023 12:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pdD5F-0005m5-NP
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:37:37 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pdD5C-0005k6-Vu
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:37:37 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PdV860f3pz6J9fG
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 00:34:14 +0800 (CST)
Received: from localhost (10.48.148.142) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 17 Mar
 2023 16:37:22 +0000
Date: Fri, 17 Mar 2023 16:37:20 +0000
To: Maverickk 78 <maverickk1778@gmail.com>
CC: <qemu-devel@nongnu.org>
Subject: Re: Call failed: MCTP Endpoint did not respond: Qemu CXL switch
 with mctp-1.0
Message-ID: <20230317163720.00005c23@Huawei.com>
In-Reply-To: <CALfBBTuELntcARWxvHyGmYvHbEACujhBq8bphHKnUv_C_z33Bg@mail.gmail.com>
References: <CALfBBTuELntcARWxvHyGmYvHbEACujhBq8bphHKnUv_C_z33Bg@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.148.142]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 17 Mar 2023 00:11:10 +0530
Maverickk 78 <maverickk1778@gmail.com> wrote:

> Hi
> 
>  I am trying mctp & mctpd with aspeed +buildroot(master) + linux v6.2
> with Qemu 7.2.
> 
> 
> I have added necessary FMAPI related patches into QEMU to support CLX
> switch emulation
> 
> RFC-1-2-misc-i2c_mctp_cxl_fmapi-Initial-device-emulation.diff
> 
> RFC-2-3-hw-i2c-add-mctp-core.diff
> 
> RFC-4-4-hw-misc-add-a-toy-i2c-echo-device.diff
> 
> RFC-2-2-arm-virt-Add-aspeed-i2c-controller-and-MCTP-EP-to-enable-MCTP-testing.diff
> 
> RFC-3-3-hw-nvme-add-nvme-management-interface-model.diff
> 
> 
> Executed following mctp commands to setup the binding,
> 
> mctp link set mctpi2c15 up
> 
> mctp addr add 50 dev mctpi2c15
> 
> mctp link set mctpi2c15 net 11
> 
> systemctl restart mctpd.service
> 
> busctl call xyz.openbmc_project.MCTP /xyz/openbmc_project/mctp
> au.com.CodeConstruct.MCTP AssignEndpoint say mctpi2c15 1 0x4d
> 
> 
>  The above busctl configuration is reaching fmapi patch and sets up
> the endpoint id but then mctpd fails with log after timeout.
> 
> Call failed: MCTP Endpoint did not respond
> 
> Any clue what's going on?

Hi Raghu,

Yikes. Didn't think anyone would still use that series.
Not even sure I still have a tree with it on.

I'll try and bring up again and get back to you. Might be a little
while though.

Jonathan


> 
> 
> Regards
> Raghu


