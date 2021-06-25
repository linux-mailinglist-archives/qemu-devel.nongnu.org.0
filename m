Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D74B3B4603
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:44:21 +0200 (CEST)
Received: from localhost ([::1]:41210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwn48-0001Te-6Y
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwmpS-0006ax-EE
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:29:10 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwmpP-00081m-Pz
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:29:10 -0400
Received: by mail-ej1-x62c.google.com with SMTP id bu12so15525498ejb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vtxeoFYKAlJ25RUHhAuvRVBvuy6po5mbfShD+sTLTXo=;
 b=YJm2eJt7L26z4gPYu98SXwg7TqKEYQZQjmiAx3N54qzXpm1BCwy6C+fJiKCKKWxs93
 vKF2oSFg7EHVY25AGZxTV/CBQSh2nNCorwKs5UNclNq5e5ZETAi94DF2GRDCzg4ee2nJ
 POfC9Ta/aLoSaem1ns9ouFSbYySeRgjae3LKnNdtP+FD2rEhFhQJMWgXvHM9kkVx800S
 W7SV8Z6E5rd5cfNLNasJMtgzOV4ht58wE2L9XaHT67wF7v6joT7ydmF0mtgoPSKaHj9G
 OOVDq+Y4Xp7khmU5xUmuT1+Y6ONLxyO1DDBwAUjrTGlKMnEKZ9Cex8TdaZFJGIYwyprp
 L7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vtxeoFYKAlJ25RUHhAuvRVBvuy6po5mbfShD+sTLTXo=;
 b=LmoPCcZy1vaB70AS+KOe+18TsEJiKFQGRMs/bgM4oQsEOxaMSGiD5buZynNUz8mYha
 tJhFo2/RHVTvoCOGnMoW07QdsRUl+Yu1KvRB1vL902l/j7USC9tmXZyVk9uiSZKvtwSp
 y+Ts1Ea/R5Tl68N2XmiTH3ZOld9NkUmm6I3GAw6TqZt7sOHG6PohVQb2cX1Tzs/KA6/c
 0uWZVWbl1G3tueQqFBuLwbB34l97bXC1ezFvPXWbYYKCW9ZUIK2NMUXlV/qg9tinMxqh
 pksPAN2QuEODRBc85kajD0GhMQmbGCKeIGhPkV9vjHMBtJ2WrFVpD5E/tTr45Siizc8b
 kYqg==
X-Gm-Message-State: AOAM5339wi0KOykYGc1oWrZbznODyUYaVst6RxvZtUnOf0a0cL9EgPMp
 1vRv+MnN6vSKG8+Daeh04m0zW46U6NOeU8XDWAPreg==
X-Google-Smtp-Source: ABdhPJxaqWS/vJVSTzO7U3grngIKSgiuqcqelW3qHMgb9OK23LUgok6jWZymEERuMrIHC+JsHjJGlBc4AHxm8PmY++8=
X-Received: by 2002:a17:906:4759:: with SMTP id
 j25mr11142994ejs.4.1624631346196; 
 Fri, 25 Jun 2021 07:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210625091355.25673-1-alex.bennee@linaro.org>
In-Reply-To: <20210625091355.25673-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jun 2021 15:28:29 +0100
Message-ID: <CAFEAcA_ECkrbbnp2yHA77TSC4NQmnQZg3nM0P-zr170fti5ZwQ@mail.gmail.com>
Subject: Re: [PULL 0/7] misc fixes (docs, plugins, tests)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Fri, 25 Jun 2021 at 10:14, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit ecba223da6215d6f6ce2d343b70b2e9a19bfb9=
0b:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
10624' into staging (2021-06-24 15:00:34 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-updates-250621-1
>
> for you to fetch changes up to 7c4ab60f18f5257d37164df0ae0951ece4425b02:
>
>   plugins/api: expose symbol lookup to plugins (2021-06-25 10:08:37 +0100=
)
>
> ----------------------------------------------------------------
> A few miscellaneous fixes
>
>   - tweak tcg/kvm based GIC tests
>   - add header to MTTCG docs
>   - cleanup checkpatch handling
>   - GitLab feature and bug request templates
>   - symbol resolution helper for plugin API
>   - skip hppa/s390x signals test until fixes arrive


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

