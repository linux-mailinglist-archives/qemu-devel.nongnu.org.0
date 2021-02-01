Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920CA30AA47
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 15:53:21 +0100 (CET)
Received: from localhost ([::1]:44956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6aZs-00007N-KJ
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 09:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6aYt-000899-8g
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 09:52:19 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6aYr-0007Hk-Gn
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 09:52:18 -0500
Received: by mail-ed1-x52c.google.com with SMTP id d2so19198321edz.3
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 06:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y5gSGF6gDifySwTz3ervnW4BZ7htYh7hmPq4CxD/T2w=;
 b=DWcFXcnOcWRqWs0KcEu0xmtHaaF+EsM1Ge3zz293L54X6toeBnlpIhcGKkZqgVLQsN
 Ap60S+jvhwV3fpowemK1z3urWWpIz/mC4bsmvJGj72HQcSBAR4hkgThnoNE3EoO65oxh
 RSnDQJGYPDJt2KfCg6aMTmKk2VJ5F5oFhma93e7xN+Yk3PtkPhUpbaUsAibWWohhO9b8
 pnOULeQKaWbISdcYrZWNh9QK7d/JDcYMKIWhnXIFLQL2Ii/6B7slx4piSB/faIBGzbFb
 2SgdrBErlvDCENS1PWMFlRF5f+uPfVtqaWhs8lqOaqTM3CCET/g4hf61MZ5Uutk1up9Z
 ss7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y5gSGF6gDifySwTz3ervnW4BZ7htYh7hmPq4CxD/T2w=;
 b=OrnUX5RrpzjOeyH/6BLk0MW/k9prEOhkNmS0Rr9fYb2uj1szfuw6mL4UwSJ02fU6lD
 wTaeUO5v/u8HNi5ooyKnpTY/XhjTP30nrKUDWtQsfVcMisIBAqf3eF1trelPLdUR2m6m
 ReqAOJhbTx2Y4Nma2FIi4ahTX4Z19fKjkiuuAN5ekEBWtMF4SSHZpTTOThdYzDtvKFGB
 JnJOMIONNxMbHhUHM/nWfNJkKtSxdqoECCRxZC9PmjsRImAHjskD7B2UrjEo2p1VO2f/
 UyPy5A2tp3BAFaqJ3KSIT+idvREnqc7ANBpdtrHZAv8w7HGcrsO/O3TW+1RUVy42lAtd
 ZbHw==
X-Gm-Message-State: AOAM530LZEHBjTR/JZ5zmZ7DEIF4ZjER/sqd/JbW1+xHJh0G0T7Vsxo4
 +MvLM0UnBIVztCo5hgc1jWhtblnP8opH+MsZzN3h/g==
X-Google-Smtp-Source: ABdhPJxbyzMtsj7p9bJXtLpTx3pdbfLqxdBCdQ+4iyRMWZa3ypruWRiQfu1Q7dYh4fNw/Dx6ITVM8XSEOOTYBY8H98Q=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr18874251edb.44.1612191136041; 
 Mon, 01 Feb 2021 06:52:16 -0800 (PST)
MIME-Version: 1.0
References: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
 <CAOZ2QJOq6GNXMWkk_1oxqtT_GYW8FmXT8jYGHzyROXC_yoWfxA@mail.gmail.com>
In-Reply-To: <CAOZ2QJOq6GNXMWkk_1oxqtT_GYW8FmXT8jYGHzyROXC_yoWfxA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2021 14:52:04 +0000
Message-ID: <CAFEAcA_m3vbjh42_tox4h_9wS_BSEad=nJrc=v_it01FxVV=EQ@mail.gmail.com>
Subject: Re: Makefile has local changes that will be overwritten
To: Dan Streetman <ddstreet@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021 at 14:49, Dan Streetman <ddstreet@canonical.com> wrote:
>
> On Mon, Feb 1, 2021 at 9:23 AM Programmingkid <programmingkidx@gmail.com> wrote:
> >
> > When trying to build QEMU I see this error:
> >
> > error: Your local changes to the following files would be overwritten by checkout:
> >         Makefile
> > Please commit your changes or stash them before you switch branches.
> > Aborting
> >
> > What I do to see this error:
> > ./configure --target-list=i386-softmmu
>
> Sorry, I don't see that error, what commit are you building from?

...and what does git think the local changes to Makefile are ?

thanks
-- PMM

