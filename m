Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F52213EF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jul 2020 20:07:48 +0200 (CEST)
Received: from localhost ([::1]:42188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvlop-0008DC-Ii
	for lists+qemu-devel@lfdr.de; Wed, 15 Jul 2020 14:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jvlo1-0007ft-Q0
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 14:06:57 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:41324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jvlny-0007Po-8N
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 14:06:57 -0400
Received: by mail-oi1-x22c.google.com with SMTP id y22so2913036oie.8
 for <qemu-devel@nongnu.org>; Wed, 15 Jul 2020 11:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tRvIQII6jkEEU/BEagCUcppNIv3PqURejApMNszh4tU=;
 b=N4X7qLDtnZRTwKcbgcvL3GRL+838axwGwo+0ul2hsU8Ar95JrSOmQL2FXQ2wr0iGCw
 eEqrAh8BJfR8WgQW4CA8RY9S3A5SmAtykf8j5Cpw2TIDaW+3zpoNh2Dit4znQOVEHqOl
 i08atThfAKqniSNOBq0t4AHO+XowjlduspWgvWf3us/8UsUbiN7mUyTMIpTlIlNuHYrr
 myWSBoORfw242VvEIAU15FZkvRX7tdKqjFvYRm+ADgHB1bomy+IfSCdrP5Gm3eqtkmLp
 Q7X44g5KVrn2+5pCaiSsr+p5DvYRJ0ssMrQ/crZvauxf7FXUXS/LSVcomY0+OFhV85c0
 WWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tRvIQII6jkEEU/BEagCUcppNIv3PqURejApMNszh4tU=;
 b=RXXymRgKAKf9rWnnk3AI+0JjJtyP8pKaJwOgLfT/BPdL/zCONtuUzMXu0j8mvl3arK
 qv4BvhQKjlPpZG+Ca4eaLUeJIc/zk09/oRyMf/tcO2W76cYw3v+6OhSHHIC7H/ttIOxm
 tWygdvi4FkFUgZxeXoXFzo+YMqNuge1PPD0Dd4Ijl7I9XuAaLcbuk2/HNTRJfO+Xz9Gm
 hj9NB5oKsoiB4ox5S7msRNSo8J6arss4hW8pcOOwFDLPrFKdzw3x5hiZCZPBflyS3Tte
 //mgD4b2gT8/2tno97aTIQFd0/s5IurYBHmHz9LUHZvyqRXqTXm+dVxIXxa01G2QECgi
 yvlA==
X-Gm-Message-State: AOAM533lCOKkwIRPmDzNGyuBv8sgZEqAbdFGds+eZrmlr4gS2s+/5+RP
 iIU9BfLg57ajCe46fP8Gp5/IXQ6gW19SKwZA7gm9e0ZQ
X-Google-Smtp-Source: ABdhPJyn2ljzU2glNs+wFBCFSBReRVnXrE774YaxchmDCqUDGEI+xXD5b9NUzV90wRm7kGFf20l7FmSZzmE8TBzGKAs=
X-Received: by 2002:aca:54c9:: with SMTP id i192mr761900oib.163.1594836413102; 
 Wed, 15 Jul 2020 11:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <1594821201-3708-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1594821201-3708-1-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Jul 2020 19:06:42 +0100
Message-ID: <CAFEAcA8q1WnAG7jDOh1AjqLnf5Hc0Gxr1oACEAz5U3uQQLy41w@mail.gmail.com>
Subject: Re: [PULL 0/7] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x22c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Wed, 15 Jul 2020 at 14:53, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 673205379fb499d2b72f2985b47ec7114282f5fe:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/python-next-20200714' into staging (2020-07-15 13:04:27 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to a134321ef676723768973537bb9b49365ae2062e:
>
>   ftgmac100: fix dblac write test (2020-07-15 21:00:13 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------

just a note that this has missed rc0 but will go into rc1.

thanks
-- PMM

