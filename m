Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027293565C4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 09:49:35 +0200 (CEST)
Received: from localhost ([::1]:56998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU2wQ-0002N2-3o
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 03:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lU2vL-0001u2-7g
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 03:48:28 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:37610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lU2vI-0004J5-AZ
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 03:48:26 -0400
Received: by mail-ed1-x533.google.com with SMTP id s15so4680223edd.4
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 00:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v02FlDW9VZ25vjMFoe/JgHQKNpzmymT36sEZ4H/Kv/o=;
 b=FdVlBpeYx7jRFtDkIrWWhS5v4jun1rxidufd7P7/VM3LL4WoV0zkv7gR3AhUj5oMoB
 yyDquVE6efeuT7lC7+A+ehsZH+s8/IX/ZgRaTIn/iynUArcoBAA3si5KZUMWtWawS05m
 n6gIhujWUpUUCJZ1+T/LW9eu9TxE4lS9gQE+F+0VAHDfn7iFRmSN+zy5+X5ODyGzSaKi
 svDEC9cn8+I5/GqlcHfeQMr+4m1mAFMKqxvcbl1i/PvV+hd4pdLFmS+3e7ZTUjG6NTt0
 y6OQU9IpcRfo1oxPihzHZOPB5V5wIK7Y7spgmwXJ3o7l3RrcnvnfY+1Yek10BBrsAo0/
 0uMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v02FlDW9VZ25vjMFoe/JgHQKNpzmymT36sEZ4H/Kv/o=;
 b=e0Kl3uf98UKWBELzanej+yupDfJbk7OiRa+WwtvSYUyt39uzbedegnT6bUVqfc6E9c
 JrtYQPz87hI0wsYP+bHCZ+SL4cHjr5smxgvHvrWEAaaZzJ4HSLpISz/K7I538P+2jIVk
 c6p+pk6rVzu9vsHxURB9yugWJxniF4st0N6OkRLDjUMNEIegIbgXcTCrXECcnMt8tslV
 iRqpKVTJM+zel/z0nmu87owuhEw7UwImIfig0VwXVVFxkxB9/Vj3KOAZ1SMJGYMpVKI9
 3vZQmpq4LrI8XFrA1AaiMCqnL0h2yHocDIKy/VyS2SzLWBOCPxLf11gLE/wspYWrAWu5
 osdA==
X-Gm-Message-State: AOAM533DyGdvotdvgg9lFxLGoriZkp/Up6CktZ1/UTvV1Zeu1JA/Dqc0
 /6f5zly2MkU0CrsB8bOlho+fhY2ns77LEc8kCAcmQw==
X-Google-Smtp-Source: ABdhPJw8YhGedFO+dpcmt+VfBOIV15cHUtUPjmZiFX/2q7pOLZQLTgoRGyVdEqCwItC9Qch/tdfNbCQ9ZC87kMXET2s=
X-Received: by 2002:a05:6402:2746:: with SMTP id
 z6mr2865259edd.146.1617781702680; 
 Wed, 07 Apr 2021 00:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <87mtubwnsq.fsf@linaro.org>
In-Reply-To: <87mtubwnsq.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Apr 2021 07:47:43 +0000
Message-ID: <CAFEAcA8V94ac+UNcP6nKfNJQAxSzeY_dbpZx1tKa0xnXHhekEA@mail.gmail.com>
Subject: Re: Could we document exact steps for loongson3-virt in the manual?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Apr 2021 at 14:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Hi,
>
> I was trying to bootstrap a Loongson3 Debian image but ran into some
> roadblocks. Philippe pointed me at:
>
>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg768848.html
>
> which gives a bit of detail but elides over details such as how to
> handle block devices. AFAICT it should support virtio-blk although maybe
> Debian bullseye doesn't support the target, it's hard to say:
>
>   ./qemu-system-mips64el -M loongson3-virt -m 4096 -nographic -blockdev d=
river=3Draw,node-name=3Dhd0,discard=3Dunmap,file.driver=3Dhost_device,file.=
filename=3D/dev/zvol/hackpool-0/debian-bullseye-mips64le -device virtio-blk=
,drive=3Dhd0 -kernel ./vmlinuz-5.9.0-4-loongson-3 -initrd initrd.gz -append=
 "root=3D/dev/sda1 console=3Dtty0 nokaslr"
>
> Gets as far as:
>
> [    0.008641] printk: console [tty0] enabled
> [    0.009507] printk: bootconsole [early0] disabled
>
> and then just goes silent.

Oddly enough somebody on stackoverflow had the same problem for
a different board (malta) the other day:
https://stackoverflow.com/questions/66904366/qemu-system-mips-stuck-after-c=
onsole-tty0-enabled/66910192

As Jiaxun says, the problem is that your kernel command line says "send the
console output to the virtual console on the graphics device (tty0)" but yo=
ur
QEMU command line is using a serial console and not trying to use graphics.
So as soon as the kernel gets to the point where it can honour your request
it disables the early-boot console and enables tty0 and then you don't
see anything any more :-)

thanks
-- PMM

