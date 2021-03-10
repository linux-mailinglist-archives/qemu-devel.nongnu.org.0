Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536C3333B20
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:12:05 +0100 (CET)
Received: from localhost ([::1]:60664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwl2-0005m7-De
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:12:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJwju-0005Cq-9V
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:10:54 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJwjs-000858-Qg
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:10:54 -0500
Received: by mail-ej1-x62e.google.com with SMTP id bm21so37867717ejb.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 03:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ya9r0QaSA0+YgfKkYNWdxg2jNTYrg7QauRG6yo3toIg=;
 b=KkvS/+BdhzpqKt5N6QMkZRJ/S/eqQm1lPoMh4nEeI54wlmENmhd/xLo8XMVqllus/T
 Rbp+ivnBtbT1Gz8n2xzbltfbl5fCARr9j1x+els4yP1BTFjgVCimGhytl76HOxo8z8mU
 DdbzbeX3MMpbYfauuP5gDfA3xHat3flc2XO8HbI2WUQsv65REf35RzyRbsIA5p5r1y2/
 a52XHPtOA/Fg25Fn8zeSl/oQ0zFUWIoPYxltJFRYQ4E6IuBTz689EpfRL4VdqqKaNz6d
 urpkF1r+5QDRRbyKyCRa8eU9ae8mZUa3tCy/TwWJ1rDfVQiergguTDDJg2ZKaq8EF8rx
 FMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ya9r0QaSA0+YgfKkYNWdxg2jNTYrg7QauRG6yo3toIg=;
 b=P+XA5p7hZy6A1BrsKghkCzBkA8TLspiONYOY1aH2nhOHMvqT4C5JG/0/Tz7NDgYZI1
 zm5uOfTuobjlhhNfZL9Kb1B+XVaQtWyye4nPLM7ArCtImRpRhKgO1Wtv5Tk1lJ9yMNvr
 WeAWDwozEbgpE2vUuKWQZ70YNTEen8zZFg80llVqlrCQGfiZm1Au2KgVPB/DNzoKgBfC
 DidKvkf+IWFxhs/hkt4pDnBs41r3ERyif+ae8JN90jcXRpF5xPwYhhuTae4Wbhy4DyBi
 H1W3wnUiQhIuag91EHGZb+SqmA66reGugoWyNGTJvndwJji3AD7Mnv9VSXaPjsgdqYR5
 hvFw==
X-Gm-Message-State: AOAM533HpPaBzHh49T08PdbCrna9woOOIcthE4z6oSoZUwnn7p5OxDpK
 Z0BdV9lSdqFArzE5KxGh7lkXC/9g3VLy0sjYjpJJhw==
X-Google-Smtp-Source: ABdhPJztiL4cJNy/ZRztRwvR5EBg9IBnnsQgGbJ3x0S4Y2FEv/TssL0xL/LTNTvRHlZFdSiJK5q6/TTTfjS3j4HU8Xo=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr2468627ejz.382.1615374651112; 
 Wed, 10 Mar 2021 03:10:51 -0800 (PST)
MIME-Version: 1.0
References: <20210308135104.24903-1-alex.bennee@linaro.org>
 <CAFEAcA9d01LaFRW=NnqivAMCsxPUbRP8kqOuL0i=P3o42tSZEg@mail.gmail.com>
 <87czw78f0d.fsf@linaro.org>
In-Reply-To: <87czw78f0d.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Mar 2021 11:10:32 +0000
Message-ID: <CAFEAcA-DmTGgAgpwocj5vO9W0E9RFtbdvO0DVThSa47S=yPJvA@mail.gmail.com>
Subject: Re: [PULL 00/18] testing, docs, semihosting move and guest-loader
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Wed, 10 Mar 2021 at 10:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> And then I get the same failure as you. Can you confirm the docker
> version you have now?

e104462:bionic:qemu$ docker version
Client:
 Version:           18.09.1
 API version:       1.39
 Go version:        go1.10.6
 Git commit:        4c52b90
 Built:             Wed Jan  9 19:35:23 2019
 OS/Arch:           linux/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          18.09.1
  API version:      1.39 (minimum version 1.12)
  Go version:       go1.10.6
  Git commit:       4c52b90
  Built:            Wed Jan  9 19:02:44 2019
  OS/Arch:          linux/amd64
  Experimental:     false

-- PMM

