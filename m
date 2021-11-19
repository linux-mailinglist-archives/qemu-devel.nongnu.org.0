Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA17456CE2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:59:59 +0100 (CET)
Received: from localhost ([::1]:59744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0gX-0003sL-RS
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:59:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mo0fX-0003Ak-Sx
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:58:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mo0fV-00074E-0t
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637315923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmOleslG12vl9Z7yHeI1cJ/tVwTF0SHNfDgY4j1ql64=;
 b=D3JvOhJkH/XIc1kbeqtv9V4L/Rwsoj3XjUh3jpRkim2ojV7pI9J7k4fQ6/GjPG+XUd/tW1
 gY6yzHVo7+5HNbQueUeGb/2Y7YZbCgzCSrQ1Mi8AX2V6YLHc89upGgtwnh8cLEnn20R3Kd
 ZW3zB2QjueFmqeeNOyNAKtt+spnuH3s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523--A7GAxOvOzSrPpcLmZDX2g-1; Fri, 19 Nov 2021 04:58:41 -0500
X-MC-Unique: -A7GAxOvOzSrPpcLmZDX2g-1
Received: by mail-ed1-f71.google.com with SMTP id
 q17-20020aa7da91000000b003e7c0641b9cso7951710eds.12
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 01:58:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RmOleslG12vl9Z7yHeI1cJ/tVwTF0SHNfDgY4j1ql64=;
 b=TcLU5yFXejN6Htl4mdKkcgHACK0xt80nlGIKjGaZE+jjXWRCvFlKMi/Z8ZsVq4z53v
 BXC7Bmew3yYKd3YJI+fK2zPFNGHIwftXPfnqR6UPhl1K2b/wg+D1vWx+l0c+6cTtHO+r
 PErVDfgOmJt9JGapRA5Hc0s/CGRqaa89j+7Xt1Dji73YuDTkMq73RIby67sh+uW1qRWH
 3JZy31vgWLt0gfyFy/mVt3QuLNBHdvmkZqBsFZz17CiZ59xBwS+8OXgGHNgb8msA2Xtw
 y+HgzAStZkz99MPeQvRvq8DqRDKbYZWpt5h5YN55tD50AQSj3muBsR4vArIrvivhqJ1p
 qKkQ==
X-Gm-Message-State: AOAM531Wl/J7SfKHc5rcpnA47De4PrZgCMeQWBqL8Mvw5RFoI4P2UtLM
 UE1D4F5tmt4lMS3EqvTDYwfBi1To/rMFAZhiOATvTTHoqOgNJYQOTNiUiDxpP2ZeHJrOKhn/D/B
 EHL96RSkNJmqd/4g=
X-Received: by 2002:aa7:cd99:: with SMTP id x25mr21845961edv.249.1637315920316; 
 Fri, 19 Nov 2021 01:58:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmtRpLQGYJOv3me9dtC52GA219YAGYDfaMH0TwuNMr+4ckZnW2zFm6F4b3Bf7JveOGSxiIEg==
X-Received: by 2002:aa7:cd99:: with SMTP id x25mr21845920edv.249.1637315920082; 
 Fri, 19 Nov 2021 01:58:40 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id x5sm1179916edv.29.2021.11.19.01.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 01:58:39 -0800 (PST)
Message-ID: <a77c94fe-633a-5c33-e6e5-2715f89f2b90@redhat.com>
Date: Fri, 19 Nov 2021 10:58:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 0/2] hw/display: Do not allow multiple (identical)
 VGA devices
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20211118192020.61245-1-philmd@redhat.com>
 <776204b8-22df-555b-1836-425995272fd9@ilande.co.uk>
 <c7cb668d-1ed4-c9a6-7c27-d8892c625f0c@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <c7cb668d-1ed4-c9a6-7c27-d8892c625f0c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/11/2021 10.49, Philippe Mathieu-Daudé wrote:
> On 11/19/21 09:21, Mark Cave-Ayland wrote:
>> On 18/11/2021 19:20, Philippe Mathieu-Daudé wrote:
>>
>>> Commit 7852a77f598 fixed creating multiple TYPE_ISA_VGA devices,
>>> generalize the fix to all VGA devices.
>>>
>>> See https://gitlab.com/qemu-project/qemu/-/issues/44
>>>
>>> Philippe Mathieu-Daudé (2):
>>>     hw/display: Add Error* handle to vga_common_init()
>>>     hw/display: Do not allow multiple identical VGA devices
>>>
>>>    hw/display/vga_int.h        |  2 +-
>>>    hw/display/ati.c            |  4 +++-
>>>    hw/display/cirrus_vga.c     |  4 +++-
>>>    hw/display/cirrus_vga_isa.c |  4 +++-
>>>    hw/display/qxl.c            |  4 +++-
>>>    hw/display/vga-isa-mm.c     |  3 ++-
>>>    hw/display/vga-isa.c        | 11 ++---------
>>>    hw/display/vga-pci.c        |  8 ++++++--
>>>    hw/display/vga.c            | 17 ++++++++++++++++-
>>>    hw/display/virtio-vga.c     |  4 +++-
>>>    hw/display/vmware_vga.c     |  2 +-
>>>    11 files changed, 43 insertions(+), 20 deletions(-)
>>
>> Hi Phil,
>>
>> I don't think this is correct for non-ISA devices: for example years ago
>> I had a PC running Windows 98SE with 2 identical PCI graphics cards
>> configured in dual-head mode.
>>
>> IIRC the BIOS would bring up the first graphics card and configure it to
>> use the legacy ISA VGA ioports for compatibility, and then once the main
>> OS drivers loaded both cards were switched to PCI mode and configured
>> using the BARs as normal.
> 
> The problem here is QEMU technical debt, not the hardware.
> 
> When vga_common_init() calls memory_region_init_ram_nomigrate()
> with obj=NULL, "vga.vram" is registered as a QOM singleton.
> 
> Updating it would
 > 1/ require non-QOM devices to be QOM'ified

So sounds like that's the right way to go here.

> and 2/ break migration unless using HPFM which I don't master.

What's HPFM?

  Thomas


