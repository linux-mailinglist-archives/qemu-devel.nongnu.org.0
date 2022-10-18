Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78365602745
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 10:41:43 +0200 (CEST)
Received: from localhost ([::1]:53500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okiAQ-0003zX-BX
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 04:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <julien@xen.org>)
 id 1okhuJ-0004Es-1n; Tue, 18 Oct 2022 04:25:03 -0400
Received: from mail.xenproject.org ([104.130.215.37]:47912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <julien@xen.org>)
 id 1okhuH-0001ch-82; Tue, 18 Oct 2022 04:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID;
 bh=RZV2EaUyuf7LDviRdlZ1zghsWBgRjq3ZsAcy/wHuSkU=; b=3Km7LjD/BOVMIq0yts/6nebgii
 slQfESAWAaNb0YGu5FfAHfeY++Wbav9WaOtjsB/8e8aog/HiWUbLZIbBkDYAAazGc8h9TI032O3fK
 2SKxbgaEPUgOlmKfCdeWfTU5NplIGHeRUiWa8oXIOliI2OBXvvW/LW48mUWuBQQkTwR0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okhu7-0004Wl-Aa; Tue, 18 Oct 2022 08:24:51 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okhu6-0006Sw-SW; Tue, 18 Oct 2022 08:24:51 +0000
Message-ID: <460a480e-4e91-8d78-60da-59b9cc98beee@xen.org>
Date: Tue, 18 Oct 2022 09:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org,
 stefano.stabellini@amd.com, Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
 <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
 <alpine.DEB.2.22.394.2210171345450.2351079@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
In-Reply-To: <alpine.DEB.2.22.394.2210171345450.2351079@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=104.130.215.37; envelope-from=julien@xen.org;
 helo=mail.xenproject.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Hi Stefano,

On 18/10/2022 02:26, Stefano Stabellini wrote:
> On Sun, 16 Oct 2022, Julien Grall wrote:
>> Hi,
>>
>> There seem to be some missing patches on xen-devel (including the cover
>> letter). Is that expected?
>>
>> On 15/10/2022 06:07, Vikram Garhwal wrote:
>>> Add a new machine xenpv which creates a IOREQ server to register/connect
>>> with
>>> Xen Hypervisor.
>>
>> I don't like the name 'xenpv' because it doesn't convey the fact that some of
>> the HW may be emulated rather than para-virtualized. In fact one may only want
>> to use for emulating devices.
>>
>> Potential name would be 'xen-arm' or re-using 'virt' but with 'accel=xen' to
>> select a Xen layout.
> 
> The benefit of 'xenpv' is that it doesn't require any changes to libxl.

I am quite surprised. Looking at the code, it seems to work more by 
chance than it is intentional as the code is gated by 
libxl__need_xenpv_qemu(). So it would not start if there were no 
emulated devices.

> It is even backward compatible so it could be used with an older version
> of Xen/libxl.
We don't really gain much here. IOREQ is a tech preview and anyone that 
wants to try it should really use the latest Xen.

> Backward compatibility aside, if we come up with a
> different name then we'll need changes to libxl and to manage those
> changes. For instance, if we use 'xen-arm' that would mean we would need
> to handle per-arch QEMU machine names.

Right, so the main argument here is for simplicity in libxl
Looking at how 'xenpv' is built, this is really expected to deal with PV 
backend rather than emulated device. I do expect some changes as we go 
along to be able to add emulated device.

Furthermore, libxl is not the only toolstack out. So I am not convinced 
this is a good argument to keep the name the same.

Cheers,

-- 
Julien Grall

