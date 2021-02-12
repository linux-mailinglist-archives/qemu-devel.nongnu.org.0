Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188F931A4B7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:50:10 +0100 (CET)
Received: from localhost ([::1]:42794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdW5-0001Oq-3p
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:50:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAdKp-0007yl-Lt
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:38:31 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:41123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAdKn-00036f-RI
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:38:31 -0500
Received: by mail-ej1-x635.google.com with SMTP id f14so719675ejc.8
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AJjLNsYG85ze0qXDCn25l0UqkHNxsYp2LFHpRXLftIA=;
 b=c6+DSP5xLF+g0LvK0TAPNLqwTXxZIF98SJOw4sTDWb19YaWcZEFFsvBBPUBoslJsG4
 KELZ8oMDscas2ZAdy3dtxRaHUBjA3ct5WKEznMk9AOYOK+LWP/JT91Sq3Rb3Ldk1Axh+
 KiDG5HnQqBy5OSSW7khmGjoO0Y3cuOhYa4IpS+9kSPShiTqxU8OZd0G2hhOC6+6JnMW4
 l8eg23tWd++nNJRU3BHv4VuiDk/7kKIsF6duRs1CY5NFO1sYAGhn94SWGieaEf6xI1mg
 reru6HmL4lNicaLgvr7AefGhXpuFywWxJLEk1GNC0AhfKb3dilAye04HFW/QFwgOSM11
 /rhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AJjLNsYG85ze0qXDCn25l0UqkHNxsYp2LFHpRXLftIA=;
 b=qoD7yzlKKv2r0aQ2bF2+HslnCtZXuM78aoR5zeiDsrEf4sn2M8+xgezqHnlxPcH5zD
 rskf2NgMHnHsPlarciMfVJcWUE20ImhzDAJoJv09p8VwyYRIygii3Qi/49xcz4pUf/D5
 m1w3FM4cfZPTRqo5cY1f8ye/ucYZTT/RnELenUvXEFOip7BPTPx0VtALY+IvwjcgHmwE
 IkOtpS5EQvIjhIhizvn1mns+nv+E/iX9beux/RB17XIZPi/YeyGfDihUX8JMrJ2wa8EP
 sfOJCVtBgpuK58Ly8lupKO2zYU82JjIEXFsz9+QYbs9xBuZOs9T9GdvhE05ErY+X3mmD
 XnIw==
X-Gm-Message-State: AOAM530B9gedlv/tggKTGAmUZwT3yADnnOkrJHibRTT7sL9P+VLeM41G
 Cc476FIjHx2WOcnRU0p3wjaZIU+DBaXTeATmQyNWlg==
X-Google-Smtp-Source: ABdhPJyoj1BR+h3Wt1sqV/5XSs3iYBpgH2NYrwi9jokg7V7P8Yabj/dYaFXYiKNrqxMlC/WifUQhIIS+I5joaFtrL/M=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr4291757ejh.85.1613155108095; 
 Fri, 12 Feb 2021 10:38:28 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-DZJDe+DziaT9boPObnpnqyLj+-4-S+1ikFbqr_U-SDA@mail.gmail.com>
 <20210211101200.wyzaut76ik77dl2x@sirius.home.kraxel.org>
In-Reply-To: <20210211101200.wyzaut76ik77dl2x@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Feb 2021 18:38:16 +0000
Message-ID: <CAFEAcA9E-HpCv91DmBoxi2dZjXY0Nsy58dxUQ5HGFki4YK5uaw@mail.gmail.com>
Subject: Re: can surface_bits_per_pixel() for the console surface ever return
 anything other than 32 ?
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 at 10:12, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
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

Quick follow-up check: this is always RGB, ie is_surface_bgr()
will always return false, right ?

thanks
-- PMM

