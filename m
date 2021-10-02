Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A441FAE5
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 12:33:44 +0200 (CEST)
Received: from localhost ([::1]:33734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWcKt-0000nb-L1
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 06:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWcIu-0007d4-Im
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 06:31:40 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:43786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWcIs-0007Ti-UF
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 06:31:40 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 a131-20020a1c7f89000000b0030d4c90fa87so3282988wmd.2
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 03:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pZaRY5KmOeLehmHXKtttyvmihqvIvXWxNSugh0F3NMY=;
 b=w4atiU1qYchG7iKwJXnOtx+oMZfdaBMgNEIMdXpFAnoK7Bbv1cU+VhBF3p0C0bRt2X
 6EBqkXNGH+iVDHhfa4QkoNZZboUEJwnhes+3eQ+O4TPwst0cgRn+nHELRLuIHlKDu2QD
 6687haLgl4buzIETiB9hCnPqrUPI6G4ciDLol80Jwq0o6RQSHP0D/0+5A2CuGUUfX1Ck
 J146v0AzGVvx3tjBoA0aAkhrtq5oyAlVdoXa/g1IdpRhotMPyZzh9qGOk2nF9b19c982
 yD15pvo4dazRhlwx6ZJiYM4X0Vd68ToTAJGJkrYCtn5k5KShYAnDmHBR4l6LWaZVDn07
 CQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pZaRY5KmOeLehmHXKtttyvmihqvIvXWxNSugh0F3NMY=;
 b=zz2TORRQPTH92zE0c3qVZtCAJz2sQUH1TGPAxr5BoX0LGLgyzg8LYycsKkHMabGgL1
 JX1TRdtrOZMLuYJ2n2EnowmmKN5gqyF+5tdSVAyCxbpj5PxAuzm29M0Vqv5/PjzpzVEl
 VGk1Ot4nkCfhK5ndtBZ17xhZ3DlFnoPU7hzb3vJ/6xKl7TuGJtkc4qcgjVUh1PiFSa7y
 w21PutiRDRiLOAtJXgQFdv9PP4W3uXZo476GSN0CZOxxRtLkWZRp72sAoZ49BRSHb6AT
 irhVNfwaL7sSBG3x+ze4PmMnMt7bpvtdK33DSIjEwilZU/ZEmxGUOIuRtQoxHPVY/q9T
 wmNg==
X-Gm-Message-State: AOAM5310d+fbJERWJ5gh01WnanxHHpcPaFXO2wovUcRLcd8s6T3MUMcL
 iSAhQknGKF1zUY7VugYcl/4OSKm1q0PdNTvQ0PJcDg==
X-Google-Smtp-Source: ABdhPJyZLJdvI3i2OXweXgrOe16TqQhBjPuR6D0Dpz5p9obOvOtXQ1Wh8D4i+SRcXPCNtd0S9Pm4ZCQs/ITWuZzpBJ4=
X-Received: by 2002:a1c:9d42:: with SMTP id g63mr8553519wme.32.1633170697157; 
 Sat, 02 Oct 2021 03:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210929092843.2686234-1-laurent@vivier.eu>
 <20210929092843.2686234-12-laurent@vivier.eu>
In-Reply-To: <20210929092843.2686234-12-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Oct 2021 11:30:43 +0100
Message-ID: <CAFEAcA__kwF8fLeLPFKayZn_xU+tOypAx7oHZY99SJLRTWtKgA@mail.gmail.com>
Subject: Re: [PULL 11/20] nubus-device: add romfile property for loading
 declaration ROMs
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Sept 2021 at 10:53, Laurent Vivier <laurent@vivier.eu> wrote:
>
> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
> The declaration ROM is located at the top-most address of the standard slot
> space.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Message-Id: <20210924073808.1041-12-mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Coverity spots a memory leak here: CID 1464062

> +        name = g_strdup_printf("nubus-slot-%x-declaration-rom", nd->slot);
> +        memory_region_init_rom(&nd->decl_rom, OBJECT(dev), name, size,
> +                               &error_abort);
> +        ret = load_image_mr(path, &nd->decl_rom);
> +        g_free(path);
> +        if (ret < 0) {
> +            error_setg(errp, "could not load romfile \"%s\"", nd->romfile);
> +            return;
> +        }
> +        memory_region_add_subregion(&nd->slot_mem, NUBUS_SLOT_SIZE - size,
> +                                    &nd->decl_rom);

'name' is allocated, but never freed.

-- PMM

