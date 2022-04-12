Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEC74FE092
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:40:56 +0200 (CEST)
Received: from localhost ([::1]:45348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neFpH-0002Yi-Pc
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1neFo0-0001pb-TT
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:39:36 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:38164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1neFnz-00068F-5Y
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:39:36 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2ec0bb4b715so71008487b3.5
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M1LZ4smoM6pzZnqzt0xXGb+zr0l2LwiCQaq+q/Md4f4=;
 b=TPw87MVb1dwKpDyGX6m+EOFYN385K2ZXe4SMGV8DP07H+WUYbBK4oL33csDIj8rtNq
 EbNhNewEQIKZrTZEQuH3K6oIoO7jgwHY8yPFx0cDA4pakMvcc/eV2tBgES6Jkysqt8jG
 ghEBNBpYf2w3RHQspIBnRiSshQCpUm6VoHudv6N9vZhAanSbG/QMBT3y8F5z0N4PW7UL
 usrCtrjDmpEmfhoBfMOyU5llIemFb7ptgVIjXjOpu/CZDdwsyduFdX/x779jvOLltrKV
 9qqK+dIFN5AFH6l/4psWYa4xJF9TzQmqXu/ohbZOrmYzv/Ccx2BLgdZqDjSid2Kz+W5+
 gn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M1LZ4smoM6pzZnqzt0xXGb+zr0l2LwiCQaq+q/Md4f4=;
 b=L58Uwv/j9AhemYqOffqBY1d+cMe0Do1J1gDSM61xnMIC83RPJlMYh3y0u0Rd1pTldq
 zyWElzyk1MZYKi7IdWQ7VeNnndm7JIVSoT0ry1VHQzs6KHZmK5d9jcn0k95k8RUh5PN1
 YYKH4WneK+ub6IHm7RtcJv24NYiEGOc+x9vIQJvOQlIaqsADjOVh4KHlZcoM5YOhj/wB
 0OpAH15z/WiowIJs+TpoEcDVjlpdWjTd+gW+X128vtvnjr0xCQdbRebGix3g1fP/uzqZ
 E+aelWVu7r9CISncD60AHHQ3TqJ3dSwDcdfeAYWsIogZYaEhCaVZmZLM+WTJlzBitJ8c
 9Rtg==
X-Gm-Message-State: AOAM532f4TmYLPaxXp2rU8NSrfmu38RtC+tcDjUzU/D0JrrtmOLci4Ab
 zzz91boEv6QYEAUwEToa/WhoCmHkfhiVVdzlKFwqRA==
X-Google-Smtp-Source: ABdhPJz7eeFOX32DAurLWlsu/qZ1NrGziedBG/Mun6aejwI9I2E1n9bQva9MS5DxQ6gfNHMgqK1g+s9TSo/jpgt81Ec=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr30191037ywf.347.1649767174032; Tue, 12
 Apr 2022 05:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220408104519.32931-1-gautamnagrawal@gmail.com>
 <f3adc652-6a89-a063-313a-4d87c11fc474@redhat.com>
In-Reply-To: <f3adc652-6a89-a063-313a-4d87c11fc474@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Apr 2022 13:39:22 +0100
Message-ID: <CAFEAcA9_RoxE7haPVT9701hpZb2rwSP15udj1dKL4kJvMkXOwQ@mail.gmail.com>
Subject: Re: [PATCH] Warn user if the vga flag is passed but no vga device is
 created
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: stefanha@gmail.com, Gerd Hoffmann <kraxel@redhat.com>,
 Gautam Agrawal <gautamnagrawal@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Apr 2022 at 13:13, Thomas Huth <thuth@redhat.com> wrote:
> On 08/04/2022 12.45, Gautam Agrawal wrote:
> > +    if (!vga_interface_created && !default_vga) {
> > +        warn_report("No vga device is created");
>
> I'm not a native speaker, and maybe it's just a matter of taste, but I'd
> rather say it in past tense: "No VGA device has been created"

I think we could phrase the warning to tell the user more
clearly what has happened:

"A -vga option was passed but this machine type does not use that
option; no VGA device has been created"

thanks
-- PMM

