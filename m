Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34207306CB3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 06:21:45 +0100 (CET)
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4zkV-0003BP-RZ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 00:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1l4zjN-0002ji-Qq
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 00:20:33 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1l4zjL-0002Fr-Af
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 00:20:33 -0500
Received: by mail-ej1-x62f.google.com with SMTP id bl23so5955693ejb.5
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 21:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0EE3WdBhuLL9IYYc+G01qYzv1cSQ1fNPI7rfPULkxrQ=;
 b=sER1JWgJmcwuLzi6pWd5yX6KKMKAeB3aiuDnkcmFLE41twOkmfLx2Xu78LnYvwjAcL
 JNxqSNefTIhaNtkMQjMuCPaJRP+HltDJBS/Ddw1eQBVS2huQmddic551J+98SHGRiiM2
 QSW6/8YOcLNoQrsGoa+ibx71vlF8NJJeFFYyQoVrH46Cis2rTrEw++AWB5NXjDnVeMLR
 hxCpvPMYVNVFZkBmyR18v9DgDeFob8AjD5qXC6U4KCRepfxqg4Wzl5Wqk+0Gm1N+fCsx
 4HMNI+M29H4FIBMiHqwg4WFz4WMKYDzQxEAhlgz0EJJ9b8C9lVgVLcoLSZx76E3wDkiy
 l98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0EE3WdBhuLL9IYYc+G01qYzv1cSQ1fNPI7rfPULkxrQ=;
 b=ahMQQPtq/8MF1Xx/3pkmE8z2LOQ54RrxSFXe7fJpahQ5Izs9UK589sdO6q1MSdp1KC
 3Q9K2xzyzfXdvzDxJdir1jX0Dn1qVfN0XUrK4e+84wz+LkNBEsjw4BxKWqvRMHRWVBu3
 VXOXKPU77w3FJDeKhzFQJAR94cKDNTCWDCP5WQVg9tDgmXXtiACV/c5QEwwyGwsI3bMA
 Qc2EpxnLgrieTIXLvm7phEGCVkW7ankYU16pXpkIINHYVJVTtBVLRJ8y0Np+pM49tZHe
 XKzHTJ8QSpiLR0zUu1EwDyiL5NlhFTdNRR4abwjuRprTw0PUI+8rBSDCYgMTs+R4qEw9
 1LLw==
X-Gm-Message-State: AOAM532Q8EVxLzC3eSr1xivHUO2rvlKY48VpTwU7COHCOCejBw9HEB/w
 RiTXrzwiPUJenLj9tVSE0SyZGSFt23fGSYwvaOhvdA==
X-Google-Smtp-Source: ABdhPJxkbW3nCRTzil6zk0lvKGDOm9ScB8biJhpJa/NxxvbiRcxNb+y6gWLrg/OhExBsrNYY+jowuqxXzevanHSXoXY=
X-Received: by 2002:a17:906:e085:: with SMTP id
 gh5mr9588476ejb.418.1611811223496; 
 Wed, 27 Jan 2021 21:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20210128035146.gt7ir3u73h5coxrr@mail.bwidawsk.net>
In-Reply-To: <20210128035146.gt7ir3u73h5coxrr@mail.bwidawsk.net>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 27 Jan 2021 21:20:21 -0800
Message-ID: <CAPcyv4gbfrHM0L8WFU2jKLJw5DFxj5mpEOi62wyxAoKsQLMdhQ@mail.gmail.com>
Subject: Re: [RFC] Set addresses for memory devices [CXL]
To: Ben Widawsky <ben@bwidawsk.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=dan.j.williams@intel.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Qemu Developers <qemu-devel@nongnu.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 7:52 PM Ben Widawsky <ben@bwidawsk.net> wrote:
>
> Hi list, Igor.
>
> I wanted to get some ideas on how to better handle this. Per the recent
> discussion [1], it's become clear that there needs to be more thought put into
> how to manage the address space for CXL memory devices. If you see the
> discussion on interleave [2] there's a decent diagram for the problem statement.
>
> A CXL topology looks just like a PCIe topology. A CXL memory device is a memory
> expander. It's a byte addressable address range with a combination of persistent
> and volatile memory. In a CXL capable system, you can effectively think of these
> things as more configurable NVDIMMs. The memory devices have an interface that
> allows the OS to program the base physical address range it claims called an HDM
> (Host Defined Memory) decoder. A larger address range is claimed by a host
> bridge (or a combination of host bridges in the interleaved case) which is
> platform specific.
>
> Originally, my plan was to create a single memory backend for a "window" and
> subregion the devices in there. So for example, if you had two devices under a
> hostbridge, each of 256M size, the window would be some fixed GPA of 512M+ size
> memory backend, and those memory devices would be a subregion of the
> hostbridge's window. I thought this was working in my patch series, but as it
> turns out, this doesn't actually work as I intended. `info mtree` looks good,
> but `info memory-devices` doesn't.
>

A couple clarifying questions...

> So let me list the requirements and hopefully get some feedback on the best way
> to handle it.
> 1. A PCIe like device has a persistent memory region (I don't care about
> volatile at the moment).

What do you mean by "PCIe" like? If it is PCI enumerable by the guest
it has no business being treated as proper memory because the OS
rightly assumes that PCIe address space is not I/O coherent to other
initiators.

> 2. The physical address base for the memory region is programmable.
> 3. Memory accesses will support interleaving across multiple host bridges.

So, per 1. it would look like a PCIe address space inside QEMU but
advertised as an I/O coherent platform resource in the guest?

