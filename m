Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249EB2C2EAC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:34:56 +0100 (CET)
Received: from localhost ([::1]:45012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khcDP-0004ZP-6S
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khcAs-0002oI-H4
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:32:18 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khcAl-0004Kn-PL
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:32:17 -0500
Received: by mail-ed1-x530.google.com with SMTP id cq7so21740330edb.4
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 09:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i2UOAD+OTEineN8lgYpwigxL5I+cgyFhrP+LFbABxVg=;
 b=yY+LR1k36FWOAufgKcs29YFk5kA4BS5wkQTmat+xSnDP5KTMMJSh+1wIKcATS/ByjH
 NGsWV/vf6pxekaSeVKru3rETSt97Aodwa+GaQ4HneGfBoMcFvQM3vX7o8DUukD3HjOz3
 vEddzErxCeUYQOSzhTvWsmPoli4ci2ckWc8Cz94YDvJ9hyjYlpzvys1MRc9EWsCKX4pk
 2nXX3SZ+3YpgQfFLOut9WPid+j9E379GtaJT71hlben4TpK8BHRwrguamJt4iUkF4QuK
 wauc2BMUdIGUUZvxCEKxmGkOw29lidor+ffZExqPTBbfxKIWhY5oODwD5B08pgGiagWy
 iD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i2UOAD+OTEineN8lgYpwigxL5I+cgyFhrP+LFbABxVg=;
 b=VhO5ngcsimGxu7URYWM/MQxIlvlIrjTw/HnuWjTV0TkMnXLVXwTCRBBeDUGHt/0qTQ
 aaQ4QveqOhnD8AuZsLhaofETnprnZ0TQnk/TQG2AKXOvpk9KlKeVK6eLgzBKnxIOBHeE
 w+HVKtTpNBjkf2AwoHo93YlSwgoeUBTrFikngJgIlLtmZ7/CFR7MS3GKjsADPgh3Ne5I
 g2L/8aNBHvbbePteC7o6h1q57gTI3BT+ojlfrB/oL54UrdeZIqNurxLkihBrw0IMbw+6
 FDCAXXK2OwEh5ZURuP0jiGHdjUQadPh1moHP5gbPe22q9XqIEfe0rakoQBII4owBiuHy
 ktqw==
X-Gm-Message-State: AOAM5316ioYLyMO778RgtjD+vljpGrVgUCC0gOZKPHUoMD5e4+IMKB+C
 DJHxqooJpiNuUvk/7zBTER72r2CtlbU5bQauEmByGQ==
X-Google-Smtp-Source: ABdhPJwJVZWbtav0F1DIKoycl28rCTvm0H0vAVMQGvFzT4RHfFyNArpd7Fdl/H6TkQO3mTbW2/yZTwbSsioL0MWDG0M=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr4842400edr.44.1606239129835; 
 Tue, 24 Nov 2020 09:32:09 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA_=RGziK6H4Pip+heE3JfjTYaZgrTgkwM=tNTwsqvuLfg@mail.gmail.com>
 <8e6cbc1f-82a5-1cd7-cdf3-59ab45c6d189@linaro.org>
In-Reply-To: <8e6cbc1f-82a5-1cd7-cdf3-59ab45c6d189@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2020 17:31:58 +0000
Message-ID: <CAFEAcA9yf3uAAp+MGpCpMs-KyRvn=oKJnxWJMttU0kK6afbvSg@mail.gmail.com>
Subject: Re: simple aarch64 binary can cause linux-user QEMU to segv in
 zero_bss()
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Nov 2020 at 17:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/23/20 11:52 AM, Peter Maydell wrote:
> > Somebody reported this on stackoverflow. Before I spend too
> > much time thinking about how this ought to work, does anybody
> > have the elfload.c intended operation in their head still?

> > Should we try to get the SEGV handler working earlier in initialization
> > (it's pretty hairy machinery so that could be tricky) or should
> > elfload.c be mprotect()ing things appropriately itself?
>
> elfload should be handling this.
>
> I believe this should be fixed by
>
> https://patchew.org/QEMU/20201118165206.2826-1-steplong@quicinc.com/

That does indeed seem to fix things. I have a couple of questions
about the patch that I'll make in that thread...

-- PMM

