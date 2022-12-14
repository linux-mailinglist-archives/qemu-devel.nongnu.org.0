Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F1D64CD6A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 16:55:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5U57-0007SK-RT; Wed, 14 Dec 2022 10:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1p5U54-0007S3-Qd
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 10:54:02 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1p5U52-00054m-Vv
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 10:54:02 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso9556934wmp.3
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 07:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8+Z7irTtXV7W5t6ZP6Dt2MS/xr5kIkndrQ8OMv0D950=;
 b=COCtFDgJgBQrRluRHNJAdiiRZlvciEU07pMXqAmTXgsJGM+ZOk2spB5sGX623C+yir
 ZTa1WMzCba+hhj/vKSFzvF+3MzuUdDteTNTqQlm6KN2RMqkfV9GMvQ4nmgd8rr6Os0Bj
 nuW8DzKGZIoLj6xTQ5rxDSEpqscnKVP/wjITNGi0pj1Sl7Jr3w4ZsI35NxVklZ2LFDyE
 IwvJwGOW0rJ0OX3bopZkVMiNZvFWxuadj9vOv04/WRLptWBMrpU8Y9gVO5TEP4q+deBg
 6NkzxVmWagVURnkP5FPsmfAdIN28j1wdjC0WcM3OvbnqBBPDp6mz9/qKdeL25BOa+b/8
 hZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8+Z7irTtXV7W5t6ZP6Dt2MS/xr5kIkndrQ8OMv0D950=;
 b=dxTMtEYD4P1GddE8IxHOzqjwtyLRWyDOVkVydvOXIcVrhg51/vpzNYWtyNQ8UGxNey
 wtDyIwE53p/d7SNFjtnsA+jTa3rKQuRqL0lHfRrDkkDjaS0SUScfwjv2OriljMVNTivD
 xRXY1o2XUzI3n21HSkG13ipO9adlLHwNvqZFF3IWDAB4+PbrujBIz75gqU/8ty8VI7Ts
 s2ENyOkfFyYLhXeALsvO8yh4xk975ABuMQ9djqIIPKFmX177oABwfgUfxxl9zH5mflHl
 lYIEZOfEp0z6+HmN9VCrPhm2pB/E/g12Sd0p9dkPsOYNx3OAMJ4gc5DFau9wj0Y1EIRN
 YvWQ==
X-Gm-Message-State: ANoB5plESAqlPEDM1+p5imz8q+a9c2Te/JnI8XVnECEAsKQfXsdmAybz
 4Sm3lqPtvUFeBF5RCPCzVG8YVLV+4IyqQxZ1giKRjw==
X-Google-Smtp-Source: AA0mqf7xAoq6ADJgB97FmUiNtQ2Z4wv9ZmcZvvns/h96szGHRG4ebIzcKZeYerWiIEDAMc5Ce+zF9yxbX8bMlvNUFD4=
X-Received: by 2002:a7b:c7c9:0:b0:3d0:7d45:ade5 with SMTP id
 z9-20020a7bc7c9000000b003d07d45ade5mr182166wmk.184.1671033238474; Wed, 14 Dec
 2022 07:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20221203132407.34539-1-ani@anisinha.ca>
In-Reply-To: <20221203132407.34539-1-ani@anisinha.ca>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 14 Dec 2022 21:23:47 +0530
Message-ID: <CAARzgwyj6kKfO62E2u=Fw_MjCH7uorYMmSx4TaL4zU2QivCckg@mail.gmail.com>
Subject: Re: [PATCH] acpi/tests/avocado/bits: add mformat as one of the
 dependencies
To: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::335;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x335.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Sat, Dec 3, 2022 at 6:54 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> mformat is needed by grub-mkrescue and hence, add this as one of the
> dependencies to run bits tests. This avoids errors such as the following:
>
> /var/tmp/acpi-bits-wju6tqoa.tmp/grub-inst-x86_64-efi/bin/grub-mkrescue: 360: mformat: not found
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Michael, please queue this for your next PR.

> ---
>  tests/avocado/acpi-bits.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> index 898c837f26..14038fa3c4 100644
> --- a/tests/avocado/acpi-bits.py
> +++ b/tests/avocado/acpi-bits.py
> @@ -50,7 +50,7 @@
>  from avocado import skipIf
>  from avocado_qemu import QemuBaseTest
>
> -deps = ["xorriso"] # dependent tools needed in the test setup/box.
> +deps = ["xorriso", "mformat"] # dependent tools needed in the test setup/box.
>  supported_platforms = ['x86_64'] # supported test platforms.
>
>
> --
> 2.25.1
>

