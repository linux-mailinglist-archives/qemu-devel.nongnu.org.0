Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C52C407E1F
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 17:48:42 +0200 (CEST)
Received: from localhost ([::1]:56908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRii-0003HO-Rl
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 11:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRhW-0002PH-TH
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:47:26 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRhV-0003n0-5A
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:47:26 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x6so10614571wrv.13
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BvZNchEf1pUQKdYyWLOPgz/fqRc+XI1o27XNnL6Qk4Y=;
 b=fZPtzNZalA8qUnEUqfotdo7ffbWiKQM8f/iKmjl4fiwa7YzpS6Qntt9FGVJx5HyW1n
 e4RK9lpZK30fd74gvptWO4i1KhcF0sVkfvqyzjmlRvk5fMJ6MsYEOtiNfNKRU42WzmaP
 eJZ/vTNpGc3ochRiO3VYJftrmbDHUbqk3j5c2VBNwZA4fAFJUx/zIeB8GyTi1R4hazlp
 wkY5X110LRskeKA1gp6tuiHBjYJ4pzXOXxbKK5JmtktsbadRwmiNzYuNjG3ai4xxPR4i
 5gc/8NWILisdnXbmb4XMc7LswLsSUepOSCL2CZXwv5AB2UrsgOhtvmltqlQ4iLVaui+R
 +jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BvZNchEf1pUQKdYyWLOPgz/fqRc+XI1o27XNnL6Qk4Y=;
 b=ZRTHhOCLL9g3LdxLoKuH2fx8dRlHUdyBswrG/joegtrF77laRxlweuIgyaa7YjFGej
 WYPCrmakCDo7ZVRePo66svnaQkrWi9jfQFpCu4RAbKP929qbJFi/u/sebSVwphIJVteu
 kOqhQ8+KAVH1xqQBa6iTZeBusN3M9PV7OrWMtMrmFK2zttqg+eJRlLj67xSp5lcZT3si
 vIMj30txKxiMXVc1OCqR0RqN6COyZtppc/9+Pyw7HhF/gkkQ5AxHF17rZZhirkg8bXJd
 BoCO6SusIQg+xcrDhuPZZ3qYbLQAZ55geqHsZjLdN8pMAuk4tlSLPSam6geQ1DpXoEHb
 WtnQ==
X-Gm-Message-State: AOAM532Yp9gH4KICZLzpWEGa2w1y+zSQkrKg1W4Vb7r+zvs0qZDyK+9+
 GBbYC5Vj/HaRx93CGGnUGzc=
X-Google-Smtp-Source: ABdhPJzAB1ZtSI3rQ+yIHHCGp41RVanRO71oaWfbStNLgyYY58xOstZp7/1PQ9OT44yMXJdpOTB/oA==
X-Received: by 2002:adf:e404:: with SMTP id g4mr8019706wrm.143.1631461643308; 
 Sun, 12 Sep 2021 08:47:23 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t23sm5018021wrb.71.2021.09.12.08.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 08:47:22 -0700 (PDT)
Subject: Re: [PATCH 00/20] nubus: bus, device, bridge, IRQ and address space
 improvements
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <65a6ebbf-5f5a-8a47-ff68-b48c9079bf01@amsat.org>
Date: Sun, 12 Sep 2021 17:47:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,

On 9/12/21 9:48 AM, Mark Cave-Ayland wrote:
> This patchset is the next set of changes required to boot MacOS on the q800 machine. The
> main aim of these patches is to improve the Nubus support so that devices can be plugged
> into the Nubus from the command line i.e.
> 
>     -device nubus-macfb[,romfile=decl.rom]
> 
> At the moment the only device that can be plugged into the Nubus is the macfb framebuffer
> however with these changes it is possible to take a ROM from a real Nubus card and
> attempt to use it in QEMU, and also allow for future interfaces such as virtio.
> 
> Patches 1 to 6 move the logic which manages bus addresses from the NubusDevice into
> the NubusBus itself, including the introduction of a bitmap to manage available
> slots on the bus.
> 
> Patches 7 and 8 change the handling for unassigned (empty) slots to generate a bus
> fault and add trace events to allow logging of empty slot accesses during Nubus
> enumeration.
> 
> Patches 9 to 11 remove the existing stubs for generating the format block (the epilogue
> of the Nubus device embedded ROM consisting of metadata and a checksum) and replace them
> with a romfile device property to allow the entire Nubus ROM to be loaded from a file
> into the ROM area, similar to a PCI option ROM.
> 
> Patch 12 moves the Nubus into its own separate address space whilst patches 13 to 17
> update the NubusBridge (and MacNubusBridge) devices to allow machines to map the
> required slots from the Nubus address space using sysbus_mmio_map().
> 
> Finally patches 18 to 20 add support for Nubus IRQs and wire them up appropriately for
> the q800 machine through VIA2, which is required for the next set of macfb updates.

Some questions:

- TYPE_NUBUS_BRIDGE is not abstract. So far, beside
  TYPE_MAC_NUBUS_BRIDGE, no other code use it. Could it
  be use as it? If so, shouldn't the code in
  mac_nubus_bridge_init() be moved to nubus_bridge_realize(),
  creating the slot alias regions generically using the
  slot range from slot_available_mask or using another
  property?

- Why is "slot-available-mask" a bridge device property and
  not a bus one?

Regards,

Phil.

