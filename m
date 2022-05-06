Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B42951DDA3
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 18:30:58 +0200 (CEST)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn0r3-0007je-5v
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 12:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0pk-00073y-Uz
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:29:36 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:36685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0pj-0005w7-E9
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:29:36 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f7b815ac06so87250387b3.3
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 09:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dldZtvrGiquzLnudNOD4ZnGCR4hfh0ITKPFZ+gmBKrI=;
 b=V8tkY5EawU9KnbTMyiA1P8+Z7/c9DkP2QbMMexYiL3EhFIvXsD8q/CYvowD8wcHQ1X
 QHi3H5AOTh4rkm9xcqsA5tDx0Vue4Ryzhklc4SsZdDU6XmbslDiD8MnNh0OhEpiVmPtn
 fmHI5zkxJ/F/UVt1bIdT3KV20fhDbU/8ZMjzlEzPoVL+1ozqEr8PI2lHt0eUCCNLzw+0
 h9j5Qd+QPQBq4dsKU/bfU/wfQH3S6bvafkxFOwhZwa+htEudiPm6pINIlvTeBL3jKDL2
 8s8BNQ8Q0ybTZRClpoOiSONDSmrQ5B6v9PXmhjZKGCgFdQQZePzX7V+/hCEl6Gxd6qKw
 crMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dldZtvrGiquzLnudNOD4ZnGCR4hfh0ITKPFZ+gmBKrI=;
 b=3uwXnDECWCO188Uct6wE29mIvzQDmZXVXDFL9LCtq56nvi2bYqu9tQTEeyuvruLUKI
 Y58+xPZrorRhzmzsgK3ZF2nCBl//6YsSNwaIiWLzNEorEfSrCgbyvcEoXM6w6l5RpfcM
 oPQ8iLewCtiM61qKwVnPITFvPYKE83YU9Zm6cdeFUr82GqikLHq9c4VUYzAL9E2bV/kz
 JHAaDsX1nSBOtjW8vq88nq/zQgXh+HpHqRrWvTIbuSRwWEdZ1Z5tbFf6hNen5KkmJFUu
 kmlx/W/kRDO6jLqrHKKGq20DrmCocDiYRAupp0kIcShptDc9oIiPx0Prias/UePFc1w5
 +3Tw==
X-Gm-Message-State: AOAM530Z5UIgrSHlXiW3CCScyNyrN1Yu3wPk0mR8KqJWpHYtqkcFJns9
 BmoXz3BDxMR7hbw/kd5mqb0tp77Qeq7wIiR7g/w52w==
X-Google-Smtp-Source: ABdhPJxIdIfUN/26e1AUq4t13VbLyCukghFL2R6gmI+V3IdtaM0l9U3xC3NT+/Ky5iuJOmuPyZ0ArDIE+kjCiQYt2Lc=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr3280529ywj.329.1651854574170; Fri, 06
 May 2022 09:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220501122505.29202-1-gautamnagrawal@gmail.com>
 <YnUvpsaM0hwUSZvM@stefanha-x1.localdomain>
 <b16d2b2d-f086-636b-4da5-79d3134a4482@redhat.com>
 <CAFEAcA9rK6T03mkUrojf+Wz=UCiakibXtj56W0F=uuEjeqoZig@mail.gmail.com>
 <7551dedd-7417-6292-907b-28ff8304cd83@redhat.com>
 <CAFEAcA8i5t0i61HT0NEV5BHYEkK_ipSAeNGuc+3Zg3uqTGkzYQ@mail.gmail.com>
 <b754d9a3-1762-71d2-417a-3c61ae87f3de@redhat.com>
In-Reply-To: <b754d9a3-1762-71d2-417a-3c61ae87f3de@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2022 17:29:23 +0100
Message-ID: <CAFEAcA9VaYjMCXUuRk0B-Me6kNApmDcLiwnsNa1eH2WN71Jmjw@mail.gmail.com>
Subject: Re: [PATCH v3] Warn user if the vga flag is passed but no vga device
 is created
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, kraxel@redhat.com,
 qemu-devel@nongnu.org, Gautam Agrawal <gutamnagrawal@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 6 May 2022 at 17:10, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 5/6/22 17:47, Peter Maydell wrote:
> >>        if (!vga_model && !default_vga) {
> >>            vga_interface_type = VGA_DEVICE;
> >> +          vga_interface_created = true;
> >>        }
> >>        if (!has_defaults || machine_class->no_serial) {
> >>            default_serial = 0;
> >
> > Can you explain why that's right? qemu_disable_default_devices()
> > isn't creating any devices at all, so it's not clear to me
> > (a) why it's setting vga_interface_type or (b) why setting
> > vga_interface_created to true is OK.
>
> VGA_DEVICE means the device has been specified on the command line, but
> the board should otherwise behave as if "-vga something" was there.

Oh, I see now -- qemu_disable_default_devices() does a
preliminary scan through of every supplied -device option,
looking to see if it has a driver=foo that matches some
value in the default_list[] array; if it does then we
set default_vga or whatever to false. (So effectively we
have a hardcoded list of things we consider to be "VGA
devices" for this purpose, which might or might not be the same
as the set of actual VGA devices we support...)

I guess this is all here for backwards compatibility purposes?
I kind of expect that short options like '-vga' might have
magic extra behaviour beyond "create a device", but having
some devices that have magic "make the board behave differently"
behaviour when they're created with '-device' is a bit
unexpected to me.

thanks
-- PMM

