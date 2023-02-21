Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D909069E69F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 19:00:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWvC-0000GV-7k; Tue, 21 Feb 2023 12:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWvA-0000Fz-Qe
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:59:20 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWv9-0006uB-6J
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:59:20 -0500
Received: by mail-pg1-x52b.google.com with SMTP id c32so2892031pgc.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 09:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pk3HqKJdAIfe2w9FuzkLzW4K1hOPaBemQWMfR0trEb0=;
 b=HwJbYpBTMlsFwwXCzBuMXbjw/j31IDDcdcuLSBBKzOD1+Ga/ljvM2EsCvm2A+i9BeI
 por3VGEBbxfd70TBMescMKf5cCFui08t0XJjyiugyUkZlqdj2rJUK/hlJjxOEB6FNQkF
 Qm53UuYPYBuXlV9vXv1Mrsq3klvYfZnUJI7OsmE02QkU6YzZYHXf9tYdBwDxE2DxLEe3
 C7bZwuA7yblHnO+PkGrOfRun78J4jAptEGNTuvg7465hOubTGR+y9VZNp9Kdt3LebyRr
 0ZFv6BtXWWdA+AuYaTbxXn+dyTijvA4gPWifrmDcx6NNky6cAOq+jNLaCjX/sllslM0s
 CS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pk3HqKJdAIfe2w9FuzkLzW4K1hOPaBemQWMfR0trEb0=;
 b=otN/w0OLjLgpSwXPmu/BaegZqiYF5Me9IKojB+PaSZEfEfwm63T+qmnVG/MQwVEYYr
 elRmtkyVowMtrbG6GDDsqiNeeiEP96Ff2ThmwNPCkmKVRdG2FJ2il35l/J0HIe5zKBXm
 Cf4YeBrah+j08/rtpWu8N8/nYzClC5Fc7jIwwF2RmnL3Sl2EPkpqujQfceDwPrbmmBUf
 WSNqfZAoAJidgO4dIK57QO23DsiGzljcAtrdAwcbbly0+Fj7ZRupbLdUAGVoqmRbofcM
 FJkDH7CUvNTMMqpQomvyzZMU7vv0p0Pm+AGYb4NWhss+t8cNITkn5UpY+eDCo6WhiipX
 PCbQ==
X-Gm-Message-State: AO0yUKV9RlxKRbA97i7M6OX77uVaDFudCYBDiYN6iyYfeIlg/fGc39SH
 ga24B/HlIEB20hNnRxrwySfuhfjXvnLhAnbJce0Rww==
X-Google-Smtp-Source: AK7set85TFxumxGnEaGDYlPCUyVNaX4N5sjZPMCkYIL5m5CgH7JbxxCwOvBUiDQuBfAeJih33Ln29zUkPM/8gQ1+xX8=
X-Received: by 2002:a63:3815:0:b0:4fc:2369:811 with SMTP id
 f21-20020a633815000000b004fc23690811mr755656pga.6.1677002357723; Tue, 21 Feb
 2023 09:59:17 -0800 (PST)
MIME-Version: 1.0
References: <20230216142338.82982-1-philmd@linaro.org>
 <20230216142338.82982-4-philmd@linaro.org>
In-Reply-To: <20230216142338.82982-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 17:59:06 +0000
Message-ID: <CAFEAcA8vMWOcuRib5aL=SVrRoDMOBdD+PpSOrsZh0kdCU7KavQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/cpu/cluster: Restrict CPU cluster to a particular
 CPU type
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
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

On Thu, 16 Feb 2023 at 14:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> CPU cluster id is used by TCG accelerator to "group" CPUs
> sharing the same ISA features, so TranslationBlock can be
> shared between the cluster (see commit f7b78602fd "accel/tcg:
> Add cluster number to TCG TB hash"). This mean we shouldn't
> mix different kind of CPUs into the same cluster.
>
> Enforce that by adding a 'cpu-type' property. The cluster's
> realize() method will check all children are of that 'cpu-type'
> class.
>
> If the property is not set, the first CPU added to a cluster
> sets its CPU type, and only that type fo CPU can be added.

This seems like a reasonable extra assertion to add.
It won't catch all accidental "wrong thing put into
cluster" bugs (you can still put two differently
configured CPUs of the same type in a cluster) but it's
better than nothing.

Personally I think I would just have the "check they're
all the same type" guard, rather than having the board
code set a property explicitly.

thanks
-- PMM

