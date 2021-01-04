Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C3A2E9BDE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 18:20:14 +0100 (CET)
Received: from localhost ([::1]:47624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwTWX-00080K-W7
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 12:20:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwTQU-0001zD-5A
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:13:52 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwTQR-0002SB-Nn
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:13:49 -0500
Received: by mail-ej1-x62c.google.com with SMTP id 6so37764112ejz.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 09:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TpYhWVwDUjo8I2MD6BuRSf5vVKnVma4jy4Bu2ua9JA0=;
 b=I0KhyZ7xZ3X5Dqo3KA60/IyMsl2gjxmnQlra7r02nJ2OJ/Xyit2U06kUv7m7blde9f
 +jl3YxmmE/ZOYRMM8XX+FdNPKOTpBpxBZIlZgurbf7Xpuv07NtLztwS0yLm8rIpZyNnS
 jZQVxfj5qQNoQvb8MZBOTKvtq7q1+wxxYjqj+W/q32cIrODklFlZp+G5aqd1Tr75/dv+
 ERY0DMawnEzZyaCA1TzLzzCyzmRX5417MZD6tdp9dfanIeC0c0c5H3yTE5/MHgubwJsi
 A+YI2qgNQc5SURX+uQrAQzeQ5Lwoi1wRY+LyChb8EK71cFbrqja1EAoStdqsInnoUvE1
 8z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TpYhWVwDUjo8I2MD6BuRSf5vVKnVma4jy4Bu2ua9JA0=;
 b=Y//UwD3aSEaUGyiWbDqQ68FfjFil3MLRdnKnaMbI/GitENxgZg5ALpCQ+gYP7AIRJ4
 qzH1nQHLaWsbRcvP1UylD3qGnjg4g3h9eFZD9PB4jajRkiYksLSI8rtHHbM4vakVndmU
 a3xGOFfmTg3BKUDa8Lr1clcDLmtI9kT8RtikYlD1+2CdzHbRxVrTIYuzU5KcFLFBrt0I
 QhBWudn2vBLwGmoXt3B0BBGhkHzip9ph/bM7VNZS2eTw0cFPSz7RimDfm5zx8jBs4B08
 QS8bUdtai/njbUTTfscnQv5KF1ddeU9CztG4fa/KEDgglnOs3dkkUv1iKoUY1Vqj8X+f
 FEiQ==
X-Gm-Message-State: AOAM530kKStNNEsOYftXGjZ0St5Ya4RBINxG1yTJxRcqKd2VKt12gDqL
 CC6C1EIhZagxAQtHDVIPal5dFCuMjVVA8ADmgqTg3w==
X-Google-Smtp-Source: ABdhPJxzBuPNqvL+xKjWi7NXvESriGKO+h8/YHUh6rPoPq8kxULRgiXlPF+455veKmvBsBiEB3wBN7qUhXhsCIxckQM=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr65522350ejb.382.1609780425831; 
 Mon, 04 Jan 2021 09:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20210104161200.15068-1-peter.maydell@linaro.org>
 <94abce4f-0cfc-2b3a-c571-ccdbfd0c501c@redhat.com>
In-Reply-To: <94abce4f-0cfc-2b3a-c571-ccdbfd0c501c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jan 2021 17:13:34 +0000
Message-ID: <CAFEAcA9KXaBSPMvfWgFwkrFiFtkAZng9OVz173FkvpUbWvgeVw@mail.gmail.com>
Subject: Re: [PATCH] monitor/qmp-cmds.c: Don't include ui/vnc.h
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Jan 2021 at 16:30, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> On 1/4/21 5:12 PM, Peter Maydell wrote:
> > The qmp-cmds.c file currently includes ui/vnc.h, which (being located
> > in the ui/ directory rather than include) is really supposed to be
> > for use only by the ui subsystem.
>
> That makes me remember yet another cleanup series I started few months
> ago to remove -I$(srcdir) from $CFLAGS. Now that Meson is in, I might
> eventually refresh it.

Yeah, I just floated that idea on IRC. I bet we have a ton of
places that don't follow the "headers not in include/ are supposed
to be subsystem-internal" guideline, though, so it feels like one
of those "whether it's worth the effort depends on how painful it is"
cleanups...

thanks
-- PMM

