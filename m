Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE22EF1BA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 13:02:44 +0100 (CET)
Received: from localhost ([::1]:39470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxqTb-0006yd-EB
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 07:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxqS4-0006NN-WD
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:01:10 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxqS2-0007mh-PV
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:01:08 -0500
Received: by mail-ed1-x52f.google.com with SMTP id cm17so10957593edb.4
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fP/qEYZEGDFRfjuEHIlUuy7VdR+fkK+BoeTNoMGoGkc=;
 b=oOK7OvmOUBm7EmO6nssa+X/aiGv4HkJCY/uSIw1vYotmLu5jJQN6c6eV8rkydvugr1
 7b3xY9Qdb3WOqRJgn2LP/oqXV5YWmx2vwem5omkYcuNLzZ61a5hDxgt/i/WA4v0ehUyD
 wMFVY+Fb4O4IASrO0f28JM5NzBS6sFKGqdt9Qki9NnM9DXyl42y4b+c9wVbMGha3/Dbg
 +Fd9CEgVomGwYj2Xcp9RtS+IDrljAP0qB7dYHHqn0mTey+e35oxqGGhmZnlY5otaV+8u
 cSLuKB3Dia/9XnoCOI8YOJezJeN514+1/lTxqpZmYU/K04duZwR9yXrjtgByNXiz/mHx
 5rCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fP/qEYZEGDFRfjuEHIlUuy7VdR+fkK+BoeTNoMGoGkc=;
 b=H1ZlTq6rrv898NHNCl9LLtu0RQLBDAOYxljJUuW/5b8I30pafyHTHDl9LOxeCWa+Gr
 P4Q2zdSgsi9mqx3aw7VYAuxEIYqsw6FKcfSUoM7jd9SHZUWn2bctj8Le/qBhIWB/h3UB
 HHJ/Ko8ukoEXao1cmB5C0PcL9oPvpxOarpR1OfOPLGeR+woIQy6Aekwq5+Mufk8jWMSO
 vi6cnYwlWi12TrTevWz+iTrqMvgZLqr2csrDxbgu4LFHa931UcMiqaNiwPsXx4q0Qkdm
 9deW4ufZaWPwIegzVDMCufcKi+cX1GvgD8pQceCw9e2sNhmv9szE10XFw4/RAfgt59Rf
 txzQ==
X-Gm-Message-State: AOAM533fk+TEfjRHCSFixzlZo5VkSv+okA9Aw7YlsT78oUf/HrGUO2TI
 Xh58MSwFmgkqxT+DH2mKAjR0IVrkWikUDbGc8I7jgA==
X-Google-Smtp-Source: ABdhPJyavmNM3mPdY/gExcnC7UAz4yMWEaNdLiZFmlUQvekvE3u/6xkWk/gP/m01XtE5QUHH9BAqAr/rNJR4dQm7dGw=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr4911789edw.44.1610107265082; 
 Fri, 08 Jan 2021 04:01:05 -0800 (PST)
MIME-Version: 1.0
References: <1608295996-8464-1-git-send-email-mihai.carabas@oracle.com>
 <1608295996-8464-4-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1608295996-8464-4-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 12:00:54 +0000
Message-ID: <CAFEAcA_CGCCH8YahZQypxqobrngyV2YPgWQhqb0Oqcgbfz0DaA@mail.gmail.com>
Subject: Re: [PATCH 3/3] pvpanic : update pvpanic spec document
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Dec 2020 at 13:36, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> Add pvpanic PCI device support details in docs/specs/pvpanic.txt.
>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> ---
>  docs/specs/pvpanic.txt | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
> index a90fbca..5ddc8df 100644
> --- a/docs/specs/pvpanic.txt
> +++ b/docs/specs/pvpanic.txt
> @@ -1,7 +1,7 @@
>  PVPANIC DEVICE
>  ==============
>
> -pvpanic device is a simulated ISA device, through which a guest panic
> +pvpanic device is a simulated device, through which a guest panic
>  event is sent to qemu, and a QMP event is generated. This allows
>  management apps (e.g. libvirt) to be notified and respond to the event.
>
> @@ -9,6 +9,9 @@ The management app has the option of waiting for GUEST_PANICKED events,
>  and/or polling for guest-panicked RunState, to learn when the pvpanic
>  device has fired a panic event.
>
> +The pvpanic device can be implemented as an ISA device (using IOPORT) or as a
> +PCI device.
> +
>  ISA Interface
>  -------------
>
> @@ -24,6 +27,14 @@ bit 1: a guest panic has happened and will be handled by the guest;
>         the host should record it or report it, but should not affect
>         the execution of the guest.
>
> +PCI Interface
> +-------------
> +
> +The PCI interface is similar to the ISA interface except that it uses an MMIO
> +address space provided by its BAR0, 2 bytes long. Any machine with a PCI
> +device can enable a pvpanic device by adding '-device pvpanic-pci' to the
> +command line.

Why is it 2 bytes long, when both the ISA and the ACPI interfaces are
only a single byte? What size reads and writes are accepted?

thanks
-- PMM

