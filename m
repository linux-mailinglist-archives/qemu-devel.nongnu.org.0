Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1452C5B8B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 19:06:38 +0100 (CET)
Received: from localhost ([::1]:54580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiLfB-0000kz-9H
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 13:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiLdr-0008DV-8s
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 13:05:15 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:35162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiLdp-0002Pm-FB
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 13:05:14 -0500
Received: by mail-ej1-x644.google.com with SMTP id f23so4134227ejk.2
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 10:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OqrmPnoggcLtxT00sDykkwbcz2yDbg5QBTVngWEu9UI=;
 b=m40sP57Fu+d+JBSYKTCaSG97cY0NpRFbymMHhzdMzbvneRtGl7AiW+QQ97PSBMdmxa
 AydW1cSjbLYrcWci/s+WMfjq4cb4icNJMHb6icrXnJQjZbjeT/RFYBOQUYHsiffqAzbh
 sNWUJmNBdfJWzf7Tf9zQfgyJ1k1ANCMCnlTSwZRcVKVufVjUVazUBLtk9ZnlsKFSqF1N
 u5nSXZ27ynCAwAcK8Ne/E0TX+0jIeDmQsXk8cmnzIgff7qOUBmeZdfdD2VrgTImGzokv
 cf2KFrmhBTE3GxuOzbksfVTwPT96k1LSRKe8IIVkjXgAq3AyMbZTpZg533e+rKyS5sp3
 wINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OqrmPnoggcLtxT00sDykkwbcz2yDbg5QBTVngWEu9UI=;
 b=WX8H2tveYUUxP2m9xPkE766zblwRRUFwwFcLw2PM0O5Rv9KnOUxdmNGB0q6q7ye6cW
 TQ4N+UEtJLs29XCYzBPYMnMSIeM7v7bBDryftFZmG7030FN0pljvqj1RUXACe1RsAW50
 h0Lrafl2sTT9ZZ7fgh9MIWQzmI4NMXpZ//J9wipiYk92k8GpuGDE4ZzhjBiq58Ts8ojM
 MgogHG6BF0k+D+lm4xyiFG355M918H6vJ67/kCEOpSh8CZhhncV4C9BnrVWkaZzTqwU9
 nHX1eKunK7ac7JKJRUAozsmrduZTo0+W0DqBCd/HCpLrRU6pb+UotRy4zoca5APuR2Wj
 L2kA==
X-Gm-Message-State: AOAM530rjKMv8OvLA6PbUKjnbJEdhIDXMGCYnkNtWt+tofADKDn6hmfB
 +rhMqkwG/TCFN4U0PGXGXsaUZN4ofyPzkVIQSo/a+Q==
X-Google-Smtp-Source: ABdhPJxacYqo1ZErczfkVeuFwBY4Ur67p/I4ISq7R31lCH7aYAus6EyRL+mmO3Zn+cKOn2vSGQPVwK5l+O/c/n0iehg=
X-Received: by 2002:a17:906:4bc6:: with SMTP id x6mr3879596ejv.4.1606413911743; 
 Thu, 26 Nov 2020 10:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20201124122936.30588-1-kraxel@redhat.com>
 <CAJ+F1CJYeO9fGcSOZEEJmYvFwAxXe32rKGv81sfG8Dz=nCiGog@mail.gmail.com>
In-Reply-To: <CAJ+F1CJYeO9fGcSOZEEJmYvFwAxXe32rKGv81sfG8Dz=nCiGog@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 18:05:00 +0000
Message-ID: <CAFEAcA9FWSwZnoGm67sswTDP29CZQr0NRJsD7dqrRWSom3B1Fw@mail.gmail.com>
Subject: Re: [PATCH] qxl: fix segfault
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 15:42, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Tue, Nov 24, 2020 at 4:30 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>>
>> Add missing sanity check.
>> Reproducer: run qemu with "-device qxl" but without "-spice ..."
>>
>> Fixes: 0d9b90ce5c73 ("console: make QMP/HMP screendump run in coroutine"=
)
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>
>
> It would be nice to include this regression fix in the release. Anyone ta=
king the patch to PR?


Looks like a safe fix and we do need to roll rc4 anyway, so if somebody wan=
ts
to send a pullreq tomorrow I can apply it.

thanks
-- PMM

