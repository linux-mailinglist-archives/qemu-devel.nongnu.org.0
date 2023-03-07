Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99076ADEFC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:42:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWdo-00050o-9q; Tue, 07 Mar 2023 07:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZWde-0004xz-G2
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:41:59 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZWdc-0002pR-Pf
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:41:54 -0500
Received: by mail-pf1-x431.google.com with SMTP id z11so7920596pfh.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 04:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678192911;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JBcgIsAH3qFGf/CtlP2QDnmA42QgFjNWz7NbEoDgECQ=;
 b=vpZthG588tZUKfgp9/fmiUH2r57MPDw8KAWBl4mrKT8/HMeKA/9cUMHfqle8HueMub
 raw+t1CJ51qpsC6ruoJ1llPr44eEmlRqgC2kIAQZT93oERvQMl9dRPAswnCOLQ9mB3O1
 9J0wuep89m418EnZ/RBwUL6O/bEgBmw6Kme0NgydNq6Vy7L0P624+EfGxImqxuaT0j5w
 +Fh6ynRLH92z1c8M6N2TTFkAzrWSRWJaGo4/R8ipfmWz/t78KZ9TIej5gA+mao3I+ZED
 OpKVWH3aAxBR72c+3Mlu1/X5gZlshLv2l7tyXc5kGrd1d50o+nEtr7Gz5wL3aJTRtAbN
 sgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678192911;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JBcgIsAH3qFGf/CtlP2QDnmA42QgFjNWz7NbEoDgECQ=;
 b=ASZWb+g1CUUDqKGDk+Y/ErocaWfz6uj2vJkOsioTz87PEvNNzDaxjHCS+9D6kPKj2c
 ZbQMpcvLfgtJhGjZpz5GEO8wLKC1woAWroVcxzeDxWJIo0RXCkqtIYYL4v/qXzB99S/5
 Bx+1hgNRfBV1c3LQK4DCB3LcVS+RI0nrJuJtyTNNkgOsgf8l13QNuAa+g3FjuqiOdJKu
 ouM6ZBe1dcHwtq7n2+vx+WDUk8gxJfDUyOYkH58gOb21ZexPkRzQ+hr9dUadBa/WyytM
 8E4eUpUsbSeuTSasLLLk1ESc22XjQ/uTDT1Kbie+Rq/9N1UAaZ+9WZnJQiSbMT/jmtOv
 AjxA==
X-Gm-Message-State: AO0yUKVr7wcJkXJaCiAHb40QOiY0bFmZORyPa4EyICqSFQ/99JvUtYBJ
 GA2rugMAXQCYa6kmHUTNgC9WI2ELpNLQlNPBQOZPhw==
X-Google-Smtp-Source: AK7set8Xl101nyQ5+/PoWDrvREQRtB1zzqU8085fAr+4D/4yX09SlIXUn+8iCgN6zSFqa1eKqZAbm6n11EnvVtzkvEY=
X-Received: by 2002:a63:9c0a:0:b0:502:e4df:5f3f with SMTP id
 f10-20020a639c0a000000b00502e4df5f3fmr4743229pge.6.1678192911320; Tue, 07 Mar
 2023 04:41:51 -0800 (PST)
MIME-Version: 1.0
References: <20230306143433.10351-1-its@irrelevant.dk>
In-Reply-To: <20230306143433.10351-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Mar 2023 12:41:40 +0000
Message-ID: <CAFEAcA881EZuuAgU-uyRWe=jDr5hpYcB9XP49LjYUEW3V9Qxpw@mail.gmail.com>
Subject: Re: [PULL 0/5] hw/nvme updates
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Klaus Jensen <k.jensen@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
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

On Mon, 6 Mar 2023 at 14:34, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi,
>
> The following changes since commit f003dd8d81f7d88f4b1f8802309eaa76f6eb223a:
>
>   Merge tag 'pull-tcg-20230305' of https://gitlab.com/rth7680/qemu into staging (2023-03-06 10:20:04 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/birkelund/qemu.git tags/nvme-next-pull-request
>
> for you to fetch changes up to 73064edfb864743cde2c08f319609344af02aeb3:
>
>   hw/nvme: flexible data placement emulation (2023-03-06 15:28:02 +0100)
>
> ----------------------------------------------------------------
> hw/nvme updates
>
> * basic support for directives
> * simple support for endurance groups
> * emulation of flexible data placement (tp4146)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

