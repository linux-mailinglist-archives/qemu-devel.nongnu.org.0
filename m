Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A962E87A2
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 15:30:03 +0100 (CET)
Received: from localhost ([::1]:58576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvhus-0007oD-2b
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 09:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pragnesh.patel@sifive.com>)
 id 1kvhLK-00018T-DH
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:53:18 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pragnesh.patel@sifive.com>)
 id 1kvhLH-0004BO-On
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:53:18 -0500
Received: by mail-ej1-x631.google.com with SMTP id qw4so30497727ejb.12
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 05:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4h4CzpHASV+CdAekwQaUgBD7hx+1FXnti+a1XA5oAJU=;
 b=PRZW2wqpX7MoSBdUIhJQvz1yRCMUhRDE6Fp8iwJ6pLnyrbeFacI5+3y6x950tlDceD
 2pT/qJsMbQGDNqoP8pZIyn/bbHG4F+SECV0Rx8nsekGDkjr6sJ3HXmNgOEYdZLLgttCE
 o6jokymiNi4zmboHPROXGTra1BykOrbznhb/uxxKUZaC3ZfDzpTu3A8Ebn8gjZQesRXc
 qH7k7s/Xk5o8tbjVqA10GgqToHkDZZ/+kQBpxeEJZxbxTZUfTN9XG3nYhi7k1SUHoJw2
 Fvxh/KlWY0qG3NY2E+E5HHCz0JCtsnSAUm4bCnpMhPyeSyO7PWUhG9B30vJcwd3BWXJ5
 Y5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4h4CzpHASV+CdAekwQaUgBD7hx+1FXnti+a1XA5oAJU=;
 b=X3MR7dAPQEg3dcs6W7m9SyGRyTC0T6Ysx7UuYF1xgV9suzx/1zzf55WNnLxHxnZVcO
 iIjTT+qr9MzrQpJaTwzQboEPfMWUGqNwBnKucbmPfe5P45WrlB8BjPp/ZaaKlFcFFk2g
 RSTdgZzYkcPSzcqsr0chQzpnutAkfNxD4qEUN+w0Sko+388uSNu5+JXlRvJffSSfOdf9
 JffiZmzpnkIS8Um+zFWPRlhQxtlBdQhGC7KHdtUwXJOXF5Qk+20pcW5ZCZ+x0JMfpZz1
 JkyDxlUeAg8bmpuni2dBrrnQbTOAiaDgH+k+79yYKp2MYYDng+yIJIjOcl2CSHk/qMs7
 PyBg==
X-Gm-Message-State: AOAM532/iE2sXhvI0QA9aeXmuoi/Cve0g94hkLuoVbgnt7bl2aPshZU4
 9jYzTCDQAvSs8vhkhVgnRccDDH7ZFfAosopyZaVm9w==
X-Google-Smtp-Source: ABdhPJzIEytmZQxMuyrWUWYZ0gs48Wzh4UPMDH7wzPi02jHynq4gEVF/ktXcp2sW0bP5uXbhchFodoUT2yhBS2n5V4w=
X-Received: by 2002:a17:906:9888:: with SMTP id
 zc8mr58998283ejb.42.1609595594188; 
 Sat, 02 Jan 2021 05:53:14 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-6-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-6-bmeng.cn@gmail.com>
From: Pragnesh Patel <pragnesh.patel@sifive.com>
Date: Sat, 2 Jan 2021 19:23:02 +0530
Message-ID: <CAN8ut8Ka6qhPT8vKwebkaH3McCcNSB9k3HhDeffnrubFmFWcLA@mail.gmail.com>
Subject: Re: [PATCH 05/22] hw/sd: sd: Drop sd_crc16()
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=pragnesh.patel@sifive.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 02 Jan 2021 09:24:39 -0500
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 31, 2020 at 5:04 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> commit f6fb1f9b319f ("sdcard: Correct CRC16 offset in sd_function_switch()")
> changed the 16-bit CRC to be stored at offset 64. In fact, this CRC
> calculation is completely wrong. From the original codes, it wants
> to calculate the CRC16 of the first 64 bytes of sd->data[], however
> passing 64 as the `width` to sd_crc16() actually counts 256 bytes
> starting from the `message` for the CRC16 calculation, which is not
> what we want.
>
> Besides that, it seems exisitng sd_crc16() algorithm does not match
> the SD spec, which says CRC16 is the CCITT one but the calculation
> does not produce expected result. It turns out the CRC16 was never
> transfered outside the sd core, as in sd_read_byte() we see:
>
>     if (sd->data_offset >= 64)
>         sd->state = sd_transfer_state;
>
> Given above reaons, let's drop it.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/sd/sd.c | 18 ------------------
>  1 file changed, 18 deletions(-)

Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Tested-by: Pragnesh Patel <pragnesh.patel@sifive.com>

