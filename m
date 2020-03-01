Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF00174C43
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Mar 2020 09:23:56 +0100 (CET)
Received: from localhost ([::1]:39238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8JtC-00027H-N3
	for lists+qemu-devel@lfdr.de; Sun, 01 Mar 2020 03:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1j8JsO-0001dZ-G2
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 03:23:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1j8JsN-0002XJ-ES
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 03:23:04 -0500
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:44188)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1j8JsL-0002WF-1J; Sun, 01 Mar 2020 03:23:01 -0500
Received: by mail-yw1-xc42.google.com with SMTP id t141so7897505ywc.11;
 Sun, 01 Mar 2020 00:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xLoX3G2fykg3Y+f9P5/71XfGh+NJ9L4hDR7j2wpIGKc=;
 b=dN87W8FEyMmwKnSscTF1r4Cc11uRNqfjGcJzQf1Q1jVuWkpwJCtngHDWwgLdNk0Ybs
 H2Z72QKYdiDBtBZ2uRUIAeNVjaSo8ha/phQwWxtObnkpZBE2P2cOiotSfCm3RXwAvGEg
 GSStTfQ0KJBPXvfGgPmD/xSwzrLokzUBV+TQmEQqY89p1bipIAvSoB2NFk0e47twgKaV
 6c+BQxIm032UXr8GwVwHGDl9BYEVjKvx2NAuD8DRy96dK70A8lTDb4bQMdCvGd6jqx+0
 ulp4hKpiw2MrJnNkakVop6HeuXHwFC2m+JQeLE+D5XU3dK68eM0iMYlKmefGTEZQanUw
 Cn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xLoX3G2fykg3Y+f9P5/71XfGh+NJ9L4hDR7j2wpIGKc=;
 b=IZGK3tRX/Lg6bmPwqEVUKFNPYYV2rxSFBwCeCnWokkxuHzh7S2Xm6Sf0jSg5rZArIe
 w6y613BoPzMsPijB/vKu1pwCQxc8HTm/0sS6kAl91dW/lWW7LwycHvd8FHTt1R2Rx+06
 iRApCxBQ/KDDpvPNrzhVGT77tZGpjSD2dSby9Om+0CVkDfmXVN51Rg04MgTsNmYJAnpe
 IKL9SOgMGIBdo6+HzsYQgjWZn7j/Scwglrji0TuB1kcGUvVh+KaXVXKf6HKN/5ywbA6U
 1CkRFIXPBXWfYZLvmBxH33eMnbUg8/rufzuRzlJOe+r/2ZqAnkCeBvW+QQ72zq1O3Wq3
 muUw==
X-Gm-Message-State: APjAAAV8f/pmAlWRZEIz4Ry+ZWS0mSVvu99v2DN8L08XiwnzS5lTFRkO
 ffmK+oGTq6wSjZTcFBYEur7/BX7hVHHW+8Ubd4o=
X-Google-Smtp-Source: APXvYqy15nR9f9z+rz0EO2CLk6kW28l0BvXfkHZAJAepZxwJ2N2b/vA8CFBrXPBc5aITQJzJy5v1dE18BWh7a4oN2S4=
X-Received: by 2002:a25:9a05:: with SMTP id x5mr10203963ybn.29.1583050980215; 
 Sun, 01 Mar 2020 00:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20200202134217.14264-1-anup.patel@wdc.com>
 <20200202134217.14264-2-anup.patel@wdc.com>
In-Reply-To: <20200202134217.14264-2-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 1 Mar 2020 16:22:49 +0800
Message-ID: <CAEUhbmWhwYx__5jBiywgpc7mbJiK9CSoGcP+_DhWrs94GhG4GA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] target/riscv: Emulate TIME CSRs for privileged mode
To: Anup Patel <anup.patel@wdc.com>, Jonathan Behrens <jonathan@fintelia.io>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 2, 2020 at 9:44 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> Currently, TIME CSRs are emulated only for user-only mode. This
> patch add TIME CSRs emulation for privileged mode.
>
> For privileged mode, the TIME CSRs will return value provided
> by rdtime callback which is registered by QEMU machine/platform
> emulation (i.e. CLINT emulation). If rdtime callback is not
> available then the monitor (i.e. OpenSBI) will trap-n-emulate
> TIME CSRs in software.
>
> We see 25+% performance improvement in hackbench numbers when
> TIME CSRs are not trap-n-emulated.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        |  5 +++
>  target/riscv/cpu_helper.c |  5 +++
>  target/riscv/csr.c        | 86 +++++++++++++++++++++++++++++++++++++--
>  3 files changed, 92 insertions(+), 4 deletions(-)
>

Jonathan has a patch before:
http://patchwork.ozlabs.org/patch/1106480/

The idea in his patch does similar thing according to mcounteren.TM.
But in this patch we seem to control the TIME CSR purely by software.
Is this behavior spec complaint?

Regards,
Bin

