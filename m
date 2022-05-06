Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6480C51DB1A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 16:50:15 +0200 (CEST)
Received: from localhost ([::1]:47140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmzHY-0000uU-Nw
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 10:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmzFx-0007Eh-RH
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:48:33 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:35809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmzFv-0007AA-VI
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:48:33 -0400
Received: by mail-yb1-xb33.google.com with SMTP id w187so13285105ybe.2
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 07:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TX0X7lZYq841aum4tr5RJJMQC6SpkDosUistpEge9cQ=;
 b=Z9f/WnX4HfzJUwLmHZj0t0OiZE/vUZjNk6NyZHTW+0X4e0mvnKsP7uDjmOuywtSW/4
 Svwk2BZ3ZO12c3Q3IAdi0PDo4xxKXC0Z5+MdmKtUbQTV1+mcFDHXrgBRBgtQnF73/9s0
 yta7EumUZVXzc6nkdqMvOAP0jOpWBOeOdS3GP/RscNjmIEFGWuJVRS0irzBZDsC5zFzn
 ePzKdn4zK9LRt0uHtQNZ7PS/BI2mdXSDLLcnrL5T6GK2NAWSh2Z+Fvj3aoeyzdvCwHVP
 Qgvsy83B80RWPx+4C7ac9vwqqf3QHFXSs5RRiFoD2nzdgUm1J4p5ncNYXBoxtbYVOUze
 db6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TX0X7lZYq841aum4tr5RJJMQC6SpkDosUistpEge9cQ=;
 b=GrBXoBX9Y8kkX/gAz0fyQemHaZcngGibljQu27LTKl1hs1JRq77QIvmtyZLMb8M+qU
 CleMbuvGyHEikuwBNLF8uZ/oqO2FB+RPOzrmNT7xMfsphL1yhoOv39kUh+M35A13yIaO
 YIYgCfrGRWNqS/BHrGZ+wtKl06UZusrZk3bFsN2G0ypaSCgz1mHYsEunfnyDc0AhbCSO
 tejDi2zQo38YRimscAXIcO7/DXsXVgo2VaEg8B+Oirt82rKJWjIwY8mkzAGoxtjyZHb6
 W44jYGlbgalhAuF/IAVcIYZPs1+BgaVe/owBKibLw4YqMOWwQdE4JQDbmT8B96cKIUta
 QqfQ==
X-Gm-Message-State: AOAM531APcqrzFFqu1pZny1NV8KcuQIz8ai6HZ5akVPXI32b4JAtuW/o
 BGxodWJF5AldFdLSiCHeAlFmsUZnsx+6FQxe7Jp8Hg==
X-Google-Smtp-Source: ABdhPJxJjMKonlN/Bi7L5/2Tr9Y0nE1jLab2cFsBp/vHx5nCQk+Zpq7mL1/k3pMGCSwbkIxp6shL1Z1ihGmfCTW0PXY=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr2447389ybg.140.1651848510954; Fri, 06
 May 2022 07:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220501122505.29202-1-gautamnagrawal@gmail.com>
 <YnUvpsaM0hwUSZvM@stefanha-x1.localdomain>
 <b16d2b2d-f086-636b-4da5-79d3134a4482@redhat.com>
In-Reply-To: <b16d2b2d-f086-636b-4da5-79d3134a4482@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2022 15:48:19 +0100
Message-ID: <CAFEAcA9rK6T03mkUrojf+Wz=UCiakibXtj56W0F=uuEjeqoZig@mail.gmail.com>
Subject: Re: [PATCH v3] Warn user if the vga flag is passed but no vga device
 is created
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, kraxel@redhat.com, 
 qemu-devel@nongnu.org, Gautam Agrawal <gutamnagrawal@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Fri, 6 May 2022 at 15:32, Thomas Huth <thuth@redhat.com> wrote:
>
> On 06/05/2022 16.24, Stefan Hajnoczi wrote:
> > On Sun, May 01, 2022 at 05:55:05PM +0530, Gautam Agrawal wrote:
> >> A global boolean variable "vga_interface_created"(declared in softmmu/globals.c)
> >> has been used to track the creation of vga interface. If the vga flag is passed
> >> in the command line "default_vga"(declared in softmmu/vl.c) variable is set to 0.
> >> To warn user, the condition checks if vga_interface_created is false
> >> and default_vga is equal to 0. If "-vga none" is passed, this patch will not warn the
> >> user regarding the creation of VGA device.
> >>
> >> The warning "A -vga option was passed but this
> >> machine type does not use that option; no VGA device has been created"
> >> is logged if vga flag is passed but no vga device is created.
> >>
> >> This patch has been tested for x86_64, i386, sparc, sparc64 and arm boards.
> >>
> >> Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/581
> >> ---
> >>   hw/hppa/machine.c         | 1 +
> >>   hw/isa/isa-bus.c          | 1 +
> >>   hw/mips/fuloong2e.c       | 1 +
> >>   hw/pci/pci.c              | 1 +
> >>   hw/ppc/spapr.c            | 1 +
> >>   hw/sparc/sun4m.c          | 2 ++
> >>   hw/sparc64/sun4u.c        | 1 +
> >>   hw/xenpv/xen_machine_pv.c | 1 +
> >>   include/sysemu/sysemu.h   | 1 +
> >>   softmmu/globals.c         | 1 +
> >>   softmmu/vl.c              | 6 ++++++
> >>   11 files changed, 17 insertions(+)
> >
> > Gerd or Richard: do you want to merge this patch?
>
> I'm just in progress of preparing a pull request with misc patches, I can
> also throw it in there if nobody minds.

Paolo mentioned on IRC yesterday that there was some detail he thought
it wasn't handling right with VGA_DEVICE, but I didn't really understand
the details. Paolo ?

thanks
-- PMM

