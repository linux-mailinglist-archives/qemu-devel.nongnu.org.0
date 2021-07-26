Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A4A3D5BBF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:34:08 +0200 (CEST)
Received: from localhost ([::1]:48294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81gF-0001PT-8P
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m81eU-0007pn-BN
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:32:19 -0400
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3]:43840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m81eR-0005ge-Ou
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:32:18 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id 180461F4275D
Subject: Re: virtio-gpu: Mapping blob resources
To: Gerd Hoffmann <kraxel@redhat.com>
References: <0eb17319-0b1d-5f43-f5d9-8ccadb0839ef@collabora.com>
 <20210723135242.w5bcqwwrm5stec3b@sirius.home.kraxel.org>
 <baf58f3a-6b82-74c4-5383-117ac51d6579@collabora.com>
 <20210726081921.yekhfrxg6bccvn64@sirius.home.kraxel.org>
From: Antonio Caggiano <antonio.caggiano@collabora.com>
Message-ID: <1d3f790d-50b4-ccf1-b3e9-dcbef84f20d2@collabora.com>
Date: Mon, 26 Jul 2021 16:32:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726081921.yekhfrxg6bccvn64@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 envelope-from=antonio.caggiano@collabora.com; helo=bhuna.collabora.co.uk
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.438,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 vivek.kasireddy@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/07/21 10:19, Gerd Hoffmann wrote:
> On Fri, Jul 23, 2021 at 05:07:52PM +0200, Antonio Caggiano wrote:
>> I added it to the gpu hostmem at the offset specified by the map command. I
>> enabled the subregion, and then I used subregion->addr for the vkMapMemory
>> call.
> 
> Hmm, no.  I'd suggest to first vkMapMemory into qemu address space, then
> pass the address of the mapping to memory_region_init_ram_device_ptr().

Awesome, indeed that works and I was able to render krh/vkcube in 
headless mode.

Cheers,
Antonio

