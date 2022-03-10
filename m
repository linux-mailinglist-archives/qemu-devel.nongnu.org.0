Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE8B4D4362
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 10:22:42 +0100 (CET)
Received: from localhost ([::1]:43192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSF0L-0006ju-4C
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 04:22:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSEwf-0004cj-3e
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 04:18:53 -0500
Received: from [2607:f8b0:4864:20::112f] (port=44172
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSEwd-00034Z-D9
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 04:18:52 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so50527127b3.11
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 01:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EdgC9D0UatlNbqFWBIq4Qht9GFHJO+sRHnHoBpKZAf0=;
 b=ZVXa6IhnoBEH1VLfe1JgGgNa4czGVSO6NMPOwO7UwzamQ5K6X98ZOVdOLLfTMl3vbP
 ihwVrSNGCPeb1hIdQtFHqBUZF642Dj6bwUs31E/vcqHP96uKyHT2knYvAzZvJVTEI98q
 Nk+lpV2ithdngH+GhUC5Z6DsLVBGKtc6yjcOlGkQleO3lLZzNQc8yHx56aIp/BHEL9lW
 ZRykCJIhqimDmS7hLMwxbFOScYiBvOgVYVUgAuuNC6LqG6SH9X4Pw8ox2QRE6vVsgVvs
 pMKFSLYM495aOgWTkPqXTBDyltZhmYQWGF+ZWtJUw7ZeXmizxry1eoUVc3aqTXoCmbu+
 K0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EdgC9D0UatlNbqFWBIq4Qht9GFHJO+sRHnHoBpKZAf0=;
 b=79w0z1R6SA2z4xU3sgPvRA7jheyfUTBmbkj5Q55Dy5pDCHakPkerFC6Vx2c7MDrJFB
 sxGQs1EiUa+vLmjYxJYYS/QEVDUj7Xx3nQ9YUsCca1d2JKHM8k3U+eXV1xVfQ5cxOSDY
 FPscy2vzUYxqvyoRtok5H10eIvft47H9YuHFYsLkZLPoXtCfqPUSy+Hx7Wzf7ANJSqGp
 I3zBVLM9JEdruC8a1xBj8xtyzoXZlCqSKYYjJWHnIoe46yE8USox2Gtk/5q+9QW0eIwr
 scm+6tKebUqKa33LmBxqhKpEqSt3bLzmW5Zp7A+pa3bprQvrhHe1ntZ1njRdtx8oaU08
 pI5Q==
X-Gm-Message-State: AOAM530Wg/i8pci5iCoypGGPO0y53ZAoJcN32hlxuoO6y4UoIitzKXOm
 +V/uIhmoOmk/Ei7QBIpbphi8ChDEJzpT/1g+j3KI3A==
X-Google-Smtp-Source: ABdhPJx5VjzR7zjQBAec2tr75P385baQkdbp4TQ79/AyjpVwmb8Bq/aLbJ3bQVj/A7zXjAdq7iOxLc3d64eyO5v72hg=
X-Received: by 2002:a0d:e2c9:0:b0:2dc:1f22:e349 with SMTP id
 l192-20020a0de2c9000000b002dc1f22e349mr3196626ywe.10.1646903930379; Thu, 10
 Mar 2022 01:18:50 -0800 (PST)
MIME-Version: 1.0
References: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 09:18:39 +0000
Message-ID: <CAFEAcA8ZuxcFYc-=27YyWNr8_x1m8VKSjJEPYAzV1yMAnpr6wg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPULL_0=2F9=5D_I=C2=B2C_=2F_SMBus_=2F_PMBus_patches_for_2022?=
 =?UTF-8?Q?=2D03=2D08?=
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Titus Rwantare <titusr@google.com>, qemu-devel@nongnu.org,
 Corey Minyard <minyard@acm.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 18:22, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The following changes since commit 9740b907a5363c06ecf61e08b21966a81eb0da=
b4:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
20307' into staging (2022-03-08 15:26:10 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/pmbus-20220308
>
> for you to fetch changes up to 5f14cd7032beab6cac8d7ed1b09efc58baddb48c:
>
>   hw/sensor: add Renesas raa228000 device (2022-03-08 18:46:48 +0100)
>
> ----------------------------------------------------------------
> I=C2=B2C / SMBus / PMBus patches
>
> - Add some Renesas models
> - Add Titus Rwantare to MAINTAINERS
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

