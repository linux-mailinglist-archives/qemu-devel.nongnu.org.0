Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1D221A075
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 15:05:41 +0200 (CEST)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtWFA-0006Ib-06
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 09:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtWEQ-0005tl-N5
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 09:04:54 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:35732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtWEO-0007v8-UD
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 09:04:54 -0400
Received: by mail-oi1-x233.google.com with SMTP id k4so1817239oik.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jul 2020 06:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tpzF9OuYn64nQnDr6krGXfyX32gQ68YuJV+RJVKGjn4=;
 b=x9KHMeAlA31oveSp8+E/wMlEpcgmVdwr5AXAI7N29WQn+H8mkJlti0bY/D0/R67FT1
 cn/M8w5zViws9Paqb5/z9ZtHy+hh19iMzJwOsdDZmR8dSWXHXIWlnL2Zy6PjgGUD/KDP
 nc3t7EiIGy4RzWvTmQ3a1veLuiWka85S/NjPUkKkUfQG7RYyNAbeXxNXZ+nxMSpwXPd2
 J3qF1NO6D/bZ8Qt7S1sXGHWIWE9iEsKqGMrYPQObm3SjuVUxx3c/GI0g0vBGDJWsoYfn
 InPCr0T2vInHZ3Yki2N863QM1amNuYqwVhPtH9wkJbWJP7WQ7z8o5ofSTdBTtHUtTXpb
 w/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tpzF9OuYn64nQnDr6krGXfyX32gQ68YuJV+RJVKGjn4=;
 b=nmU1Mcy6JxAFOhPCwrD2Z6/Yv0q8CsfnK5Y7ARSYzvEzEu5+7yG5efUPFq7khwwszC
 0J1SiX6wJexW88YmCaIep0nv8qURh1kWw52dGGexQt4xJ1OUTQqLo/AZZZaiaOINvlxI
 hs8LTAaIyps7dKmqxp74MSQZjLsTGkcXvltAt00kKIG7P5tsrExQCCmUHN670RCQvl+C
 RVllzHB5vh2aGzCvLfqGskisq7psCc4MW/1RVRZ31/mVdsqaCB2GL3rxtHmioxOCbG0o
 5Ln4iWfv3dx/HLTK6ttpLqPKqg52NH7su0UUeav/8oZN8Xo2QOoNderWPD6Pwp1VfFtI
 QQ1g==
X-Gm-Message-State: AOAM530rzdfleJdKPiRl9aoR98m2Ni/8cFYE/nH7BzCU+1QHZMn+lfnc
 JQMi9nuvDqUEylazG45tm8uM+97AOz7Zq8rbMoyfaQ==
X-Google-Smtp-Source: ABdhPJwlSX1yBn01p8p2zT9rXZTgqe2l737CzpwGIT3vTiYoOAuuIEwkCDnvmJAze2eZRJzCuXC4FdJlKoBXgfPmGkQ=
X-Received: by 2002:aca:2819:: with SMTP id 25mr10271507oix.48.1594299889940; 
 Thu, 09 Jul 2020 06:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200707070858.6622-1-alex.bennee@linaro.org>
 <CAFEAcA80gPAFRsJcFyO8ogNbSa_ex6fSaxnBYU6awU=Ug+Y7wg@mail.gmail.com>
 <70a8b609-a84d-1390-7f85-bbade83a980e@redhat.com>
In-Reply-To: <70a8b609-a84d-1390-7f85-bbade83a980e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2020 14:04:38 +0100
Message-ID: <CAFEAcA8sEaReoNsybPSJJqhDPfHXYCAby3+ViEd=QeeF21wi5w@mail.gmail.com>
Subject: Re: [PULL 00/41] testing updates (vm, gitlab, misc build fixes)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x233.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 Jul 2020 at 13:24, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> libssh is bugged on Ubuntu 18.04.
> https://bugs.launchpad.net/qemu/+bug/1838763
>
> We need to use 'configure --disable-libssh' there.

Ah, thanks. I guess libssh recently got installed on that
box.

-- PMM

