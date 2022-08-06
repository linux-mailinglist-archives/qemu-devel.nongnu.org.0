Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3838D58B63A
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 16:54:31 +0200 (CEST)
Received: from localhost ([::1]:52356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKLC9-0004NS-L9
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 10:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oKLA3-0002Ai-Rw
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 10:52:19 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:46063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oKLA2-0003du-9B
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 10:52:19 -0400
Received: by mail-yb1-xb32.google.com with SMTP id e127so7685232yba.12
 for <qemu-devel@nongnu.org>; Sat, 06 Aug 2022 07:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=vka57rOV+koECqQYlDS4waa235n70xik9LTEoi7vHkA=;
 b=K+M/qHRk5dCDzy3t8vtBUjjvIoBJTDH9l8Cc9jliYPrMA/GjNZKgAprLAxOT0RurbD
 5yposyzykPUBMJ79YmOEq6IsgL+4+NU64abbRI5Rk2uM3jwGTCzE3EJ95LbyHE9H8/rl
 fMkqQ7vVlyEiuXkyJiwQcI7KGD9Oqro6cv+4ms40DXJjYviVI7K0gjM+Kfg5HeZNyyYE
 Xp2hWNgKWA8g7phqtMrSOWgPcVaFiVfntApvSqkJ+y5YXu7CYdiwJAezo0gqyVgBs+E0
 Auu14oOK4CcTGT8w0K+7pA4SjjMgYW9MIhS3MfPvtF8atJaI51VsseD4RfxI4ajMtKXv
 VBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=vka57rOV+koECqQYlDS4waa235n70xik9LTEoi7vHkA=;
 b=PEsdUBUs//9YZj+afmCL4SUY7o+QNFygFdonSF+GUn6NwuFd4CA5wF9jkfM6R535UR
 qWAqSDgYqJGmW1hvBatYmCB27WlNrBCAC/vn/A5aF1W24ngtq/NPwAyI2IN/cscv35q2
 xMJiH5RmvzXBmDcFcGuQWLBFTUlanLwfp9fGhFDWaaJsnb+wHihcPglvY+FSRq1TFv6P
 tjGGmF/p77mdE78OynyRQldRXu6rQKJeqahmCFgDdrsDxL1GYdumbzOpc5XhML2LFaZr
 TEZtuNR10F197Y5oG6ahoIFGv1UiszVQy5jcHB1ZHJS8f2qR/cwsaGX9t4KXByYBnqhy
 Wj/w==
X-Gm-Message-State: ACgBeo3+To0AI0RFPyc2RvTKGnjUs2ZUrfImLhjNh8+LmqDpp8sKemkK
 1OHIsJBGnsXWYu+nUUMftznMLKzs8iHT4dBl6+CQlg==
X-Google-Smtp-Source: AA6agR5MXIRxyM1UO0RkSeYq9Uo5Kvuo5/PCX09p6Ov5MqxIVeLStiAn1x6E88OfBtQ6vrF2ojyKmhLji0hbitjPmLU=
X-Received: by 2002:a25:2f47:0:b0:671:8223:4325 with SMTP id
 v68-20020a252f47000000b0067182234325mr9138524ybv.67.1659797536740; Sat, 06
 Aug 2022 07:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220805205435.139286-1-danielhb413@gmail.com>
 <326fba13-13e7-f327-bfd-f86aa0fe1211@eik.bme.hu>
 <35d24b84-14ee-fc74-bb6f-7166aaa5cb70@gmail.com>
 <42fdccf1-6ce5-a318-3893-04448c4ef3fc@gmail.com>
In-Reply-To: <42fdccf1-6ce5-a318-3893-04448c4ef3fc@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 6 Aug 2022 15:51:36 +0100
Message-ID: <CAFEAcA_qS2mtr7dPc0pKuTD+NLdTVyjQP61X9S=_wHV_jEsFcQ@mail.gmail.com>
Subject: Re: [PATCH] hw/ppc: ppc440_uc: avoid multiply overflow in
 dcr_write_dma()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 6 Aug 2022 at 12:17, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> Balaton,
>
> I had a change of heart. The code is too clear that it won't overflow.
> It felt overkill changing var types just for that.
>
> Peter already marked it as Ignored - False Positive in Coverity as well.
> So this would be a code change to "look better". It didn't look particularly
> better after the changes I was about to send, so let's forget about it.

Yeah, I marked it false positive because the limit on the two
inputs to the multiply is very clear in the code. (Usually I
put a note about why when I mark something an FP, but you have
to expand the 'Triage' section in the right hand panel of the
Coverity Scan web UI to show that text.)

-- PMM

