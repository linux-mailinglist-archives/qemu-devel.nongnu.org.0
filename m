Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA305FAF62
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 11:32:45 +0200 (CEST)
Received: from localhost ([::1]:36062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiBcy-0004rN-L6
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 05:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oiBXi-0007qg-Ok
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 05:27:18 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oiBXg-00087t-SF
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 05:27:18 -0400
Received: by mail-pf1-x42e.google.com with SMTP id p14so8662851pfq.5
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LtCKKDnwuDvYrA8AFMSDTWFuaN8hNHBbSKwGOmT9QaA=;
 b=bxqAODebLrEUlM6fRwGF9wDz2ep6VD7BGXbG/+jSxQResj8qhJcuCaTJeUEdomO0mH
 qHpb1CCa5p7Xi/AkRwQCqEJU7zaMQS1W/VeIdfJHeLqCndwivLui/61d5CZgxFUM280d
 Ulpk6Aaoleeq4q/ug+O5ROYHC8p05BDqvkniMDCGSSs141FNJQ6NIOSeKKW6lRUzxmg7
 rq99aj76o88sEE2hK8MTk/hnN0i2bAjNxL+SMBOF/miwWKp0uZ4PhrSYPWEns79TluIf
 nm+1lWs28qycWTX5Ngqo+/+vF2kEseBAvq0dfF1jQmUj05ahhiF6KzM2pWXxfq3G76P/
 KoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LtCKKDnwuDvYrA8AFMSDTWFuaN8hNHBbSKwGOmT9QaA=;
 b=ys7NxxiMUto3giVH4PaZrnG9lnPKZbKW4D9elfkvlG5hYnuhypdW0P8Ed9S14DGj9/
 fSjfzpLqGpON6uclG0N5GK6DCZ+9GZB0Rt5C/BCmKllhRffcYdxp3NROrVYv/1AdqmRm
 /8HW/WIMiiIiPcB9fVAJDTfYuELKlzCa8beSa9Q7V0Ncpsat3RfRYDsAmZLid5o7n8R1
 GkXhQBIsNiNVkYsd76DxGz6e8FraEmlBFzYAvYDtJ5tblZ9uPJ8LcJ0FQr4usRP7g5yi
 K6G+3b6QqCFK+sVOv4E/ke77OIJfLxyylUYply7xj6nRAIZKDCGVT44GSEcmGj6fQrDz
 fT1g==
X-Gm-Message-State: ACrzQf37Aovm1jg5eoE5OtXorNyajORDBoZEvvDG1A0lotGg5A7a3lzA
 o6dH/xXYuSIblkIXYEc1XL8iDGLFEQEtAXWuMcttbA==
X-Google-Smtp-Source: AMsMyM68IjEgpNNEpAHNs5foQENWYR25pAx1B/QXl+EclbNodtSjf5WHuEDdv9k4nT3cg6yq7D6I/rW4uWrV1zsIe38=
X-Received: by 2002:a63:9043:0:b0:458:6003:30ee with SMTP id
 a64-20020a639043000000b00458600330eemr20940258pge.231.1665480435054; Tue, 11
 Oct 2022 02:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220917074317.1410274-1-gaosong@loongson.cn>
 <20220917074317.1410274-2-gaosong@loongson.cn>
 <82e86c6f-4304-119a-49e6-d0b16bd9a7e0@linaro.org>
 <CAFEAcA_T7T=9gt3Xm37zMpY5AZDRz9sKMjagQOXX9AX-CgqFNw@mail.gmail.com>
 <34b95105-711e-7dab-d5cb-fad315e8c26b@loongson.cn>
In-Reply-To: <34b95105-711e-7dab-d5cb-fad315e8c26b@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Oct 2022 10:27:02 +0100
Message-ID: <CAFEAcA839Om2gmweTcNqo3HPAQAoJ4xgA36ZLPE3V2KctX4qkA@mail.gmail.com>
Subject: Re: [RISU PATCH 1/5] risu: Use alternate stack
To: gaosong <gaosong@loongson.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 alex.bennee@linaro.org, maobibo@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Oct 2022 at 07:57, gaosong <gaosong@loongson.cn> wrote:
>
>
> =E5=9C=A8 2022/10/10 22:43, Peter Maydell =E5=86=99=E9=81=93:
> > On Mon, 10 Oct 2022 at 15:20, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >> On 9/17/22 00:43, Song Gao wrote:
> >>> We can use alternate stack, so that we can use sp register as intput/=
ouput register.
> >>> I had tested aarch64/LoongArch architecture.
> >>>
> >>> Signed-off-by: Song Gao<gaosong@loongson.cn>
> >>> ---
> >>>    risu.c | 16 +++++++++++++++-
> >>>    1 file changed, 15 insertions(+), 1 deletion(-)
> >> Good idea.
> > Depending on the architecture there might still need to be
> > restrictions on use of the stack pointer, eg aarch64's
> > alignment requirements, but this at least means you can
> > in theory write some risu rules that use SP.
> I really want use alternate stack, this way can reduce risu rules.
> what about use this only on LoongArch architecture ?

I just mean that although this patch is fine it might
still mean that depending on the architecture some care
and/or special casing of sp in the target risu rules
might be needed. I don't know if that applies to
loongarch or not.

-- PMM

