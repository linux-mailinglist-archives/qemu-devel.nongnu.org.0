Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FB3136471
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 01:53:02 +0100 (CET)
Received: from localhost ([::1]:39110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipiXr-0008Bj-V1
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 19:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1ipiWd-00076K-HG
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 19:51:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1ipiWb-0001Ht-Jp
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 19:51:42 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40710)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aik@ozlabs.ru>) id 1ipiWb-00018V-3E
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 19:51:41 -0500
Received: by mail-pl1-x644.google.com with SMTP id s21so150832plr.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jan 2020 16:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vmhacpGVTEstbLuwNM4yFQ4ANRKNIAfibaUAOsi+1zs=;
 b=1DsxijWCNKhY0r3Qth8PDpo6zIEAF9SiB0Xp040oIiMY1gYoAu5dz+jUooDUI3w97s
 6WK6vVYxA1RlNBygR35esXtsfznKM8Q+UAYWHSnZn5NV11IzcRKc+H4xhN0HoLieyrOc
 wsR4XyImyGRvhjVmQXlDx9U98FqmuwNoaM2bwXU+voQvyAvR73TUxJrysV4JPcolPsFK
 knt0bZ1Yk8PP7l+ctnQQwQbzGfyPQpTd+F5MTmLdI2YEklkztJTZYFr3wST81tT98rm4
 h+QdVtcw3FnUSzGaGN/IWQFC6oE3OOG1CnTJh5w8SLuEYy2nU7XnuVGaA4Y+nvbNw9Lo
 jNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vmhacpGVTEstbLuwNM4yFQ4ANRKNIAfibaUAOsi+1zs=;
 b=HJg2Q07DnOrNbevWJBIkLdnhwRQ0aatps9GRnNAEqHlx8FQbOcwVe7yY5B36Dqr9t6
 dbhV9D7RBw9YwSmiimGNsDuaQAbpZFLSmktRPPzDQuvZ106xl2qBhsFsD82OiiIVcs08
 Ba9zM+Z7AUDJhvZO2dY4HoJ/ciFDhwejJskhRNrMSsK6Uqh9d6ZqJxG/NP4VXsVHlFCH
 CXIIr7UyNfkDPBdQF09QGnUH4mBEuJIlRoNzslgg4csvkTiB+wLF5tmjTkovp7rhAYPN
 LN2Ans7XGoKGlMgf7YRD8PI/cIzhW78lsuvQXPOx3yLiYgF7TnWXydoR1ZiOH9MGZAKX
 mD/A==
X-Gm-Message-State: APjAAAW0dTDo87a7r3GYzTUVFu9OK2jHRrvqwoJdF3QK/jb/MS5Yg5mo
 y/lJwnFQDdgs/PKREG/F1bQirg==
X-Google-Smtp-Source: APXvYqzEuXRlIPhUYaGLnvThWk+TSfmkUk7QEAbrUlmrMz1+gAmXXO2eDw1NPP7Z7JOHf6A4DO+CQQ==
X-Received: by 2002:a17:902:654d:: with SMTP id
 d13mr836970pln.187.1578617496311; 
 Thu, 09 Jan 2020 16:51:36 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id u7sm236880pfh.128.2020.01.09.16.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2020 16:51:35 -0800 (PST)
Subject: Re: [PATCH qemu v4] spapr: Kill SLOF
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
References: <20200108061856.4554-1-aik@ozlabs.ru>
 <b4011a6b-d502-b514-84ad-4e6a1580449d@ozlabs.ru>
 <75b2a298-b549-dcc9-519b-7bf7c388110b@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <684e7d31-04d0-3176-5de2-c817ce1aedf3@ozlabs.ru>
Date: Fri, 10 Jan 2020 11:51:32 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <75b2a298-b549-dcc9-519b-7bf7c388110b@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/01/2020 10:32, Alexey Kardashevskiy wrote:
> 
> 
> On 10/01/2020 10:05, Alexey Kardashevskiy wrote:
>>
>>
>> On 08/01/2020 17:18, Alexey Kardashevskiy wrote:
>>> The Petitboot bootloader is way more advanced than SLOF is ever going to
>>> be as Petitboot comes with the full-featured Linux kernel with all
>>> the drivers, and initramdisk with quite user friendly interface.
>>> The problem with ditching SLOF is that an unmodified pseries kernel can
>>> either start via:
>>> 1. kexec, this requires presence of RTAS and skips
>>> ibm,client-architecture-support entirely;
>>> 2. normal boot, this heavily relies on the OF1275 client interface to
>>> fetch the device tree and do early setup (claim memory).
>>>
>>> This adds a new bios-less mode to the pseries machine: "bios=on|off".
>>> When enabled, QEMU does not load SLOF and jumps to the kernel from
>>> "-kernel".
>>>
>>> The client interface is implemented exactly as RTAS - a 20 bytes blob,
>>> right next after the RTAS blob. The entry point is passed to the kernel
>>> via GPR5.
>>>
>>> This implements a handful of client interface methods just to get going.
>>> In particular, this implements the device tree fetching,
>>> ibm,client-architecture-support and instantiate-rtas.
>>>
>>> This implements changing FDT properties for RTAS (for vmlinux and zImage)
>>> and initramdisk location (for zImage). To make this work, this skips
>>> fdt_pack() when bios=off as not packing the blob leaves some room for
>>> appending.
>>>
>>> This assigns "phandles" to device tree nodes as there is no more SLOF
>>> and OF nodes addresses of which served as phandle values.
>>> This keeps predefined nodes (such as XICS/NVLINK/...) unchanged.
>>> phandles are regenerated at every FDT rebuild.
>>>
>>> This defines phandles for VIO devices to have phandle assigned to
>>> the default stdout device at the point when we write "/chosen/stdout"
>>> which an ihandle which the OS uses to write to the console.
>>
>>
>> And I do not really need to preallocate phandles for stdout as it is a
>> leftover from when I populated /chosen/stdout before populating VIO
>> nodes, now /chosen/stdout is added at the very end. Thanks,
> 
> 
> Ah noo, I do, to implement "write" to the selected stdout as I need to
> trace ihandle back to Object* and  object_resolve_path() does not know
> about FDT path, it is /machine/peripheral/svty0 in QOM. The commit log
> needs an update, or this needs a fix but I cannot think of a nicer one.
> Thanks,


I just might extend instances to do real instances, i.e. associate
ihandle with phandle _and_ Object*, I just need a helper to find Object
which matches what qdev_get_fw_dev_path() returns. Fun :)


> 
> 
>>
>>
>>
>>>
>>> When bios=off, this adds "/chosen" every time QEMU builds a tree.
>>>
>>> This implements "claim" which the client (Linux) uses for memory
>>> allocation; this is also  used by QEMU for claiming kernel/initrd images,
>>> client interface entry point, RTAS and the initial stack.
>>>
>>> While at this, add a "kernel-addr" machine parameter to allow moving
>>> the kernel in memory. This is useful for debugging if the kernel is
>>> loaded at @0, although not necessary.
>>>
>>> This adds very basic instances support which are managed by a hashmap
>>> ihandle->phandle.
>>>
>>> Note that a 64bit PCI fix is required for Linux:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735e
>>
>>
>>
> 

-- 
Alexey

