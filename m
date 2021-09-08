Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A74403740
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 11:48:35 +0200 (CEST)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuC3-000530-1U
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 05:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNuAc-0004Ar-Lo
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:47:06 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNuAb-0004ox-0e
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:47:06 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z4so2319675wrr.6
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 02:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x0a+n2seyYHtcm+WRsTc2Zyu84e7VRKkfJAV0BfGFU8=;
 b=Vp4WafrE8BfEFoTeXEgFPjBvybjFnfLZhMJu/X80WeMgqaWoJOIUQbve1jTRi/yzC5
 yLLd51eAZetFY5D/cC3tmQTCX3j+KLRYa0JMBAy6E9BdCInXKn6MUSnXEUxTjkDkExFR
 NJnmlYLaXNZwlBvS+3HaqzVA7ra5s6XcTu12KphvtheEISU4yXBFuasRbxuTcBpvdoHB
 SlsIqQ7iWLtkGg7J3SJhMoQpVcBUv8vWwUr1ZQepMnVpqkDK4q3JyKezgBz6T8T7N9rf
 LZ5n/6grCw6v3uP8bcPkLFtxEFYzUYoqgbwyW6geMzHxnKlO1qKBx9SEdYAqCtbSLqkC
 GqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x0a+n2seyYHtcm+WRsTc2Zyu84e7VRKkfJAV0BfGFU8=;
 b=M4y1Wn03sSk5V4/pTk3Xf7Sa004F2lQfvhD9ylRprV9TX2/R91OOQd9vnzX9Y69/Kz
 9spcS8xMUkEv2vfGKR+vjVFuGZvmdn8ex0tdri+LYNAP1qDlHqAs78pxA/o3hhnwNv2C
 lEBS/CFKE75xINVr1aROYz4MJHz6pJtoswbwVrD3mKH1ij/vpH6jopQfv9wG042tNmrJ
 VSxxJ7Q8+myrstx5Sv+eRJGwqeXJvuSoW7PuHv4DgvOwUkthHX7LPD2mfCY6qpFdBElu
 VwdU/TKSohZaDYX1vIEy2aqKMaBvFfefFUmBxWZcy2OEZ2KWX4URwtruVgY9NQ2U4Dvd
 /I4Q==
X-Gm-Message-State: AOAM531U1SfElnY14ylx/pMgiy5wSnNUWWwKCLHS6rVxIUv/VZ+0DKUQ
 Bo6m7n9vfm7JTntqatdT4dxEllsYx5sA9Iu3iRxucw==
X-Google-Smtp-Source: ABdhPJzLO+PhiT+9Xt6xoTwDVsse/45fen1jfpL+jOIpBzDF28gm0VwPmnY/ypOiVZ/4DH+KYPbeG32A/Me/sMvu8JI=
X-Received: by 2002:adf:c18a:: with SMTP id x10mr3070125wre.302.1631094423411; 
 Wed, 08 Sep 2021 02:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <CALUzjTbw0m-n0wmqYPw9C_SFVrCYvqOde6qUsB40FMM9BVPHZg@mail.gmail.com>
 <CAFEAcA-H_titydNAYO94k4i5uiJyTXXt=tNyPd7RfjFMjRYb1w@mail.gmail.com>
 <CALUzjTbsSte6rzFVr+k6EyUJTJV8GW2N5yhxBYxZcjkoCJ=K7g@mail.gmail.com>
In-Reply-To: <CALUzjTbsSte6rzFVr+k6EyUJTJV8GW2N5yhxBYxZcjkoCJ=K7g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Sep 2021 10:46:13 +0100
Message-ID: <CAFEAcA-LOUvZu4g1gK3WjrmZpH+B8aj5wrEY77isihetQmPUpA@mail.gmail.com>
Subject: Re: Application of QEMUTimer in short timing.
To: Duo jia <jiaduo19920301@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

On Wed, 8 Sept 2021 at 03:50, Duo jia <jiaduo19920301@gmail.com> wrote:
> Also I want to know how to make a delay in qemu.
> For example, when I send a UART data, there is a certain time interval fr=
om setting the register to when the data is sent. Most of this time does no=
t affect the simulation effect, but some guest firmware will execute errors=
 when there is no such delay. This is a comparison. Few, but it does exist.
>
> My question is, if I really want to add such a delay, how to do it. For e=
xample, in USART, can I set a callback for sending completion, or add some =
delays that will not cause qemu to freeze.

You can do this kind of thing with an additional timer.
Look at hw/char/cadenc_uart.c and its handling of char_tx_time
for an example. In that case it is (despite the name)
modelling slow data receive, not slow data transmit, but
the basic idea is the same.

As you say, though, very little guest code really cares about
UART character timings (and the guest code that does is probably
buggy strictly speaking). So if I were you I would put "model
delays in UART timings" very low on your priority list...

-- PMM

