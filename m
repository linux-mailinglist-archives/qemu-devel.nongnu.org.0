Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0A6470550
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 17:08:13 +0100 (CET)
Received: from localhost ([::1]:49050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mviRQ-0003jK-HL
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 11:08:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mviOw-0001Z8-IE
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:05:38 -0500
Received: from [2a00:1450:4864:20::436] (port=34697
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mviOv-0007ru-1I
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:05:38 -0500
Received: by mail-wr1-x436.google.com with SMTP id j3so15765484wrp.1
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 08:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CK1E3VQ1z/DXwubvkTMFXv98rjGUT9FJQdHkLf5QGos=;
 b=Hw26NBrAKUbOaNhbIJHTweRNUjVkazPrYLYyT6gP4At506MEYew5+KbfOa0IgwO8Xs
 40RLbaUd9DUeOwEZBLCiVZpTsvzAXe/SCEtut/wshPAcABwr8iMEBA20oIaz4I1qFbRF
 L7ghkHpcLDaNCMh9vEXVfq9ShdD3rDKjv+jFfu/YY4cp4oWZGLQCpB/dO1c4g6ACFpy1
 9P82XdHD2N6Y5OhsZBVVLD0tpqbFFR9gLYG+GlOJzyY9JHUYsHShuyTGpC/HRqQ8Agm+
 g8hZdBjz6Y6bcMsOgkUtBQex3XiH+IXMlgiYbAduCbPAmfRXyZpRuvoHoN+9yJAUONGu
 6lCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CK1E3VQ1z/DXwubvkTMFXv98rjGUT9FJQdHkLf5QGos=;
 b=XzI4Aci+vH3J3/4CpsUt3o+vufdsdoPmQ6W3cQcVYIUnvw1ZYzqbtq/KEpzQlk7foK
 nn/h/ycHSZZajqTpUEjsL8u7HO2on1DToj/K4ztc1Cj1U8hi60e1QaGn60iy5d/FuVs8
 jZ94O0bj7fNVrXQmSmDY6z/5zMnjq8jb6B7jMPcz7lPqhxV6t43y8QME+JtMWxkdcumi
 t3ywk4aqHx02D1ZS6W0Rrzc5bovMOt/PWKkKcXfP2HNkCyq8/rCL2ZjOZO6rL1jNRufl
 kJlPrY/U4bAtFAxL2JNJjWJ3C+zoYvQBULaANWWF+dxQjN8ucsjmfFTj6e3DpcvZ2OpT
 8JIA==
X-Gm-Message-State: AOAM531xuNsg0Sb+OdI8Fw0wqiqQ8qaYt1YRrfuy3kK2Mc8mnRMJrBmW
 95n3Jofcl+Uoh3mLbWJj4eqEP8hxJfbxG5Y1KKJYVg==
X-Google-Smtp-Source: ABdhPJxauYX+WqyeqzqBXWcjoP0EywuciV4OnHqNPU5oyfjbi+em0gRhEItlfkaw5tNpvbyZ7LK06yTEcMeLApma1zg=
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr14364996wro.484.1639152335654; 
 Fri, 10 Dec 2021 08:05:35 -0800 (PST)
MIME-Version: 1.0
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
 <20211201154023.13931-10-francisco.iglesias@xilinx.com>
In-Reply-To: <20211201154023.13931-10-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Dec 2021 16:05:24 +0000
Message-ID: <CAFEAcA_gKac3ugnhCM4+9SuUcBh17rRWF6eUGp6QHqtxgwze6g@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] hw/arm/xlnx-versal-virt: Connect mt35xu01g
 flashes to the OSPI
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Dec 2021 at 15:41, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Connect Micron Xccela mt35xu01g flashes to the OSPI flash memory
> controller.
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

