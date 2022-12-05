Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E798642E61
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:10:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2EyO-0005aZ-UA; Mon, 05 Dec 2022 12:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2EyM-0005VL-RL
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:09:42 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2EyL-0003aK-30
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:09:42 -0500
Received: by mail-pf1-x42c.google.com with SMTP id k79so12004418pfd.7
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 09:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MwByMuLrmF8YMdq4KZXXjR0AyOvR3boTcNRCXu5Qxyk=;
 b=t7tvGwNfkj7s5LyQ4qUYdgmC3e6iEDzHOfYII7iMaZSdicvUjmgo5KndaV+3DWSgMO
 iSJUzb1lM6WlZXI2RtWfM7ry5FyGs+iAkgThBzwumeUSViCDCKzag6/Q3tobwlbLxZRm
 ROuVIJgIRQ4SSn0N/Qq9FVabPoSw2UG4RVeNDatTx90aJA4clccjMj5ShKCjH92ZKJMi
 DhaZjtd0t7KQDIzDqxQSMmAhoTEmSsKJb6leoq2FNVk3V8OLeG2KLTyqGcZj9ieePSH/
 dFZyfgea2PW3PcZz2JFpUNcGVMwm5KfzrTuFmiDWMuplS0nhyE7kFVHDHJVF7elxjybG
 cjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MwByMuLrmF8YMdq4KZXXjR0AyOvR3boTcNRCXu5Qxyk=;
 b=OA0jkCAwgf4V4MKwcyNm5O/EsIdmiwkrg1+lEXQb4Ffi+3XLXk4KwtZPuKf9XwM4JZ
 izlAmNvzmiJg2ybBt7v2YKCAH4kMEMODIzaTSyHh3gORACxS0/5wT8hRhlJ4BXFcQsKs
 XNq2AwuDQz2bw5yzMkcKBRN2vjpFEh5Ic1P0Z+zvDgf1MkWNu5a7cuEOepk0XE6GGYj1
 G3G0RsZEd9sAtgvfToiYQlCbjN2tWsdgFtXmfpIN+KI+xlwI40MFtVC916VI1thyslIu
 YJH173zbE25HmMrVPR/BgMBwNZx8Ury7nMX/8JVeUEa4b8ogyU/BiJYa1s/CG3XCZ4Uy
 i0SA==
X-Gm-Message-State: ANoB5pmOka81rn+hqtlicL/s9lUX0uJ3RQpC+Yf6//CIJtlR4AtinrQ7
 eZFimqddI8+FSEnACeLuFEAetr+6VLXA7aIUUAKfow==
X-Google-Smtp-Source: AA0mqf5Cl0WMAqBfmzsecvBOwmoCZYr92vSvYRPveA64jmVHbgjbFasj1Mny4en72pcbL1+yTNxbqA5gaF9+r5hc4jY=
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr58021632pgl.231.1670260178541; Mon, 05
 Dec 2022 09:09:38 -0800 (PST)
MIME-Version: 1.0
References: <20221202154023.293614-1-thuth@redhat.com>
 <7681b7e1-2c03-cf98-3d73-e2b9f3dd0a72@linaro.org>
In-Reply-To: <7681b7e1-2c03-cf98-3d73-e2b9f3dd0a72@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2022 17:09:26 +0000
Message-ID: <CAFEAcA8_Y2bgi-uSzt7z36LYOVjibb-57zGKiW8_2rhSJ70=aw@mail.gmail.com>
Subject: Re: [PATCH v2 for-8.0] hw/misc: Move some arm-related files from
 specific_ss into softmmu_ss
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
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

On Fri, 2 Dec 2022 at 16:32, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 2/12/22 16:40, Thomas Huth wrote:
> > The header arget/arm/kvm-consts.h checks CONFIG_KVM which is marked as
>
> typo "target"
>
> > poisoned in common code, so the files that include this header have to
> > be added to specific_ss and recompiled for each, qemu-system-arm and
> > qemu-system-aarch64. However, since the kvm headers are only optionally
> > used in kvm-constants.h for some sanity checks, we can additionally
> > check the NEED_CPU_H macro first to avoid the poisoned CONFIG_KVM macro=
,
> > so kvm-constants.h can also be used from "common" files (without the
> > sanity checks - which should be OK since they are still done from other
> > target-specific files instead). This way, and by adjusting some other
> > include statements in the related files here and there, we can move som=
e
> > files from specific_ss into softmmu_ss, so that they only need to be
> > compiled once during the build process.
>
> Cool!
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Applied to target-arm-for-8.0 with the commit message
typo fixed.

thanks
-- PMM

