Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C35D115697
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 18:36:32 +0100 (CET)
Received: from localhost ([::1]:42174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idHWo-0001xL-GO
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 12:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idFoM-0001cM-JK
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:46:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idFoL-0006wb-IB
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:46:30 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41149)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idFoL-0006v5-CK
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:46:29 -0500
Received: by mail-oi1-x243.google.com with SMTP id i1so130647oie.8
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 07:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pdre9Si9zdnLnZji5jvhEWMqNMAmGc7VPA2Ram4aBAs=;
 b=smqN0Zo3p7AWhUxu9cMrrtCDcTtJJNDMv1XSCTfLUdyMsV1lb17buybLen3xcJlkgt
 i0t57+53v7TdXfxETy5QiFuQGKnnlZaD5hBaXc6BcEna6lSMzkZpYCQPAIrJgYnPV78t
 yQG0yayLzwyMh7/edQv13w2cmxXSV2Lcgv96ux265aiPle5r0p4ugWy5ZsDDEdvEWRx+
 A5hJ4CFnhVCsPcFbaJnskwT7yxpAm++3JrD52we02eYrhN5OwrYeLJlvWcXpm0DZCNL3
 hxamFRNcRxO3YBIaNh3oXtG+TkIHx2RQ4pYuzWRtcXsKcKKRsHTMhUwO0wPYd3QgoDix
 E0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pdre9Si9zdnLnZji5jvhEWMqNMAmGc7VPA2Ram4aBAs=;
 b=anpsSO1HQ/X1itn+ZCdDvb2hT3flr4llClPNk2DHf/Dk4RdHJmkLLILZh2dGCFV950
 kcPThhWzheD1fJ9TElu86qPnyKfTs698KoUJANNC4RLPkKqKfSZjHBJXsHWKqc+TOXgz
 rIUTopBcpbxzTJ8xqn3QXvWPYch1gHXk85LOaJaZB/lJQETMwSsZWuSGpprrKlHv0J8U
 r1jZ/wb8VjmNZti2RCNOZNtCA8azi1d4+LkhFBW1Omj8hrKE4Pkq5Q/zUjdC381glm9b
 4V43L1fEIM/JLy07zRyqTIHYUdukkbVCJVhLCbf3+RRe57/x3KGgRSTHshq5hs0u5dEm
 yOJQ==
X-Gm-Message-State: APjAAAVtsy83nvqr8P7jHopGhgu18SyHB6i0OlmpDyvOuefPHMVqFIoY
 KGge4kjht5g4zruWJDdWo5IFB8K6VoZDiPLGgO+Wtw==
X-Google-Smtp-Source: APXvYqxalfWrWoR3jCUeyjKcikZA21HXZZEJ3u5ZRtUbo2uYGuKQA1bU5lag7k6gmJslTdMZIW51o5FB2VYYMsqGAF0=
X-Received: by 2002:a05:6808:996:: with SMTP id
 a22mr12214250oic.146.1575647188495; 
 Fri, 06 Dec 2019 07:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20191203022937.1474-1-richard.henderson@linaro.org>
 <20191203022937.1474-10-richard.henderson@linaro.org>
In-Reply-To: <20191203022937.1474-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 15:46:17 +0000
Message-ID: <CAFEAcA-2mpUSjwnkAJGdwHX5P0xvF_eZyVLt9xPv57330Qu3dg@mail.gmail.com>
Subject: Re: [PATCH v4 09/40] target/arm: Rename ARMMMUIdx_S2NS to
 ARMMMUIdx_Stage2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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

On Tue, 3 Dec 2019 at 02:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The EL1&0 regime is the only one that uses 2-stage translation.

...now what happens when we support secure EL2 and we need a
secure stage 2 MMUIdx ?

thanks
-- PMM

