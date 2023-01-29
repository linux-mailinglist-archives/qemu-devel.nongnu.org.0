Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A1A67FFC2
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 16:06:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM9EB-0003dQ-Ld; Sun, 29 Jan 2023 10:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pM9E9-0003d4-Nu
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 10:04:17 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pM9E7-00013y-MO
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 10:04:17 -0500
Received: by mail-pg1-x530.google.com with SMTP id v3so6026912pgh.4
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 07:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tW1E5IEDzGjvvBprCk8Wz4R79fHcyvP4zfm0E0g+Qvw=;
 b=cFYiaWmKaO7i/ppVrORw+j8OuzmOuFUqAULDDFHYEhDYTYq1dp03r+alEzf8zm/lNo
 7jGzAKAhJBjeTU9sSqz6t09MaTeAotfCCKATmQWd6pPvCBtX7YgFi7GIMt7JTxrm02a4
 BBWk4qmgOMiszfe92haB4WM51owWPmH+xA3rauKzoveLY0PnEo/9J3Nzdt/mC6arahz0
 e6eQqj4z6HVAFgJissDGhl0QilK7W9viIhQ3ZWtCNYqlD8+J9DyE5JmgwlYCpnbVwohc
 Js0MmqbkPiuH077TJigJistPJs+GQxmipcmudim9v7R5ZlQoC1BT4zbZd5mqawxGRyV4
 EfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tW1E5IEDzGjvvBprCk8Wz4R79fHcyvP4zfm0E0g+Qvw=;
 b=KyqFJUMKkIcvyK+1/G1po6/Pi4SdWDcu2PWzMmKQkQpPLePtAdJ/rWio7Vvko9KFUQ
 f4WGSaoPm2ZRymQfOE8d4PvdlliMSFiBjBpPdYptwXBVNwjZvW+/e07cQCFleZtryXSS
 OU7ivHVeE65uA6f/XF0Eu9Ju6AZL9DYwd196kjrYszgG4LzgI6cdXKq1DAczhfoJHnSr
 Eo4WKQtRM81P14dz1hgWwGVHqDu4uVJst1FiQCKtokLVyV1pllphIJm3MvuQZKk5/OT0
 32rF2R4i+3E3URY5xvrSK3THljgl3beZuh1IHJ4C10Lelc7OZ9jHRrRJ/6LWky/H8IdP
 DQZg==
X-Gm-Message-State: AO0yUKV7Q+ddsWvUMyhUSx19mMoWH1yjgCJjspIoT/Zt3CSeIBJ4DZfI
 hXK/4Qa6DHIobl0xfwmbmQEt+LoQf0v8P8Elrzn40iROaFefMH19
X-Google-Smtp-Source: AK7set/r+zCHeOz6DyaJSheZOF5bXEpF0VFaydmFSJwm4mO1abgX9Br/TykORfGPxXj2ztG2YxNqNT4VLrNZ5sdSRvs=
X-Received: by 2002:a63:1606:0:b0:4da:e1c7:99be with SMTP id
 w6-20020a631606000000b004dae1c799bemr1651932pgl.37.1675004653521; Sun, 29 Jan
 2023 07:04:13 -0800 (PST)
MIME-Version: 1.0
References: <4dd3e63d.4889e.185fd6e590e.Coremail.fanwj@mail.ustc.edu.cn>
In-Reply-To: <4dd3e63d.4889e.185fd6e590e.Coremail.fanwj@mail.ustc.edu.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 29 Jan 2023 15:04:02 +0000
Message-ID: <CAFEAcA_wL3PBW3aG=3nmQhJ6c6vrvy6=NE3DXn3Q06ct4pV19g@mail.gmail.com>
Subject: Re: Please review a important patch abort fix setting of
 CPUX86State::gdt::base
To: fanwj@mail.ustc.edu.cn
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 29 Jan 2023 at 12:10, <fanwj@mail.ustc.edu.cn> wrote:
>
> The patch fix bug abort settting CPUX86State::gdt::base on linux-user, the bug can write dirty data to emulated segment registers of x86
> Patch address:  https://lists.nongnu.org/archive/html/qemu-devel/2023-01/msg00142.html
> Bug description: https://gitlab.com/qemu-project/qemu/-/issues/1405

That patch was already reviewed a couple of weeks ago; you got
feedback which you need to address (or if you're not sure what
it is you ought to change in the patch, you should follow up in
that email thread to ask for clarification):

https://lists.nongnu.org/archive/html/qemu-devel/2023-01/msg03078.html

thanks
-- PMM

