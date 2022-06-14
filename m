Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F130754B450
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 17:16:06 +0200 (CEST)
Received: from localhost ([::1]:50992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o18H0-0003ID-2C
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 11:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o18DQ-0000az-U8
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 11:12:24 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o18DO-0004zl-Uj
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 11:12:24 -0400
Received: by mail-pj1-x1030.google.com with SMTP id z14so3973611pjb.4
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YM2YngzMkaGIWHpkf6M7ADa9V1hMmADYOG1MXNhlzWE=;
 b=Hua16gKf/ZBdAKXYPXFTnxhFrivxJk4e10lo8ixeYNmksvupoHrmXJ2RGnzwEJq9iv
 kBa31EaF9odSqcB9dv9APd67sxav2GhXvynfpLM6KVmzCrzPlM35sYCDPOfdKsc8+d/D
 my1JQ0/AMOCSnpUjDjjYrWiNTuNXuxbGtaEpanQNHqAsSfl/85olI3ai83sD21BSd0xn
 NV14E/MWURYOtWYbmQPtZyQXRECtXIv+zkG5/YC6EVzSXvEHSjw0Hn7kyRCtBDmDkn5F
 e/I+I/ofG/P/cmMt2Ekj5q0ZZSMAlnh1BBUogdRk3TRiDOpWzu2Dsh8lpQGinhxeit/C
 s2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YM2YngzMkaGIWHpkf6M7ADa9V1hMmADYOG1MXNhlzWE=;
 b=mEHo7kTvEpaGJWxdbnawsdVZgHa79kO1Xa1LHj0xt6noN/cxaoBzSjqOD+rkqT+3Z4
 Mtw/b2MJUwbuZnIKs1xw8xW7/caI3Vri/GjevGLmmQ7J/8kYMVMYPdzUySk0JQ7r0BDd
 DHRtW73dYUPOn0UfdyQKoFbuUD8qRZ80u0qDkHQ+LNuKEukogmpQMh+7obaBw7atUdR7
 yfSP74381F91zerO7THTxbuxrdkgcZp+hggzvFTBf3NHJ+AZL1EkY7LETkN8Y7EB90/e
 N+SuHKoIyP4DXQqJF2ShOpB1LMg8OcpQDXiAUtMBF2O8NBQuVY3NZezaf3f4E6POibZv
 AECg==
X-Gm-Message-State: AJIora80arqSjvzfLAa3Ime8803BSvIZAQqVCicyNP4UIr1/QZP06/YV
 +Esk0SJUl3SeC0uIJLIGoaanZw==
X-Google-Smtp-Source: AGRyM1tjRZAqa5I7tdwTBMIp6PN2CGs2N7UY/5qPMrgEvGZ2f/pTTPIaidozXKlXn7LAd1/g8WZySA==
X-Received: by 2002:a17:90a:6849:b0:1ea:d05a:223a with SMTP id
 e9-20020a17090a684900b001ead05a223amr823789pjm.173.1655219541080; 
 Tue, 14 Jun 2022 08:12:21 -0700 (PDT)
Received: from [192.168.159.227] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a170902864900b00168c1668a49sm7368707plt.85.2022.06.14.08.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 08:12:20 -0700 (PDT)
Message-ID: <ba496d86-3883-c7e2-9e06-76b62e111aa5@linaro.org>
Date: Tue, 14 Jun 2022 08:11:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/15] Kraxel 20220614 patches
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Canokeys.org"
 <contact@canokeys.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20220614121610.508356-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220614121610.508356-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/14/22 05:15, Gerd Hoffmann wrote:
> The following changes since commit debd0753663bc89c86f5462a53268f2e3f680f60:
> 
>    Merge tag 'pull-testing-next-140622-1' of https://github.com/stsquad/qemu into staging (2022-06-13 21:10:57 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kraxel.org/qemu tags/kraxel-20220614-pull-request
> 
> for you to fetch changes up to b95b56311a0890da0c9f7fc624529c3d7f8dbce0:
> 
>    virtio-gpu: Respect UI refresh rate for EDID (2022-06-14 10:34:37 +0200)
> 
> ----------------------------------------------------------------
> usb: add CanoKey device, fixes for ehci + redir
> ui: fixes for gtk and cocoa, rework refresh rate
> virtio-gpu: scanout flush fix

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Akihiko Odaki (4):
>    ui/cocoa: Fix poweroff request code
>    ui/console: Do not return a value with ui_info
>    ui: Deliver refresh rate via QemuUIInfo
>    virtio-gpu: Respect UI refresh rate for EDID
> 
> Arnout Engelen (1):
>    hw/usb/hcd-ehci: fix writeback order
> 
> Dongwon Kim (1):
>    virtio-gpu: update done only on the scanout associated with rect
> 
> Hongren (Zenithal) Zheng (6):
>    hw/usb: Add CanoKey Implementation
>    hw/usb/canokey: Add trace events
>    meson: Add CanoKey
>    docs: Add CanoKey documentation
>    docs/system/devices/usb: Add CanoKey to USB devices examples
>    MAINTAINERS: add myself as CanoKey maintainer
> 
> Joelle van Dyne (1):
>    usbredir: avoid queuing hello packet on snapshot restore
> 
> Volker Rümelin (2):
>    ui/gtk-gl-area: implement GL context destruction
>    ui/gtk-gl-area: create the requested GL context version
> 
>   meson_options.txt                |   2 +
>   hw/usb/canokey.h                 |  69 +++++++
>   include/hw/virtio/virtio-gpu.h   |   1 +
>   include/ui/console.h             |   4 +-
>   include/ui/gtk.h                 |   2 +-
>   hw/display/virtio-gpu-base.c     |   7 +-
>   hw/display/virtio-gpu.c          |   4 +
>   hw/display/virtio-vga.c          |   5 +-
>   hw/display/xenfb.c               |  14 +-
>   hw/usb/canokey.c                 | 313 +++++++++++++++++++++++++++++++
>   hw/usb/hcd-ehci.c                |   5 +-
>   hw/usb/redirect.c                |   3 +-
>   hw/vfio/display.c                |   8 +-
>   ui/console.c                     |   6 -
>   ui/gtk-egl.c                     |   4 +-
>   ui/gtk-gl-area.c                 |  42 ++++-
>   ui/gtk.c                         |  45 +++--
>   MAINTAINERS                      |   8 +
>   docs/system/device-emulation.rst |   1 +
>   docs/system/devices/canokey.rst  | 168 +++++++++++++++++
>   docs/system/devices/usb.rst      |   4 +
>   hw/usb/Kconfig                   |   5 +
>   hw/usb/meson.build               |   5 +
>   hw/usb/trace-events              |  16 ++
>   meson.build                      |   6 +
>   scripts/meson-buildoptions.sh    |   3 +
>   ui/cocoa.m                       |   6 +-
>   ui/trace-events                  |   2 +
>   28 files changed, 707 insertions(+), 51 deletions(-)
>   create mode 100644 hw/usb/canokey.h
>   create mode 100644 hw/usb/canokey.c
>   create mode 100644 docs/system/devices/canokey.rst
> 


