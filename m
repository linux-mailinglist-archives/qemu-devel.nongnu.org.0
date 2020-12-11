Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB4D2D783E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:53:49 +0100 (CET)
Received: from localhost ([::1]:32908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knjno-0001IS-84
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjlX-00006d-Lv
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:51:30 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:42378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjlU-0002Sp-NF
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:51:27 -0500
Received: by mail-ej1-x643.google.com with SMTP id d17so12696103ejy.9
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ATarSdgZ4SHf3l2vLgaCEZfDsVKDkLa+HC7ltLN2fIU=;
 b=FQ7TkphATazrlxtDMbuBbdxLmjEZxW9RUDj8RN+TviGuiGy37B7QIfzh0/OFnQEm9Z
 RweANuuqnWdWY2lP8flTQhMQGivlG751z5XhtoafPLD15M6qWWnFb5hTUIuWXfzs0g6H
 0b+6Y5DQKc/7Gwv1Tl/kmfKnpnhyc0/Hpwc0k7azjRlfryb31E88v83jGPSOuv+v7Wjo
 e8tdzJ29JYn1Awu7t9m2gbWNHlwBJRhxn9zZy+UsQ/OTv2lxGjJrIdpIjnPTN6ITq92X
 VsOzyyVyZOsi4O4g2JEkMGeD5Br7mcn/0eu9+s5z9YUKaOSvEF4eIDzS1m2LXo06R/oo
 9f+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ATarSdgZ4SHf3l2vLgaCEZfDsVKDkLa+HC7ltLN2fIU=;
 b=X+t82hnrRYVK4KMPodCp9vEQgQ+5AM5ExrTk0qvPqka1cj1kBVUgFJRGJMoFdLvqDf
 0P9ByyYlJUrpk2mAQWYoYsz2B47ZH9Yiwu/A4rG6ZjF3/JuZnIaJnp8ozJhzGUbawkpL
 7HRXY9GYPPtWVSw7BTkYMKFBvMiJitDCwwobSc/mH2TzbiJ7XCSBX/DMLTiyO6qqEfpP
 WWMOGm0GaQ6LuJzioJni+YmmYiZrpVlg2/SS4AjEXESLRBUYt4U4foWFHnyjwqdpscbC
 LrnIT60OTB2X5I93Li+khCBPhI489OMm5dIS0ZrlguR9ioeI6gG6rHTyDFVwBIGBP1Rg
 lASg==
X-Gm-Message-State: AOAM532MP3kFZ6fPR/KZ2dFj3baNk/9M/XyWIAZaQcOdBGT9SfZHHOP3
 OObF3KzPkQC73+fltxj7TAHzYjeY5t+O2FpIEFcJ0g==
X-Google-Smtp-Source: ABdhPJz//MqmgN9jR/LO0Vf0IAlF2TRMNzbsIgSVcVtiuBR11H3oWIlxQ4xmWB/zkH/Dpxue/BEKGMIo109qtBCMMRs=
X-Received: by 2002:a17:907:971c:: with SMTP id
 jg28mr11261616ejc.85.1607698283039; 
 Fri, 11 Dec 2020 06:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-6-leif@nuviainc.com>
In-Reply-To: <20201208122306.8933-6-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 14:51:11 +0000
Message-ID: <CAFEAcA-KhOTnWiVxWdwABaiq7Eg9zw2ny8LH5ee=2=rGF2-pcg@mail.gmail.com>
Subject: Re: [PATCH 5/5] target/arm: add aarch32 ID register fields to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 12:23, Leif Lindholm <leif@nuviainc.com> wrote:
>
> Add entries present in ARM DDI 0487F.c (August 2020).
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  target/arm/cpu.h | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)

>  FIELD(ID_MMFR4, CCIDX, 24, 4)
>  FIELD(ID_MMFR4, EVT, 28, 4)
>
> +FIELD(ID_MMFR5, ETS, 0, 4)
> +
> +FIELD(ID_PFR0, STATE0, 0, 4)
> +FIELD(ID_PFR0, STATE1, 4, 4)
> +FIELD(ID_PFR0, STATE2, 8, 4)
> +FIELD(ID_PFR0, STATE3, 12, 4)
> +FIELD(ID_PFR0, CSV2, 16, 4)
> +FIELD(ID_PFR0, AMU, 20, 4)
> +FIELD(ID_PFR0, DIT, 24, 4)
> +FIELD(ID_PFR0, RAS, 28, 4)

The ID_PFR0 definitions are already in master now
commit 46f4976f22a45 has gone in.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

