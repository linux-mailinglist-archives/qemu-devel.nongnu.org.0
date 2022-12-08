Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0682B6474CB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 18:01:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3KF9-0002Sc-IC; Thu, 08 Dec 2022 11:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1p3KF7-0002SI-Ew; Thu, 08 Dec 2022 11:59:29 -0500
Received: from mout.gmx.net ([212.227.15.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1p3KF5-0006C5-8P; Thu, 08 Dec 2022 11:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670518758; bh=QukUxVqhkej0RqzBcfcoXlCNLMO5GAAlg4VaR29XBfI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=naTN8ReON9B/QGBWGd43y92uceBFyX32KJp5LRFWDEGWmJhWPdUd51/gH2D4i1vjo
 Ue4TNBtbnFlu8VuGOeziVqhZpaWwivu/kcEyf85zZpKjHlzb8XdHcYhGRNAUj55wEt
 HAya5sAnM64OrzybZN5Nrz+DuUx1S2GmNLsOCue3uDLLGtLjtW//fnuAPOZH7KbCJo
 zEDy+d2KAqtpMoZ3AlG4ILlPGLJy3wgAqg4F24mvyYXpU+nJb+OHP8Z7WnYU4+oD5f
 ulHEDfiqKZommgboeKSiNJL1fgGiOghrkixQ/l9WBkjBRicpCym/crAe18I98vt11W
 R9cXZeQSYaaSA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([92.225.24.60]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlT2-1oddr93kOs-00jv8z; Thu, 08
 Dec 2022 17:59:17 +0100
Message-ID: <c31be243-e380-eabd-f387-0b0923d4f6c1@gmx.de>
Date: Thu, 8 Dec 2022 17:59:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu.git 0/1] hw/arm/virt: add 2x sp804 timer
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <166983457648.13115.4940680286975412418-0@git.sr.ht>
 <CAFEAcA8csAbbdvLoq+202CAQ0PLWdHaBTfADtqx33c=DNU-wSQ@mail.gmail.com>
Content-Language: de-DE, en-US
From: Axel Heider <axelheider@gmx.de>
In-Reply-To: <CAFEAcA8csAbbdvLoq+202CAQ0PLWdHaBTfADtqx33c=DNU-wSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:0jb2QbDr649fH969MFou2Y+GTxuVjqdz8oJyzfZ2vErDfnKq80n
 ddsBBduM7JM5X7Tvf2697M9q3AdPKDTI67A7RHnoC+0q6YqNnzz49IUNm2UWzBQgvXzyMCl
 M+xc2NYBeL7LTgg2CuA12r3d5LoqoDvTYe4swy2Qs4oEp5k2pqJvYUh3Io0HdhsUE6fNrB8
 v6bPcrHMAvgLBAoj1wnGg==
UI-OutboundReport: notjunk:1;M01:P0:lrwoESYrS/c=;x4NqSGAJ6N5zzBbE62EAnwrJD3j
 XanDtQQcCCHQNWLEp8qG+T4NZyvxjkEdGkNSUvTMnY3WpPHEWtfgwFxlhXWd5C5i/QHN7EKm0
 EgEH4GHEhmN1Xmm5lFRoTjEhDnkmV6WuFnrDuX2ypeKkYRLXu4f3+THYE7dS1Kg+gQnxzzIjG
 nFsCQeklObuaCf0U7FUkwlcX6NNKupLupIBOL5qcXTThgY4YkK832VvWeAWgKh1CG6JIBAcDE
 5mgDc9jKGgLDhyQmzMAuHJX2u7VG39VG5T6RYVAokYXl7iQfpAps4bJ3eAVfcKJrbcKvCavAc
 UcP4Yvog/JAY3QhRhTjw80FwypKgA1CGY3dpqcYYhHSC/OdNDxGHyBeJ9eAey7dycqC6yT4ug
 dGiJ4GvXgzwzMeevebQf+QUJ1ZvdRJLDIENGhTCz5r1Y2pnagazxVICd/6TeKPFV35nsxSNv7
 wq5PgZNmAB6nswMBEbSW2FF5B+HOPta7zD/aQ6vsDxOzvbKqlMJaB/s8VXO9pSoDPpzQIGBz6
 ABHFdKJnMVEAU/mZ0bvbnY2cbJ7lWf4y+HgqAeDSiFJ1cgW51lHPxgJQatwklTWUaQ3ohADGj
 L94ujXhFDGPYv+G+YFF1cHO3wUoLgyjttfzoWlKzSM+KdQND0kKKhnCMlysW90K+N1fMuPxeZ
 4bqRFUS2G/qMIk7BZH6IercGFekyYcw05lx+QEPEIKKOnQcBwJnN0OD1+PukchfiDM1ZavviW
 O2eC8tFnWVLoZ+n2PCMMLyEFIpMJRvKiFLBsOvAsgC/tRb1rqFn1iJ+8pVs5MxyAIUSbVmuE/
 fEwFnqnAUtOGnIYA0xVe3Ib8dDROO8NX1Q3W9jWQR1CgDuAdzur6ZT56lKXYnrI5n2OLlfIGO
 IlL6oOWiqqL45rr4Bg+rP496wnjP74qAcZnFjE7GTSi40PjppEKciLMYTeUYCcAQqMJgzYAX/
 Ul888Fd2pRGRcugU13U6cGToxsM=
Received-SPF: pass client-ip=212.227.15.15; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.266, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter,

>> This patch adds timer peripherals to the arm-virt machine.>>
> Is there a reason you can't use the CPU's built-in generic timer
> device ? That is what typical guest code does on this system.
> I'm a bit reluctant to add more devices to the virt board
> because over time it gradually gets increasingly complicated,
> and every new device model we expose to the guest is another
> thing that's part of the security attack surface for guest
> code trying to escape from a KVM VM.

For the seL4 specific case, this is currently not possible in
the standard configuration. It's only exposed for a special
debug and benchmarking configuration.

The catch we have here is, that the virt machine is a nice
generic ARM (and RISC-V) machine for OS testing purposes also,
but it sometimes lacks things (see my other patched for the
UART). So, I wonder what would be the best option to continue
here. Should we consider defining another generic machine
profile that is more suited for the system emulation use case.
This is what OS developer could use then. Or could the virt
machine get some config parameters to customize it further.
So the "Machine-specific options" would  support a "sp804=on"
that would add two timer peripherals then?

The really cool customization option would be passing a DTB
to QEMU that describes exactly what "virt" machine is to be
emulated. I think the Xlinx fork used to support this feature
partly. Not sure if there was ever an attempt to mainline this?
But it would avoid running into a command parameters hell for
customization options.

Axel



