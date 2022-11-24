Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FA9637EC9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 19:04:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyGZW-0008Qg-3a; Thu, 24 Nov 2022 13:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oyGZU-0008QY-A8
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 13:03:36 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oyGZS-0001VG-Om
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 13:03:36 -0500
Received: by mail-yb1-xb29.google.com with SMTP id y83so2548102yby.12
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 10:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=femjegsVOog6i8bQ7cGyNmeOFdNwox/8TGroaqAYWto=;
 b=CFex3QWCBx6RcfLswQJnmRAp9zncIry28V9fMZdm8bQ8uT04px/GtXnsPF2iK3vZDv
 Z2VsakSjDY1WztLnTD/i20nJ7fM5AzdJumknKNU684+rXXQTDvfcSS7tQojVahcGpd/h
 13Xs3r1BGJwAi65BpNLJUCh/6Owf9CHmLcVcVJniMY7DOrxqZwLLULqjt2eTCLYZtDQi
 TspDg4L1T4hAmfOyMotPcwCRlaBOD+Au+uNkPQXVJsEoFx/CFWp19nHgLIwbJAqa8e0j
 I8/5gEVxONJew2G51KBWfwJ5ETFEaVu3+/Qvjl37NgHuzTwm4QLU5ntnMRgVV7JWcSUX
 OXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=femjegsVOog6i8bQ7cGyNmeOFdNwox/8TGroaqAYWto=;
 b=bsLhyE6R3/X3/SzIq5nAYp5Qki1iXbi9pxBDotElAb3ZQTx7inoqH/RgNZIf68y/7u
 +3TbLXpmbu007CFb3LzmEw+kFxtjSkOFCdL2+sl/2vDDtXLN8+rbLlatG/Ps/rP/XRNv
 4Fw8/9HFYTf48xFM5vGxSarzMN1Y2xAzWFhtfbsyKtxKutGNYhCRJ7r3qh//mSY7aYHQ
 sHg+U97gPNWGtFPW1C7gVOazcEcfucLQbwgmhXbWDX2fuDrjC0qIgAZlal6Npe2g9aYS
 lA/JufJKV3iCqrW09luU93Ik472sTCFzT7rBtgKBbZ3cd/jWFXNGtDe/K6h45jI2gwyr
 ZTdA==
X-Gm-Message-State: ANoB5pkrnKARoH5b6xuZZiiO19BXle74ISWjGebaRjtcNkVDBVYjb+jn
 XL50yxurdUtDgSLb5rAGekvG4q8IDzBG3j0AVdw=
X-Google-Smtp-Source: AA0mqf51CLjXv2zln2sLHUXfF0o7AFkRCBBfjMlqOCCy0WFfySlID+LTbBaIbyJ8TeURgV68K55yKWac3bH2MZOjnl8=
X-Received: by 2002:a25:bcf:0:b0:6f2:a9c3:cbad with SMTP id
 198-20020a250bcf000000b006f2a9c3cbadmr267506ybl.118.1669313013272; Thu, 24
 Nov 2022 10:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20221124071602.1109150-1-kraxel@redhat.com>
In-Reply-To: <20221124071602.1109150-1-kraxel@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 24 Nov 2022 13:03:21 -0500
Message-ID: <CAJSP0QUh2Pp9PdxTQ4HvrraF03eKBeUMJR8WhPN4GgEW36K93w@mail.gmail.com>
Subject: Re: [PULL 0/4] Fixes 20221124 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, 24 Nov 2022 at 02:27, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 7c09a7f6ae1770d15535980d15dffdb23f4d9786:
>
>   Update VERSION for v7.2.0-rc2 (2022-11-22 18:59:56 -0500)
>
> are available in the Git repository at:
>
>   https://gitlab.com/kraxel/qemu.git tags/fixes-20221124-pull-request
>
> for you to fetch changes up to 64f1359bd08060ffe7a5689fdcbaeec6d8a59980:
>
>   ui/gtk: prevent ui lock up when dpy_gl_update called again before current draw event occurs (2022-11-23 12:27:55 +0100)
>
> ----------------------------------------------------------------
> usb+ui: fixes for 7.2

Hi Gerd,
I already applied your previous pull request so these patches are in
qemu.git/master. Do you want to revert the 8.0 patches that were
included in your previous pull request? I don't know how risky it is
to have them in 7.2. It's up to you.

7d3cf19548 hw/audio/intel-hda: Drop unnecessary prototype
3e95ef49e6 hw/audio/intel-hda: don't reset codecs twice
1dfb7a175f hw/usb/hcd-xhci: Reset the XHCIState with device_cold_reset()

Thanks,
Stefan

>
> ----------------------------------------------------------------
>
> Claudio Fontana (1):
>   gtk: disable GTK Clipboard with a new meson option
>
> Dongwon Kim (1):
>   ui/gtk: prevent ui lock up when dpy_gl_update called again before
>     current draw event occurs
>
> Joelle van Dyne (1):
>   Revert "usbredir: avoid queuing hello packet on snapshot restore"
>
> Michael Tokarev (1):
>   hw/usb/hcd-xhci.c: spelling: tranfer
>
>  meson_options.txt             | 7 +++++++
>  hw/usb/hcd-xhci.c             | 2 +-
>  hw/usb/redirect.c             | 3 +--
>  ui/gtk-egl.c                  | 2 +-
>  ui/gtk-gl-area.c              | 2 +-
>  ui/gtk.c                      | 2 ++
>  meson.build                   | 5 +++++
>  scripts/meson-buildoptions.sh | 3 +++
>  ui/meson.build                | 5 ++++-
>  9 files changed, 25 insertions(+), 6 deletions(-)
>
> --
> 2.38.1
>
>

