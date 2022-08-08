Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972DB58CCA8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 19:24:47 +0200 (CEST)
Received: from localhost ([::1]:57672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL6Ug-0000pd-Ky
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 13:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oL6LB-0001LD-RG
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 13:14:57 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:43867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oL6LA-0003dA-90
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 13:14:57 -0400
Received: by mail-yb1-xb31.google.com with SMTP id o15so14620802yba.10
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 10:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=XeC6MciYwmMHdtOxX+nDFtaWbWnjwBnaErIaOmBI9ZU=;
 b=qaaLQBONZtFAzI2pvbb32YG+pRTKE1N8WfQsQ7uIMjFc4xcQJ/w5fAL0NQAzTyqv/0
 Pw7QQSa+8zZnHRk7URer2CFEB5NbVUOsvEcMkQQOY3wiG2zzWZYyfLQnGBaX1ILiFmZt
 oYg+z6Mim0WTpH2BJzmrD1nGctiGt4fGAS7iHDKpJ3xZGGTitdIEd9VoEUfAfFaKEoiM
 1MeqfpIdQWErzflIeQ3sL6UN/pxBPY6wqqDjFlG7dsP9FeHSY8mkLuFUbHMIXogC2hF9
 nvkqMNpRxmvuoiObV53B836IJlDK38QjaMQO1pFoI1xHctv7pvqug8fycISV05y+LaBi
 Wv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=XeC6MciYwmMHdtOxX+nDFtaWbWnjwBnaErIaOmBI9ZU=;
 b=e48jI+lzIPaXKxmQMZnsWYW/spVEd0KK1qzyjprhL+s1YkQSLK5dUFS9Dd+JuWXVWH
 pO8koJ9ty2oJfesRhJlkjQdqIybxgA7Py7YRDk6NuuzfdBtFCzWONjfKnLnKmTCyZnzf
 5naGkFaG9Tz8Q242QktMRB5BCfM3bojCgLhh8vHxgyQK/F5FCqdpy6/zC18w/7cFXIyy
 9CGNsmioiThB7Z3bP/Of00iWwUvIp996EHPG9piPcMgGeKAkOVaNYdW/yvOA31dxOQn9
 kYHIH3hFZ0+Dl4c+PDh0sPda4ZQuDParO1wB8BqHB8Se2yBSaViTrkMAbW9suGBcNTTo
 2TDg==
X-Gm-Message-State: ACgBeo2yJeQnDw+X8zrx5s6xu7t7lUR1ycTooNh0OqU99SYctzY6px0A
 HIP2HQzTM0OlbpI0e1POqhiX03XBA3eJ0K1U2YnjIA==
X-Google-Smtp-Source: AA6agR705/5gZli0/0yS2dzIZxKQ0D6meZWOdNqnzhKifd7irZBeSktXtWomTgag8afXdxHylbcV7kXiVN5qiJInej8=
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr17907327ybn.479.1659978894800; Mon, 08
 Aug 2022 10:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220808102734.133084-1-clg@kaod.org>
 <20220808102734.133084-8-clg@kaod.org>
 <2499ab9-44e8-a33f-5f4-74a1d7ad3e7@eik.bme.hu>
 <4cdc4026-78c5-e617-c74c-3ee5aa5d44d3@kaod.org>
 <cd735510-ec37-357c-3fa9-34b0d445c5a2@eik.bme.hu>
In-Reply-To: <cd735510-ec37-357c-3fa9-34b0d445c5a2@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Aug 2022 18:14:43 +0100
Message-ID: <CAFEAcA9ThTqTaJCNM1M97+yMfj3gNPwpFxy6weAG6fcaGfbqQw@mail.gmail.com>
Subject: Re: [PATCH v3 07/22] ppc/ppc405: QOM'ify CPU
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Aug 2022 at 18:05, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> But the handler we register here just calls cpu_reset which seems to just
> call the reset method of the CPU object. If we have nothing else to do
> here do we need to explicitly call cpi_reset like this? Wouldn't the CPU
> object be reset by qdev when resetting the machine or the soc its in? If
> we have our own reset method we may call cpu_reset from there to make sure
> the CPU is in a known state but is this needed when we don't want to do
> anything else? I don't know how reset handling works but some machines
> seems to do this and others don't.

You do unfortunately need to manually reset the CPU object. This is
because the 'automatic' qdev reset only works for devices that hang
off a bus (including sysbus devices). This is because it works by
having qdev_machine_creation_done() register a reset function which
does "reset the sysbus". Resetting a bus resets every device on it.
Resetting a device resets every bus it owns. (This means that for
instance PCI devices get reset because the PCI controller is on the
sysbus, so it gets reset, and it owns the PCI bus, so the PCI bus
resets when the controller is reset, and when the PCI bus resets
then all the devices on it are reset.) So reset propagates down
the bus tree, but it won't reach devices which aren't on that bus
tree at all. The most common case of "device which isn't on a bus"
is the CPU objects.

This is, clearly, a complete mess. I would strongly like to sort it
out, but to do that we need (a) a plan for what reset handling ought
to look like and (b) a transition plan for getting from here to there
without breaking everything in the process. I haven't had the time
to focus on that, though it's been nominally on my todo list for years.

In the meantime, it's the responsibility of something in architecture
specific code to arrange for the CPU objects to be reset -- whether
that's done directly by the board, or hidden in some other layer
of code, depends on the target arch. For instance for arm it's
hidden inside arm_load_kernel() and board models must therefore
call that function even if they have no intention of supporting
loading Linux kernels. For sparc it's done directly in the board code.

thanks
-- PMM

