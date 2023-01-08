Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B444566150B
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 13:29:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEUmt-0006vf-Bk; Sun, 08 Jan 2023 07:28:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUmr-0006vN-41
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:28:29 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUmo-0005Y3-FG
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:28:28 -0500
Received: by mail-ej1-x635.google.com with SMTP id ss4so6443718ejb.11
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 04:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rH9BW/Z85CA4t+Wr7aC66xgE7NRGcXbzzy4TKD8eKeU=;
 b=RLzWBH9q9hONLE15kN11E389+KvaHCAZGPQJxD/e2qSPX9ZogD3DeYIWvOU1YfLz7E
 iGQQ3qOAROzAlq5wCy9U/wa3em3xtJ/OCiNuH1Qdx1JpYINmHlFBQSnxc2fyhEq4G9VZ
 aWzhJrBDaE+5M2vgMwODX99yMq3ZM9mY561I0Xq3QUcU6kz75nxurqlkkaUBnS/ceDyH
 Z3ueeERHB6UOwZkzkxehBlFkRDxj1tqOn61PeLg+3p8cxFsUEM4lIhfIUKkgoQw+7SiQ
 CZFkUNFOO584oVLnrNMB9BWpX8VmjsoHTEhv3eSw1qYS2daUnrJkzL69e7ZUeJyKydkY
 Yhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rH9BW/Z85CA4t+Wr7aC66xgE7NRGcXbzzy4TKD8eKeU=;
 b=IugZGHNsk+KnCZdPRCyBr6RNx3FIMj1fjxy45DVstavYWg0K34z0JuTOsagL3FvFj1
 BNQfS1ePfVJro5gStGZRe/ez/Pm6bsbaPRDhxV7NUrsJxX1UNy+N2ulL8nnKpPXQtIZA
 5lj6xYXVvh1YIvv6f5/FvEWTkS+pAj//GsPcL+cx84gx4pLezLZqDGfycF7Ly9TJnFL3
 O2jwPSwJOvmtnuc1GczvdLhqx7bBW2tl7IMcya1Bk+UgTueLo21P/efAKd+6Yg/n9W/U
 /AA4YaPNu/wB9t51tnZYBkV16im9bhV44btNUswRsy7Rw2IQVpfU5fZFMTVB0UX8JO7O
 gJzg==
X-Gm-Message-State: AFqh2kohyzxIMU0+uso7R4d4Pp0RbytG+zF0yXUFIeYZv7YWpG81s2Mz
 nOXtf2utgCvAfLKIKXQrJEOF1HOzvpos/KndaCk=
X-Google-Smtp-Source: AMrXdXvwqxcc1jqD0K7q8wENCl6+2mSMPERMiBkG7Yx9r9YcyxD9IJijiVR6uTn6//EFm70/CrYxkxNq6KDDNOMyASQ=
X-Received: by 2002:a17:906:1945:b0:7c0:bb4c:e792 with SMTP id
 b5-20020a170906194500b007c0bb4ce792mr4765833eje.618.1673180898960; Sun, 08
 Jan 2023 04:28:18 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-14-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-14-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 20:28:06 +0800
Message-ID: <CAEUhbmVZ_dWKYmwGdA-Kkk7Z8zgYBm_a7m-RhBhZ2Mq-h23hOA@mail.gmail.com>
Subject: Re: [PATCH 13/20] hw/ppc: Open-code pflash_cfi01_register()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Jan 5, 2023 at 6:49 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> pflash_cfi01_register() hides an implicit sysbus mapping of
> MMIO region #0. This is not practical in a heterogeneous world
> where multiple cores use different address spaces. In order to
> remove to remove pflash_cfi01_register() from the pflash API,
> open-code it as a qdev creation call followed by an explicit
> sysbus mapping.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/ppc/sam460ex.c     | 12 ++++++++----
>  hw/ppc/virtex_ml507.c |  7 ++++---
>  2 files changed, 12 insertions(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

