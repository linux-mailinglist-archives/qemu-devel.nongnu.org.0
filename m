Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFC86F41AF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:34:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnJz-0007vs-PK; Tue, 02 May 2023 06:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnJx-0007tt-U1
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:33:21 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnJv-0000MP-D0
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:33:21 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-958bb7731a9so732909066b.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683023598; x=1685615598;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xMHHRTKyq1uQreCZO0VysdC+MMapYvFTrKpYK1X2AIU=;
 b=NhhX27P2eqjOHacTHAyAWcU2m3LOckYP0OD0RBRRpl4YfR8TvvuhG29Ma1bdnWpTh/
 GNT3CtSwZT8wO8IxY342T5rD/frKARxq9ZfPQskKIxkjcSMrb7qe40EjRdTMdKcmKj1u
 93b3B/5LpdZqKTQ8NpHZ9x2D5mAw6ohq3aFbrNw4xnu4MprshpsP+CEYvmPsNDAaicR/
 5uvgjqdZEoWjQWOxxjh4zpXmwyZK/VG7yXvB2RAMXMswhF9CXGpxS18VwoZvqspMzzZR
 8PNPlalNl3WRHJN6M63oLCX0U1gE8fLn3h4b1UZSb/pVD24U/Pda6GSwQHnKblNQvhqk
 6pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683023598; x=1685615598;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xMHHRTKyq1uQreCZO0VysdC+MMapYvFTrKpYK1X2AIU=;
 b=LBz6AaK22kDLa44ZRlYPe0priq/mwfhTkDYZak/gIf3FWwdmQSDnydgyUmoD4eSX3z
 OM/IDVVwc7uJnEMhBaHP1ECvRnUl24bkMi73N5/lwbuBn01WIrjdGGxGrQtMa4apyKCc
 0+iBKSFDxHPOW8ivBukUAnIePgsIGqA/daYCql1We9kFYb46jDSuabvP2hFALYzsgEuU
 XzdvlHQkXmly4SJHyY/5rGImA2VKQvRVKorzqwYXR6ZI3+uEGryo2g9ZrcR7eJUOo8YJ
 nERppAdqx2kZvx1DGuOJdpH1rL3o3Ib/vb14IUyW4EI9HNsNHsC3vFDHipPLJiAdoWPf
 ZO3g==
X-Gm-Message-State: AC+VfDwLa37mkczzigoLa8/WOm5CgM8/iYx9EiRnh+DH0xCnISD+xJB/
 C/XxvvjCoJW3ZZQE4D8LDkeWs7G8eoGI+PiB3AeK7w==
X-Google-Smtp-Source: ACHHUZ6CiAazl7mSVLiV1FMohH95AbFpm1Wmt+dOKrbUc+uxBfVX2Gph6dvNiXBmL6u7S+ORKCU7mgGmO3AINR3kdps=
X-Received: by 2002:a17:907:2d07:b0:94f:5a9:9fdb with SMTP id
 gs7-20020a1709072d0700b0094f05a99fdbmr17216965ejc.67.1683023597671; Tue, 02
 May 2023 03:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230424153909.1419369-1-peter.maydell@linaro.org>
In-Reply-To: <20230424153909.1419369-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:33:06 +0100
Message-ID: <CAFEAcA8+uw3-Buu2MmKDPj3_za7JCOnwA5gnaiFhXrsfTHaryw@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Load correct half of 64-bit fields
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 24 Apr 2023 at 16:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset fixes a bug where on a big-endian 64-bit host the
> guest would crash immediately when it did an ERET. This happens
> because when we load the new PC value from CPUARMState::esr_el[2]
> we do a 32-bit load even though the struct field is 64 bits.
> So on 64-bit BE we use the wrong half of the register.
>
> Patch 1 defines a new macro to load the low 32 bits from a
> 64-bit field, and uses it in the two places where we got this
> wrong. Patch 2 adds some compile-time assertions to the
> existing load_cpu_field() and store_cpu_field() macros that
> catch inadvertent uses on struct fields of the wrong size.
>
> This fix is necessary to be able to run the avocado tests for
> the orangepi on a 64-bit BE system.

Applied to target-arm.next, adjusted to use sizeof_field().

thanks
-- PMM

