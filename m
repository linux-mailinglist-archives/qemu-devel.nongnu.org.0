Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE3A3CC5F5
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:53:39 +0200 (CEST)
Received: from localhost ([::1]:56984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4qNW-0000Ye-3u
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4qMZ-0008Jb-3l
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:52:39 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4qMX-0004mu-NN
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:52:38 -0400
Received: by mail-ej1-x62e.google.com with SMTP id dp20so18791700ejc.7
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 12:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rzWiVEtoXDNRM0F14TgkBXAaVrhxjOHBkVa34LBS7gg=;
 b=hnFJNayO+nbqvE7Xts10e0nF0T3vYu5tGXYk9E7XUqWHADjtGbCe1LmPfuuL21rF1b
 epzvnsjHB087jM8r1uDdCJeL3FB9uxP4PoTL/lnv0K9+odCVQYgbPEz0+nlomYGtAyrm
 0xxEAhA7JAE3Cb85kucULwyHzdOYp4igsrH6dn0IPAhV471tYTzIzxNz2ZHl0Eyvx29y
 T/Snl3EmdlzukGL6IWyGXitQYo6yRNkNG4acDpjyTpAD7LM4DLie4sFF7+gd0IjvBP+F
 CbDytpkXe5MzOljkO/7tzAtegeHaDbko0gC8vjY4xoCMQUKEzx4uihn/xugPuESc0x2h
 Et3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rzWiVEtoXDNRM0F14TgkBXAaVrhxjOHBkVa34LBS7gg=;
 b=b8W0ROPlEtZAJ2FM2ZXOBj7OAaf7koaTelGswpx46b1uYaGPq4FD2kjBIeUukedg7k
 v9YPVVMtYZVpYWjiZbL1WqCUlqkCZjC2ciQ5a1C2d27qAuhFCBlvYeNr7k+IpzmT1Q66
 24Hj5fju89hl+BhPvZX0FqS0WRJPBcvMNgWZmPqRSA2QRSGPLz8fz1mgkF8kVFPmVgD5
 DCb1xRNllhH51pgI+CKM36pNHQwjmPJgR2yYuG6Iam3lSeKIHyvVt2sBFEZMeKwUEmV2
 XMNWtEjMyTVlNMUEFzYbuXN9i63IhNUFGmg4zfo5U9cZyGEQuH19yakRy7i6GFCTW65i
 N8AQ==
X-Gm-Message-State: AOAM532/WDHb71+szgXD4H+RH36/DX5ApiqK8ZJBwVifmnKKyj0cApLQ
 fcvpE8TxQcWaKH3T0Uk0qo21l1iME1T9q/Ca8MyjNg==
X-Google-Smtp-Source: ABdhPJwwA9E7OR7Th1sZ4c0GTxmAft8MsYqqPuXRs3g9gsd1dWuz+Rq317ZYWM0tsjvHIfk8srNDO0jzuW6pPMLB2M8=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr19336363ejd.250.1626551556221; 
 Sat, 17 Jul 2021 12:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-6-richard.henderson@linaro.org>
 <87a6mk3kbz.fsf@linaro.org>
 <e94c9ae0-5f50-8979-36f8-d409e3631b16@linaro.org>
In-Reply-To: <e94c9ae0-5f50-8979-36f8-d409e3631b16@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 20:51:55 +0100
Message-ID: <CAFEAcA_F=vzKi5FoWhGYKMzTrpGCaR7rM+Qbz_8pDa9RAD+4Yg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] accel/tcg: Handle -singlestep in curr_cflags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 19:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/17/21 10:42 AM, Alex Benn=C3=A9e wrote:
> > Hmm we are testing a magic global here and looking at
> > cpu->singlestep_enabled lower down. We have a transient singlestep whic=
h
> > is turned on an off via cpu->singlestep_enabled and a global as a debug
> > option. Can we rationalise it further?
>
> Not sure what you're asking.
>
> cpu->singlestep_enabled raises a debug exception after one insn, whereas =
singlestep merely
> exits the tb after one insn.

We really should rename 'singlestep' to 'one_insn_per_tb' or something,
because it's continually confusing...

-- PMM

