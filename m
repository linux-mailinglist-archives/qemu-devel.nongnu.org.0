Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B1F2F2E23
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:39:27 +0100 (CET)
Received: from localhost ([::1]:53514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzI1G-0006DP-Iq
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzHtn-0005vz-SY
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:31:44 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:32911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzHtl-00025z-N5
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:31:43 -0500
Received: by mail-ej1-x62f.google.com with SMTP id b9so3059012ejy.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 03:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z4yU4z7LjBbWtwDVWg9Fzy18EUDDU7JBdYr1lPxZwyQ=;
 b=vgrI7LmZukUVpIY0MlLqDNn2zEkeAbj6j6Nw5alh2nf/on4Z4fFDauRNAuLSJJMell
 24plVha/x4SvYfIJj9jdbn+3LxnAevavUnTfO8wgcQTpLcvBhdP6rsmzJ/1KEvIc+GQU
 GdTvGK4qyxnOyCskdmVpYjjVTp3dKWOUZdqBB6B1PaTZ70mkctIdyywB9eQE65zhMYks
 +bE7aviWqzZUXLMujbEbMhoR7Ld26OBGi0o7ZyucSPywDUCZNT+av2Wqo7hQJqE9SaIg
 ykbPtcwXgmp8U+trkba21B6aEUuY3AV5q12QknzqcAisI7zZJDFNlKGnTLkHzzgr2L9C
 jkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z4yU4z7LjBbWtwDVWg9Fzy18EUDDU7JBdYr1lPxZwyQ=;
 b=shU/fNaqXDPvBSgpxqo50kk3DjCb7wpFm0hJqOWYqcTTv2iNHDj9J2tSEFJunR/oC8
 kaOQo3cISi7ow8w7iGHZlw0un85Rk915f1n00dXSjR3uDKdWvpeVAdQiMQGHbx2E5oot
 bdjTXBIK1BY86Jc6dn2i3CEMawVVVpMBlSjezVgjMeuSu1L9X9mIbb4ledfBLkFJHRwo
 so9Rkgn0lLaitdF7hf1ug2G9VkoUTwZ3srgb8hKj020IaAUIimLH3RzQj8NeAlGtE9Ys
 BK3nu6nDN8haBHw8Pi752Ivy5VIYTM8sBu1jXTAQ53/g0F8BJ9zPhGffMmMS38b8hAFH
 t9wQ==
X-Gm-Message-State: AOAM531EaVIPDa0KXMUaCzQSmWeRBvHfmdGmtFsUGG5XJL4iRs3ZnE7s
 egd9HDLsGEw79aWfgX4JgO+imgQE6Me9dtVkkivUzQ==
X-Google-Smtp-Source: ABdhPJz/A/y51JXwVtsHicvKL1YY4w2ZYCNzH/iMEq6g6qpoirQRYydYdY7vl5X3Dh4ZZbfzQPF7CMRtoo6PPFQ9nzc=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr3005813ejb.56.1610451100135; 
 Tue, 12 Jan 2021 03:31:40 -0800 (PST)
MIME-Version: 1.0
References: <20210108190945.949196-1-wuhaotsh@google.com>
In-Reply-To: <20210108190945.949196-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 11:31:29 +0000
Message-ID: <CAFEAcA9akrH=CHxNysQSoddCtS+c4suQ9gWUXcyUBXiGc87Ojg@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Additional NPCM7xx devices
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 19:10, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch series include a few more NPCM7XX devices including
>
> - Analog Digital Converter (ADC)
> - Pulse Width Modulation (PWM)
>
> We also modified the CLK module to generate clock values using qdev_clock.
> These clocks are used to determine various clocks in NPCM7XX devices.
>
> Thank you for your review.

Applied to target-arm.next with a fixup to the ADC patch for
the missing trace.h file.

thanks
-- PMM

