Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8C51A33FC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 14:24:42 +0200 (CEST)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMWEb-0003vP-Qm
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 08:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49878)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jMWDP-00035q-Ul
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 08:23:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jMWDO-00055z-EA
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 08:23:27 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:39740)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jMWDO-00055Y-9X
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 08:23:26 -0400
Received: by mail-oi1-x22a.google.com with SMTP id d63so3049606oig.6
 for <qemu-devel@nongnu.org>; Thu, 09 Apr 2020 05:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JmmEOfhMMGAXslmZW0AeJDWIV3MeSBwmrgpGZ1favDE=;
 b=SPlKt6fVBLTG3wPv36XWIk+O63PrLE4HKUvtvwwvMfdipnBTWjCcPnbPM+e5TCOx6f
 r2VeEbc/d9pFoT6CRR9AZBTUpXc3W+Lwht3oHevsy0dpCm+0hpaADa/ITvV5S6WII1bT
 GYKf3bEukdghigu9SReIghzp82IuHjwu/NWL6vkg4l1ztoWyZy69s0T084YFsNFEuysj
 RCzV6SItGUqokGVU8aFVCT5u4d5U2zIvz14DPY+NDf25Cd7GWikrq0jMdBYyeULaextT
 V+O/qJwkLoApMi+A8NOplBZLPLtbfkSbrAnaAN9SY+aOd7wZy+Q74xa8DR481Tr3VBE8
 G2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JmmEOfhMMGAXslmZW0AeJDWIV3MeSBwmrgpGZ1favDE=;
 b=egRH1ahi1/cI6RTsKwfkU4Pk+tmsxElfaoLnDA+9J90gNe9Lc+wpMAZ3hqjNjyf3Aj
 MqkusSIqMxaRguXqzEC/i5p4EUUAY/SFNuLZoXghWFECpcQAn7l8sd+2a3sItFaWLHSP
 3Leq7syoxf84tOh1rHeuEYJr475HKWvb1hFAvmiNdGdNLOkMH9xUTcJAXok2pf2eyuyv
 EuXX1dA9MxgCTrx8exAevgA2pooDCz2WbmYEhL9sq0vWNo94ZOeAiNaQGxyWKmA+QZPe
 mWYOt6uA3zhr8NYpAW+pEhHNHeb9Uadr31aQ1+VzELRK8dui3/mFPimokCCok922J2et
 fsQg==
X-Gm-Message-State: AGi0PuYW/Xt6t23CXTDKHTLeCKL05xjoZxYXp3ywZ+Ne0Gw9ogGWRZfj
 FoyD54UNCJ8qJsUNxHjz/wsDXlgDdAWLCtCYwECcKw==
X-Google-Smtp-Source: APiQypLNc8qx3YmgaHW5ksV+1eckIBCYvh7dpYNKP/reIgHnJZsUUJU+8OK2v5YifjoqVdJHXmjkM/DW0kBbZt1Oktw=
X-Received: by 2002:a05:6808:8cb:: with SMTP id
 k11mr5695760oij.48.1586435005138; 
 Thu, 09 Apr 2020 05:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200408000210.22182-1-jcmvbkbc@gmail.com>
In-Reply-To: <20200408000210.22182-1-jcmvbkbc@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Apr 2020 13:23:13 +0100
Message-ID: <CAFEAcA9_TAiF+eThk5HLy5xD8JkpQWoxib94zjeL5iwjouXNsQ@mail.gmail.com>
Subject: Re: [PULL for-5.0 0/2] target/xtensa fixes
To: Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22a
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

On Wed, 8 Apr 2020 at 01:02, Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> Hi Peter,
>
> please pull the following two fixes for the target/xtensa.
>
> The following changes since commit f3bac27cc1e303e1860cc55b9b6889ba39dee587:
>
>   Update version for v5.0.0-rc2 release (2020-04-07 23:13:37 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/OSLL/qemu-xtensa.git tags/20200407-xtensa
>
> for you to fetch changes up to fde557ad25ff3370ef1dd0587d299a86e060bb23:
>
>   target/xtensa: statically allocate xtensa_insnbufs in DisasContext (2020-04-07 16:08:11 -0700)
>
> ----------------------------------------------------------------
> target/xtensa fixes for 5.0:
>
> - fix pasto in pfwait.r opcode name;
> - fix memory leak with dynamically allocated xtensa_insnbufs in
>   DisasContext.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

