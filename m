Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603EA3B5EA6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 15:03:25 +0200 (CEST)
Received: from localhost ([::1]:56230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqv6-0006yj-E9
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 09:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxqtO-0004sU-4k
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:01:39 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxqtJ-0004qn-Dg
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:01:37 -0400
Received: by mail-ed1-x52c.google.com with SMTP id t3so4266827edt.12
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eWUdW7ZKWpQ7p8hjnQ25fDervMhwi3yyXQR743idhD4=;
 b=I9yESsLjqZ5I8AYQeduJ29A2wAbVPShRycrOuHVwALRIl1RQ3jqLL48be0mmggMLNg
 MlfkXPrW9emkG2rXCydYotqJxh/VPoV45HWPhUbGwSN/lZ7qq6Gpy75zfLwFp8apGZUM
 gHqBTNwHgpsxoqPI0AM7+qe1UebJz4RzPEPQ4xuPqquLr/40WKH/ivEPSOi6c0SOwB+e
 KOf1IJIaWx7XMrPR+BjJHQgZSnFIogehJcsLn01dM0PIpiDc7aoIIp61cqCANcAsWyRU
 EOJ8Uh6NmcqDRYcMBe11JdsRWYKnQf5h8rL11+qIbfWAWajQY2sKwUc4OS9J8sap4HRS
 grCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eWUdW7ZKWpQ7p8hjnQ25fDervMhwi3yyXQR743idhD4=;
 b=DaEBcLhI/AZJuqYzMInjUDrhfXWbBn9yR4kK5+9aEzoMLN9ssqUUBYXAFpw7jqSaUK
 f12zGbGvAKjeXVtZ/XFKFu2saN1/ih3cC1BX0HD/SU9UQDQ9jJczNdH8B51ANbFxVsWN
 nGj8gnrl/LqJ2IVcgAbfDm3++eA6VT+x72M3bsDYDp2Uvhe/cwob4CVq7f0hXeFhWHYt
 5PtSWQEB1mXtCtrbaWHbDbyichno7fkufP4+/9muFZKK+l2vYrbXIQe84GWYdJG41AIV
 W6FOvEZMZyz+ymV1b7aQa82+Un3MdO1NuWm+r+d2MmirkMqsMufy2i0EPmyWQ5UfaMA5
 6BQg==
X-Gm-Message-State: AOAM5313GcanPoGC/qafxwhoU11aVCjJQGvC8U8mTCbpsQ2GVY3EE1ts
 XDmjDnVL1aDHfgdzUnZ9jA66/wW6YV8Bx8apDBVqmA==
X-Google-Smtp-Source: ABdhPJzkV4t+4nfrc+qgZJbhCOlyryU9fClOBxirxVe/Zw1VHUYDOoBD+iEsmwpFbJw8kzWSGBHTj+TDVvZZ5QqFnMA=
X-Received: by 2002:a05:6402:5204:: with SMTP id
 s4mr32629579edd.52.1624885291862; 
 Mon, 28 Jun 2021 06:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210625092329.1529100-1-f4bug@amsat.org>
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 14:00:55 +0100
Message-ID: <CAFEAcA9tCKcEOdqYn9mwjbTTyMZVEO+8X1VUh=jOCbJBGOHr0g@mail.gmail.com>
Subject: Re: [PULL 00/15] MIPS patches for 2021-06-25
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Jun 2021 at 11:08, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3D"utf-8"
> Content-Transfer-Encoding: 8bit
>
> The following changes since commit d0ac9a61474cf594d19082bc8976247e984ea9=
a3:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-20=
21-06-21' into staging (2021-06-24 09:31:26 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-20210625
>
> for you to fetch changes up to f5c6ee0c6b7b4b79b52a1614a808633dbb694de4:
>
>   target/mips: Merge msa32/msa64 decodetree definitions (2021-06-24 16:48=
:08 +0200)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> Various fixes:
> - Potential integer overflow (CID 1452921)
> - Invalid emulation of nanoMIPS BPOSGE32 opcode
> - Missing exception when DINSV opcode used with DSP disabled
> - Do not abort but emit exception for invalid BRANCH opcodes
> - TCG temporary leaks
>
> Housekeeping:
> - Remove dead code / comments
> - Restrict few files to TCG, declarations to sysemu
> - Merge MSA32 and MSA64 decodetree definitions
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

