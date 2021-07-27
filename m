Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7415C3D7556
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 14:52:05 +0200 (CEST)
Received: from localhost ([::1]:59204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8MZ2-0007Ar-GI
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 08:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8MWj-0004lc-38
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:49:41 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8MWh-0003fu-G2
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:49:40 -0400
Received: by mail-ed1-x52e.google.com with SMTP id h8so15190946ede.4
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 05:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nDBmyIZTESccYW8y/016x7emB0XVIcqyNuso4NDRUcg=;
 b=PzypwMxnxnG3UICTdgjPfNVlh0cF/dITBJSZjSGEtYoLMU5Ce5flh45V30n/IYC5pp
 gNBFgNCJgnaHjBnU9qMQ/R8u5GrVT9uu4H9Sa93k4zQj7ucMU0uhh9KFvRYZSDPuq+Ak
 O7V8EYIK3oTYX48fM1MXUonY0w7z08a2jWcpcwiYhwKT5E8+jx//94ZfG17wmLJYb40r
 UqJuGowtrKzd+qzJsEc2yFkPSpQhQxcHA1Bu/zMEQlFtWZHGdBvGnn83iHeql0bVCtcz
 lRllvy2c7xFGCotlWU0i6/KbWO/AzzqRq54fOn6dx6pmOIJRN+NEK3PrYxIYmvrbB/c+
 b++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nDBmyIZTESccYW8y/016x7emB0XVIcqyNuso4NDRUcg=;
 b=R9hiIIfnlv6dXGeh0j5iYop7yUX+wjiNLBVIchOy3Xn6owPJ7eqjmo1gkB46ByX7ha
 6kDRcxAC27Pq3U37lh8WphS42bQVnvmOPv+dI8wbJvSNTjRllhfcVFRe2IkrWoT4DyDO
 JdkP0bMyoiFGDRvK2e2UaxzsfmvqtU2t+Q1C1r5ZbFOzKmAYXfbrKAym2WyYuKevBiuS
 qD6oNtCePlnfr4jYrQn5nUGnLdponERkrGE4nxvZGNDO4zdpyeIDmb+Yr1KWc+uIYTF5
 75fuPTq3cW1xPBglUogg3FDEXOT8J2ntVbeO7w3CMI5DPVwNAb+OiTG+mPu3EET29KxS
 055Q==
X-Gm-Message-State: AOAM5300sHXUjbO42pGMCWAuPRqxRLuSoMByFAg7B/jjl8nbihCCzcMU
 GHm8RIDZlIYn7EO5W2UouAtyQXL9PvsOzcY7+uQwkg==
X-Google-Smtp-Source: ABdhPJz1GcmXrQV12gygq5F+nt2k8vChd44bzBHt9MLYi/1oU2G9C/wr2txyNF7MlEfGIYfkicqF3M2eu5pBhH1kmkA=
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr17888449eds.251.1627390177891; 
 Tue, 27 Jul 2021 05:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210720235619.2048797-1-jsnow@redhat.com>
In-Reply-To: <20210720235619.2048797-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 13:48:55 +0100
Message-ID: <CAFEAcA8fG4Tuk04VuOHoeRBPdjvgDYhyyBUqyKOj045=uqxH1Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] docs: convert qapi-code-gen.txt to qapi-code-gen.rst
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Michael Roth <michael.roth@amd.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Jul 2021 at 00:58, John Snow <jsnow@redhat.com> wrote:
>
> Patch 1 does (roughly) the bare minimum, patch 2 adds some formatting,
> and patch 3 adds cross-references.
>
> John Snow (3):
>   docs: convert qapi-code-gen.txt to ReST
>   docs/qapi-code-gen: Beautify formatting
>   docs/qapi-code-gen: add cross-references

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

