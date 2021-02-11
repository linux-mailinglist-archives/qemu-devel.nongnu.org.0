Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138483188AA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:53:29 +0100 (CET)
Received: from localhost ([::1]:52084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9bE-0001LX-5i
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lA9ZL-0000ox-4u
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:51:31 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lA9ZJ-0004ww-Fv
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:51:30 -0500
Received: by mail-ed1-x534.google.com with SMTP id t5so6419182eds.12
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ryBdOk4HIiILtvCpweZx/RHs/3qRlJuVkUJsP44Kgms=;
 b=Sv61wKurXxqcfC5peyJQJdZM2umyXQo505JFggSb4W91y/6DXS8wZWA3llOu1S2rZO
 +Ym3jev4D5Ri8MjtWx8PVHnxVajvyWROTbAfjfoEGLfY+7HKYw8FbVtqjaB+RQAJ7+DV
 wUk5XslQGwwaD9c30o/qtZLMxtAJ2gWGzy8D4q7SYEKnckmC6IzVL7dNOwD0QETIl78v
 tWmO2nhAlVd5v1QAbDhRm07WkYqpKArIFdxWY9MkHTBBzz7E+p09UP8KMMpeUt5gINOZ
 GHRCcMNvGPwHu5n011/8JIFglEM/oD3StFwSKJQi1nSrgt3sjLYfu0Z0dmXE5JuEuEfP
 pg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ryBdOk4HIiILtvCpweZx/RHs/3qRlJuVkUJsP44Kgms=;
 b=iH6lGRSDvr5rEqAzqvK2NvG5pRBVNef8f61pXyBRPHflbwHK07G0xkT9BFliBdhJZU
 o+Wx9ta21B08aTnPAbjCsDEy50X+5zfFP7rilDEH6P0q7P33mwxIXas6Dgz4F1L2wuxa
 E53tDMQQ0gjBcowAnMp5nDAOstM2U1hyD7nJnA52SbdvO6G/t43JaCwpL80W1OHGwEko
 gQJyP41McGdHCwQF5rcUI2xx7GAAePKxWGChy5+EcMDBOcB7GhG9/Kluc+94kgG3ROtj
 3efYIhi1g0L4fxreGScQhbGRt78I/9hD7af90kG54EqTUORkQmvgnONqty2wr/LXGvX7
 Jvww==
X-Gm-Message-State: AOAM532tP5zKpdB8QR+BwxD351DLZf/myh2ViGn3VKV2ZhbtIPBNQ0eF
 OTstv4KQfBfSiUIotGCPyG8qEOwjHUa2A7qUST8SVg==
X-Google-Smtp-Source: ABdhPJzgpbfPKmNxzGWiHAcxAxREkfJ2MceivDWr2VtyZwQSiI9ef3tWCY7ZFlS9MVCeL86t/Z8SZiyN7epa28YQwIg=
X-Received: by 2002:a50:9e01:: with SMTP id z1mr7773434ede.44.1613040687478;
 Thu, 11 Feb 2021 02:51:27 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-DZJDe+DziaT9boPObnpnqyLj+-4-S+1ikFbqr_U-SDA@mail.gmail.com>
 <20210211101200.wyzaut76ik77dl2x@sirius.home.kraxel.org>
In-Reply-To: <20210211101200.wyzaut76ik77dl2x@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 10:51:16 +0000
Message-ID: <CAFEAcA-PSH5S_8G9wPVjeSy6w+s9-HCC1HA8cqgTPu+xuF7j_w@mail.gmail.com>
Subject: Re: can surface_bits_per_pixel() for the console surface ever return
 anything other than 32 ?
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Thu, 11 Feb 2021 at 10:12, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > I notice that as well as handling surface_bits_per_pixel()
> > possibly returning 8, 15, 16, 24, these devices also seem to
> > check for the possibility it returns 0 (presumably meaning
> > "no surface" or "no surface yet" ?).
>
> Depends a bit on how the surface is created.
>
> When using host memory as backing storage (typical workflow is
> qemu_console_resize() + qemu_console_surface() calls) bits per pixel is
> 32 no matter what (format is PIXMAN_x8r8g8b8 to be exact).  I think this
> is true for most if not all arm display devices.
>
> Depth 15+15+24 can happen when the display device uses
> qemu_create_displaysurface_from().  That is typically the case when
> using guest-accessible memory (vga vram for example) as backing storage
> for the surface.  Which implies there is no need for the display device
> to update the surface in the first place because the guest can render
> directly to the surface then.
>
> "no surface" can only happen when the display device explicitly calls
> dpy_gfx_replace_surface(con, NULL).  virtio-gpu does that in case the
> guest disables the output for example.

Thanks. It sounds like for the displays I'm interested in
I can just assume the surface is always 32 bits with no
exceptions (and it's easy enough to grep for whether the
device is making one of the function calls you list).

-- PMM

