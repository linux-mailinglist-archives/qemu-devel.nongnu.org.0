Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61614428DB9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 15:21:53 +0200 (CEST)
Received: from localhost ([::1]:52620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZvFY-0000Ck-EU
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 09:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gsomlo@gmail.com>) id 1mZvD2-0006tz-KK
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:19:18 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:44652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gsomlo@gmail.com>) id 1mZvD0-0008Vu-KE
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:19:16 -0400
Received: by mail-qk1-x730.google.com with SMTP id bi9so2489817qkb.11
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 06:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gOUXfATGpgc5Bq8IRIj/6Lh57m3WUOmx0d3iD+XQbVE=;
 b=dqqmwpm//9BhAo9J4klcnLX+d3lK3lSNsNgG8+a37Fw/hbMDC7A4lh/vgYGDbChQFR
 s+eG8/ZiIn1+lIxU3H846es2XcJBGM2RitgHUlJO528zcwT6lCjWIIMxMdEGd5omtE0n
 SZBUHDp71PEQ9Jzu7zhfVGYPfMdHZAYjrIK+pYTPp3Nn5gm/hzMgSmqk6Gdt/ZMtVRbF
 qqn9YZrLwkw46FEflITJC80n1tNjsEflojrtZq/SmV23Qb4z66XvsYLjaI4zlzxRV7nY
 i2d9phUY2cLspibXURCTRatEnP/AyTbLqROgtX9Bfrm4+6rqRburMc6RTv9p8Q7MRAob
 WvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gOUXfATGpgc5Bq8IRIj/6Lh57m3WUOmx0d3iD+XQbVE=;
 b=d/xeKbmUSYCMtpQO/A06NZKh4Gbr2lpH9d4yV9VtTukac2jEC0C/JAKSwllCmmTi3C
 NQ0MXe6kTrEK3NfZdzUGYF5pjBwZ0+2YlhEQU51PXZQOxOkxE/C+9H7yAdSIdhDHWKqU
 015Ab7PSqJ0JbO8WFE4l6zvwbaC1AMjJfC6877sMh+ovqAeLvPlngiSsCNsRxG3hphDQ
 o84d1Jy80DQNjjNmX8Y/hEGP7ZlVjXGkDZWdTawm9WFMX/Sj9V7ViIkGOCJrWixAjj+L
 0jbxF/Fi2CT+9X2tALFETBQk4JIe+6BJ+CX3nIZ8NQCDsSlG7ar98dYhTP7zyRP0+yGJ
 nG+g==
X-Gm-Message-State: AOAM532KYXCBgnKK5JymrKG2WznEk/QlVVRpnjrHBTlA2GYF7qQQyhyx
 7ExrIoGytq1fe2D+OPuwwBQ=
X-Google-Smtp-Source: ABdhPJzkBcEpFr6s/SgtAmLFB2kpl4BC7pqC4ysYCclnDyChEFfGiu8VSvqpfwe0D+SwmXMBsJQaVQ==
X-Received: by 2002:a37:458:: with SMTP id 85mr5522341qke.39.1633958353180;
 Mon, 11 Oct 2021 06:19:13 -0700 (PDT)
Received: from errol.ini.cmu.edu (pool-108-39-235-221.pitbpa.fios.verizon.net.
 [108.39.235.221])
 by smtp.gmail.com with ESMTPSA id u129sm4134712qkd.127.2021.10.11.06.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 06:19:12 -0700 (PDT)
Date: Mon, 11 Oct 2021 09:19:10 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Pedro =?iso-8859-1?Q?T=F4rres?= <t0rr3sp3dr0@gmail.com>
Subject: Re: [PATCH] hw/misc: applesmc: use host osk as default on macs
Message-ID: <YWQ5zmFtL9yrJA81@errol.ini.cmu.edu>
References: <CABgObfZvicuKLqkDqK3a4zn92LRiC_g--_oT-7sPgTO3O1PrAQ@mail.gmail.com>
 <001C97D2-2710-415C-9ECD-F8C20AB52196@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001C97D2-2710-415C-9ECD-F8C20AB52196@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=gsomlo@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, rene@exactcode.de, "Kiszka,
 Jan" <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>, "Graf,
 Alexander" <agraf@suse.de>, suse@csgraf.de,
 Paolo Bonzini <pbonzini@redhat.com>, afaerber <afaerber@suse.de>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FWIW, there's an applesmc driver in the Linux kernel, and it exposes
