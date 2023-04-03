Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A66D4646
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:55:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKe0-0003Qi-5L; Mon, 03 Apr 2023 09:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjKdu-0003QH-RT
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:54:42 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjKdt-0006GT-Cy
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:54:42 -0400
Received: by mail-ed1-x530.google.com with SMTP id eg48so117584107edb.13
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680530079;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O63RSbGTNRHKa70AimcDILSKXnM2Bbeq2uBasOeJ6X0=;
 b=b3KhXdWjmt11ii5EU4KSZDPZpXqTKp4krQcikdRIAjVuwXFT3etlfHfWFXDHMCY7TU
 Pmjh9q41prtCMVM6Tq/5jro3h7stcKTyBppUyG6fZgvuLIL8lJQj3bkDGBMDWtUDIVtt
 lCB5880eyjnO2csiptZasGoj5BocPo4W2898hZ6QvpC2yaEtmfCrdsXJztKU/aHUqaFr
 A/oS4QStlsi2r70gxBfsMuAL6iyHtMLnXYhieEo0ifWYLSjwJ7sYZgiPxN8+tK2tTJGg
 ZDjdG/6oSay8gWCwEYxnwCwnNNAJ913ns2RxFSK9TW+pM/kja8uhtWftygNSpF++4kOd
 iy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680530079;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O63RSbGTNRHKa70AimcDILSKXnM2Bbeq2uBasOeJ6X0=;
 b=Gd9/+YPBJWXJocaHuELcn0T3S2OrNFE+3hRZGUQEqA9/qvuM00if9+zsZkJ21JP3vY
 tqI4+2T9hSe1UQZC0g2c/WPzx2WjO/NeYB1XkJJe+9HKQ6c1P0zgP0SD4PJ4KGWkf0Sq
 fy5qAW2By6aEHpkRDL42zOILU2LDGRclbLUfY/ZEHUutQ6rBeDm/Ox1DH6Z8xGZ2qVW+
 WlhXkbhOz0MkE8k4BRAkWOr5B0X9QciGlcUbWKvwGUdIF4i/gecrD7oU2PH8TJb5hamB
 r8fsyaHEa2iDOUP2XoXX+Y3By8fhh6N2ql4eK4UhPfWZ8y0/zYLetvcX5ks5IuCCRoH1
 dbYQ==
X-Gm-Message-State: AAQBX9clL4Wxtd3JY2S9H2BfBwR/jcfxWjIFku6JT3oO9YLxUsjC/aYX
 1UCp9fNuvJ6omNwS4jf05jeSFOcH5LPhrIS4X5V0cA==
X-Google-Smtp-Source: AKy350ZTWUbwm9XhG8JQjUJoZC2z8PAdlitmVCiDszGk4fFKtbX5vMjAosTLx1kjWta8G48EF2eZERWBpPBP0FpSg0E=
X-Received: by 2002:a50:9e89:0:b0:500:547b:4e1b with SMTP id
 a9-20020a509e89000000b00500547b4e1bmr18124132edf.6.1680530079218; Mon, 03 Apr
 2023 06:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230403121537.71320-1-lucas@osdyne.com>
In-Reply-To: <20230403121537.71320-1-lucas@osdyne.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Apr 2023 14:54:28 +0100
Message-ID: <CAFEAcA9ERb4a8kwcgtr3VAxnjaCuOVnKFJ56FfkNx=F73a0o-A@mail.gmail.com>
Subject: Re: [PATCH] stm32vldiscovery: allow overriding of RAM size
To: Lucas Villa Real <lucasvr@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, erdnaxe@crans.org, 
 lucas@osdyne.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 3 Apr 2023 at 13:51, Lucas Villa Real <lucasvr@gmail.com> wrote:
>
> stm32vldiscovery comes with 8KB of SRAM, which may be too low when
> running some workloads on QEMU. The command line argument "-m mem_size"
> is not recognized by the current implementation, though, so one cannot
> easily override the default memory size.
>
> This patch fixes that by adding a memory subregion according to the
> value provided on that command line argument. If absent, the default
> value of 8KB still applies.
>
> Signed-off-by: Lucas Villa Real <lucas@osdyne.com>

Does the real hardware have (options for) more than 8K of SRAM here ?

thanks
-- PMM

