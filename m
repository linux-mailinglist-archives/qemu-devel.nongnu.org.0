Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84AA2AF437
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:57:31 +0100 (CET)
Received: from localhost ([::1]:36542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrYw-0005Ir-Qt
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:57:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcrXc-0004rp-FD
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:56:08 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcrXW-0004IZ-Vr
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:56:08 -0500
Received: by mail-ej1-x630.google.com with SMTP id s25so3138683ejy.6
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 06:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/GSJ2b9EUjdf9FOpQYl+0ssT7tswpqOzgHZ/EUsMZJA=;
 b=Dd2emW67tQQAQ2Mu3bIOWVCkHHHWVT/ROgbJe6XvHGkb2GzQUrE8GmUcOMHjtc4PpX
 Wiax773BG+SaFADkY2uzIyV3g3dItbuFD3d7WvExTJYoyoXgJTIPZAgnwQgUlm9I3SY3
 NUoywvX4TDmkaHOU7laSt0+Sw0/yj2YV/Aecv3mwisAL9iwtPcLRLW+bfvsSR4hfvFsk
 Iae2AFZl35bKj0ON26FgFgDGs/swPUeo4Lardl+AngIJMBsWigDs+AwUKs/8lcZTfHIP
 aQxFqkJTkW52RllyJI4S8eWi9h+kVfeMVYoI9E+9bebbdnj5Lvqigjo9gQT15lra11a2
 j/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/GSJ2b9EUjdf9FOpQYl+0ssT7tswpqOzgHZ/EUsMZJA=;
 b=lA9oyJlIRY2MvzNbyOdL1ssDL5Z3mkB+b2cyLFZOKiVA+0rnx4Vg6sDy85dIQ1RFwe
 TsDQDpsGjTBxemdGe7Zsd6rXd3KFpTS2rQo3r+MHOKXHcIOkCS+25UGzOOjhp7fPl5wf
 doNvgZxaGjOeqGFPSwV5mtk1Jl4XqbcoSNfEcj4q9UHaoVDsD+7A2qHRkWS9Wjof+rJh
 OUT76y+CxKOjuNdn8aeYdBIUcQVwHNI3UrzHVPlnCZQyd7AEWJB59EgskOP7UJlOeV0J
 PMdorHpGPflBIE03L2ub/Yvc13uzreiwrT89pI/AhUBCViBAhHZcUeKFr19YcrwLF8/R
 GwZg==
X-Gm-Message-State: AOAM530ud0HoIQRXH9B19mkVlwkPwcY31YH2iBCOtHw+jppgJJMiMEAk
 SaBabrOYjzoAbC+4LH56hboTZRETPFUzHcLsTubKDQ==
X-Google-Smtp-Source: ABdhPJxQbPVJWHThDckCTv8JMpu0Qg7uJWRB259omWqakf6HS4TKtgbev6tb55Byifosu9Ml4UBHFi7nde1zF7IMVbY=
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr26893440ejr.56.1605106559100; 
 Wed, 11 Nov 2020 06:55:59 -0800 (PST)
MIME-Version: 1.0
References: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 14:55:47 +0000
Message-ID: <CAFEAcA_m2Y2q14_Xr7D3VSToo+3_Fqu_doP35k0RpfCWPEmfiw@mail.gmail.com>
Subject: Re: [PULL 00/17] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 at 13:11, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit c6f28ed5075df79fef39c500362a3f4089256c9c:
>
>   Update version for v5.2.0-rc1 release (2020-11-10 22:29:57 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 71182187ddae5d5b17bd48464f719798321484ed:
>
>   hw/net/can/ctucan_core: Use stl_le_p to write to tx_buffers (2020-11-11 20:34:36 +0800)
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

