Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADBC41FAE8
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 12:36:46 +0200 (CEST)
Received: from localhost ([::1]:39964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWcNp-00054X-7O
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 06:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWcLt-0002sd-3s
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 06:34:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWcLr-0003YQ-Gw
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 06:34:44 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v17so19546390wrv.9
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 03:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ARS8Q92xAZvkeeFc95ExZ8YifJ/nV0bAlY9bUVIrYHg=;
 b=BQUR4DKNxqcpVkWCaTUrpKQ6xB/xdXZgG9rlPosevMJR7LAyDHPU2H0uFaB+k8iuBm
 gIIVz5+CyRQOH+aWpT8POcF6PKVsvXD0C8KBVuy049PLx3tO/KzYURMb9tAlxSCv5tjJ
 kqG43qgK5evz0/j1n8iAf9szP/UdrWFpmVC9yGZB5Oey6yZgmjy4AEr2IpacovUe4m/u
 90UVz/6JDk/1r2ILrTv7TY6THKqz2SNPeNmrmFsz9PiHB68TuRUYbVuma1lKMgc0fbRf
 WcF5balQ4UG54ROgymL94k2PzL0qVgH6mhEklP2K0Yl9eU0jF7n+/6UPKIKD5Nyewn4g
 wvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ARS8Q92xAZvkeeFc95ExZ8YifJ/nV0bAlY9bUVIrYHg=;
 b=pG2LDdAvytTSTVRnYae8JIg/iAqcC5QXFFmV//AZFYoFCT94vWL5eJ3JV1r2zpN4AM
 pFt7u47+1e5K1NIzHgRzvMZ8wrH1Jwh5ib8LbaSSIDjA2atDdrm/vk3XON/p1Ie5R1id
 4F3gzK0wf+Ojern4rrrend1DRz0uUIagsS7PMfiZ5PaF31gj0+43QoVLrJM6SBSm92cx
 vvs5lJp2w6CHY1CzOKFoNnlNYz7nbcIockft1oiYLNBJBu+0hQ/mY7n/vgxa36PhEgWL
 69qdEfHpS7elFf6w1UhDlvyT8OW8h5kWJURyroz8DJdtpTdh8fK6iKy3Z1p7FoKBlTwL
 +OyA==
X-Gm-Message-State: AOAM532XnTa6Ho9xqld114Z6Jzqj5N5vRROt3oZb8xphY+8lz/HkrisE
 daiW7UZN7Ew/TWBA5G7x0XcMsG/la/TmtHBLrRZ/9w==
X-Google-Smtp-Source: ABdhPJwwDi8dDt7VAX0bUTzbnOAAmZr73j7VQP7bD6g79yslG+Kld+PTI65bSSVJZyvHMpfGpSUvATfCYKyxEiAHSOo=
X-Received: by 2002:adf:8b98:: with SMTP id o24mr2864797wra.302.1633170881913; 
 Sat, 02 Oct 2021 03:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210929092843.2686234-1-laurent@vivier.eu>
 <20210929092843.2686234-4-laurent@vivier.eu>
In-Reply-To: <20210929092843.2686234-4-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Oct 2021 11:33:47 +0100
Message-ID: <CAFEAcA8528uFsvUU3+z-wiE7jz_g80ff4U=XaBifoYZbGBC5nA@mail.gmail.com>
Subject: Re: [PULL 03/20] nubus-device: expose separate super slot memory
 region
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Sept 2021 at 10:49, Laurent Vivier <laurent@vivier.eu> wrote:
>
> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
> According to "Designing Cards and Drivers for the Macintosh Family" each physical
> nubus slot can access 2 separate address ranges: a super slot memory region which
> is 256MB and a standard slot memory region which is 16MB.
>
> Currently a Nubus device uses the physical slot number to determine whether it is
> using a standard slot memory region or a super slot memory region rather than
> exposing both memory regions for use as required.


> +    /* Super */
> +    slot_offset = nd->slot * NUBUS_SUPER_SLOT_SIZE;

Hi; Coverity thinks this multiply might overflow, because
we're calculating a hw_addr (64-bits) but the multiply is only
done at 32-bits. Adding an explicit cast or using 'ULL' in the
constant #define rather than just 'U' would fix this.
This is CID 1464070.

> +
> +    name = g_strdup_printf("nubus-super-slot-%x", nd->slot);
> +    memory_region_init(&nd->super_slot_mem, OBJECT(dev), name,
> +                       NUBUS_SUPER_SLOT_SIZE);
> +    memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
> +                                &nd->super_slot_mem);
> +    g_free(name);
> +
> +    /* Normal */
> +    slot_offset = nd->slot * NUBUS_SLOT_SIZE;

Same with this one.

thanks
-- PMM

