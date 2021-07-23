Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCBA3D3BC5
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 16:28:30 +0200 (CEST)
Received: from localhost ([::1]:41852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6wA9-0006w1-8O
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 10:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6w8i-00068B-LL
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:27:00 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6w8g-0002Q0-UA
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:27:00 -0400
Received: by mail-ej1-x636.google.com with SMTP id nb11so4001529ejc.4
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 07:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1U6UvWv8rkkYP55T02FkkhEKxrSTKQsJ00EMSGLAy1A=;
 b=ZPGHF+ZKYQvrjujTytfNXBeHzSxW87AF0dZgMvYi4Z8hdKzpEFtH+7Z/ZIdBaozd4g
 LWFK0oW3aYhyrL9TXH/KzuIyACVRsTWg9OEfRkEQy6BLSt7caUkBezoR/ZabyfP0va04
 hJ7mEkmZd1Fk6G67IqFEBgpNRRkWvKP7Y09r/P1KEdWMed+Tv/AD/F+4jH1RH4xIp3bX
 1taOXdVu6+kWLuSrhcpHog4Ut/0RrA8UbV9u6+rE6wkuH2dgXBG1UoczOSK+whvsAKzm
 arhcagOOEZZft5dLq5VLrtZKdSNtxWJFArh1Gxf6RP2h8uqLrfv/tS2K7R22ZNNQ9gXo
 Q4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1U6UvWv8rkkYP55T02FkkhEKxrSTKQsJ00EMSGLAy1A=;
 b=LtIwycrJHsPYfv9gx/gHPyEFasFxWgBPHJb3+GBYN5bF57KkvhfuQU+25gwMQ7Z0Ba
 hUKpipcI3uFBT/h2pbptLPoSWpnZXk2Qd4sH4/vgUlKE4JSfhyTmKBqILXoBpX0uHhgB
 FtPgxH/9HJpScSHAhVbmTP9i22Rug7X8y1UvbtvkSvO04ajC77LgPzNKcnXvrN+fmNcT
 o/grwAf4lc8SjTdQcJdXbrSHdqVEDFiutlCOXLTKa2Db6fCw8Sck74M8+Rys2Ws/md+S
 /DLqSFmt5Ncq79Dj6MGXR+uxpOOshtQbnkEokQ/BDGcZ4jOM13eAhUmSNaqUnUAOrkHT
 eBqQ==
X-Gm-Message-State: AOAM532e2+ZmqAkUN9cvcWeuD3YIWGDHLD0hVM67Gm3x9ysvoiNJYfV8
 fFSLQXBAidiDjRJSJSATws2bWvVSCeJWCrOQRy7vjA==
X-Google-Smtp-Source: ABdhPJzYspK9yyEP5NaI7NWU8Hu2cswVp5jxL03/XAjDoDqMhKgVPunMjKtvIRjy8+f6XB7syxDm1KHNY27rpcF1ds4=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr4911189ejc.4.1627050417343; 
 Fri, 23 Jul 2021 07:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210723055448.1032115-1-kraxel@redhat.com>
In-Reply-To: <20210723055448.1032115-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jul 2021 15:26:15 +0100
Message-ID: <CAFEAcA84h3t+J2wzs4BM+Qm1nhRoVTvXzDRzqSVmcw=P8Nd0aA@mail.gmail.com>
Subject: Re: [PULL 0/6] Vga 20210723 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Jul 2021 at 06:57, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit e77c8b8b8e933414ef07dbed04e02973fccffeb0:
>
>   Update version for v6.1.0-rc0 release (2021-07-21 17:10:15 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20210723-pull-request
>
> for you to fetch changes up to 8a13b9bc0f283caff4333c75bc396a963f47ce5c:
>
>   hw/display: fix virgl reset regression (2021-07-22 15:46:54 +0200)
>
> ----------------------------------------------------------------
> vga: fixes for qxl and virtio-gpu
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

