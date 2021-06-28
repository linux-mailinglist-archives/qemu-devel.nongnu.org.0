Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5933B5894
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 07:21:46 +0200 (CEST)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxjiL-0005YV-Tu
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 01:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lxjhI-0004cV-HH
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 01:20:40 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lxjhF-0001Jo-8X
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 01:20:40 -0400
Received: by mail-pf1-x442.google.com with SMTP id y4so13140875pfi.9
 for <qemu-devel@nongnu.org>; Sun, 27 Jun 2021 22:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BehMR00TWERC7csgPUBeepgiV9Z63UwAjwBkt33wsp8=;
 b=Bdhlx3cDw/1AmNDhKKC8pSYek3Go5Fl3TKGvIR4bAY41TX3ThemQKgNxFECUgoGsxf
 2ua2T9nnf4++YF3SAKfemiUyDITpuW0EOCx52m4LrvYOjb1rCezOa/GSLTGFFwerfSfo
 OLiZ4V0QpdPx0FdtfJx2TkESacxMzzSgsfYD/4hJNzGWvQbLe+cR4Glk2tPoIxhQ3dRp
 8iPIjPGn6bSAqf60zcsyWNy+t9dWUDu0RLrrf4FjKNG7FXOkk4y/u7w+aIQp3Dq8klv6
 yP7P+1+MbG39Dwa82Bq1RsSwq0lcOXNouuuGVmwCdXbAZGB8HHlbGHnvAtCQUl0M91ri
 amKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BehMR00TWERC7csgPUBeepgiV9Z63UwAjwBkt33wsp8=;
 b=a5jd5ISzYmKUgelQ2emRv2AYUXelkdny6OSrebrRhHjI365cNuI4gZxdfQzU6jObdj
 TDRdIzCyS2cmdwOgRdmPUQip9xk12OIdWEXT/pBA9EfGXHk30sdNC7hHWGMLjV9Gb0vK
 eiAlzykeF6hHvi+dNmADIdqfKSSU5jU7dmD/p1JJWw+x1IitdJYUmH72+cBSJEUaU60C
 MpFmdf9/fuoczwQ/K/eGKxwtu4SUeaLbaLnu8vLCvP61ohtCUR+rUV1HizQbBi6J+lh7
 z6jQGJA8X2ZCmF4HQ75takf3QdzvIYdnsepO2l37r46uwf0hro8Jisn54+CAXnPIeA4g
 eOHQ==
X-Gm-Message-State: AOAM530Njz5rEFKcR4QJXh2Go1JQQXcaZE+/diVUSpOiSecZ0HdG1gfr
 B0KcVGd9RlK4C55N2bBx7XLoUw==
X-Google-Smtp-Source: ABdhPJybJe3IGQ3nHHby3A6Uo6pyL8xoBr907SuP8TD46Kjjx7i3oO+OVvM/j5sEO4mglw7gQ0DCsA==
X-Received: by 2002:a05:6a00:d53:b029:303:9c38:7d50 with SMTP id
 n19-20020a056a000d53b02903039c387d50mr23019151pfv.2.1624857633184; 
 Sun, 27 Jun 2021 22:20:33 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id d69sm4719443pfd.77.2021.06.27.22.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 22:20:32 -0700 (PDT)
Message-ID: <d30cdd17-a712-dbba-a018-ea942e8d7441@ozlabs.ru>
Date: Mon, 28 Jun 2021 15:20:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH qemu v22] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210625055155.2252896-1-aik@ozlabs.ru>
 <441f2ab1-8cb1-43fe-1b14-65c5f1d43a8d@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <441f2ab1-8cb1-43fe-1b14-65c5f1d43a8d@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=aik@ozlabs.ru; helo=mail-pf1-x442.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.765, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/28/21 02:38, BALATON Zoltan wrote:
> On Fri, 25 Jun 2021, Alexey Kardashevskiy wrote:
>> The PAPR platform describes an OS environment that's presented by
>> a combination of a hypervisor and firmware. The features it specifies
>> require collaboration between the firmware and the hypervisor.
>>
>> Since the beginning, the runtime component of the firmware (RTAS) has
>> been implemented as a 20 byte shim which simply forwards it to
>> a hypercall implemented in qemu. The boot time firmware component is
>> SLOF - but a build that's specific to qemu, and has always needed to be
>> updated in sync with it. Even though we've managed to limit the amount
>> of runtime communication we need between qemu and SLOF, there's some,
>> and it has become increasingly awkward to handle as we've implemented
>> new features.
>>
>> This implements a boot time OF client interface (CI) which is
>> enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
>> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
>> which implements Open Firmware Client Interface (OF CI). This allows
>> using a smaller stateless firmware which does not have to manage
>> the device tree.
>>
>> The new "vof.bin" firmware image is included with source code under
>> pc-bios/. It also includes RTAS blob.
>>
>> This implements a handful of CI methods just to get -kernel/-initrd
>> working. In particular, this implements the device tree fetching and
>> simple memory allocator - "claim" (an OF CI memory allocator) and updates
>> "/memory@0/available" to report the client about available memory.
>>
>> This implements changing some device tree properties which we know how
>> to deal with, the rest is ignored. To allow changes, this skips
>> fdt_pack() when x-vof=on as not packing the blob leaves some room for
>> appending.
>>
>> In absence of SLOF, this assigns phandles to device tree nodes to make
>> device tree traversing work.
>>
>> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
>>
>> This adds basic instances support which are managed by a hash map
>> ihandle -> [phandle].
>>
>> Before the guest started, the used memory is:
>> 0..e60 - the initial firmware
>> 8000..10000 - stack
>> 400000.. - kernel
>> 3ea0000.. - initramdisk
>>
>> This OF CI does not implement "interpret".
>>
>> Unlike SLOF, this does not format uninitialized nvram. Instead, this
>> includes a disk image with pre-formatted nvram.
>>
>> With this basic support, this can only boot into kernel directly.
>> However this is just enough for the petitboot kernel and initradmdisk to
>> boot from any possible source. Note this requires reasonably recent guest
>> kernel with:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735 
>>
>>
>> The immediate benefit is much faster booting time which especially
>> crucial with fully emulated early CPU bring up environments. Also this
>> may come handy when/if GRUB-in-the-userspace sees light of the day.
>>
>> This separates VOF and sPAPR in a hope that VOF bits may be reused by
>> other POWERPC boards which do not support pSeries.
>>
>> This assumes potential support for booting from QEMU backends
>> such as blockdev or netdev without devices/drivers used.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>


Thanks a lot for thorough reviews, much appreciated!


-- 
Alexey

