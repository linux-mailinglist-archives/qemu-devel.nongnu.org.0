Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37D2632E84
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 22:11:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxE3o-0003HZ-8Z; Mon, 21 Nov 2022 16:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxE3j-0003HD-Tl
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:10:31 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxE3i-0004G4-7E
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:10:31 -0500
Received: by mail-pg1-x529.google.com with SMTP id 62so12229749pgb.13
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 13:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tKhj7MBUxtmOhVfL2zJ+SZ4qJJsdpQKV7//1J4ttH8g=;
 b=Gs0KezbSMPoHE1BIzd6pP34jhyD72u4/X4f35Dwq5byl1fTYY9KjhWwqFToaHcJaKG
 EIe2dXRrXWHc7zWLG1vHMRYOKo5+lla5yX/DwZsuDJ067gmZ9bKQCwq8hDrUohzane/r
 qLxLzGa1rUiRDh7hRb4qpAR4F6hQcnU+rkQR4AFNP28O7LEk9/twHtdPvtE6h6ZJajij
 HUMDVhgPTIw9VBMKDS4UAwfpgFb/Sz2DRRSCZP4FOYuC9KPismKlr6eRR/fXy6RGpuDn
 kQtc6ZAEfez01axiYNKOlPUROn9ywvvXbUrjIC2M5Baz4PHtuo0ZL0zGBrUQflOAd0Qh
 UXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tKhj7MBUxtmOhVfL2zJ+SZ4qJJsdpQKV7//1J4ttH8g=;
 b=u2F3oyuvLkbGx0I9x1t7dtGh+O6nn4WiKG9k9pLboDMCI/lEOrfN77Ic9VOylrGjYG
 crJ07LdZlKQLP+J1xiTYIAugknVJJdeVv3yxdjiEAcp+3oVs8cU/MMa1j7Zc3lC2WkVb
 8dXaSP1pqD005TxWTvktB0lieqtGcCxHbGhR2jrsqRUiF6APXvVgligVY1N8Ie3G9Vn7
 v9qvIMZhqYm1lVw0A8weaToHLvRYytinXv7hmtykvkEiQMX6vi3Ehr5tuF/sfQbHiWTY
 4jDVqjO6uAfRO1Wm0Y5exa0WEmJLTSQ9+ZX6uzfWfkp6DyMM+Hxf+3bvoyvaMk0PXiMk
 j7GA==
X-Gm-Message-State: ANoB5pmZ0wMoibmumxiA2FjAAOney7xaly+mI/1ooYghgaPICavqaLHB
 bY8+7z0tElwuG5orIpHSJ341h0ooabvh1cMD/4NRiQ==
X-Google-Smtp-Source: AA0mqf5enzPn+PZd4dXLu9cLYmF0jC6XkmROVYhLPUtAVQOZcDZ+T9Wl9CeFUXC5t6dHK0vlw5cq8vAmmxzfyKwzvgo=
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr587136pgl.231.1669065028483; Mon, 21 Nov
 2022 13:10:28 -0800 (PST)
MIME-Version: 1.0
References: <20221121130239.1138631-1-peter.maydell@linaro.org>
 <Y3ufQyGAl4ToeIls@fedora>
In-Reply-To: <Y3ufQyGAl4ToeIls@fedora>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Nov 2022 21:10:16 +0000
Message-ID: <CAFEAcA9WASG7aeAGsPZKmoncBTKkvzjfyrpbTgoZWfxacVbc_A@mail.gmail.com>
Subject: Re: [PULL 0/5] target-arm queue
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
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

On Mon, 21 Nov 2022 at 15:54, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Applied, thanks.

This doesn't seem to have reached https://gitlab.com/qemu-project/qemu.git:
did something go wrong?

thanks
-- PMM

