Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211F5636B82
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 21:49:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxwfC-00071l-AT; Wed, 23 Nov 2022 15:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxwfA-00071b-5r
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 15:48:08 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxwf8-0000PW-E5
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 15:48:07 -0500
Received: by mail-pg1-x52d.google.com with SMTP id f9so13545688pgf.7
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 12:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UKMXNjjjx6Z3vk/4LUQmcSGs666tj0DK+6D6pRL36ZI=;
 b=nZokXcjxrFi+GL0/i7tTFc3r5cxrHukklcQB8vH4/Y5gRiVAH1lOP+EBvWJAMh7IZA
 qIDMqgQrmRntxqGamgwqN4NFs5aJMhukZ5famwsoqwYksUxyAMadcfW1yvmHm1iexs1p
 +Trvnn6T4MYBEQip39SfYUmqN7Wyd+BmOU51rF3uH4tajWQoVvNV8D8W2sVuwWW4XR1F
 gVnjAUGBoG1XVRM9FbgyRnnexgpF7WICMM9aqyE0FOxeTpj/IEUy7jGlqbGOdRBUdnTI
 Ot8HHJYu2TvxWgraLZhXht662IxYoORZ4OYNYLN3WmVt9bQxQIttnvJ5xXqsOjWHiMTY
 iW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UKMXNjjjx6Z3vk/4LUQmcSGs666tj0DK+6D6pRL36ZI=;
 b=11wXyiqE/krcIs1DQglPFPCuNI8W1z5YmYAZIkB4QBVJEJIVmZtnSg6wYFLOFIaxlP
 Z4WxMAwNkmUVsbaz9P+/h3VRPJEcfg5Jk6eH5ljH5CLdMGXZeb6hMGWKuhsCdSxoyPg8
 x39ugTJSFXKVpJwl6AcJSdJ+A2F6haV3jKOaEoJdEsCLfREoyULRNgptmA1mICsBGMll
 NCj1YFAWiQJOIVpunWmUku+rrabqTkvmaeswLZzYuKy9xT13iZ3y6J07FtOQO3Vr7NXp
 naaSCy/mA4Oc31gm/HAEDpWqZ7UzY2uOK7cMn5J0REt9FYJo0Qaqki2FFoW5kEoeKSRh
 TBwA==
X-Gm-Message-State: ANoB5pmtEbLBoCbgEDsq6z58leq536e+49q9y7+ltxQ6DxRpOGIbvlE0
 qWBBRQ9PJ+UbkUvUz5xTBcZvZ6UcPK7NvR1QKLoeWQ==
X-Google-Smtp-Source: AA0mqf5CPe5VoPcNEA/VMc33u2rXaSZuVRKSiXlxjR/dYg9YYR3RBTuYnrLIJKfwHI2ChWh5MQU8Px0pWYhDJ0fDDKk=
X-Received: by 2002:a62:5f81:0:b0:56b:bb06:7dd5 with SMTP id
 t123-20020a625f81000000b0056bbb067dd5mr11160368pfb.3.1669236483545; Wed, 23
 Nov 2022 12:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20221123144436.2141069-1-kraxel@redhat.com>
In-Reply-To: <20221123144436.2141069-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Nov 2022 20:47:52 +0000
Message-ID: <CAFEAcA8Y=Vbt2HF8ypshRy8DGbBUdVtfdEUG57Lrea64psZzVg@mail.gmail.com>
Subject: Re: [PULL 0/7] Fixes 20221123 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
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

On Wed, 23 Nov 2022 at 14:45, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 7c09a7f6ae1770d15535980d15dffdb23f4d9786:
>
>   Update VERSION for v7.2.0-rc2 (2022-11-22 18:59:56 -0500)
>
> are available in the Git repository at:
>
>   https://gitlab.com/kraxel/qemu.git tags/fixes-20221123-pull-request
>
> for you to fetch changes up to 7d3cf19548b7f9afd9d25c30dd1450aad7d1877d:
>
>   hw/audio/intel-hda: Drop unnecessary prototype (2022-11-23 12:30:45 +0100)
>
> ----------------------------------------------------------------
> ui+usb+audio: bugfixes for 7.2
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
> Peter Maydell (3):
>   hw/usb/hcd-xhci: Reset the XHCIState with device_cold_reset()
>   hw/audio/intel-hda: don't reset codecs twice
>   hw/audio/intel-hda: Drop unnecessary prototype

That reset-related series was for-8.0 material, it shouldn't be in
a pullreq at this point in the release cycle I think.

thanks
-- PMM

