Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54082173DE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 18:24:49 +0200 (CEST)
Received: from localhost ([::1]:58434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsqOm-0002XA-Uk
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 12:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsqBF-0002aj-WC; Tue, 07 Jul 2020 12:10:50 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:33525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsqBD-0007k0-Q7; Tue, 07 Jul 2020 12:10:49 -0400
Received: by mail-il1-x144.google.com with SMTP id a11so28235326ilk.0;
 Tue, 07 Jul 2020 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X+Qd1NYmOH3wB1S0J4kZx3z2S+y+z4eBLTSOpPfCw48=;
 b=NOIdLairACBw6RLd04+arzVGy13JbUrdriKVXl2kyKZEfvHbt/Fa6IW0IZ5jzkDk1y
 uyPUK3boVRjpI0wfH3XUgRoFQ06QMD/rBumjgL/CLa0u4zD+PMwj2lZVFPMUPpyyGVcc
 z2qO3ac6QyluPOW8BAbFIpwd2BW9kPtiUqhmLsz12UWjJvGqUfCUIEGZ98sZAhA+S7qo
 SdMb57iC3b2ajFLj12zJgcQBAJDtpDKMeJ0oyFtZot/vNEue/SHgKWBSaRnw0K0M6J1H
 b1h2KXH5drhveGw3/ZL3vRYNGEDq+zsKfKxoeBfK+ZZpA0ZWZ44LM0gTZDnvyAT02O7C
 pNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X+Qd1NYmOH3wB1S0J4kZx3z2S+y+z4eBLTSOpPfCw48=;
 b=nI5ZP8NZNUqVsbC+Y4PakB9XfGC+EQji5tPAwjpNf67zeLTnBUdQ8cHsc33+KHiHL+
 YS7hGb7yyapA0ywM5fFv8yl/1edtr5sUHJQs4/pGGKxpDg3F3EVdHF3lfMsQxC0r9di7
 pqFqMTX3Y19oFbhIxZ/APhkyCBLb+h7NtgDv1shrm0vzP+jOHF+A51OobnGk6EN8Btgw
 X6ay+9RwRXzbaT+6Ij4ri6ZyjNeH0F+cfOwKjAh+tZ2xWHBJHHHv+UgsUMhu4mk8Rz8p
 5wPXfQ9pTW7nSOLJwOqv0BxRbtVM5+UtYDK4Fx9dZgEm0n/3pUwUKRbSVrQXzVvsxvDi
 7UcA==
X-Gm-Message-State: AOAM532BMe49QJJyiN9BEQSKWDOfB6nlnp0o63b11LhQ3NZi1D0pe9Fg
 tjAo46ZGwRpyOgJNhuDLZTFKHPyFY/KOWqaRMAM=
X-Google-Smtp-Source: ABdhPJyndBw+vr8IcYF1Uh/gFFmV6Z08Uv/bA6PfdcVqY37MOqLsQDw6WiSaqMi4ow0iMFxBKSsCliQGvDQdyluscac=
X-Received: by 2002:a92:c213:: with SMTP id j19mr37182707ilo.40.1594138246327; 
 Tue, 07 Jul 2020 09:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200707062308.4531-1-f4bug@amsat.org>
In-Reply-To: <20200707062308.4531-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Jul 2020 09:00:58 -0700
Message-ID: <CAKmqyKMadFqy-jF8KmJEj0dzEHxvBordB6Teg+qnFErJesnLvA@mail.gmail.com>
Subject: Re: [PATCH] hw/register: Document register_init_block @memory_size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 6, 2020 at 11:23 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Document the 'memory_size' argument of register_init_block().
>
> Fixes: a74229597e ("register: Add block initialise helper")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/register.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/hw/register.h b/include/hw/register.h
> index 5d2c565ae0..fdac5e69b5 100644
> --- a/include/hw/register.h
> +++ b/include/hw/register.h
> @@ -181,6 +181,7 @@ uint64_t register_read_memory(void *opaque, hwaddr ad=
dr, unsigned size);
>   * @data: Array to use for register data, must already be allocated
>   * @ops: Memory region ops to access registers.
>   * @debug enabled: turn on/off verbose debug information
> + * @memory_size: Size of the memory region
>   * returns: A structure containing all of the registers and an initializ=
ed
>   *          memory region (r_array->mem) the caller should add to a cont=
ainer.
>   */
> --
> 2.21.3
>
>

