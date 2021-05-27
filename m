Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F97A392ABE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 11:29:56 +0200 (CEST)
Received: from localhost ([::1]:40778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmCKx-0003Wz-5i
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 05:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmCKB-0002rA-TO
 for qemu-devel@nongnu.org; Thu, 27 May 2021 05:29:07 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:47029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmCKA-0003V1-93
 for qemu-devel@nongnu.org; Thu, 27 May 2021 05:29:07 -0400
Received: by mail-ed1-x534.google.com with SMTP id r11so17533edt.13
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 02:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cRPdfPABMtc6nEYPUNYt/nouMTo5ozDAHvfPfCMWLkc=;
 b=DnujIVcWQxNsW8fGVVEXdP4rGRTYg3fpGCjoVh5rRccYlAtvMb5FFVHiPVXA0WifC5
 9vHG09eQa1tEJ1Sh8VWDBa9yexRI2N8PbfGJiTGRtgU+wsXD9vHcSkBNDWTglFkpvCIM
 xD+5OoQqncKRkxFVGNeykyQA3bC03wy4i0sXBDQHp6d29y3d6U/HfFAm/jbHQbgi8qot
 Gi2/heLyVvzS4b6/LOa+4JGKwia3npEteke3Y3zGIaee2gjE0gI2LfloH2A+TC13qjQu
 1QoVDGL+o2+OUJKN824nIz/5gpTYhCv1A9FHxqPl7mRh80DNeFGVkLxwaz1kxDwriTbr
 ozeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cRPdfPABMtc6nEYPUNYt/nouMTo5ozDAHvfPfCMWLkc=;
 b=ei/UOX2fs/DP98wJNOuQlJoaez+WALBk1+zCyp91tyEdDMsRKhk62HrLf+bcv1GqrF
 Kj6I3eSz++UUujvj84X8PTMCrOEax8g0VTPOsAfIlTMwCF7n6eGbVnKW69tiZVyj1Kwk
 bZRbyubSeSv0ZDqF7pLXKejnRUe4cHWBAWvwjkSwGlrLfJ8rL/fgWEpHA+nnSjZVdTSW
 ibtiL7h+y8z08+T3HMcKrUwEqt0gCcc9cEAoxw2diRGXUcPF3GJKTL6Bp+AEvFCbB37/
 L0j8NpYNQPRti9H8J7kVqFfDXIru2eZOtGNizJ7FyNfdXDYOyoOnj4vHnRfifNgojX73
 NwlQ==
X-Gm-Message-State: AOAM530gsVWhyWe0bvEwuma77KBXMUYxfGe77rGihZ1NjYKVAL4zQOam
 ExRZGmiDT9DY+dhS9yJZ1xg59SnSMG4iDAZqhNQyDA==
X-Google-Smtp-Source: ABdhPJzB1rosQ7wbt2O9OoD1efnrEVl5vfqtIDo1nSm0iUSbWPRoFxc9FQTQuUlid+js5cPLpGzY2kisdiSndukr5dQ=
X-Received: by 2002:a05:6402:8d0:: with SMTP id
 d16mr3063405edz.36.1622107744948; 
 Thu, 27 May 2021 02:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210519200942.2223292-1-f4bug@amsat.org>
 <20210519200942.2223292-3-f4bug@amsat.org>
In-Reply-To: <20210519200942.2223292-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 10:28:39 +0100
Message-ID: <CAFEAcA9hNhU+iFexco9dbE5cuLhOpZo88a40G0E44SEK=UOZOg@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/arm/Kconfig: Add missing dependency ZYNQ ->
 USB_CHIPIDEA
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 May 2021 at 21:09, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> When using a binary built using --without-default-devices we get:
>
>   $ qemu-system-arm -M xilinx-zynq-a9
>   **
>   ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type !=
=3D NULL)
>   Bail out! ERROR:qom/object.c:714:object_new_with_type: assertion failed=
: (type !=3D NULL)
>
> Looking at the stack trace:
>
> (gdb) bt
>   #3  0x00007ffff6e229ff in g_assertion_message_expr () at /lib64/libglib=
-2.0.so.0
>   #4  0x00005555558d3f01 in object_new_with_type (type=3D<optimized out>)=
 at qom/object.c:714
>   #5  0x00005555558d3f59 in object_new (typename=3Dtypename@entry=3D0x555=
555ad4545 "usb-chipidea") at qom/object.c:747
>   #6  0x00005555558cd526 in qdev_new (name=3Dname@entry=3D0x555555ad4545 =
"usb-chipidea") at hw/core/qdev.c:153
>   #7  0x0000555555739fc6 in sysbus_create_varargs (name=3Dname@entry=3D0x=
555555ad4545 "usb-chipidea", addr=3Daddr@entry=3D3758104576) at hw/core/sys=
bus.c:234
>   #8  0x0000555555796b57 in sysbus_create_simple (irq=3D<optimized out>, =
addr=3D3758104576, name=3D0x555555ad4545 "usb-chipidea") at include/hw/sysb=
us.h:104
>   #9  zynq_init (machine=3D0x555555de07a0) at hw/arm/xilinx_zynq.c:254
>   #10 0x000055555573707c in machine_run_board_init (machine=3Dmachine@ent=
ry=3D0x555555de07a0) at hw/core/machine.c:1238
>
> When replacing the xlnx,ps7-usb device by the IDEA one in commit
> 616ec12d0fc ("hw/arm/xilinx_zynq: Fix USB port instantiation") we
> forgot to add the Kconfig dependency on the new device. Do it now.
>
> Fixes: 616ec12d0fc ("hw/arm/xilinx_zynq: Fix USB port instantiation")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

