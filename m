Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DB16E11A6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 18:04:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmzPq-0001ny-VT; Thu, 13 Apr 2023 12:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1pmzPm-0001lQ-Cx
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 12:03:14 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1pmzPh-0008TW-1M
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 12:03:11 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-504e232fe47so2025826a12.2
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 09:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1681401785; x=1683993785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9jlVDfhHoysTNDNrwCw51YGNtSFoN2LyI2tRzaXDWWY=;
 b=QFJ2sP2Rni5PiJtvOkO3YpXM0a500EQ6cciUtVkiDWaKTJcQDLBwKAoCFw16cGxygq
 a7Zy1hLauj3OpBOs0TvR7LxwufP+DCw998oJ5dR+UgA2khdgXuYEJ+JwcspAhATSKeSV
 8vJEY6xJpS9bH/AOzrujMqEqMahrfYxq6HmClXQXme0h4rLaUpVS2ZfFyyG3OcXb7vFP
 DTCTdkV6vXiQG9ttu2t8TWh0DOQY9rcmbpvgwqqL+AuxXbNPniVL1XGciUzi9OAA9FhN
 nN/RECuecEB471mr74RMdhW5G2vSzrVz6KU2ZYLPHsZhj4xhyk2J+pNWHX0+Bnr5Mf3H
 fBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681401785; x=1683993785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9jlVDfhHoysTNDNrwCw51YGNtSFoN2LyI2tRzaXDWWY=;
 b=DEDQJmBQawEeVJbsLto4pxvCtNhJZPQy3CpBUD7zADlU2nPgokiu1us6axK52/HuMB
 zK4Joy8b5Nhq2hJiPIuQFy6VYYgvrDOtyudlj/6jfoNYxaG4zsRVs93dCPO7bD83VC0Y
 J4xSPbIAsMi+6D65D1xWJivG3cL7EmxW9Camu2U63ZkqDjeEgTeqxpeHW+Vh5CHElRas
 O0vlJUrhc7L4z3nFfZ32nHaGDkyWCX4L3JmQu8n+4/SUv5jmuZI3rkNrKpZERBCWkqZ5
 AOCf6aYrTFMEW5V1gcdDPN74utGmKMRMYUNbJLSzgrIeTYKv8chnegc/Q/fVJ6ynC3Le
 2v2A==
X-Gm-Message-State: AAQBX9edbCzWmdLi0LrRQXdQR4t11YxHgZbwDFvqzsT/tZ4lSUo8GRKu
 RJnPyip2ZfMVyP7sm3v2Oq9sV4+9O/2hV0UyFICjHw==
X-Google-Smtp-Source: AKy350b/VbzvQAK0KvIKXae+1yleidrMBjVo9A64yzXV51lFtnq17uyloGvrVTyoGt4lnDAgibzv6vy7nvHzh/zOysM=
X-Received: by 2002:a50:aa9c:0:b0:504:9200:8c88 with SMTP id
 q28-20020a50aa9c000000b0050492008c88mr1551777edc.1.1681401785151; Thu, 13 Apr
 2023 09:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230413133432.53771-1-ivan.klokov@syntacore.com>
In-Reply-To: <20230413133432.53771-1-ivan.klokov@syntacore.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Apr 2023 21:32:54 +0530
Message-ID: <CAAhSdy1hhz9wYX8EwCkN0z2YF0y70q0OfFCE2T+fXUdGGApu9w@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/riscv_aplic: Zero init APLIC internal state
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 anup.patel@wdc.com, palmer@dabbelt.com, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=anup@brainfault.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Thu, Apr 13, 2023 at 7:04=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore.=
com> wrote:
>
> Since g_new is used to initialize the RISCVAPLICState->state structure,
> in some case we get behavior that is not as expected. This patch
> changes this to g_new0, which allows to initialize the APLIC in the corre=
ct state.
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  hw/intc/riscv_aplic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index cfd007e629..71591d44bf 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -803,7 +803,7 @@ static void riscv_aplic_realize(DeviceState *dev, Err=
or **errp)
>
>      aplic->bitfield_words =3D (aplic->num_irqs + 31) >> 5;
>      aplic->sourcecfg =3D g_new0(uint32_t, aplic->num_irqs);
> -    aplic->state =3D g_new(uint32_t, aplic->num_irqs);
> +    aplic->state =3D g_new0(uint32_t, aplic->num_irqs);
>      aplic->target =3D g_new0(uint32_t, aplic->num_irqs);
>      if (!aplic->msimode) {
>          for (i =3D 0; i < aplic->num_irqs; i++) {
> --
> 2.34.1
>

