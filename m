Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB745F892B
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 05:35:21 +0200 (CEST)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohN5z-0003fi-K6
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 23:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ohN1l-0007gO-0d; Sat, 08 Oct 2022 23:30:57 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:34782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ohN1j-0007v9-IT; Sat, 08 Oct 2022 23:30:56 -0400
Received: by mail-qk1-x733.google.com with SMTP id s7so1109370qkj.1;
 Sat, 08 Oct 2022 20:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q2QbXE+bY7bbkK0ORnsPfCSpnriLteycwJJYj/+hSss=;
 b=dwZ3jdkT96GI8D/cLYmVz1Zfitb1XJBmG335d1C+wy+N1exdHpfwxBnLh5vcpzI1oH
 JgamQilXO23dDDfNn/hP6SrbjhahFgO5zFxhnEXjHqR/0PHmocXn5LSltE4KoGjiLEpj
 zznwKMDEi7BsbzjFwj6s4xiFzgQ4YQfofNRLEIZKS2BiV1oUux+0th8QaBm4zGmrpSey
 UhHd3WMjAW7MbOG8W9qUKf7gTCBz4bVxuj8xKd8W9vwzLJDGb+r2GAHwu8Jd7mhM5dW9
 0965lcC8nvOdzWL5f4FNE6NdhoBt0huTv7vdbfpDyuQYsK+aOcu/tPw9CH1fkHC+D+Xz
 GHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q2QbXE+bY7bbkK0ORnsPfCSpnriLteycwJJYj/+hSss=;
 b=Jwr3XREm9xSQspOmnWvTp3G1w0uZk6i6u8+lcVYM3WKLVCZfEEE3QjwPwfhh+X9Ozi
 HmcKac7JOQuKw3kzJJbdXuKHjqjxozhQyzxLuKgkNuMLK3jDsPlKvIOrv1474Y9bNYmM
 7nYwH3rhHR67meHS3MruRFj9iY7C1TOKcqX5UTE4sNG1KzrkBfSYeLg/SW1j60p2zLDt
 p+fqoF+k2K4lxBSVp2HmGIusCBwziemm7omNhEctCNpbDCmFxJLJf2rp72kozzfgBSoW
 krVFOWBexCyMS7WUBYr5aYr08sQwOFo8fbzfWfaAkDYEIJMNVzvU+OULQosiph0Rz1ep
 TipQ==
X-Gm-Message-State: ACrzQf2m4DrD8eXl5Qn5tlAP+iIP8Qc+5/gkscNGP5U4ZA7gnEt+Z+kA
 MbyRcYFEk06N354caYpMwo62imWI1N7Qk/j7Udk=
X-Google-Smtp-Source: AMsMyM6CXs5p5xiOXbIUcyk5B+tdcGG04gJPanqJoZZecILv/8Md8fZKuB29b6hc8bHT00aPGFjFCodCU6P5MfuKCvU=
X-Received: by 2002:a05:620a:439f:b0:6e2:a440:b10b with SMTP id
 a31-20020a05620a439f00b006e2a440b10bmr8701220qkp.94.1665286253982; Sat, 08
 Oct 2022 20:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221003203142.24355-1-shentey@gmail.com>
 <da8a2a03-0e54-fe81-7a13-cd5e79d69d18@amsat.org>
 <ba62aabc-0023-c5e6-d156-67d027bb6ff3@gmail.com>
 <45BEF5EF-3259-4B50-8F17-115C31A0D3EB@gmail.com>
In-Reply-To: <45BEF5EF-3259-4B50-8F17-115C31A0D3EB@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 9 Oct 2022 11:30:43 +0800
Message-ID: <CAEUhbmXPo67x67ckQSYGb4XNg+TbWYn1NT+Xap8qzCLAm+zA=Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] ppc/e500: Add support for two types of flash,
 cleanup
To: Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 qemu-ppc <qemu-ppc@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x733.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 9, 2022 at 12:11 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Am 4. Oktober 2022 12:43:35 UTC schrieb Daniel Henrique Barboza <danielhb=
413@gmail.com>:
> >Hey,
> >
> >On 10/3/22 18:27, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Hi Daniel,
> >>
> >> On 3/10/22 22:31, Bernhard Beschow wrote:
> >>> Cover letter:
> >>> ~~~~~~~~~~~~~
> >>>
> >>> This series adds support for -pflash and direct SD card access to the
> >>> PPC e500 boards. The idea is to increase compatibility with "real" fi=
rmware
> >>> images where only the bare minimum of drivers is compiled in.
> >>
> >>> Bernhard Beschow (13):
> >>>    hw/ppc/meson: Allow e500 boards to be enabled separately
> >>>    hw/gpio/meson: Introduce dedicated config switch for hw/gpio/mpc8x=
xx
> >>>    docs/system/ppc/ppce500: Add heading for networking chapter
> >>>    hw/ppc/e500: Reduce usage of sysbus API
> >>>    hw/ppc/mpc8544ds: Rename wrongly named method
> >>>    hw/ppc/mpc8544ds: Add platform bus
> >>>    hw/ppc/e500: Remove if statement which is now always true
> >>
> >> This first part is mostly reviewed and can already go via your
> >> ppc-next queue.
> >
> >We're missing an ACK in patch 6/13:
> >
> >hw/ppc/mpc8544ds: Add platform bus
>
> Bin: Ping?
>

Sorry for the delay. I have provided the R-b to this patch.

Regards,
Bin

