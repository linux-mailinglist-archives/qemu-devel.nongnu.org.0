Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320242D89DD
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 21:01:42 +0100 (CET)
Received: from localhost ([::1]:48764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koB5F-0006TW-T3
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 15:01:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ko9tH-0006FP-8G
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:45:13 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:38284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ko9tB-0003Ef-5L
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:45:09 -0500
Received: by mail-ed1-x544.google.com with SMTP id cw27so12914471edb.5
 for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020 10:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tzUsb1oAOgAwkhpFJliDtvmjm9NTDD2Shb+dSAyDTts=;
 b=n9AuUX2UaXmUg0AQdVSCooAu338lwKCj9TI2vXMFYlfT+MrTniTIB3Ov4IeJJ5EASR
 fbuhpAaxcZ3RGcMtOTpL0vuS7vQfIonVhunxKGjpdkHffC8pDVeLM+InDVDm6o6XpkbL
 P6mG/3LV2OG3XF25pE3QaRjGvYuLBCnnBACJy2Dm+Y04ZS8ugdVDQSP+lDYK/HgVSMgZ
 29A4LIoUdyE3oh2fqxw4yUP5njhz0KUSLA5tl6Um9hjkmo+W55NmseDlfeyJ7sFCzJt1
 CnKA/jTtQxx8LpkVLOx9uTfZIrZeUYOjPn0FxC1TP9zqMDzGn71l0mcZNCBuVxM6ZVxE
 Tk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tzUsb1oAOgAwkhpFJliDtvmjm9NTDD2Shb+dSAyDTts=;
 b=UQ13ek+shY6bGfaCKtW/4jQtwHFsm2jdgTnMcr3g67MgAS2f6HlXx1tYx5k2fqlck9
 91RNuHFy8W73r1a8wjyvnebDEINvw/O4MO1IASKbeX/NwjKrfR8eOzEkkDvTxMtA/sD6
 hr4ojh4T4CwCh/RdP2qTETn3oyQuFxXjAZ/Sf3v8bveBmEvVS1IBOYAcAm+YqgvJa30s
 2u+otDSu+bJwnZFmVgx921bPmr9RAkwwNR7aqtj/Ztfkb++tInebEDDT9V/p0wM8hO1b
 2XqRGN7f7aEYBytYUrt3hRaNun0kmx92VeKRj3/BbYp/a6uBlOQtNBm6bJXZn/gTE9S2
 dxgw==
X-Gm-Message-State: AOAM531KcmYFP7mJuEPCuQwAVSI4xtrFbveU2xpcfVlykK6cI/Bi1fvB
 idJ9As9Yql6/71EIJ7NOOOCi91wfAXKxUBhHNSC2AZ1EiAg=
X-Google-Smtp-Source: ABdhPJx7XdlDKAFWotIqaFdp3hZice5M/x2dBsqEs5YhnYm27HfNvYl5CAYYbew51YQQZuw/X321TEP+/lm/MX+yv4c=
X-Received: by 2002:aa7:c388:: with SMTP id k8mr16509651edq.36.1607781654038; 
 Sat, 12 Dec 2020 06:00:54 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-12-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-12-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Dec 2020 14:00:42 +0000
Message-ID: <CAFEAcA_3eSKuAZj=pwV33csLdbVnsAhkm4ZNehinn7YYUkJ44A@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] compiler: remove GNUC check
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Dec 2020 at 13:50, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> QEMU requires Clang or GCC, that define and support __GNUC__ extensions.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

