Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BE22C143F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:14:40 +0100 (CET)
Received: from localhost ([::1]:42750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khHIN-0005bp-Uw
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khHG3-0004hT-AZ
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:12:15 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khHFx-00035k-71
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:12:13 -0500
Received: by mail-wr1-x441.google.com with SMTP id r17so19743434wrw.1
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 11:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9qUi7hbSRSBdQ2oL2H6udW4BB9jJQxF/7pndamiW0h0=;
 b=ClbSEBvg6+ncvNIOSVGq6SrrTGwgsr0eBVWtAUloldU0Q3DOzZBWn3UpeNrluQMZ9Q
 Rjr7LVX3mCyWdzYtJSCpoSz8qciP1+XjsuPUbso5WN5YO5L7/UO5rjLfZ61rB8zxEEh9
 +i4yk6VHItxLsPHu5i8QR3yAcIT+dxtNanM2xorELXvzHN8hdkoE2esVLXPiVbFQytFJ
 9MYHZzp/VgpJraTDHlT4/oabAnoctmr/FTttbipgKZb1z1qIr1dhZX4Zh5IgqU2K3k7M
 vWhezmR3jpRXId9jyu7jSn15mfrfJWly3UMKBkPY1Zh2dSyZFE7eOgWhIh2hc6ZsfuW5
 GTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9qUi7hbSRSBdQ2oL2H6udW4BB9jJQxF/7pndamiW0h0=;
 b=b5AL4NHs2FFPeXV2m8AHKhh88NUs6uyMa8yS/n35zE6X0RoU+tHik0PguFpfdECf8u
 VyZpLTk8G8uIc7+jdLGliz43q71t77kehqq+P2VjlxVlvLFPDvCU0phIHjPzX0fcWU0k
 gZ09R8xV8ae4oMC8J+jVF76uTO0U/EpNRlMeQdFpjSBkZTjHmrtdaIOfBC3iNBZ8torc
 6Ih3at5SJ+MEHZoAGdIUDH5Rt4MYPz+bFuIZ0k8St/szFKsbXuYEb41uN+jgO6b1Smhw
 RZt6tVX/+hwo0mNSg3d4Ci/UJwM+dBaU3/0TV8wadhK6CyD5b71ParszWvfI/BT/vvjL
 rVng==
X-Gm-Message-State: AOAM533/FXMkjwue86jVmoVZihoLgctpbzXgOl3k3lGSW+hm57hQR9YY
 Zw7g05sNzZBLZl6bJULMpZ8=
X-Google-Smtp-Source: ABdhPJylG6kf037UN+TzuI+Zrb68fxkzfK6AySlG/Yfy5bNpAG/hLw7sHZTEbVkTrZX+WARBHKTJow==
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr1301709wrt.38.1606158724731; 
 Mon, 23 Nov 2020 11:12:04 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id x4sm5737835wrv.81.2020.11.23.11.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 11:12:03 -0800 (PST)
Subject: Re: [RFC PATCH 16/25] hw/pxb/cxl: Add "windows" for host bridges
To: Ben Widawsky <ben@bwidawsk.net>, qemu-devel@nongnu.org
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-17-ben.widawsky@intel.com>
 <20201113004952.tm45qv2tukwnle52@mail.bwidawsk.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c51b000e-80db-40e9-d878-f260c49e4a2e@amsat.org>
Date: Mon, 23 Nov 2020 20:12:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113004952.tm45qv2tukwnle52@mail.bwidawsk.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/13/20 1:49 AM, Ben Widawsky wrote:
> On 20-11-10 21:47:15, Ben Widawsky wrote:
>> In a bare metal CXL capable system, system firmware will program
>> physical address ranges on the host. This is done by programming
>> internal registers that aren't typically known to OS. These address
>> ranges might be contiguous or interleaved across host bridges.
>>
>> For a QEMU guest a new construct is introduced allowing passing a memory
>> backend to the host bridge for this same purpose. Each memory backend
>> needs to be passed to the host bridge as well as any device that will be
>> emulating that memory (not implemented here).
>>
>> I'm hopeful the interleaving work in the link can be re-purposed here
>> (see Link).
>>
>> An example to create a host bridges with a 512M window at 0x4c0000000
>>  -object memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M
>>  -device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52,uid=0,len-memory-base=1,memory-base\[0\]=0x4c0000000,memory\[0\]=cxl-mem1
>>
>> Link: https://lists.nongnu.org/archive/html/qemu-devel/2020-08/msg03680.html
>> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> 
> Hi Phil, wanted to call you out specifically on this one.
> 
> The newly released CXL 2.0 specification (which from a topology perspective can
> be thought of as very PCIe-like) allows for interleaving of memory access.
> 
> Below is an example of two host bridges, each with two root ports, and 5 devices
> (two of switch are behind a switch).
> 
> RP: Root Port
> USP: Upstream Port
> DSP: Downstream Port
> Type 3 device: Memory Device with persistent or volatile memory.
> 
> +-------------------------+      +-------------------------+
> |                         |      |                         |
> |   CXL 2.0 Host Bridge   |      |   CXL 2.0 Host Bridge   |
> |                         |      |                         |
> |  +------+     +------+  |      |  +------+     +------+  |
> |  |  RP  |     |  RP  |  |      |  |  RP  |     |  RP  |  |
> +--+------+-----+------+--+      +--+------+-----+------+--+
>       |            |                   |               \--
>       |            |                   |        +-------+-\--+------+
>    +------+    +-------+            +-------+   |       |USP |      |
>    |Type 3|    |Type 3 |            |Type 3 |   |       +----+      |
>    |Device|    |Device |            |Device |   |                   |
>    +------+    +-------+            +-------+   | +----+     +----+ |
>                                                 | |DSP |     |DSP | |
>                                                 +-+----+-----+----+-+
>                                                     |          |
>                                                 +------+    +-------+
>                                                 |Type 3|    |Type 3 |
>                                                 |Device|    |Device |
>                                                 +------+    +-------+
> 
> Considering this picture... interleaving of memory access can happen in all 3
> layers in the topology.
> 
> - Memory access can be interleaved across host bridges (this is accomplished
>   based on the physical address chosen for the devices, those address ranges are
>   platform specific and not part of the 2.0 spec, for now).
> 
> - Memory access can be interleaved across root ports in a host bridge.
> 
> - Finally, memory access can be interleaved across downstream ports.
> 
> I'd like to start the discussion about how this might overlap with the patch
> series you've last been working on to interleave memory. Do you have any
> thoughts or ideas on how I should go about doing this?

Main case:

 +-------------------------+
 |                         |
 |   CXL 2.0 Host Bridge   |
 |                         |
 |  +------+     +------+  |
 |  |  RP  |     |  RP  |  |
 +--+------+-----+------+--+
       |            |
       |            |
    +------+    +-------+
    |Type 3|    |Type 3 |
    |Device|    |Device |
    +------+    +-------+

// cxl device state
s = qdev_create(TYPE_CXL20_HB_DEV)

cxl_memsize = 2 * memsize(Type3Dev);

// container for cxl
memory_region_init(&s->container, OBJECT(s),
                   "container", cxl_memsize);

// create 2 slots, interleaved each 2k
s->interleaver = qdev_create(INTERLEAVER_DEV,
                             slotsize=2k,
                             max_slots=2)
qdev_prop_set_uint64(s->interleaver, "size",
                     cxl_memsize);

// connect each device to the interleaver
object_property_set_link(OBJECT(interleaver),
                         "mr0", OBJECT(RP0))
object_property_set_link(OBJECT(interleaver),
                         "mr1", OBJECT(RP1))
sysbus_realize_and_unref(SYS_BUS_DEVICE(interleaver))

// we can probably avoid this container
memory_region_add_subregion(&s->container, 0,
                            sysbus_mmio_get_region(interleaver, 0));


For the 2nd case, USP can be created the same way than case 1
(as a 2nd interleaver) then the main CXL is created with the
minor difference of mr1 now being the USP:

object_property_set_link(OBJECT(interleaver),
                         "mr1", OBJECT(USP))
sysbus_realize_and_unref(SYS_BUS_DEVICE(interleaver))

Regards,

Phil.

