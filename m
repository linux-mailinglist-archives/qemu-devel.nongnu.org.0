Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A723E35670A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 10:42:23 +0200 (CEST)
Received: from localhost ([::1]:54540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU3lW-0007o2-3o
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 04:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lU3jW-0007Bg-KY
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 04:40:22 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lU3jR-0001pb-Ct
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 04:40:18 -0400
Received: by mail-wr1-x434.google.com with SMTP id q26so11298728wrz.9
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 01:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=x7uiHnU0qMg0vQcYk21N2sBbGHzjkiYPD6V0cUWdzWs=;
 b=d642DLlUbntgNKDMp4RQ0YZQ28X+8T4UJNFX+8a9RRV86CkhIKfpCs416VRsQ3vg2f
 siI1b5KSx/NNgf4JpA/I6DD2jMHgIY4tIuCkJ2num7vPEgfbVkzCONWX2a1GfxQT1eXt
 QNnPWaYvoVpcNd96PYLFgnVUycPUaM2AVmnRvSGNE/lIcPHlv0HKArtOa1kwpAZ+n5u6
 7JjjWGS48IDf86i7CKPmlwh0s9YQs3sHUHxQVVF558nv30Q2VeXGQZVQD0HBdqDoT/i6
 yxXxjk1VWrYRyK7qLEp2AuBxOYGh+bSwJoGhK6Us1gsbEPzgk09lajA6tqWAsuw6zcpG
 KKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=x7uiHnU0qMg0vQcYk21N2sBbGHzjkiYPD6V0cUWdzWs=;
 b=b6ywvWsZlMgafRgDMCuYysYtYI8p7UPJTBt5Eqo26u/jSQtFE0dOlaExvcaDe5qmW/
 UhJ4bjxJxcfzvohz80JFp3ZfC1CRnKVk6bZsGpujurRCrXAb8BYuww30bumJMENGYitz
 TZsxH5My8NduuvtbGXp8AktREkZz0eNNSDkWnd0wB5ItcNPbxVQhbTMhVi9vNmgi/Zie
 Qg8a8ThZMOr/J4Y4WadEx892b89J7dMQ5CwNMLb5LvlUjK0D6FEiJc3ZJABFepvnbcdg
 EyNXbRhsWCqKB4KPGmZ0obm3sUvhYMkEk0zGE0wgmfH236x0pvslWKjtQ+Igw6rC7jME
 WQ2g==
X-Gm-Message-State: AOAM531Eh7o7RjFLNjGDhQD8fcXcA/l9yx434y4XS9NMWOxBmnGV+wIj
 mnemPuEvbvct9cToGmDPWVwaQA==
X-Google-Smtp-Source: ABdhPJwwokN6gp/q6H2z26TSesBZuIyYhvbPAOHjKnxHg+vef5U0CsF29dt2KMCTsNug0t1/+gh92g==
X-Received: by 2002:adf:ba87:: with SMTP id p7mr3014781wrg.298.1617784811343; 
 Wed, 07 Apr 2021 01:40:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f8sm15620045wro.29.2021.04.07.01.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 01:40:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 597121FF7E;
 Wed,  7 Apr 2021 09:40:09 +0100 (BST)
References: <87mtubwnsq.fsf@linaro.org>
 <CAFEAcA8V94ac+UNcP6nKfNJQAxSzeY_dbpZx1tKa0xnXHhekEA@mail.gmail.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Could we document exact steps for loongson3-virt in the manual?
Date: Wed, 07 Apr 2021 09:37:36 +0100
In-reply-to: <CAFEAcA8V94ac+UNcP6nKfNJQAxSzeY_dbpZx1tKa0xnXHhekEA@mail.gmail.com>
Message-ID: <8735w2wkra.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 6 Apr 2021 at 14:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> Hi,
>>
>> I was trying to bootstrap a Loongson3 Debian image but ran into some
>> roadblocks. Philippe pointed me at:
>>
>>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg768848.html
>>
>> which gives a bit of detail but elides over details such as how to
>> handle block devices. AFAICT it should support virtio-blk although maybe
>> Debian bullseye doesn't support the target, it's hard to say:
>>
>>   ./qemu-system-mips64el -M loongson3-virt -m 4096 -nographic
>> -blockdev
>> driver=3Draw,node-name=3Dhd0,discard=3Dunmap,file.driver=3Dhost_device,f=
ile.filename=3D/dev/zvol/hackpool-0/debian-bullseye-mips64le
>> -device virtio-blk,drive=3Dhd0 -kernel ./vmlinuz-5.9.0-4-loongson-3
>> -initrd initrd.gz -append "root=3D/dev/sda1 console=3Dtty0 nokaslr"
>>
>> Gets as far as:
>>
>> [    0.008641] printk: console [tty0] enabled
>> [    0.009507] printk: bootconsole [early0] disabled
>>
>> and then just goes silent.
>
> Oddly enough somebody on stackoverflow had the same problem for
> a different board (malta) the other day:
> https://stackoverflow.com/questions/66904366/qemu-system-mips-stuck-after=
-console-tty0-enabled/66910192
>
> As Jiaxun says, the problem is that your kernel command line says "send t=
he
> console output to the virtual console on the graphics device (tty0)" but =
your
> QEMU command line is using a serial console and not trying to use graphic=
s.
> So as soon as the kernel gets to the point where it can honour your reque=
st
> it disables the early-boot console and enables tty0 and then you don't
> see anything any more :-)

Doh - should have spotted that. I guess the -nographic doesn't prompt
the kernel enough to warn about switching to a non-existent graphics
device. I can get to the installer now although it fails later failing
to find kernel modules. I suspect this is a Debian problem with a
mismatch between installer and archives.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