many of the keys and values stored on the chip under
/sys/devices/platform/applesmc.768 (or at least it *used* to back when
I last checked).

My idea at the time was to get this driver to also expose the value of
OSK0,1, so that userspace programs (like e.g. qemu) could read and use
the values hardcoded in hardware without needing to hardcode them
themselves in software.

It went nowhere at the time (the hwmon maintainer kept insisting that
"since it's a constant why don't you just hardcode it", and round and
round we went until I walked away:

https://lore.kernel.org/lkml/20121210222313.GF2097@hedwig.ini.cmu.edu/

Given *this* conversation, it might be worth someone's effort to try
that approach again. IMO it's really the most efficient: have an
already existing applesmc driver in the hypervisor's kernel expose the
desired key values (it's whole job is to expose key values to
userspace in the first place). Then have userspace read that and use
it for whatever purposes (including populating guest-facing emulated
smc devices). Nobody has to use anyone's copyrighted code or strings
or whatever. If only the hwmon folks could be convinced this time
around :)

HTH,
--Gabriel

On Sun, Oct 10, 2021 at 06:22:04PM -0300, Pedro Tôrres wrote:
> AFAIK there’s no public documentation from Apple on how to read values from
> SMC.
> 
> But Amit Singh wrote a book, Mac OS X Internals, and one of the processes
> described on it is how to read OSK directly from SMC: https://web.archive.org/
> web/20190630050544/http://osxbook.com/book/bonus/chapter7/tpmdrmmyth/
> 
> This is actually referenced on VirtualBox’s source code as the base for their
> implementation: https://www.virtualbox.org/browser/vbox/trunk/src/VBox/Devices/
> EFI/DevSmc.cpp#L520
> 
> Additionally, there is the smcFanControl project, licensed under GPLv2, that
> performs reads and writes on SMC and have all information necessary to
> implement this feature on QEMU: https://github.com/hholtmann/smcFanControl
> 
> This project was used as base for the SMC in-tree driver for Linux and it’s
> referenced there: https://github.com/torvalds/linux/blob/master/drivers/hwmon/
> applesmc.c#L14
> 
> I think we would be safe using these sources as the base for our
> implementation, given that other huge GPL projects like Linux and VirtualBox
> have been using them for years.
> 
> Best regards,
> Pedro Tôrres
> 
> 
>     On Oct 10, 2021, at 4:25 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> 
>     Can you instead provide documentation in English (pseudocode, tables of the
>     structs, etc.)? That's the safest bet.
> 
>     Paolo
> 
>     El sáb., 9 oct. 2021 7:32, Pedro Tôrres <t0rr3sp3dr0@gmail.com> escribió:
> 
>         Hey Paolo and Phil,
> 
>         I understand you concerns regarding the license that Apple open-source
>         code is distributed.
> 
>         If I restart from scratch and implement this feature based only on
>         VirtualBox code, that is distributed under GPLv2, would it be fine?
> 
>         Best regards,
>         Pedro Tôrres
> 
> 
>             On Oct 8, 2021, at 3:54 PM, Paolo Bonzini <pbonzini@redhat.com>
>             wrote:
> 
> 
>             On 08/10/21 14:03, Phil Dennis-Jordan wrote:
> 
>                 1. Licensing
> 
>                 Given that the code it's heavily based on is copyright Apple
>                 Computer Inc., licensed under APSL, is it safe including it in
>                 qemu as is?
> 
>                 If the integrated code is going to be quite so "directly
>                 inspired" (down to the inconsistent struct definition style and
>                 mixing unrelated constants in the same anonymous enum), perhaps
>                 at minimum place it in its own isolated source file with
>                 appropriate notice?
> 
>            
>             Yeah, this should be reverted.
>            
>             Pedro, I understand that you stated it was "based on code from
>             Apple" but you also said (by including Signed-off-by) that
>            
>             ---
>             (a) The contribution was created in whole or in part by me and I
>                have the right to submit it under the open source license
>                indicated in the file; or
>            
>             (b) The contribution is based upon previous work that, to the best
>                of my knowledge, is covered under an appropriate open source
>                license and I have the right under that license to submit that
>                work with modifications, whether created in whole or in part
>                by me, under the same open source license (unless I am
>                permitted to submit under a different license), as indicated
>                in the file; or
>             ---
>            
>             and this is not true.
>            
>             Thanks very much,
>            
>             Paolo
>            
> 

