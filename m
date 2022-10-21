Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7328D60746E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:50:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olofK-0004dY-LV
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:50:10 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloWB-000068-Rm
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oloW0-0007IE-FF
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:40:32 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oloVy-0007ya-P4
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:40:32 -0400
Received: by mail-pl1-x634.google.com with SMTP id y4so1874022plb.2
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 02:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=De6goZ7JkJ3YLqvW+bgz0dCp6u4aYLJy+OozOnLn8Gs=;
 b=sWQ0M2npDN5B2FIkmFjPdt8EnYt3HyWOU8gt+esKN4O5krXqRx8MFY3SsZ3hRzj4Q2
 C0EVABdwr8QTPwe8FEdQmDEl8+0oHUxB0tbpCZ6gaY4/K7zw4kSFNkQ1uCzIqUcTo/2q
 NU/XmXXKZH0Xok/pslnb+Dbv+pZTP1wNyGIT6n/umx3sMNvA6Oyd7JpPkaPzr4iwxPBr
 CLZOlPfBmbdTKAa0XWJeO3Gb/tzli3c6pP+8U3Hl3xClNeZ6gkb7QP6gqwIVmjhS/3Ep
 Uq/GAoWei01QDo8Y4jp1nr2EOX1pLV/mnkrHS42erQeItAFGQjzuFvQS76L6JoCjraQ/
 4jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=De6goZ7JkJ3YLqvW+bgz0dCp6u4aYLJy+OozOnLn8Gs=;
 b=csD1V81c27IAsRFskBsA3LqX22Nt6iaffDqecL6qL5ifFPgYj5m1MzUlBLaxN1ZxIr
 ljky9hnuwcbyhXc6YPXt7CaFpwfS+1v27gKGMYa+8W5uSrQQPNcOJ5Qv3OkT0C2wjga2
 2qFUNUB1zMFeBcS6nhLWDImCqRp126dOM8zQFXAFXWNttvK21SbBvH/RYEZUuGc4Lwfs
 V3/gwYUw58RsuN4/gYacMR5l7ZyQhTKcor1NoBwyOD3ObDdy8uBMimOxjHROmpTVzf8f
 GtDrWTGaERCQQhyKEIOZ2nVBxRa3AWMUhQr5+D6MLxyIBUT0SfeBZfL0/y9mZ7NnIvjp
 Xtdw==
X-Gm-Message-State: ACrzQf17kcKIyMtR5vK85fOHNc19PE7Ltinx2tC2/And788eBfz4nzZa
 sch0Tg/ABO3ffbKc1FUac1NrVw+L06bYyVSdfKOIKQ==
X-Google-Smtp-Source: AMsMyM5tomvCTqqzDaiWrDHNPfKSi8m0a498XbIExYYjerJZcpGnQo+lfONELorGaXo2VJduQuKEADm6OofQMeeBzYo=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr17826192pll.19.1666345228832; Fri, 21
 Oct 2022 02:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
 <20221020223548.2310496-10-richard.henderson@linaro.org>
 <1eda418c-61e1-a00a-1217-0ab2eaff0ae0@linaro.org>
In-Reply-To: <1eda418c-61e1-a00a-1217-0ab2eaff0ae0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Oct 2022 10:40:17 +0100
Message-ID: <CAFEAcA9E=-r6P6hR_E9VAjek+kbP=h1vp4hH6scXvprwzg67ng@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] target/arm: Don't shift attrs in
 get_phys_addr_lpae
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
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

On Fri, 21 Oct 2022 at 10:27, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 21/10/22 00:35, Richard Henderson wrote:
> > Leave the upper and lower attributes in the place they originate
> > from in the descriptor.  Shifting them around is confusing, since
> > one cannot read the bit numbers out of the manual.  Also, new
> > attributes have been added which would alter the shifts.
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   target/arm/ptw.c | 31 +++++++++++++++----------------
> >   1 file changed, 15 insertions(+), 16 deletions(-)
>
> >       if (regime_is_stage2(mmu_idx)) {
> >           ns =3D mmu_idx =3D=3D ARMMMUIdx_Stage2;
> > -        xn =3D extract32(attrs, 11, 2);
> > +        xn =3D extract64(attrs, 54, 2);
>
> 54 -> 53?

Yes. I spotted that in review of v3 but I guess we lost the fix
along the way somewhere.

-- PMM

