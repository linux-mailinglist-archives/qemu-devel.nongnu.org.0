Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7AA69CFBE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 15:53:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7Vx-0005iw-Mx; Mon, 20 Feb 2023 09:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU7Vv-0005iR-RT
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 09:51:35 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU7Vu-0004gP-E6
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 09:51:35 -0500
Received: by mail-pl1-x62a.google.com with SMTP id s5so1567965plg.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 06:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OOqOv0S4AmruzS46bC7oAarcPy0QZ0WNgZoeBUtXMyE=;
 b=kCw9gxkV3XUyAeW640WEPBn0SHim7nUUtaFFPTvZly9oULgDUrUn8Bh4GmnKzyCmI6
 A5baRoJq+nRTcBktt6yyUDKe8lWN4R3zWYYaECXhKvDUd1nt03FxHDam60LJzBr7h1L+
 wY3xSWkJceULw2dk8qqmEeEwgxxeiiqh8gfBbtbQTmM2fLTzQsgH4yN1/5wE1o0kY29J
 VyB2fv9vbZW/8+036a5K/eHmBlflZaxcD4TF7IZItjrhWxmpgHkwth4F/Tp3jzdJ5hUm
 AvrcS1G0f2phTOFos49j7kylxGKBf2grYrFxBfuilJxcHvgDZg+A0rGZEDoqWuwt8HB8
 knnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OOqOv0S4AmruzS46bC7oAarcPy0QZ0WNgZoeBUtXMyE=;
 b=a+CZ3LrJpqxLxtgnzD+hp44tjYj9YCuIdLc9IEENTxNBf80xegTiabncZ0rFSNiNsY
 smL/194aytELk+fCEaerBwytXPJbD/YflbxbcaHU4oHxvRg3dWP7bv1pqUvh67w4gOPi
 nG3LCYHAQnm+9FRRGLwJMBg+Zmgg/C7zLvMorjfNsnSNUg9T60OsaXRMPRj2dso9vhnc
 Jv2l35owLpp4CeZMgHLVcD71u72EZLpyvphfvDIwnDQQperqkGpmPW7e/vHNYR/dPWAG
 rpdt94IPPYRCHC+qoZOwrvv7M1Au560N0gmYuFqeTeQYoy+fzkgm/syMI0c98dV108VH
 KV+g==
X-Gm-Message-State: AO0yUKVwtnCsutxbAea6FMLP2az5sO1kwyuwyi3UYSsu94Ta1xXUHIph
 UutwbblIF8cbp1Ies5VWWmsEin4eReJbCzRmidB7og==
X-Google-Smtp-Source: AK7set83ADB1IJfstA3oP75b2tQ5V6yysJiReOLVIIuCoVUaM9J9CLlqXi9pZ5RJxs5679TDiqg3K0pdmaeNRVT7b4Q=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr938178pjb.92.1676904692955; Mon, 20 Feb
 2023 06:51:32 -0800 (PST)
MIME-Version: 1.0
References: <20230215152233.210024-1-thuth@redhat.com>
In-Reply-To: <20230215152233.210024-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 14:51:21 +0000
Message-ID: <CAFEAcA9hRNqdvd99ZwXiTzJ+ChwSmrV+ukuNaZS08Fwmcr8RZA@mail.gmail.com>
Subject: Re: [PATCH] include/hw/arm/allwinner-a10.h: Remove superfluous
 includes from the header
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 15 Feb 2023 at 15:22, Thomas Huth <thuth@redhat.com> wrote:
>
> pci_device.h is not needed at all in allwinner-a10.h, and serial.h
> is only needed by the corresponding .c file.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/hw/arm/allwinner-a10.h | 2 --
>  hw/arm/allwinner-a10.c         | 1 +
>  2 files changed, 1 insertion(+), 2 deletions(-)

Applied to target-arm.next, thanks.

-- PMM

