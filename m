Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F1969E641
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 18:48:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWkA-0004KH-D2; Tue, 21 Feb 2023 12:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWk7-0004Ht-MU
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:47:55 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWk5-0004mx-9R
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:47:55 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so3717240pjn.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 09:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8wa3cXOe8DQ5zdgwL8rAxctHQW3nFEC3AB3I9alARfc=;
 b=JG6STRWdrjjK+kWHfI/B3w3d80wBSLa6WFUOBGUU3W1+8oLAOlNm9OzqZoFEGPqzG5
 zU9Myt6W7doU8Mz23z291SQST66f7iv1m/awW1b8cfzbQn7TsRe2pgOplvVX4W2ayAi7
 GAxO17HsntqMNBQjxwcVcmwuFv2MvyiqKnAma3dZnYOIR2x4bfxlx4gxG9fAPYJGB5Dp
 k9eUdVn/zXgj4IgpbzolOpq8K1zYAQ6t882uYdcA35nCxeVu987oK7wjThTCjLA8rnYD
 TH/EZWtgu8mBCJjDOANzc/CarlgrUyfA8CJysopdvc36CNMouL5o0qnPod/0mCHKZV9k
 D0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8wa3cXOe8DQ5zdgwL8rAxctHQW3nFEC3AB3I9alARfc=;
 b=qrRFP93Rl/P43yFhBSsLkGskVINgoNQThOFiMsvG39oGJ6vki8apUgkfnN5/TCRZLr
 9DjCpbw4gc269+RlkFy2qxKCEAwrJgLHDe88ZcAzOxYiOqYmUvYSdZKoomRze5putQsW
 rGN9StHWO0UFZDULIRzSAahticH0UxPwf8Q4xv731heQvwZYwebIHhYYNPYdDZF9mRTA
 Sxb15tNCk/lu7Cdf2EIO6NHL7RIeVNVD/d2tDB88rKMi3AH3gB8yJBdHyK0oznrQbXuC
 XoK6iieswizaegyYpaceuragT2ZwqA+gL4WJkNX9E+AdC37AeNnEHm5YNO+bP5QC1LO8
 p7tA==
X-Gm-Message-State: AO0yUKV0j9kbmjxrHdozQtdher0733HCvUmjflEtG1VrO5MO6GFjIFZ7
 XAthmJs/oVBEGcXkhe1STyO4iyRIp62ekyH+4qnI8g==
X-Google-Smtp-Source: AK7set8Dn9NP8sx+CyphqMBiH1844tAapgjYYaOl64zs90/5hdQHb9b2NFW4qcLzMCbkvQd1hBFc5q5Dz2xne1CTYGM=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1940898pjb.92.1677001671261; Tue, 21
 Feb 2023 09:47:51 -0800 (PST)
MIME-Version: 1.0
References: <20230216142338.82982-1-philmd@linaro.org>
 <20230216142338.82982-2-philmd@linaro.org>
In-Reply-To: <20230216142338.82982-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 17:47:40 +0000
Message-ID: <CAFEAcA-Ju7G02yfGEmJmP=N2Eu0z5Q2UJ+AiLqvkwmLs3wcaBQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/cpu: Extend CPUState::cluster_index documentation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Dapeng Mi <dapeng1.mi@intel.com>, Sean Christopherson <seanjc@google.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Zhenyu Wang <zhenyu.z.wang@intel.com>, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Zhao Liu <zhao1.liu@intel.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Robert Hoo <robert.hu@linux.intel.com>, 
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Like Xu <like.xu.linux@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Zhao Liu <zhao1.liu@linux.intel.com>,
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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

On Thu, 16 Feb 2023 at 14:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Copy part of the description of commit f7b78602fd ("accel/tcg:
> Add cluster number to TCG TB hash") in tcg_cpu_init_cflags(),
> improving a bit CPUState::cluster_index documentation.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

