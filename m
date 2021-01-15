Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29FB2F8026
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:59:06 +0100 (CET)
Received: from localhost ([::1]:58364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RVB-0008Go-R2
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0RU8-0007ni-Fo
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:58:00 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0RU6-00050L-US
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:58:00 -0500
Received: by mail-ej1-x62a.google.com with SMTP id l9so8256253ejx.3
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XCV5o4J1FDVc2kx6kG6B7obnQbz6v7vjV4zMKdFnWpc=;
 b=HuHsCRNjKip5bu3aMvUe23RxmZ3FVITJcb1xXN/MzgyQm84lpjIuivJHLmkDUXY5ah
 9nlKJ1rAWGiL+kbkk69M4SfxgilUYCQ+sArkekaUQ/fUfdFtaefr1OeeQbNAWEOi1x+4
 daaJw2CJU4I1iv3Sqvr+eKxHTkQU5ZC+fcotOj/GgV0Ji2JGwr+s6GYOICHFi5Q0A1Vx
 dFLeMfDtjvS1IRcQNze/UjTO7lkEVSKKa2dK6v+nQEUfl4yDARuko5U5KDodI+FzmJiC
 Xj8+yUCZ/xazStpXGpl5btzwEBvgHHju23FlKHbc7loIk7QjI8LjC8d9rSrg8yg+zqfc
 2qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XCV5o4J1FDVc2kx6kG6B7obnQbz6v7vjV4zMKdFnWpc=;
 b=Ve/x7GNS07NOhiiDqkTkHfTIHx60Q6JgBrfBSPcIf7Xq8ptYuBa+rEpWKN1xkbymzn
 lSBqKvbEks5qGZu9C7Bmuw7schIO24EPOlH98+8GbUXIwkXpxMS7K/gSXGxikbWvi+Pi
 cEDomttOxe1PBD73TPZaqeB5sT39fsCAClkTub41XRRAgFsxEeyjVYfs9hLGBrl3Hp9u
 bmQvhQdNgFLeP30FTnAuSIWhIodCl4diY+rUUWSnNTNgXSyotIKgEreVDHZd7CDq7LdH
 Btdg093vfjvJiRLza059TMQjCDYq9JmSwI9Rz7MRZuvD7IrPK13Z0xkCq5CflZLKvjBS
 9E6g==
X-Gm-Message-State: AOAM532B/Q3Kc6g6u3WqMpBAilbS+WsR4MCB0CsmISwmQkS3xwjvWemm
 pUvg9NdUkb1FUk43CkjHscpSU41+jB8FhPB3PwYLCQ==
X-Google-Smtp-Source: ABdhPJyR+/CYn7fqmEmPQ0z698TIwQjRnBB2VtzC+QYAS9Av4Aqc3y5QvfVJdltlb7TvQ323X3ClULfx6uM+43X8Lnk=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr9185135ejf.407.1610726277056; 
 Fri, 15 Jan 2021 07:57:57 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8ozrnbh8XVZa8OF9C9SnNKb4Wb-=gZianHPPp5zcKjmw@mail.gmail.com>
 <CAFEAcA-f4cueeYNr=i8w0LbdsNwJo3DMLAywsp5cOu7-P0wKCA@mail.gmail.com>
 <03e68d8d-9446-ebec-7be0-21764b567dda@weilnetz.de>
In-Reply-To: <03e68d8d-9446-ebec-7be0-21764b567dda@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 15:57:46 +0000
Message-ID: <CAFEAcA9R3+tnmJa6qpVaSD-e-rQJu7QJ_ptg4=eZwJCAVOLwqQ@mail.gmail.com>
Subject: Re: Windows installer builds apparently broken since October?
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 15:52, Stefan Weil <sw@weilnetz.de> wrote:
> I forgot to mention that some of the problems with the Meson build also
> occur on macOS with Homebrew: they always happen when a software package
> requires special compiler flags to find its include files or libraries,
> but the Meson build does not use the result from pkg-config for them.

Yeah -- we fixed that in commit 3eacf70bb5a83e4 for gnutls, which
is the main one homebrew was running into. Is Windows having
problems with other libs too?

Paolo: did we come up with a generic solution for this or
do we really have to add entries to dependency lists all
over the build system for every library we use?

thanks
-- PMM

