Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7644405173
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 14:44:27 +0200 (CEST)
Received: from localhost ([::1]:40204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOJPm-0005TW-RT
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 08:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOJNa-0004V5-Hy
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:42:11 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOJNL-0006I3-GZ
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:42:10 -0400
Received: by mail-wm1-x32d.google.com with SMTP id e26so1268426wmk.2
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 05:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M/vFKA3cmthV639TlHOQw03avT7ZNtGqqVbuFSZ3CsE=;
 b=lDcE62KyFgiv99fbAKS2qqvrDEf21NZAgdsm54TvdoUWLZoK7KGvWmjyfey7EZZocJ
 TVhwiXMtGyT16lR9vuTk2ICb6hrtCQtlu9gG9wPVZN6fl8xcjfwgeL6UA6jTuPMVlW6w
 neaQPpmCnZMTTx0lnVAOsRqmbuMCKuOzADzAMQWY95FYFnjnG0K6CDSOkSDYgP+S2AT/
 6lQh4EJAawi2VKXWrrVLvBvGuIRr19NKoHpBVkRqY3OPX1aKYYsKrRROue76zUFPnuyF
 0MCGawUkALJLhqFHjAN6ecAbvAP+d2b2+bmd+1f8laifqL6e+e1/MLj6OqdxCyr3U+Fe
 vVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M/vFKA3cmthV639TlHOQw03avT7ZNtGqqVbuFSZ3CsE=;
 b=nokcyvVRZBQq7w/nwnqKvFOta04/ohIdPxtDqR313fqeR7eQBPp4Gj10pjmgZ1JpjL
 uKKaBdpj+jVQZOa/znzgpmqcen6m/qiVWnfpFUT+psAqgoPsOfgCyNJbuvNYMDmLseSt
 DBqb9nzjZaWXbRMASLlO4zxXUN15FkSPJw5elVKDoWcMYvEfn/5M2NCa0lauCVm70R3O
 z/tsEso8iaO/TPwpQpLh1l3HMfrIjoJKyzPUlpjs2omsAQQXR4k2I5JNI3ekeXiKBqiU
 LCNObyIn80K6OvhnA1ueiEHO/ZAnEdVXtbxE9jEQ7u65tAIhvg47T5AoHiOo5eLb/TcZ
 B3oA==
X-Gm-Message-State: AOAM533E3Dk9vvPnDyVgrwxCmpFdAipXU1VamPlddgAae5L0JhUJXPbp
 JDZtQEPxA+nMItaK+oQAk0W4My3agD8qLdZOPZRaqA==
X-Google-Smtp-Source: ABdhPJyWtmlYF7VXJdXrmFortBGdl6U4e69w8QokshKL335cEY68d+5QBB6xyk92/qR/a3Ie13xrEyD8Id/IcoDDyek=
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr2883614wmj.126.1631191314151; 
 Thu, 09 Sep 2021 05:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210909120459.2199223-1-ysato@users.sourceforge.jp>
 <20210909120459.2199223-3-ysato@users.sourceforge.jp>
In-Reply-To: <20210909120459.2199223-3-ysato@users.sourceforge.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Sep 2021 13:41:04 +0100
Message-ID: <CAFEAcA-Ka8A5EXOzxqHNQ6n5u-vB3kXMrkfOp2MVMOrgSkK-Og@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/rx: gdbstub add acc register operation.
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, 9 Sept 2021 at 13:08, Yoshinori Sato <ysato@users.sourceforge.jp> wrote:
>
> I added it because the operation of the acc register was not implemented.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  target/rx/gdbstub.c | 3 ++-

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

