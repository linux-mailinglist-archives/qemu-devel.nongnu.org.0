Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1C03539F4
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Apr 2021 22:49:14 +0200 (CEST)
Received: from localhost ([::1]:58320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lT9gH-0007oM-3N
	for lists+qemu-devel@lfdr.de; Sun, 04 Apr 2021 16:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lT9fY-0007O1-R2
 for qemu-devel@nongnu.org; Sun, 04 Apr 2021 16:48:28 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lT9fX-0002G0-0F
 for qemu-devel@nongnu.org; Sun, 04 Apr 2021 16:48:28 -0400
Received: by mail-ej1-x62c.google.com with SMTP id qo10so3990806ejb.6
 for <qemu-devel@nongnu.org>; Sun, 04 Apr 2021 13:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KwtKAkUifluD1Inm2L+hUczpP20dDIWfsR0j/ey9Tiw=;
 b=jTAkLutNaKtpxn1JwvmTNuSBjJicby2/6nejKBdHI6BaZV/FLM/zCORrHBQ5NFa5RZ
 t/In0Xh1lptAgvBssNxpkiUEGu/214XhQEUfbykwlifBUhA4uomHNuaupCo12aHm+ZLE
 WkMTbf8hRKz7ZrWYx+z3YTGTuUbrcWehV71F2cw3yUOyr0J9usWrfHExaVvTK75afItp
 f/Ai+sWGMnuyH24PLv8BfWr2LHaE6QtNNi+nOiSKTyKVTCQQcGaj9qvdjQ33rIbsjN+h
 W21kjEBSEfMX9ovpq57i3AXaEg0800vvplGKc/OMS2kNMTkgaiIjwccMwxGfPvzIk88w
 /kWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KwtKAkUifluD1Inm2L+hUczpP20dDIWfsR0j/ey9Tiw=;
 b=PuB9Asy4kVUXb3XAgCOfoW3wmYJVz5GDn/W6pqBeDmJCwpkYL2QHXkAMq6nNCU7ys3
 AxwioKPaVmC9E0dJtrNNBpUUs1xj7z25t0S4pamBS91QARvCGrWwXyYElZHs3bQSipRh
 301O9vLVw2w8TQD04XxW1nRXomIGTTXRktIEj2tDwkEHDyNNsBpC1wf5qYWsVPlrm8Tz
 RfNEfT8YdtBx6yXZUzK3EMHNpSf1vuZXjojM2AaLadT+02lx8nxu+H3YvevtuOroo9im
 GAqup+VO/XnYUhO5FxzmDQRykvvTZwOrvOyElWYn/2lrEIXp03lSTBHdvsP1tE/HO0KF
 loJg==
X-Gm-Message-State: AOAM5312ARcBsykrONi13H4yx+tPZPV+6ZhbHd/97fjCfYa6GaFAPC1b
 ZQXUp6yvz5f2pp9aEYiBw8ubvyg5roGs2/AeLXgoTg==
X-Google-Smtp-Source: ABdhPJw5qI2FBujVdPAIVvAj3jSg4zjs9RMJKClcsOYG+xUm5QnHVheQYgD/EZL/xPqF5eCrT5ZNISpXBZX2RqeT8fA=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr24607715ejz.382.1617569304693; 
 Sun, 04 Apr 2021 13:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210401180235.226321-1-mst@redhat.com>
In-Reply-To: <20210401180235.226321-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Apr 2021 20:47:47 +0000
Message-ID: <CAFEAcA_NfoZHuwO6hEsBTG186tD=EQ7Pz3wFy5xn3g3pWO892w@mail.gmail.com>
Subject: Re: [PULL 0/9] pc,virtio,pci: bugfixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 1 Apr 2021 at 19:02, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 1bd16067b652cce41a9214d0c62c73d5b45ab4b1:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-03-31 16:38:49 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 8ddf54324858ce5e35272efa449f27fc0a19f957:
>
>   pci: sprinkle assert in PCI pin number (2021-04-01 12:19:52 -0400)
>
> ----------------------------------------------------------------
> pc,virtio,pci: bugfixes
>
> Fixes all over the place.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

