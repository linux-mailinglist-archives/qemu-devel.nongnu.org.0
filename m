Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6098F4C9078
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 17:35:40 +0100 (CET)
Received: from localhost ([::1]:58812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP5TP-0005KV-Fu
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 11:35:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>)
 id 1nP5SA-0004dK-JX; Tue, 01 Mar 2022 11:34:22 -0500
Received: from [2607:f8b0:4864:20::52e] (port=33458
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>)
 id 1nP5S5-0004Sk-5Z; Tue, 01 Mar 2022 11:34:20 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 12so14822539pgd.0;
 Tue, 01 Mar 2022 08:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=zMs6geIRZGUb21w3O6Ms1ZjgZzSB7UuC0q+zp+Woh2E=;
 b=oksVQSMRhuFOTUwhQuWKaHCCZlwBDXjljSc7bxSnHT7t8T1NE+BLoW24ELYGzpiUda
 dvE4+Hmdq3UaM+WzIbQJJrrTxpRRO7Raar2c0W8yD9JXagt4KPCKJaLDLnbzQKEuiX3b
 1BsGtp4vVeUQl6Su04yf6Sv841yBpX9DQ0BjEWWtjvpByL9m+HPPpNA3p0yylxx0zK2f
 jv5cMOM9wLItmbF7359CY8OnP2qhZfdFR+ZBi5oYVCW+Mc+VFWSv/E2QHhJn0oL0CGa4
 H38drHFVkmmj5mb5w8AXm2HKOtWjGk/6FNM4aeCkJmNaobC/V9/UZczGlqOEUTu98dFf
 14Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=zMs6geIRZGUb21w3O6Ms1ZjgZzSB7UuC0q+zp+Woh2E=;
 b=7KwOHVMODb8fWnEGwe2ddNkNGsy3npXghl8vbkGEvGhEYsywCXdn1NnHjjccsPZZMZ
 OWTMOkENVr82qtD2wgsp/pEpwpuBmYaA9FTTFocsICgvoA5aoV25bL8loULbLn22888w
 Prx1gHPSEGY0d26xj1OoVjzQDC69QMaOX5EStrgaXN3EKpoiU58I5lETUgSQQcDmomgv
 O/ycrnOxreOoRxTaBNbGLBdKyG5reKLQACIXgXuLGUjwovNj1hyYBqmMoa3BBtuinvww
 HkG+L/Bfv24my+SbtFs1DC8oapZGZ6XzupNVwiJpp8uczyeU1Ao1ZH2aqFkarXDHHF5u
 nL7w==
X-Gm-Message-State: AOAM533Tf2FSleuan8w0hx5rmTLwqxrxRlkE2xhW8kfwDfHHsQKbgxJz
 RwymlMBzQsfWZ92kGb1ZY9Q=
X-Google-Smtp-Source: ABdhPJzORhNSxksi2vqx5FjT41Znz9pBqZ6JOmbOG/hZ/cox1BopgxNWOD1NIllpO0PXf+JK825j4Q==
X-Received: by 2002:a62:7990:0:b0:4e0:5ae8:6c11 with SMTP id
 u138-20020a627990000000b004e05ae86c11mr28623358pfc.34.1646152452829; 
 Tue, 01 Mar 2022 08:34:12 -0800 (PST)
Received: from ?IPV6:2001:b011:e000:59d7:401f:1cea:ecc0:9594?
 (2001-b011-e000-59d7-401f-1cea-ecc0-9594.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:401f:1cea:ecc0:9594])
 by smtp.gmail.com with ESMTPSA id
 e30-20020a056a0000de00b004ef299a4f89sm18172590pfj.180.2022.03.01.08.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 08:34:12 -0800 (PST)
Message-ID: <2da2f0bc-6c54-0a26-aafb-1f866cf93de8@gmail.com>
Date: Wed, 2 Mar 2022 00:34:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
From: Yan-Jie Wang <ubzeme@gmail.com>
Subject: Re: [PATCH qemu 0/7] Many improvements to HVF memory-related codes
To: Peter Maydell <peter.maydell@linaro.org>
References: <164603074537.20094.1732342403585879912-0@git.sr.ht>
 <CAFEAcA8hWy3rfGtYkyQjJSGgsX448_t01xmM4cwyCO0op4h1xw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAFEAcA8hWy3rfGtYkyQjJSGgsX448_t01xmM4cwyCO0op4h1xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=ubzeme@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the dirty-tracking part in my patch series, the major difference 
between this patch and Alex's patch is that the dirty-tracking logic in 
my patch will only mark the page being written dirty instead of marking 
the whole memory slot dirty, and will only restore the write permission 
to the page being written instead of the whole memory slot.

When memory regions overlap, "region_add" in memory listeners may be 
called with structure MemoryRegionSection containing non-zero 
offset_within_region.  This makes the start address of memory slots 
(member "start" in struct hvf_slot) not the same as the start address of 
the memory region. However, the dirty-tracking logics in both 
target/i386/hvf and Alex's patch assume that they are the same.

Currently, there is a bug in the dirty-tracking logic in 
target/i386/hvf. I modified codes in target/i386/hvf to fix the problem.

On the x86 platform, Ubuntu ISO boot menu did not show properly.

The link of the bug is https://bugs.launchpad.net/qemu/+bug/1827005

The modified codes use the new function, "hvf_access_memory",
introduced in this patch series to handle dirty-tracking.

Following is the dirty-tracking logic in original codes in
target/i386/hvf.

     if (write && slot) {
         if (slot->flags & HVF_SLOT_LOG) {
             memory_region_set_dirty(slot->region, gpa - slot->start, 1);
             hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
                           HV_MEMORY_READ | HV_MEMORY_WRITE);
         }
     }

The problem of the above code is:

'memory_region_set_dirty' sets only the page that is being written 
dirty, but hv_vm_protect makes the whole memory slot writable.

Any write to the memory slot excluding the previous written page
and before the next call to "log_sync" in memory listener
will not be correctly tracked.


On Mon, Feb 28, 2022 at 10:11 PM Peter Maydell 
<peter.maydell@linaro.org> wrote:
>
> On Mon, 28 Feb 2022 at 14:07, ~ubzeme <ubzeme@git.sr.ht> wrote:
> >
> > I recently bought a Mac with M1 Pro chip, and use QEMU to setup a Linux
> > virtual machine.  QEMU crashed when I started a VM with HVF accelerator
> > enabled and with the device, bochs-display, added.
> >
> > After digging into the source code, I found that dirty-tracking in HVF
> > did not work properly, which made QEMU crashed. Therefore I made this
> > series of patches to fix the problem.
>
> How does this series compare with Alex's patch to enable
> hvf dirty tracking for target/arm/hvf ?
> https://patchew.org/QEMU/20220203142320.33022-1-agraf@csgraf.de/
>
> thanks
> -- PMM

