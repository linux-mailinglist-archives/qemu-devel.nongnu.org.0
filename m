Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269513DBC7C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 17:43:57 +0200 (CEST)
Received: from localhost ([::1]:45906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Ug0-0008Gm-8D
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 11:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UfG-0007bD-0u
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:43:10 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UfE-0000ti-Fw
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:43:09 -0400
Received: by mail-ej1-x633.google.com with SMTP id nd39so17562949ejc.5
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bB24C2eW7LMgNN6DORpj0Y6nh2lwXal7h38xYWDRnkY=;
 b=CAX1tUePzM63kIySUkr7/2Em1FND2CXRFV82bc6LnP7/Jv6a2ODFBjo4uDXVHK135q
 UiZ7EVBQD0DFto9GX6WQwzhrpn4AxQk1So61qRX9UHehi0a0wL6GsqCZPUpgRydYjL+C
 +wH3OwVniNmCBsfch0HYoMnlG5rcJegqSDE8IKPnfpDhiX6huDkRLT0qBEPwIw37HKz+
 m8m1CUE8KO+hhei0uIU+3c7cIquYNsnUhj/JsuHex4eoCxqZMZednL4YImJXLHWqqx9F
 x+ZhdvuTTquxMMf8qR8/Xq0SWBqiGgUeWEvk3XcfJzy4sABZiRXuNl5bQK3PF0uK7OUF
 5Y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bB24C2eW7LMgNN6DORpj0Y6nh2lwXal7h38xYWDRnkY=;
 b=PhFrEBDKrWY8s5DGffOqC1PEdLFf2oQMP6GBcCULSe/ZEgUDBxcoi9eUn/lDtw9dWK
 cu0toGlS8IUgqNi7Z1LDG3vrY4Qj06ge9vny2UYYW4GN5tLwZ5qFCyj49Zh26rgoTPLd
 iC7yektW8aLWknYeaEbZVmWTzJgDJR6L9XjJj14TH2M1qWQYuqPdoTYpGhx7I+SWPbOz
 OK3GYsAD6kuQ9PD9bto+vwbczgL7amozAex3iYigIEKF8IDOc7HyPrurHiYaAXK5/biS
 XZPxZxIwsgBz2RJWeVg56OXv9KNOreJnsA3LuzjsR8dM+6AWLuk7oZJFw8QAGbZY0mA5
 WxXg==
X-Gm-Message-State: AOAM533Fo8kjHdauKtcNYKBF3LfYEB5DgbAtNrALAXE3JBV0PbNOwwME
 PHG/A0x5IchWp0wXC82zpgURSpDxQ3b5FMda+S0YDzmv390=
X-Google-Smtp-Source: ABdhPJw2NKA00XeDiYtTW2luq4KH98GovztH10JPYulq1v3N9thHFwXJdwcS9Zt7/KvIZNAvGplEcPWpNg/Z4RYxKjM=
X-Received: by 2002:a17:907:364:: with SMTP id
 rs4mr3223236ejb.56.1627659786921; 
 Fri, 30 Jul 2021 08:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Jul 2021 16:42:24 +0100
Message-ID: <CAFEAcA8DX+OJQ7UnWhYLmUOgpa_mTCmvppRdHhZOE+n7HGPKZw@mail.gmail.com>
Subject: Re: "make check-acceptance" takes way too long
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Jul 2021 at 16:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> "make check-acceptance" takes way way too long. I just did a run
> on an arm-and-aarch64-targets-only debug build and it took over
> half an hour, and this despite it skipping or cancelling 26 out
> of 58 tests!
>
> I think that ~10 minutes runtime is reasonable. 30 is not;
> ideally no individual test would take more than a minute or so.

Side note, can check-acceptance run multiple tests in parallel?
Running 3 or 4 at once would also improve the runtime...

-- PMM

