Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161C25753B8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 19:04:51 +0200 (CEST)
Received: from localhost ([::1]:43784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC2Gg-0006iX-7V
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 13:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC25M-0006De-N7
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:53:08 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:39849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC25K-0002oF-Ox
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:53:08 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31c9b70c382so23229967b3.6
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 09:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=foXcdVOz00H6ABCZbc6Pamrhp1GoJAUT6rDiKasqpPY=;
 b=E5PEmNiElQ6nM2Ifs33B+XMfpqye3qLcH0HmT4up87OF+HEUZNrkqk3ew3FFuiC26h
 reDiC5aRglzcL+at4ayts46ZzBj+SL7gYlEf4fhwbVgcoSevMe6uHsH8z2E57GCR0+YC
 IE+S8EV6bx3Tx1ZV+laEC0s9tRv9UUC8t4DY4tLiU/Hy+19VOzjJqpo2HYJBxQUi0FPY
 62tjnsKbejvr2A0bgJyK7RkpQYjxVA+8+9PCcYLlms2OdmR4ahfYtjcLSngJ7W1kDUjj
 F16iBVSVUPlLdQHdHaY3xg6/r3qc3rMrkdY4DOjZr0iLJHg5zDqV5d13SOdLFN+514V7
 p03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=foXcdVOz00H6ABCZbc6Pamrhp1GoJAUT6rDiKasqpPY=;
 b=5h12WWRFcAHF8aAipbrN2OwxVb/dIai/aE6FWXpMq7B3n6izkEXmonZAw+kZJaaQOu
 tK2iSlyr/REKbYTaJYzZZerHlQuCo2mLdo7eoNSrs68XNYCeNOm3zkE8EcPBWwQWP2vI
 1oACbqtRZNq/KXY/1XumdNDoxeriWAJzXm4QohavCAd3v7eSeS7Yz9ap6KTtmL4L4EAL
 P7JiUKoIxYfV4JErIGVdghfe5lj5ecXbLCkKaJJ+D4dRQdDEeSeVoqkb0h/qBvhbpe1L
 ED7ZK6FbM+xVVUMRNfwnqOYrVYJmWGOA6CNeVhJGfkHPKmbGiJGGaLyQsPRbRHpeJePL
 +5TA==
X-Gm-Message-State: AJIora8o/5N6cEt33VVxUDbV5cnBaN1c+sEMnk3snzcyqsL/dvAHwOD3
 X0Td2NiryQxb0voStqw1M25W3uK4gxlj4tXg+HwKsw==
X-Google-Smtp-Source: AGRyM1uIJMkx0e++qqGeiwqi3jtQNHTwy1sQfBlxFd5Nmfo2se2Xv6fwb1vh+HtVZ4dN1Ux/DCi3cexq4XISQEu9NZI=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr10615326ywg.329.1657817585519; Thu, 14
 Jul 2022 09:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220714145355.7225-1-quic_trohmel@quicinc.com>
 <20220714145355.7225-11-quic_trohmel@quicinc.com>
 <CAFEAcA849X-NfvDYPPHD6a0YXwogJY-QXAuBKRPoZEdFa3+3rQ@mail.gmail.com>
In-Reply-To: <CAFEAcA849X-NfvDYPPHD6a0YXwogJY-QXAuBKRPoZEdFa3+3rQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 17:52:26 +0100
Message-ID: <CAFEAcA-4PvyGT+s0Yqme1ZOPAGLxyfLxp8TRv_vT1G4x5t0kNA@mail.gmail.com>
Subject: Re: [PATCH 10/11] target/arm: Make SPSR_hyp accessible for Cortex-R52
To: Tobias Roehmel <quic_trohmel@quicinc.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 14 Jul 2022 at 16:46, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Thu, 14 Jul 2022 at 15:54, Tobias Roehmel <quic_trohmel@quicinc.com> w=
rote:
> >
> > From: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
> >
> > The Cortex-R52 can access SPSR_hyp from hypervisor mode
> > as discussed here: https://github.com/zephyrproject-rtos/zephyr/issues/=
47330
>
> The v8R Supplement pseudocode aarch32/functions/system/SPSRaccessValid
> says this is UNPREDICTABLE:
>
> when '11110' // SPSR_hyp
>     if !HaveEL(EL2) || mode !=3D M32_Monitor then UNPREDICTABLE;
>
> so unless that's incorrect then I think QEMU is within its rights
> to UNDEF this (and real hardware may choose to UNDEF or not).
>
> I will enquire about whether there is a bug in the sample R52
> startup code.

The author of the startup code example agrees it's a bug that went
unnoticed because the FVP happens to permit this UNPREDICTABLE case,
so we don't need this QEMU patch.

-- PMM

