Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609313F1B21
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:03:25 +0200 (CEST)
Received: from localhost ([::1]:53346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGidg-0001pv-GR
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGibj-000087-8B
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:01:24 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGibe-00061u-UI
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:01:22 -0400
Received: by mail-ed1-x531.google.com with SMTP id dj8so9064670edb.2
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qOWPiMEJ7RRw9LZJ7LOpCvTvwBQ3CiQLaFjnVf5nx8E=;
 b=AApYSL5NAG38IxeJq0/fe5iXJsaMTnSZh6w6WrfwOBhj/8iN5vc42wNCaNFPP8DLgE
 HYko4HA/mlPls44xMWJ4LAIxgV47R/Q0jQB/rmFCwZBRykeTZLcN33+nN/pChBqcOGWX
 g04Gu1pNyU8HFaU66UXH5TBQq396FLErlJOobJCDa5PH7VgHVfi68KXqIiM6n+X0M5t6
 wFKl1bl4jFq9J4/ENVyrI5PMNAmKMACRqaGRs5sJvptkt48TTGqlkWm4bN4hrbNpRs9v
 9XwAowtREL1Nea423i+83U2RSq3z2SCbPGsXSC28EBMEOUMdfG3jUJqPkxm7RVPyol13
 JtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qOWPiMEJ7RRw9LZJ7LOpCvTvwBQ3CiQLaFjnVf5nx8E=;
 b=rBFHVzMKJHVy+VuwTGCqnSeVZOT+VRTNFMj3hlKMJPN5HCbqMicb48NnvSnOuTAHjx
 Ppi+BK8FCDyfRTWyAOpJHH0se+9CayPTM5lzaapxGIjw0P5wcII8NrGoNzYQCdO6S9lW
 qyV+EUz+o422A3jjmzSPZf67PuOucRBAj3QYw4W63gnpkYr3e3mOouHWbxCQ9ReAdxRw
 BDIUtU47R/Cvzg9jjzl14l+JAFfGqUNLguZCDJ/koH1MT2/zH8AoCH6eMbitMEy9V0Pw
 5O8Xl1sQqGlbPlQR4Mvh6aL5czixc4aYqAnJrEwMRPPAGPxY/KWQ8DqrbdZOGx07sSDL
 OAmg==
X-Gm-Message-State: AOAM533BW7Itu2icgiYLAauKqtSlxv7kCgAiUc0Rq9fQWSM+Cop52ySx
 PzJQXOMeUUc/hay626wfvmSnNItJnnLSSlJ2Us6LoA==
X-Google-Smtp-Source: ABdhPJwVDPODv+IH8BDsVV4z6qI6bZdbEh3nGH1qdOJVQvrwlKQMUGsi3ni4DoK7kU2f99a/9VoXCFhWLeydHXuSd6M=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr13203139edw.44.1629381677472; 
 Thu, 19 Aug 2021 07:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
In-Reply-To: <20210813233353.2099459-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:00:31 +0100
Message-ID: <CAFEAcA9OtK-CEUEdGVdktSJntFL1nArhp+_n5DekfZ4gy-PZ0w@mail.gmail.com>
Subject: Re: [PATCH 0/7] Misc NPCM7XX patches
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Corey Minyard <minyard@acm.org>, Titus Rwantare <titusr@google.com>,
 Patrick Venture <venture@google.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 14 Aug 2021 at 00:34, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch set contains a few bug fixes and I2C devices for some
> NPCM7XX boards.
>
> Patch 1~2 fix a problem that causes the SMBus module to behave
> incorrectly when it's in FIFO mode and trying to receive more than
> 16 bytes at a time.
>
> Patch 3 fixes a error in a register for ADC module.
>
> Patch 4 makes the ADC input to be R/W instead of write only. It allows
> a test system to read these via QMP and has no negative effect.
>
> Patch 5 adds a new aux function for at24c EEPROM. It allows us to attach
> a drive to an at24c EEPROM device that is used as the initialized content
> of that device.
>
> Patch 6 uses the function defined in patch 5 to add the EEPROM and other
> I2C devices for Quanta GBS board.
>
> Patch 7 modifies the Quanta GSJ board to use the new function defined in
> patch 5.

I've left review comments on a few of the patches. The first 4 look
fine; I just haven't left r-by tags because I didn't go and look
up the specs for the hardware.

thanks
-- PMM

