Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568C931C886
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 11:13:27 +0100 (CET)
Received: from localhost ([::1]:34512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBxMD-0000zE-Sg
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 05:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBxKb-0000Yn-Ir
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:11:45 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:37239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBxKa-0006Y3-03
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:11:45 -0500
Received: by mail-ed1-x534.google.com with SMTP id o3so9253238edv.4
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 02:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XhnAYhrOmtNYBYH1EqN/J6DfGvJONW7wXsjJ7KimBGc=;
 b=nNBktqfocck00lbptjqWAzSc+a4Zc6+Y4tmYg+xx6E2DI01bSYhSGDtijD5mP0iuk7
 qkESG4LFDuxjfM0t+Nfq28W1Kq1IbK0s5WKB+0W8evKEJB5PVzN1YHTRpAIAKiFmK0iT
 tK8BFZ9NYCMsXwkoQpVR38Fjw3nBDu/ufUmCPAmXRvGke6YGIy8wXCE+DUr8IcwauaAe
 g58I2X5xmTCb6+cxrZdt7cgRIShM35gcB2S2MPEZoqdaGqHdtI0LPsDHWsGDcpM+8kLm
 Pa0qBJX63wVe4VTys9bakmJc1PHIKoyMi6oEyiGaN2X5hSGv7LBoGc5AxVcb9BRqPKzd
 Gp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XhnAYhrOmtNYBYH1EqN/J6DfGvJONW7wXsjJ7KimBGc=;
 b=F+ArbayCPCp9Mcrj31AnQoz0tX5qy4Vs3Nh+SSW1sk4u2Iq/JgKz7F6uIaxDy0OHSs
 0Sx/N87HSm0ijyM2sGm/jnCO7SkqQnRmzMGfEs5DXlI9obUhrx6zLg4hy4u9B+oy7O+0
 6zhTj+9jG2dvsI/uMFj1SeaU8Ja+Hsg2xTS9KjJ/ubUI6hRpw8zLnffPg2d9dBgkkkOi
 4scA31zh61oO3JKZEGOGbUqXPTOLNtzVxT5MUz1WXD0jXCigiwb3uCQUYZtYwMqqAGcI
 qtLop6YT+vpKFD3RxXMgO7MFlNMZsgib6XYH5eeAL/8LogYZDQ0TZVXJsWVhaCFMM6ys
 vznw==
X-Gm-Message-State: AOAM530HB5RBsurDBoTD+ouqQRaOTSFZIV5TfpMire0fSJ6GFOlxftYL
 b+jAvy1Lq7mcugblhI6TGo46XKAHq+W9kuOPqU66WA==
X-Google-Smtp-Source: ABdhPJzs1c+I7HG1+20Jl3iHbQiUTccutqRqTV1xkG6YVPaeqLSDn6Z3YWE2c42rxJanjrGttiFm2wCgSNvLNwSvx6k=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr20013618edd.52.1613470302301; 
 Tue, 16 Feb 2021 02:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20210215102149.20513-1-peter.maydell@linaro.org>
 <5b91b4f1-f557-ca74-9e68-8f860cac76c7@ilande.co.uk>
In-Reply-To: <5b91b4f1-f557-ca74-9e68-8f860cac76c7@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 10:11:31 +0000
Message-ID: <CAFEAcA-QP8-hc1i-fgy--=R1K99ubxRDX38Q1QrVrzQm+aMbew@mail.gmail.com>
Subject: Re: [PATCH] hw/display/tcx: Drop unnecessary code for handling BGR
 format outputs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Feb 2021 at 22:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 15/02/2021 10:21, Peter Maydell wrote:
>
> > For a long time now the UI layer has guaranteed that the console
> > surface is always 32 bits per pixel, RGB. The TCX code already
> > assumes 32bpp, but it still has some checks of is_surface_bgr()
> > in an attempt to support 32bpp BGR. is_surface_bgr() will always
> > return false for the qemu_console_surface(), unless the display
> > device itself has deliberately created an alternate-format
> > surface via a function like qemu_create_displaysurface_from().
> >
> > Drop the never-used BGR-handling code, and assert that we have
> > a 32-bit surface rather than just doing nothing if it isn't.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> Thanks Peter - looks good to me.
>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
> Would you like this to go via a qemu-sparc PR or is it easier to go as part of a
> group alongside your other display surface patches via target-arm.next?

I'm happy either way -- if you don't happen to have anything else
queued up for sparc I can just put it in with the arm queue.

thanks
-- PMM

