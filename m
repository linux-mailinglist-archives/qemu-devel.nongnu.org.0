Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104C56A4998
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 19:23:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWi9X-00072b-D7; Mon, 27 Feb 2023 13:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWi9V-000729-B9
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 13:23:09 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWi9T-0002KM-MP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 13:23:09 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 132so4088055pgh.13
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 10:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFs7USdCuKMD3Dj0wX8BRFlsf9fdILCiIQ4eJ1l1w78=;
 b=drsrlWzXvs+axQzPalNVJaDWobCdisrfYUXzxzd84Z0xQn/yHZwqtIOfcEIMrZAWqP
 o0D43cgbBkFRX8t4Go7kFN1tJm4o3gr22hmzMbt7scBRlyleEZ7OaJq7+Uw5jayRJ3Ea
 P0d3EoTWliHsgG6q1h3K98JtAKl6Kj9aJrw2Ld/MSeRbxn5FAtaloQ+B6z8m0XDKhOkB
 oLhTbSyz5jaxDuNTanqlfI/ofUD7eqTWC9ehY/KrofL+fMlxTWjZPG1zZKjwOwlp+voJ
 7Q/C9qkuTZv7v3gVfxMoCAae0k1UWHfe3cY13LN0/FvWyGfPv1tF14vJXIm+X93qwt3M
 Xmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HFs7USdCuKMD3Dj0wX8BRFlsf9fdILCiIQ4eJ1l1w78=;
 b=R/O3yZ/THKzw6R3QRv5h3ia+riqcyS3KJv340Zx18cGUomrD/eMsrdEm0WScwORxi5
 XrKCcknHierBptVTjweS1XX0hN5gMVKl1nQ8ZqphkhMWxJswyYffjnf6Rv8yuHHOKEzU
 qQ5/VtVlXS3/u+SgXj7C0oqwIXcCs91mahP3PmQ2aFhYF4I6ajKMEPpPFZGp/nZzfuoE
 dAi4aSwsrSS42+VScnMH9lqFZi0r4AN9V3wMYBS6lQQF5fInWBic8DoPYbPFmrw/wlfJ
 a//7x4KBP91ewEzeCwIjVjQ7Oa9uGMz59Tj4w/eLMMaBk6QdjPsNY+hn/1p4oXQiLeSr
 /iIA==
X-Gm-Message-State: AO0yUKWfzhuLgj2xM6jIdaMmHK9IHQlkj7xsD1HPLidsRrI7mmlwQlV8
 bRf+dLEPCBQY2QM2vM0wxc+G/VruFwb+Up1Nli6AzA==
X-Google-Smtp-Source: AK7set8KyMGnOoWMYC44fesWoL991cilTUaqortiphg6XMqV61Epq8doioJOmyKWs1QeLJW7jSUZcSBHwa5VZTNCmJc=
X-Received: by 2002:a63:364a:0:b0:502:f4c6:305c with SMTP id
 d71-20020a63364a000000b00502f4c6305cmr4691057pga.9.1677522184720; Mon, 27 Feb
 2023 10:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20230227140213.35084-1-philmd@linaro.org>
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Feb 2023 18:22:53 +0000
Message-ID: <CAFEAcA_ny6SumTx6CuFan3yCuP24TXjmyOBO95OeZam3Qw057w@mail.gmail.com>
Subject: Re: [RESEND PULL 000/126] Buildsys / QOM / QDev / UI patches for
 2023-02-27
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 27 Feb 2023 at 14:08, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Peter,
>
> I apologize for the size of this request, I was hoping various
> series would go via other tree, but everybody has been quite busy
> and the freezing windows is close, so I'm sending a huge mixed
> patchset here.
>
> Previous post failed with:
>
>   Unable to initialize SMTP properly. Check config and use --smtp-debug.
>   VALUES: server=3Dsmtp.gmail.com encryption=3Dtls hello=3Dlocalhost.loca=
ldomain
>   port=3D587 at /opt/homebrew/Cellar/git/2.38.1/libexec/git-core/git-send=
-email
>   line 1684.
>
> Reposting adding "--forget-cc --cc-cmd=3D/usr/bin/true --suppress-cc=3Dal=
l".
>
> The following changes since commit b11728dc3ae67ddedf34b7a4f318170e709280=
3c:
>
>   Merge tag 'pull-riscv-to-apply-20230224' of github.com:palmer-dabbelt/q=
emu into staging (2023-02-26 20:14:46 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/buildsys-qom-qdev-ui-20230227
>
> for you to fetch changes up to 79fbbf323ce0b2608eca53f85f5e02b8c4b73b90:
>
>   ui/cocoa: user friendly characters for release mouse (2023-02-27 14:48:=
10 +0100)
>
> ----------------------------------------------------------------
> - buildsys
>   - Various header cleaned up (removing pointless headers)
>   - Mark various files/code user/system specific
>   - Make various objects target-independent
>   - Remove tswapN() calls from dump.o
>   - Suggest g_assert_not_reached() instead of assert(0)
>
> - qdev / qom
>   - Replace various container_of() by QOM cast macros
>   - Declare some QOM macros using OBJECT_DECLARE_TYPE()
>   - Embed OHCI QOM child in SM501 chipset
>
> - hw (ISA & IDE)
>   - add some documentation, improve function names
>   - un-inline, open-code few functions
>   - have ISA API accessing IRQ/DMA prefer ISABus over ISADevice
>   - Demote IDE subsystem maintenance to "Odd Fixes"
>
> - ui: Improve Ctrl+Alt hint on Darwin Cocoa

Seems to have broken the TCG plugins somehow?

https://gitlab.com/pm215/qemu/-/jobs/3841174348

TEST munmap-pthread on aarch64
**
ERROR:../plugins/core.c:221:qemu_plugin_vcpu_init_hook: assertion
failed: (success)

Similarly in
https://gitlab.com/pm215/qemu/-/jobs/3841174344
https://gitlab.com/pm215/qemu/-/jobs/3841174341

thanks
-- PMM

