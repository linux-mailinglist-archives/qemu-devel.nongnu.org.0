Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C65A3C3FA2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 00:21:43 +0200 (CEST)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2hpV-0007Fo-Nu
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 18:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1m2hoO-0006Lk-Ir
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 18:20:32 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1m2hoM-00076r-RY
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 18:20:32 -0400
Received: by mail-pj1-x1034.google.com with SMTP id n11so8997398pjo.1
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 15:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Aes2cNB2UpupFY1FHzBfwajYK69jrIFJZ2B2gMXsnpQ=;
 b=hIyYjSZsltMDy7iqbM/y4J3cDGjJkFcoLZeYRelhz+X5w4YgahvtgvLjcgCyWW0LkZ
 Q+FjBbsA7vxEWRl7ccyulafsJiCP4RJzEePs/6mhqXIAZ+Zssab5LNzasX5wjVkHNpCB
 04hJ5gca/nLJ1EloomuNHBemRBP01psptsy+Vhz0rQWkOc/a/Pv8nkfkUrK9lT1Q7DN2
 IlsIrJrONx/0wHRnFFlaoxdwF44y7TmGwsnfF9dvY96XUzCO5Rppg97khveJeITIBCDX
 DB1adhUzcBaFidj9CkgyHvSB1evthDDgRYu4V+LkPOHBHnlm23rLwmqhZMyC6kjp1EnE
 zCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Aes2cNB2UpupFY1FHzBfwajYK69jrIFJZ2B2gMXsnpQ=;
 b=Pw4N5fZ8c3rSDkh4/M1j+x8zvWdhnFzs0XGob95jB+s+rmPcdIfJHxXmeS8v9IdOdr
 Eg6zpohGSPJv62QqvCkJGfC75vLd7ke8BGO5hdZ9IoeEPJ6R12yW+StFFwP9Eq52QpOf
 Y8HptFZP3t3q7Rpu6UFKxyJtdL9s2flKnwRhHSXvZ4qFqNoiGJeSJAZx0VdsUkmUngY6
 oGjUGyI7UkO/BWTL53Wigl8Xnga792NYQHK/9sFINmGKZ8RXX4JT0+USYB5EvAjU2RFa
 mtISW0CYXur8Gmpj3D8y2WR7Nlbl7thw78VVCBCB477LaDVYg+52Ix67ghkHOgZfl4aY
 bACw==
X-Gm-Message-State: AOAM533Rj9m15h5cpJU5ouDKVz8aHLLcagpAtY3fqpKKpD0K6edi4J5J
 l7DyJ+u1pT1j5Ng8XWrHs0M=
X-Google-Smtp-Source: ABdhPJyr7MolRzT4bKxPSK8+FlYRx1fA6MyU0Gc3QDuTBznWZeLjn7cccU/7O7Vg1nUdEUpE3b4aFg==
X-Received: by 2002:a17:90a:17cd:: with SMTP id
 q71mr31770401pja.47.1626042029395; 
 Sun, 11 Jul 2021 15:20:29 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id n14sm3007282pfq.177.2021.07.11.15.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 15:20:28 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Mon, 12 Jul 2021 06:19:37 +0800
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: intermittent hang in qos-test for qemu-system-i386 on 32-bit arm
 host
Message-ID: <20210711221937.dhklrohhkvlypl5h@Rk>
References: <CAFEAcA-L5kztvCiS-Y+_LDiaFgWzuCpPYN1-cHNY9Q8qpi538Q@mail.gmail.com>
 <20210711120854.andcppzuxo6ztykd@Rk>
 <CAFEAcA9tF7pU1uEC06tppkKCL7m+5OYWm8T5MO_qF4P2P_UuOQ@mail.gmail.com>
 <d21e1a9e-1df4-4fce-d6de-e7a15131b684@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d21e1a9e-1df4-4fce-d6de-e7a15131b684@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=coiby.xu@gmail.com; helo=mail-pj1-x1034.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 11, 2021 at 06:23:41AM -0700, Richard Henderson wrote:
>On 7/11/21 5:16 AM, Peter Maydell wrote:
>>On Sun, 11 Jul 2021 at 13:10, Coiby Xu <coiby.xu@gmail.com> wrote:
>>>
>>>Hi Peter,
>>>
>>>On Sat, Jul 10, 2021 at 02:30:36PM +0100, Peter Maydell wrote:
>>>>I've noticed recently that intermittently 'make check' will hang on
>>>>my aarch32 test system (really an aarch64 box with an aarch32 chroot).
>>>
>>>I have a newbie question. How do you do an aarch32 chroot on an aarch64
>>>box? At least, this issue seems to be not reproducible on an aarch64 box
>>>directly. I specifically ran the qos-test for 5 consecutive times and
>>>each time the test could finish successfully,
>>
>>Your aarch64 host CPU needs to support aarch32 at EL0 (some
>>AArch64 CPUs are pure-64 bit these days). The host kernel needs
>>to implement the 32-bit compat layer. It probably also needs to be
>>built for 4K pages (which mostly means "not RedHat"). Then you can
>>set up the 32-bit chroot however you'd normally set up a chroot
>>(for Debian you can do this with debootstrap; other distros will vary;
>>schroot is also a bit nicer than raw chroot IMHO.)
>
>If you do have a kernel built with 64k pages ("RedHat"), but you do 
>have a host cpu that supports aarch32 at EL1 and EL0, then you can run 
>aarch32 under KVM.
>
>The command-line I use is
>
>../run/bin/qemu-system-aarch64 -m 4096 -smp 8 -nographic \
>  -M virt -cpu host,aarch64=off --accel kvm \
>  -kernel vmlinuz-4.19.0-16-armmp-lpae \
>  -initrd initrd.img-4.19.0-16-armmp-lpae \
>  -append 'console=ttyAMA0 root=/dev/vda2' \
>  -drive if=none,file=hda.q,format=qcow2,id=hd,discard=on \
>  -device virtio-blk-device,drive=hd \
>  -netdev tap,id=tap0,br=virbr0,helper=/usr/libexec/qemu-bridge-helper \
>  -device virtio-net-device,netdev=tap0
>
>I believe that I had to perform the install under tcg because I 
>couldn't find the right magic to boot off the debian cdrom with kvm.

Thanks for the instructions! Since this issue is also reproducible on 
qemu-system-i386 guest x86-64 Linux host according to Peter's new email, 
I'll check it on i386 guest first.

>
>
>r~

-- 
Best regards,
Coiby

