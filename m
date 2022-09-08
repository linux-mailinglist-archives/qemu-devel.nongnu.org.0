Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06205B16B7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 10:17:54 +0200 (CEST)
Received: from localhost ([::1]:49180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWCjR-0004DL-Hb
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 04:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWCfH-00015K-6M
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:13:35 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWCex-00076D-PZ
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:13:34 -0400
Received: by mail-pj1-x1033.google.com with SMTP id m3so6399575pjo.1
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 01:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=MxIn0DvWBLAG6XuurdloFO1x5VRXBADpMd0aR10fvFo=;
 b=Aqd4he3DcmLNHSQH/8WQVZ6j4qKsOpO/wwnYZx3388woz5U5UVdxZY/plYe6UuYxRB
 2nY3Vk7rxLtElaEpmkzfXMn3DWSuF2wPRGtDOlmgzHZm5r86sUkWTlbk3k6yFlb+UGdK
 eub255zQ4INrGoukDeqpH2muMow0G+gd3DHmjZDV4Abc3MEsXqwD38BvdCAlSRolycoY
 MlBHFlxx9fFDMtBsrKo34Grs3vyEBEIQBXq4ioVzTYEH2YHorWudPsKukD5fbgFl00Vh
 DLst3B2t5AeWIR96gArHH5b6Kfc+WelMa4IMBOsUDrTiU6xhUYZs1RN4BAxoAG7Rlbk4
 uXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=MxIn0DvWBLAG6XuurdloFO1x5VRXBADpMd0aR10fvFo=;
 b=42wLlt16Ggra9bqfwqzBSNo6fZQVjDRmRHkzI3HlcyovE9F6I6oWyPxAVDRtFh2Sw8
 kKGOI1V8KvYNFTxeZ3nUuCSzcd6LZE00C3nbUlCqDlsthyZShpK5GxHStkFaU3Sug0B1
 fbRF3XGvmlyG2y+3x85K9p018276pS5MM43dGEzJbAgV8fK+sFzxHk4C7mEdYvgnF1wU
 lxtDnyLr1P299pXFDZoXmA1IxSCK9Ho4Hq4MqW5cIkSLY1sQXqDl+7Ama/1pCmBdaHTf
 FdjbKmPgpCgWFl4EepvQGhh+NLFQ3i4EWFQ0O6142aDlvMZexOuDoMYfSCUkft8Prt5T
 Labw==
X-Gm-Message-State: ACgBeo0If8yf50NUQG1JpY4fnAHZQfiEm2lFVNcFqUJ4e6M/cKqzo6vW
 +aV1TtoV0fsrrHZ0aBWSeBG5ux56TwziM9lOqzc=
X-Google-Smtp-Source: AA6agR7c8EwcOwDLGVvYs0xN0wWUP2h828CudHkqWiX5W0rfLGiG36eRWKLlGeogQZHEablP/1jKoNyr8khgYPzLQuQ=
X-Received: by 2002:a17:90b:2547:b0:200:b32e:262c with SMTP id
 nw7-20020a17090b254700b00200b32e262cmr2923273pjb.85.1662624794077; Thu, 08
 Sep 2022 01:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220907080353.111926-1-alistair.francis@wdc.com>
 <CAJSP0QVyG73LZ50UJyPFanOKJ3tq27k6LJvvwQ30mJcuAzjDaQ@mail.gmail.com>
In-Reply-To: <CAJSP0QVyG73LZ50UJyPFanOKJ3tq27k6LJvvwQ30mJcuAzjDaQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 10:12:47 +0200
Message-ID: <CAKmqyKP_4V8t0DAnQFahCmEZuH3rH-CNFRxvQjZe-8uOWEGqKg@mail.gmail.com>
Subject: Re: [PULL 00/44] riscv-to-apply queue
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Sep 7, 2022 at 4:18 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Wed, 7 Sept 2022 at 04:32, Alistair Francis via
> <qemu-devel@nongnu.org> wrote:
> >
> > The following changes since commit 946e9bccf12f2bcc3ca471b820738fb22d14fc80:
> >
> >   Merge tag 'samuel-thibault' of https://people.debian.org/~sthibault/qemu into staging (2022-09-06 08:31:24 -0400)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220907
>
> Hi Alistair,
> Please update .git/config to separate the push URL from the fetch URL:
>
> [remote "github"]
>         url = https://github.com/alistair23/qemu.git
>         pushUrl = git@gitlab.com:alistair23/qemu.git
>
> That way future pull requests will include an https URL that allows
> fetches without ssh or a GitHub account. Thanks!

Done! Sorry about that

Alistair

>
> Stefan

