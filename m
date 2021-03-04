Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BC832D672
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:22:00 +0100 (CET)
Received: from localhost ([::1]:37324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpnb-0007RL-2n
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHpgm-0008T9-Ef
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:14:56 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHpgj-0002Rl-Te
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:14:55 -0500
Received: by mail-ed1-x532.google.com with SMTP id w9so1732392edc.11
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 07:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fmMFlEDgIjjW4Yl6hj5BNVlr0m4nH8q+YwpS90Fw338=;
 b=brHVZX95xRZodztEdilsvjWibxkkERtctzuxul/4LAQ4fPG0icd+2mdUw89KRzCc6H
 /u8CMSY1NnuC9XL9llh/GnvmeUj800rKbiHz0QOYLtUiiRdoabpjIjbIx3+Zx2gmmp5L
 4CpGaRBGER2MYe31b8qSmm6mc6VVHbS/GoX7TvTA4QK1mzzVWMomoLeEPHOaSHVmPowk
 PHmIv7n0zo3FH+S9aqwsfl7DUEvSkJtYnvJSsb5uHn7jFPwSDSxxo9xGOGjxghATn4oL
 bBNnPsEKyNKCiMK851h5kXJq/eZENHxCFo600tzLH4iHwhXUhgdYYs+cIC0e6EznVHAT
 Q9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fmMFlEDgIjjW4Yl6hj5BNVlr0m4nH8q+YwpS90Fw338=;
 b=PmpRZlikwaNcx08pZnEUiM3d7ZD0OUxbLKeIKyKWKYqyZKRp58mHRs/3za3ZP36cdo
 dMDsurZsb7DOEt+h5XkDe642XAma3FUPZDziOLxz6TikLTB3LYH2idihSW7qoQ0rD2jd
 v1XWhGfrdYrwT4neH8ZK9uuETeb9d3fT5TMpcc4McDW+QIJCkgxur0uEfqKHkMlhBSpu
 PdmIaAYL84sCwpvAPJVxic2PCNXbAYLqwP2k0smYxCccdglZhY675eyO/SjG2Kf+lJVk
 o9L/czJbryT6oeEG6M+T7LUV53WsAUf7e/C+J7H8wBPSrK2CPbH+cpqAm7ochPLcZ+NH
 sWsQ==
X-Gm-Message-State: AOAM5302qNOlHlkj1/2PgnMNsAIVm7sSBGcbKDHKacYS8S6C6EnlypgQ
 O3mXu39QAnI31hHewwHF6H0xAGO9VGN5HVcSkxERMw==
X-Google-Smtp-Source: ABdhPJyU4QJgH4Wby8vcfB6IJ6j7mXAMqrWjo2OFMVCyxZa8Mtoq0wIxr9IOnQ4pMRwiZ4chXoifF/jTri+IxYC1fY0=
X-Received: by 2002:a05:6402:40b:: with SMTP id
 q11mr4890921edv.36.1614870892036; 
 Thu, 04 Mar 2021 07:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
 <20210303174849.GF1664@vanye>
 <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
 <20210304135304.GI1664@vanye>
In-Reply-To: <20210304135304.GI1664@vanye>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Mar 2021 15:14:36 +0000
Message-ID: <CAFEAcA8OsnjfyZUEVB=mmwftVnF2-bBv4da-_gqjaetoBiK3dQ@mail.gmail.com>
Subject: Re: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Mar 2021 at 13:53, Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Wed, Mar 03, 2021 at 18:06:46 +0000, Peter Maydell wrote:
> > On Wed, 3 Mar 2021 at 17:48, Leif Lindholm <leif@nuviainc.com> wrote:
> > > It would be good if we could get 6.0 closer to SBSA compliance.
> >
> > How far away are we at the moment ?
> >
> > > Would it be worth the effort to make this controllable per cpu model?
> >
> > I don't have a strong opinion on whether we should, but if we do then the
> > right way to implement that would be to have the PMCR reset value
> > as a reset_pmcr_el0 field in struct ARMCPU (like the existing reset_fpsid,
> > reset_sctlr, etc) that gets set per-CPU to whatever the CPU's value for
> > it is; and then instead of using a PMCR_NUM_COUNTERS value,
> > extract the PMCR.N field when needed. The hardest part would be
> > going through all the CPU TRMs to find out the correct reset value.
>
> That makes sense.
>
> I guess we could also phase the transition by using the default value
> if zero?

I tend to prefer to avoid that kind of transitional thing, because
as a project we have a tendency to never complete transitions. The
PMU stuff only applies to the v7 and v8 cores, and we don't implement
that many of them, so it's better to just make the effort to find out
the correct PMCR reset value for them and be done with it.

-- PMM

