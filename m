Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C052A3907A8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:29:09 +0200 (CEST)
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llarc-0004t9-Nt
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llaf4-0002MX-Uk
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:16:12 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llaf1-0008Lc-60
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:16:10 -0400
Received: by mail-ed1-x536.google.com with SMTP id df21so37180228edb.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AiIiEAPDdf3Aw9ACm+daEGl74CzDEO+Rvmp7WJhXGBQ=;
 b=syWWEf++gSeLR5OzgRobDyVbefACXZsMMS0ExwZiXTleDA0TctIMF0rd+mUtWEkiQP
 5mfsqhAhxBzEwlV3a+d4jSnbnJXVRVdKXnqRDr7RW4IswGYeaq3SK3YAw03CXxm/sBaS
 xsoB8858yKNayoCOmhpETn+AzZLJPIUxV4XlYv65KsXGIJfdxTcpCreTHszDN7T20MxQ
 snA3TchQq14R83iABsa5+e6gYZe86nK0xZIljSIrtQTcFOTx7T0tAFB6FyjpmI4CVOVG
 Pvy2Be/lcPRkhoDzO4llqwgwjUGg8viHmx5L+6Te6XmEEqXG4O/TWYKY6vzt571X4FVC
 B5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AiIiEAPDdf3Aw9ACm+daEGl74CzDEO+Rvmp7WJhXGBQ=;
 b=eFGr8XSFAa3IbJBgNxEOBhXgxXWx9TiEPr++Wd4TKliAi2sPAiGm2LTkXWMheTk54x
 iy6WMbKJDholM+6YNNN8snHWBoMmS622D2obzJfrfUXOS1RXmIWXTjBlhoGsHHyt+MfF
 MpPD86aVZy5YwfdLOJRUQVEB8M4A1bNCuZiCNsiEkiNwASoNIYrRFOvkYYHscL2FXqS4
 AaGhrt9vKDfHaLV3IjK2yXyc877kFZyK7en4Nlx1fRPiuXA6VhQmiMYWaKNQBnAr+BlS
 siNKPUqd/lDQO8rgBXpOfPFOA8AK6fA1QefzglKBDJJ98qLobLyfduzjXSS9+JkYqA8a
 X5HA==
X-Gm-Message-State: AOAM532fbKQB99OxpAMFnByqCPJXtKBxe5/wMnf+2c7vbptbQpN4eIKH
 ouLBep5Dx8DwR83sb9A6g+qENtPAmrRg/YhHHcwkZQ==
X-Google-Smtp-Source: ABdhPJxSFYTKUGKrHwj2zbScxJQGbw+8rsgmX+pwc1lngH/t+B2jmrGRoYsazX9OUC8sAeC3iSsmrmYEwAA3lvXsCg8=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr32668792edu.52.1621962964967; 
 Tue, 25 May 2021 10:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
In-Reply-To: <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 18:15:40 +0100
Message-ID: <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Swetha Joshi <swethajoshi139@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 May 2021 at 17:28, Swetha Joshi <swethajoshi139@gmail.com> wrote=
:
>
> Hey Peter, Phil,
>
> Yeah like Peter mentioned, when KVM is enabled and we don't want VIRT ena=
bled, there are a couple of routines that are being called from virt.h and =
ghes.h, which is resulting in errors. I came up with this simple fix but if=
 you think there is a better solution to it I'll let you/ other developers =
who own it decide and fix it because I don't have much experience or visibi=
lity into what happens internally, my knowledge is restricted to just using=
 the configs.

Well, QEMU builds fine for me as-is, because the default config
always enables the virt board. Do you have repro instructions for
reproducing the build failure ?

thanks
-- PMM

