Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DDB6E0A34
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 11:28:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmtFW-0005iU-RG; Thu, 13 Apr 2023 05:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pmtFU-0005iE-1O
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:28:12 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pmtFR-0007yR-Dl
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:28:11 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PxvJt19fHz67qPC
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 17:23:42 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Apr
 2023 10:28:06 +0100
Date: Thu, 13 Apr 2023 10:28:04 +0100
To: Raghu H <raghuhack78@gmail.com>
CC: <maverickk1778@gmail.com>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 0/2] Update CXL documentation
Message-ID: <20230413102804.00006cae@Huawei.com>
In-Reply-To: <20230406132839.3357195-1-raghuhack78@gmail.com>
References: <20230406113640.0000277c@Huawei.com>
 <20230406132839.3357195-1-raghuhack78@gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
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

On Thu,  6 Apr 2023 18:58:37 +0530
Raghu H <raghuhack78@gmail.com> wrote:

> Thanks Jonathan for quick review/comments on earlier patch, as suggested
> splitting into two separate patches
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg952999.html
> 
> Removed the unsupported size option for cxl-type3 device, Qemu reads
> the device size directly from the backend memory device config.
> 
> Currently the Qemu CXL emulation for AARCH64 is not available and its
> only supported on x86_64 platform emulations. Removing the incorrect
> information and populating with supported x86_64 sample command to
> emulate cxl devices.
> 
> The document will be updated when the AARCH64 support is mainlined.

Both look good to me.  No need to rush these in.

I'll queue these up in my local tree (and update gitlab/jic23/qemu
sometime later this week) but if anyone wants to pick
them directly that's fine too.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> 
> 
> Raghu H (2):
>   docs/cxl: Remove incorrect CXL type 3 size parameter
>   docs/cxl: Replace unsupported AARCH64 with x86_64
> 
>  docs/system/devices/cxl.rst | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> 
> base-commit: 7d0334e49111787ae19fbc8d29ff6e7347f0605e


