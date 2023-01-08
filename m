Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8C36613B5
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 06:29:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEOF0-0003AX-Sv; Sun, 08 Jan 2023 00:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEOEt-0003AM-GH
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 00:28:59 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEOEs-0007Nq-0Z
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 00:28:59 -0500
Received: by mail-ed1-x532.google.com with SMTP id c34so7949411edf.0
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 21:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTi1I2s83nS1hEUnbVKBf7AFenlnIhPjEsemwh5U6ns=;
 b=Xw+vtqkdHQqXNQKvxREcGBZQYrfjmxLaYS24dNZAyVm0BB4Q50fqNWEhlo7t6Jy5R7
 fjJjX5i/kCdSIBb2UY/Ynn1TylTELuTvSe05AZq3R9RzjVLwDlkz/sE5lx0abkh4q2xc
 evQcehokkDOiNJGG04GYXbCWkT3ESO7gjfmMQ2YYlFZ5UCYlpe0z9yoMfG1qZaLwVN+q
 Nfuwc4WBVVcbeEd55zfkivVwpLt0KH/TfE33jmbFs1BnpqbLToxQ6PRUgZl+tNcUVGQo
 AOI/5az24xZdF7IjdBOpEBDxgstTEVm2Od4wxlsJ/LWj3AbPVPpY8sl9glymeTouw1zu
 JX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QTi1I2s83nS1hEUnbVKBf7AFenlnIhPjEsemwh5U6ns=;
 b=73o7Q3Kfg9PdCfG3x65wcgOhBi2WAYu4OIujC13cXc5BAFEbP1UugzSlVIpq9ycGle
 /RFd/4e3ugZWyjQvIcu8HkXvDFIj2fukLBR5M9XNKJ9Y6SAxTRT7kOUqpE2SLDtUZHaK
 TKelrpC+Dqh3pT+t7XFjDetqaAe3SUgikiUkk6aZM4HRjDQUzcBNthYZpD9hdus+h2xk
 QoX3nYHrZQUffJHbOwIdlIwCX/fPnEu4prqKe/jEVkWk+yuepW9b8RMAeCN31Oxh2YKX
 KQ73wJBevvuFcS+cIGyJIOnGubKmZ9haOCoFLhBV71RpFWZjyGQUpJovo01OGAbKdyZt
 9vcA==
X-Gm-Message-State: AFqh2kqg7sgRExTBXeCOAcxv+PA3RPkg2B/x3DQRIpxDWzpAAfgX8OsV
 RpBD+CmOPf23PcbHK43FL9YRfznFYc+B0pfeR8I=
X-Google-Smtp-Source: AMrXdXuebvgU7nD07mNqxMLMr3cRm3PZYPHLuI1f/IsT3P1I5GQ1ae8Xyphbwe7TlEIhtgzyDbjGy70/haDFEr4A2j0=
X-Received: by 2002:a05:6402:1843:b0:46b:1d60:f60a with SMTP id
 v3-20020a056402184300b0046b1d60f60amr6833669edy.193.1673155736617; Sat, 07
 Jan 2023 21:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-7-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-7-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 13:28:45 +0800
Message-ID: <CAEUhbmV4som1c7mzexWSTpRZ820yHXpDNc-ik4a6M8Qz1L7m0w@mail.gmail.com>
Subject: Re: [PATCH 06/20] hw/riscv: Use generic DeviceState instead of
 PFlashCFI01
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x532.google.com
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

On Thu, Jan 5, 2023 at 6:47 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Nothing here requires access to PFlashCFI01 internal fields:
> use the inherited generic DeviceState.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/riscv/virt.c         | 9 +++++----
>  include/hw/riscv/virt.h | 3 +--
>  2 files changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

