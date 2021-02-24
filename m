Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FAF323D58
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:10:01 +0100 (CET)
Received: from localhost ([::1]:45222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtvU-0000Lt-If
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:10:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEtu9-00080Z-9u
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:08:37 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEtu7-0002pJ-TA
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:08:37 -0500
Received: by mail-ej1-x635.google.com with SMTP id u20so2937315ejb.7
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 05:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wkstw0/vthtFkcNXQeHi+pvpyqPk5RBv1J4uF/2mlBg=;
 b=WIt1YL10YPRzbeTTr3LfBEwW2xSiSIR4wujOz9Pd/Q/R9vVuvnjC3fIM+3RGVeV9lS
 sC3os16wmv+ob8WN/9YLuyofnN8wRvGKFNs0BMJun/zVUb1VMbBHuexlwlbXuSlLQl5b
 ctNKhjpnpzqX8PqCIEhkBOYVXk+CSu39q3MLGBDugRjcmuqkPqZ5ad2aQltamFZQ/O86
 2o1ySjZ7FjDJ6xBd22tv+91OawQFu9/TcfYBqFyCEt/wew9knQfy4sLx/CeN2aLgwbxJ
 /Ma9ozJ/TJqzSWWHvTyjCE361RtLYeN4k7mun1xj6EvZtqMHWA1WgvCvw1FECO3mL2kL
 b3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wkstw0/vthtFkcNXQeHi+pvpyqPk5RBv1J4uF/2mlBg=;
 b=DIrokGScGIUHK050kLLzNZ9u8CssSXeibtWwalSqx7gwTlfoEpHU2l1gxElSDsHCo5
 NDSj2HLOv/w4lOHEGl8fsMLoQPXgOWNZyIqqCvdh1nGULzZd++WAMuCIMu2mO9SQtxqB
 vZSaIFZBHJS561Mo9CmNHO2XAaqtPZkE/SNGDUtKMnm15X43Mdb33YwPM87zEArK/CkY
 IeX050lryHgvASM2dKLVfMmRX3vvhFEhBQQxhER62WhAUXDtlG0a/A0k88am2HLJ42yk
 xaBuZOrPEYWYtWDM2x4ViBkB7i25RyE6GZqt7HazM1kXm9iO1AciE7l4i4x5LUs4BR1K
 U/4Q==
X-Gm-Message-State: AOAM531JBLDM8si6B6nLOVDQe+BecsFBmwCTKc7ogR4xZoStBYsrglZF
 pz6CQXbgxz9aA/btHxicznRw2R2kn39FWfehpmGkTA==
X-Google-Smtp-Source: ABdhPJyU2jILJDPO6UUXk/NixWPWlTa3kACnbM5Qv6XR9TMyrlBKgOQCbWxzT2VGn6K5kM43kMwWEczDdfVSJMmI3aU=
X-Received: by 2002:a17:906:f10c:: with SMTP id
 gv12mr20976023ejb.407.1614172113744; 
 Wed, 24 Feb 2021 05:08:33 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9E73_a0hEMV+jFm6YbcOz=hFR-NyYKa_Roisw_MR_cNg@mail.gmail.com>
 <20210222144012.21486-1-akihiko.odaki@gmail.com>
 <20210224112307.vfz3qz6bgrboj627@sirius.home.kraxel.org>
In-Reply-To: <20210224112307.vfz3qz6bgrboj627@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Feb 2021 13:08:22 +0000
Message-ID: <CAFEAcA-whQcik9-jx_ZSHJ8dyQBM5FvQFZKn9xkeBnOZfj7DCw@mail.gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Fix stride resolution of pixman image
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Feb 2021 at 11:23, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, Feb 22, 2021 at 11:40:12PM +0900, Akihiko Odaki wrote:
> > A display can receive an image which its stride is greater than its
> > width. In fact, when a guest requests virtio-gpu to scan out a
> > smaller part of an image, virtio-gpu passes it to a display as an
> > image which its width represents the one of the part and its stride
> > equals to the one of the whole image.
>
> Probably not limited to virtio-gpu.  Wayland rounds display framebuffers
> to the next multiple of 64, so when running -- for example -- 800x600
> wayland will create an image 832 pixels wide.  Other UIs had simliar
> issues.
>
> Patch added to UI patch queue.

Could you add Akihiko's explanation to the commit message
for the patch in your queue, please?

thanks
-- PMM

