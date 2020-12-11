Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F282D7837
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:49:59 +0100 (CET)
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knjk5-0006YN-5w
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjih-0005MC-Li
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:48:31 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:46214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjig-0001Ju-1A
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:48:31 -0500
Received: by mail-ej1-x643.google.com with SMTP id bo9so12659912ejb.13
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PFf8RezM67PvJ05XLYcCmMVBzSoXGcsAzU/AhY4rV1Q=;
 b=uURBCfG6JXROVIsayNwcNlQ40vNSft2259U/EudyNejmxphaisPeTCr2gA+5lLqG8n
 HSDSdZhfUfJi7Ve9dmIR1oBtQYTuftd7jqR3kcsW989ENoaX6z3yGtVYlWS0vH60gpPI
 B1ue7ihhWi1zHyHPuHPfKiAlTieSpa7M05OcAdLWSYjcauQapANCB8cF2MSTIJ/dDe3W
 BWWFpk5/3B6xRwYx96uerGKhtuo7vZfuXqLeVxjcNoRQ1rSsLpb3O0xV5/HV0BTTvDnc
 MxBZCxvxqAG4gMWy2ITWi8ph8rsDZDR1u5k/BUnxvqEUg0Tnmkd7u2nkGkvqger4wywv
 wHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PFf8RezM67PvJ05XLYcCmMVBzSoXGcsAzU/AhY4rV1Q=;
 b=ldvDFTMof/KpxVbEdzZYo4Ok7zsMB+C6PxnuY2ZmyjH+pGG6YTAo7xUsGo9dXZBswb
 FDWG1MuleI0d4NrNnt64Iun9PwPXUzUHF8Vmagv4rqJmhsoaH69H6oZ11/9GvHppu5H5
 xkVufdwurVwqPcaKmORb13qn5/OrmVBzrJvTvjg0tOrbX7Kq0y08L8+X6Jz95SYEl1pG
 oEOlU9L0muB3ZFtuTmpJJWr2nxLSlWuP8vGd3HDDzhuWRJ624vOZgeGIpf3JXC+mp3zj
 rUwEFqiQB429eXTah6PwA1/Sh+Mu1UooFntJ+yziPtJrN0jSBtMqQvGYPGaQImWCO+gK
 ciLQ==
X-Gm-Message-State: AOAM530g1YX8Dr75D1/kCdj8OLfHAmVdUFJdutXzlon6XTmsWuGAFCog
 K/vun8MgiGGqUZfvlVHcZu4MUSVjjM5k8efm6Rp8/w==
X-Google-Smtp-Source: ABdhPJxyzeEAp4+dAkxEOuaUQ7cfUYEEFQYAznU7OHIkHvRDzvaZ7ZmmKRihxwzWSkacUv0Pe36lYyqGnAc02E6oO9w=
X-Received: by 2002:a17:907:971c:: with SMTP id
 jg28mr11251008ejc.85.1607698106720; 
 Fri, 11 Dec 2020 06:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-5-leif@nuviainc.com>
In-Reply-To: <20201208122306.8933-5-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 14:48:15 +0000
Message-ID: <CAFEAcA9oXDLRA7UJTepqpBWHNDdbtghxjtYtUdEzb6ckeY00Pg@mail.gmail.com>
Subject: Re: [PATCH 4/5] target/arm: add aarch64 ID register fields to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 12:23, Leif Lindholm <leif@nuviainc.com> wrote:
>
> Add entries present in ARM DDI 0487F.c (August 2020).
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

