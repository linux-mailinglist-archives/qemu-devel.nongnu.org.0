Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F083F8B91
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 18:11:04 +0200 (CEST)
Received: from localhost ([::1]:59518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJHy3-0003w3-7y
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 12:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJHwc-0002Zt-DZ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 12:09:34 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJHwa-0004ll-BM
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 12:09:33 -0400
Received: by mail-ed1-x536.google.com with SMTP id d6so5433928edt.7
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 09:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VxVspwANZEWNOYs674+EUJWexm1P8NmSW4e6pzVMS/s=;
 b=LTETAheE51hmqAdXGQWmUZUMfiRirvV17SV4RXc86bXCWohsOnKpeB1J8O+Cw+Av9V
 JH5TtRjtvhoO3mSiI6UIERLw3Co2hXQOs0xuDbdYnWeYzDmbsbTsv06fz9eb5g8XfB0i
 wtfN08sXH+Nu82PoyuN+hPOTTRonphm15FF886D+HnML0LSAVsCWPFyLBvtlbHROtgQS
 FFsoQQ2ZivE74lgtT/lgFY2KwAkmQPHHgGGo8z4hB/IrWAJ34R3Vw4srp3bWEPwPPiU1
 8OLp2qQkb33ZyqlzwPaia9Y7DlDSq/SSU+z8FYdFePejq4J5NsY89yw2EWakvi5/lLXX
 OKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VxVspwANZEWNOYs674+EUJWexm1P8NmSW4e6pzVMS/s=;
 b=O1dy0GCFnBunu75rvVhTsZ7nlQXZuAeK01zAAQ5dR8d8P4AGkKHx01r+DsJ7wRQxKk
 3NpePPY9iLMOAG1p2DnRQ3DjDUkGj/98ejI2Mc/6x8JpHj1LEGaOlXxLrB0hBM/5Zusn
 PBNWb0aBS+iO9R2MPCTxVXTteQu6eYeariwve+6Fq8PPogzfqcQhV1+nOXLLxnN/+q4v
 p/rLQm+/IapfCh6C9vCEZFbtWXQT8PcxfRKss6IX9AD8JSnxrYPG8Lsnw4TSOyG1XX08
 fkmXQgdaJGltdic7KwD2vjylmWw/aI0jJZKmwX2n9cYh+tvlG13Ie234bjEH6e1TieRe
 o+8A==
X-Gm-Message-State: AOAM530kIiOj3uK8gkfl7ffMlf+zQZ5R/LmWEw+FU8Nv3RoGUTCKLUpp
 7KKSyyxi0Kpw6zpOdAjkzzZBbgAF4gbJu9arlD0etA==
X-Google-Smtp-Source: ABdhPJwDropj/znIjF+XQxXu96S1X75Y02VIAE6sTD2jC9E0udA1XgfK9lpqD8xHPKHGW0YIE9EG6kbrkLQzK07iJ6I=
X-Received: by 2002:aa7:cc0b:: with SMTP id q11mr4884559edt.251.1629994170603; 
 Thu, 26 Aug 2021 09:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <F5CE910A-83CC-4425-871D-8471A5D76698@hxcore.ol>
In-Reply-To: <F5CE910A-83CC-4425-871D-8471A5D76698@hxcore.ol>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 17:08:43 +0100
Message-ID: <CAFEAcA_jKGfQRN6P815X9hCn0GOntHMs9EAgbn=rNQ565yUwCQ@mail.gmail.com>
Subject: Re: Looking for two missing files used in the `emu-master-dev` branch
 in the repo.
To: Ammar Mohammed <testvacomp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Aug 2021 at 15:46, Ammar Mohammed <testvacomp@gmail.com> wrote:
> I'm building qemu which depends on ShaderTranslator.h and
> ShaderTranslator.cpp. There is a shell script, build-ANGLE.sh,
> supposed to copy them from angle/src/libShaderTranslator to where
> they are needed.

That build-ANGLE.sh is for the Google Android emulator. It's
nothing to do with us, the upstream QEMU project -- Google have
taken a copy of QEMU and modified it, and this part in particular
is all their work, not ours. You would need to ask them, not us.

I think libShaderTranslator is (or was) also part of the work
Google did for the Android emulator, so that also you need to
ask Google about, not us, and not the ANGLE project folks.

-- PMM

