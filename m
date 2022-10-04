Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B45F47E9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 18:52:25 +0200 (CEST)
Received: from localhost ([::1]:58740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofl9b-0007FY-NX
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 12:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofkUu-0003Iq-9g
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 12:10:20 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofkUr-0004PI-Cd
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 12:10:18 -0400
Received: by mail-ed1-x529.google.com with SMTP id a13so19537919edj.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 09:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=e2Swmrwj284P5lv+BrgPCv71ReiZ0Tttrt+sBh+fMys=;
 b=VBJcSAjzCzEwzeIHQW0r9jwOh+mRleURm7TG/lQMKIEv22VDI8S5osWoncUBeH4Oy8
 wWL519+HlqM2V8HMd9fCNneL9d2gnDu781erREc7Xzv6/+OiPVtI0VeV+f7+9/kLRFjg
 z1Igdnpi+fUTadg7XATiZXNQX4gQZQ4yKlcVvVhJHXDNXdd1iaIjebnJcF9+UdDjZFds
 //jltpiuACUp5i83wZ/GtOspV+CiyNycFz91+lUFxTI1TgdFi+qNpLDbiHX09cFsxON4
 ENF439tVgQ5fWEV1WiQuEg65N24QKG6kJradmjp7pEx1ttfFav+8gWaP2TC7Wd1N6sVO
 J5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=e2Swmrwj284P5lv+BrgPCv71ReiZ0Tttrt+sBh+fMys=;
 b=YF61ig6P14Dhqlk7FMV8Xzz0vnBOAc5u9/S4STcWgIt6HIJ4ztqLIcLm0id6Dv6voD
 VmKicFxVwZA94gdksdK3ZJ+7QXLQz8GFvyugt3yAtOKzrjrUqdr3sZZg131lyohG8Vf3
 d+AaTv01Q4S430tfmj3gK+p/vqM/nCwDeBv7mb2dSfSJxmU5JwIjoCBTIt1wmAcuHXVJ
 bl0DWvd/+uvvQBiXp63HTexkxLKF2alUhxabRTuEFW0No6xZaKO7SgD3JspCf2WIh7Ag
 P4avty340Dy6KusCtfi1aRZMEAFZBZXRznUmAhF8EeK6lRnLKQSIoAWMYqy3PmW0sUuR
 pEUQ==
X-Gm-Message-State: ACrzQf1egvvIkO9KTlZ/rQGrnLZvI2p9u4Drot1JTq0/2TOiZFfid03Q
 LOS0tLcr4l17o627jVQo8igQazmppzokbrVhMoKdxw==
X-Google-Smtp-Source: AMsMyM5U0YcBlJtrtdNfUJm4z9VQOG2Qh9w/0NdADoO+4z7jwg5/okuZhhj9V8FwVaplSWpNhWp61gxHuBT5hOZszs0=
X-Received: by 2002:a05:6402:1d86:b0:457:e84:f0e with SMTP id
 dk6-20020a0564021d8600b004570e840f0emr24002059edb.241.1664899815535; Tue, 04
 Oct 2022 09:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-8-richard.henderson@linaro.org>
In-Reply-To: <20220930220312.135327-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Oct 2022 17:10:04 +0100
Message-ID: <CAFEAcA-n1Z-yTaBQCm4ChLhP-JXRu1-4mur5rHFZ84ptc8UcXw@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] target/arm: Introduce gen_pc_plus_diff for aarch64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Sept 2022 at 23:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 41 +++++++++++++++++++++++++++-----------
>  1 file changed, 29 insertions(+), 12 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

