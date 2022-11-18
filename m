Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EC162F8D1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 16:04:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow2uf-00068S-J0; Fri, 18 Nov 2022 10:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow2ua-000664-DS
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:04:13 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow2uY-0008PP-Ps
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:04:12 -0500
Received: by mail-pf1-x434.google.com with SMTP id y203so5102518pfb.4
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 07:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lPdSh4PWnHjmIRpujpv2MOoUp0yleQHi9lyNYIApIAk=;
 b=PwJvCQrOUeVTf2hwpjnGP49cU1tydnWaSa2htAuv+1JsCl6OltAYvQasc/9cF+yLPt
 HHVBYd6//jBO1J5t/NtCnsKH+nRcpUeAkIBVh6xcJct1a6X/08LtyNmG4VsUcISy9S3d
 ++z1H1FceCuwtJg00ZuSO5QQdB81y9LQuumPgOjmoTt1M6eJI5c1AP9Pf84KamCNzoT3
 zQxI8UiIjEQ/+1N4odl17XNuOATsS/ecIivi3YCxz5Au4JeRQtQilat29/ZwXOBvFMY6
 M6lF4+IosSLV90RPkeUz8H07d7xJ5fH7+yU37NZTCwSoUq8iXNtF8NY/w2Xy95hLjQMW
 7aJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lPdSh4PWnHjmIRpujpv2MOoUp0yleQHi9lyNYIApIAk=;
 b=xzWn16bYaXfYvvWCqrR9Lo96a7gCeXkJDW3ZD+VDDH7pf8xR48XDuAlhOqvfPLzJuk
 T2kCzbqpURSYBSHswvQXmreql/t01+614UqJmuTQpkk6g8B3+KwoZIw2ylXuUrncbNl7
 Nmrsr1aZhOueZDLdh05Gq9a/I5BWRtWkGH1oJ3ZnMp28EMnWOUOcykGcZZvce7fEuYI9
 VsnzhoCtrwvTLthEtvHM+7afj5K1Bg66AYDuO77qi3Jy0EnC9b+PXlr80q3sY5DepfFO
 K84axeorWwrSBAKpDCbdl8CVNqBjsdmoyHYhl9tqNPRizsDYY0DBEnhr8U65FuS8I/iS
 5u4A==
X-Gm-Message-State: ANoB5pnmC1dneHDdHySsxgNEwuJP72eVuDzg1E/6JARbZt5AyvhHa0wd
 Kr37FCTIJHlr7gSnyQlGuihCCaNQCC+fHG6/8hKsnQ==
X-Google-Smtp-Source: AA0mqf4SRhZ1fd3qZApWd9D5+R3p77S91GkBy6SbfPTdeH45YtL/8iioFfHFfEzF6Cl73KNyhvN+qj++SAlHxvxzKHk=
X-Received: by 2002:a62:b501:0:b0:573:1959:c356 with SMTP id
 y1-20020a62b501000000b005731959c356mr5043216pfe.51.1668783849231; Fri, 18 Nov
 2022 07:04:09 -0800 (PST)
MIME-Version: 1.0
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 15:03:56 +0000
Message-ID: <CAFEAcA-au-HysW2vdDdy1cmMAq8S_qzK-xs177AGaQ4n_Ex86w@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add ARM Cortex-R52 CPU
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Tobias_R=C3=B6hmel?= <quic_trohmel@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
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

On Sun, 23 Oct 2022 at 16:37, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
>
> Thanks again for all the help!
>
> Here is v4:
> 2. Made patch cleaner
> 3. Changed commit message
> 4. Replaced V8_R flag with ARM_FEATURE_PMSA|ARM_FEATURE_V8
> 5.
> Reworked the code to use existing pmsav7 variables
> Added migration support
> Added VSCTLR:
> I didn't add any functionality for it because I think
> Qemu doesn't model the behaviour it influences.
> 6.
> Lots of cleanup. I think I overcomplicated this a bit because
> of a misunderstanding. I thought HCR_VM is independent of enabling
> the different MPUs, but I see now that it doesn't make sense to enable
> HCR_VM when the MPUs are not enabled. I also think that there is an Error
> in the armv8-r manual supplement in Figure C1-3. With all that figured ou=
t
> the code for pmsav8r doesn't look that different from pmsav7 :)

I've now reviewed this version of the patchset; it's getting
quite close now, I think. Sorry it took me so long to get back to it.

-- PMM

