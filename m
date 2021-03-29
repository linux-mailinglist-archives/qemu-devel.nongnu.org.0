Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254DE34D665
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:57:04 +0200 (CEST)
Received: from localhost ([::1]:53960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQw8N-0006eX-6L
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQw75-0005nG-5c
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:55:44 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQw71-00087h-IJ
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:55:42 -0400
Received: by mail-ej1-x635.google.com with SMTP id b7so20824133ejv.1
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 10:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xa156kh1C60nrdTtaMBdGLxDp/9GUdlV42JYfw2b7L8=;
 b=Zc61SW8twZ8a6hf1sG8q6kKv5XuSDh64H5IdFOMhjEoYlg76RSyP6sDhhD+Wif5TPh
 ck0BdZ2kN22GtoELJX2Or9GFX3PkfXznl+UUOLGHck5RATTwXAxS6Ic6puou0XQNOsKg
 rkMilOdA5IOxAyqCRgG3rDK7H63fM0bvz2zWB7jsYVqqzG6VbeMZtV5ti8bUKzeg5fkl
 0rcV32cE4w+XgP1dB4gJib9O6SI4gSS4O+yjMRImjVkFU7Z2NmpyaiuTM4sZosFFhjJL
 bLZ8t+Y5nK6sBRd90bNBdX80ew3gjODwPXpoZv0/EFcIzzhfBJDQBlFf//q4htFWtuHP
 wuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xa156kh1C60nrdTtaMBdGLxDp/9GUdlV42JYfw2b7L8=;
 b=NjTnm7NJG44DqK8XvML1OOtmb2aGO90BMgjRc6tTR83ZPMnbCNEprPlEAYADukCeus
 19eiEy6AupNmuQXv1VY51FkALfHpHiNeXqbMMfxYxJLs7WrPxAjKhwSf9YpfzDbbUC4X
 e5ONe/SdMvMYQMo/TYOe6gOKtvKuW1MftHyTypaD/SS1ivuBFsZ3WNH44kIUynahIDAF
 JeIKSc0/f80VVzSsxG+HqMUrL00k//zHyHfQSHQrqRXHZ0meQ0Iq0nSfH3jpBTSPWgAy
 /a/sZZ9yfnpHZQ9+o/RtSYiJ4w2m4NpmG/c2XpKBW7S9qQxtRsGO13Geam/YzuQ65GZT
 +W2Q==
X-Gm-Message-State: AOAM531cZtU5SWp8M0mx6UpgPMfeqHLaPJN+kwRrqGIJT8ehjDeoyvvk
 VXwzGkRFbI0MzivUpxL+fRdT/M4uEDdxoGIg6Is1dQ==
X-Google-Smtp-Source: ABdhPJx0VJ+wNF8wWFOzr/+9EEgeoVoVQZHvySkdyOtzhr/lO7Zc0CC7K4WUGWzjNxP6wkHcaNSs9NnbsnWqT9FCDT8=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr30192343ejb.56.1617040536166; 
 Mon, 29 Mar 2021 10:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210319162458.13760-1-peter.maydell@linaro.org>
 <CAFEAcA9hz5ZsetCWMGJd+aX0td6vE7YiAW+x2C=K3mCsdWiJ8w@mail.gmail.com>
 <aafa7c42-333e-60ce-1323-5623536d7af8@amsat.org>
 <fb33eabd-7592-581b-cc71-1f5f436951de@amsat.org>
In-Reply-To: <fb33eabd-7592-581b-cc71-1f5f436951de@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Mar 2021 17:55:05 +0000
Message-ID: <CAFEAcA87-pBWh8a3_Y4-dXU1vNtMYO2q5mvp4CFNGk69u-DiZQ@mail.gmail.com>
Subject: Re: [PATCH for-6.0] hw/timer/renesas_tmr: Add default-case asserts in
 read_tcnt()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Magnus Damm <magnus.damm@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Mar 2021 at 18:03, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter,
>
> If you are preparing a qemu-arm pull request, can you
> squeeze this patch in?

Yep, that was my plan.

thanks
-- PMM

