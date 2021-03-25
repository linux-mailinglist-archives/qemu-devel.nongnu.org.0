Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7530348E16
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 11:36:47 +0100 (CET)
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPNM6-0002zw-Fg
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 06:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPNKJ-0002QK-Vu
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 06:34:56 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPNKI-0007Cg-Bk
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 06:34:55 -0400
Received: by mail-ej1-x62a.google.com with SMTP id u5so2051847ejn.8
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 03:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V5yYy/0yLLx2EQDFH/pz1Bt4v5XupB0mzoHTsDfkA4s=;
 b=b0U9+l6oOaavRIlezVKrE47E2JuCVJmVPb1tE393FB+AcdmH7GI8oK8o4YmG8QIq95
 HBylTvpMEwcZL6VsYDa2WYVmTrSOtqO7gmg1OTgM625GY2/4yFE5bZFijbxYD6RygrWw
 l6LLTHawGR628k1BqFSEQQSeSTWx0mgpAwTVDncLWO5o65fD/d4TrEbKiIwQVOWRBPiJ
 5M5ibm0xBlrXnBB1iS6g2qOrpriim/Wr21JYnFczXmxGQ6X1sho7pGZBm0ClKKDWciIX
 CvEqJT5IKBkqNMcZYrri4L2H1u+C3m5IduOiwV5su6VKg9DPkNGDZ2TFtluRwaNT+jRm
 9/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V5yYy/0yLLx2EQDFH/pz1Bt4v5XupB0mzoHTsDfkA4s=;
 b=a/yYIvJfEM2sfHLMQNtHANmezlCduZYcbM4xUf+oGuRt94dwPdWMRKURAwQnv4P+St
 LKBdzTKvJzouwRXO+aeZxGpzXLxcUDm4rRwRNoHdglUoeQyUV6O/EDI0sqNxHnGv1X/l
 ZTc5E1fonVieRVTfbS99TSp2wUND4SrEUDsZebs0ePRIR3In8YzwoeKCppZ5pZircisD
 fK3FtP+rcgfSV4qyZA1e0iUxpFFOCvjuhsAg+LbUSYLEptoUDuktd+Ye/y7ZQ9zFF9Qn
 zTSCUZt4ZyEPAYxGImpL/UrfVrpu1m0WSceGubhtQscfEA+LRTfHntNvmo0zHx7jxRPd
 d4Sw==
X-Gm-Message-State: AOAM532UXGhAa+dk8gFEb2zUXAfRFc83c5X0iZxgSxLeURrgLVyUrgLP
 MlktsiMeNLUa2hlA43blfjGSkhg4eJMeGH2f6KpndA==
X-Google-Smtp-Source: ABdhPJzLagJuKwi7AsvmAx5TIx5ugwOos3SqIChRFdGY4ZMABxYqWDzHw6dWeGuSAG+7jU6A+A2GOgHU9mnA1YZO5vQ=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr8726220ejg.482.1616668492870; 
 Thu, 25 Mar 2021 03:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <2da69b21-ce5e-cae2-68ef-d6e042563a3a@amsat.org>
 <8ec8b3b7-12b4-b676-630c-972e7038ec7f@amsat.org>
 <74859ed9-6f93-0b8a-a669-6aef1e164e41@amsat.org>
 <1a70056b-78b4-c4f4-afc2-044aa499e1c7@redhat.com>
 <557c7ccc-ce30-a452-8904-590667298389@amsat.org>
In-Reply-To: <557c7ccc-ce30-a452-8904-590667298389@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Mar 2021 10:34:21 +0000
Message-ID: <CAFEAcA_GGr-BT713cWLbJCvMBdw_gn6+aMdPnb=5iN-eSP9nkw@mail.gmail.com>
Subject: Re: gitlab-ci: Only build /staging branch?
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Mar 2021 at 09:33, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> v6.0 is at the door and I was wondering what is missing to have the
> CI used as a gate.

It needs to be faster. Mostly I do check the gitlab CI pipeline
status, but in the run-up to getting rc0 out I stopped waiting
for the gitlab CI job to finish, because I was continually finding
that I kicked off a run, my local build-tests would complete within
an hour or so, and the gitlab CI jobs were still pending, barely
started, etc. Turnaround on testing a merge must be 90 minutes or
less, especially during release periods, because there are always
a huge number of merges that arrive for me to test in the last
couple of days before freeze.

thanks
-- PMM

