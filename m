Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955ED4026B2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 12:05:02 +0200 (CEST)
Received: from localhost ([::1]:58214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXyP-0004Vp-Me
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 06:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNXxB-0003Yz-Fm
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:03:45 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNXx9-0003g1-VQ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:03:45 -0400
Received: by mail-wr1-x432.google.com with SMTP id b6so13552463wrh.10
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 03:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IjlI2vIY9cIMj9Ms+llOX4SlIUFYo4akexoOYkpBaIU=;
 b=WykjNdi9YbSgjGhNaiz2CEkNG8MxSshjz8Jr/GqozFD8xyNKxBU84SSw1IL1eL8VXY
 SRdd+NcmsFOs3x9JwyeYj87OwIWmkxUwEnnCwHzIMtMrnoVVPza0oIC6TLAnDcYT7j2N
 cGITBQWlYhl2TvoLgvUOPV9+aWWkV2PbzkZ4d5LWak5pgV5wtuIxWUYxNKiLMzy7eh4o
 hEb/TBcIC/huVoEpfd6P3zIZW9948fxptv1ML82FGwY/8CV18aDMEfEhyeTzMqSSZ/NP
 uyl2075JVUTzP+s11Z+/1kpLgbrNW5vl58OK1E6HVQzQXGgADvl7QIs+qBOpLKrXsOvG
 ukww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IjlI2vIY9cIMj9Ms+llOX4SlIUFYo4akexoOYkpBaIU=;
 b=eKE3Qxq4WzjYvatX0O6ebNU6fIjzHwSwFG+3A/zo8TokYNYpAkM2yUdlPWniECYDw/
 9IuTMROhUcmIT4lV2+TP6Ujgbg4Vv5UEdmXD7WVqhtnEcBhfw8lgwD7IYVsG3IY8ppag
 i6Hz0Awg9YcOYAHKTQmVBN57LsaO6gfUbSA3jjf/a5hoaMTPsMfnLGbN66s3CUWWv8gJ
 VwsiPJahRswCYJTETe9hSlbQ9M/PLzlejL62U+lNTkYccrFziU/txC1OWQd9gFuV+QOJ
 HqXArVXBHFL4gMvtMRtKszsIBdT8KvrLzYY5i5XNEFIVNCQ1D6CwVpHGUH4xAWF4LG31
 mogw==
X-Gm-Message-State: AOAM5315p6Ha9kNZn7BuxadnIZSuXlnQbfk/vucgbarmdZZ8tiZtYP1M
 XPW2Ay1Y2g2AC1Ha5wTWkE3iQQOP8tYAo3V2fjxA3g==
X-Google-Smtp-Source: ABdhPJzOXc7eP+ydp+vlvrVbybFTAZY2tOhzF39iDiKJqSg9QGibf+7ldXtVejoYg9hFX5HS6SkFmJgea9xth3Tiqa0=
X-Received: by 2002:adf:c18a:: with SMTP id x10mr18253476wre.302.1631009020700; 
 Tue, 07 Sep 2021 03:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
 <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
 <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
 <CAFEAcA9E4s3dST0GJkdg24DDAn90WU1FEmXwoKD6oQmNSB1vVA@mail.gmail.com>
 <CABSBigR1L9sE36eYA0Mq4smx1E9A4umTOKTe_x97foSMkryRnw@mail.gmail.com>
 <CALf2nmLOqtwacgrQ91TTz9_QRUmFS9ZNii2Kk7-tQ7LNp9vw2Q@mail.gmail.com>
 <CAFEAcA8oAtjVom+BXtcgao4O252ipmFzv-iNTSzDaJChcQkr9g@mail.gmail.com>
 <CALf2nmKgaZiBOfEWpMt4Yq-NyCYrsFNPwb1hZ0adwoXUs4T6pA@mail.gmail.com>
 <CALf2nmLLZ5smxqYJyA+_MPunaQqaM7-Ub9CVurTE1pM0ErOS+w@mail.gmail.com>
 <CAFEAcA9GM72tvOLDZfW=TmvV=DN1cAeXJ_MScWb3oivAR7X9LQ@mail.gmail.com>
 <CALf2nmJ-uRf=8Bq2hotai7MOD9uRVUQ0YHS667AjfVKJDYd4Qg@mail.gmail.com>
In-Reply-To: <CALf2nmJ-uRf=8Bq2hotai7MOD9uRVUQ0YHS667AjfVKJDYd4Qg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 11:02:51 +0100
Message-ID: <CAFEAcA8B5eiw3nM6fZpP8skw8uz0+V+9VEpbfHAvAk1Qz_VXrg@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Swetha Joshi <swethajoshi139@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Jun 2021 at 16:06, Swetha Joshi <swethajoshi139@gmail.com> wrote:
>
> Can y oh I let me know once it goes in mainline? Thanks!

Sorry for having forgotten about this -- I was just clearing
out some of my old email backlog and found your email again.
You probably discovered this long ago, but this patchset to remove
the dependency between arm kvm and the virt board went into mainline
back in late June and was in the 6.1 release.

thanks
-- PMM

