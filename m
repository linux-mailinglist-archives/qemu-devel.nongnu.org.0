Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3204F23EA47
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 11:23:58 +0200 (CEST)
Received: from localhost ([::1]:60974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3ybV-0005p7-0J
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 05:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3yaK-0004cj-6M
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 05:22:44 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3yaI-00020Q-IY
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 05:22:43 -0400
Received: by mail-ot1-x344.google.com with SMTP id r21so1082791ota.10
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D/xmAgHv28D3G+h7X5ONnbYR4vXWlTa2XYhHN3IvxuE=;
 b=bC36p5KWMdP6sA/I1K6Qyh0j3LrudbhsWTfJccbTEQLd9zQPMBWd0AT/W1QhCs/Kkk
 a076xvp+cC5A/EA7Gk6WZkb3j6hwXa4b0MFcrAd5dbihEgwv/g/cYE6EabFGwJtX4XEM
 5jM4xcqJu7iHFjguHGU2b6vl5caqI1L2+EwakF6roMOH1s0G01q8btcz26yO3Dp9yIkt
 W61tKG+X5bi0q+xYHHprILYOZRxeQMIZMfWnA/UVJZehm/vHgwXY7NHqKsBr4yUAIjra
 IXx2aKfoX5V0p74wRlrx308eaJXdprDGpbwSrx7r1H8VAAHAldfSDBnMK7SHsvcjM+Wq
 wpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D/xmAgHv28D3G+h7X5ONnbYR4vXWlTa2XYhHN3IvxuE=;
 b=gxUoiswfbN9CtvtNu/guwuOUxgQO+Jo7bVw7yw3O67ydyJXZ/lmQjvEVHiByE4yk+G
 oAYUblMXfwgLwqSViD0HXQqfdn7Xj6/0saDvXD4AIIsIZStzACYtdE5PqO20CpQF8TAw
 LC345+KMBVIwJS/DZiYIi4vXckY8MQDiZ8JmzUWIy3dVFN/hIco/J7cOUDKtUVeTPf53
 jSdbqhrMcuXQlEOppz4YXpBth6dUiF6QMsb2hrWZ9NR9eMTbilzC+6B6e039J1Kk3cMa
 0d/Z5fdHcN4KaYs4eKOzS6hmAdi0suY3eHnh/CJK8uevGPK+CsklUErVZrBkD8/ARb5y
 CrDA==
X-Gm-Message-State: AOAM532q0HQlIxYnSvVzATCgokxlP71KcmnzvVMFQ1bjLctAQZWpuciS
 NV7bct17KvgeyhA3WgaQIrg7Fy7W8oKs5FLib5MkBg==
X-Google-Smtp-Source: ABdhPJzxITawtboDg4YynVNnTrOVGu0jCxo131JcJTI0lq4eLgGr5D9CEh/+ymQRPJR7JALGU7+pWMueFJjGfT/RXfo=
X-Received: by 2002:a9d:3b61:: with SMTP id z88mr11153216otb.135.1596792161381; 
 Fri, 07 Aug 2020 02:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
 <CAFEAcA-d0F9y2OSX5D7GrzUYU7yf4nAhHabE1dUVii3LRrueLQ@mail.gmail.com>
 <dc73a810-ee9e-711e-dad0-76a566b923e4@redhat.com>
 <8dedfe22-8659-5684-99a6-e9d503a5b3e2@redhat.com>
 <20200807091841.GG120942@redhat.com>
In-Reply-To: <20200807091841.GG120942@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Aug 2020 10:22:30 +0100
Message-ID: <CAFEAcA8CVcKzNzaFVV4Gun91Nt0qQEOz+Ej2uedoN0MkQtaAxg@mail.gmail.com>
Subject: Re: [DRAFT PATCH 000/143] Meson integration for 5.2
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Aug 2020 at 10:19, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> FWIW, for libvirt we decided that despite lack of distro support,
> there was not a compelling reason to bundle meson, because it is
> really trivial for users to update. e.g. just "pip install".
>
>    pip install meson --user
>    meson build
>    ninja -C build

I really hate software build instructions that want me to
"just pip install" something. I know nothing about the
python out-of-distro packaging process and I don't want
the python thing I had to install to build software X
to be lurking around on my system forever being picked
up and used by random other stuff...

thanks
-- PMM

