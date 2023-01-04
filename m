Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38E765DC6B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 19:58:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD8wm-0004Xu-JI; Wed, 04 Jan 2023 13:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pD8wi-0004Xb-BG
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:57:04 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pD8wg-0002k6-Gq
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:57:03 -0500
Received: by mail-pl1-x636.google.com with SMTP id b2so36765269pld.7
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 10:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=foAxF6mYacFRcXDpBZFah23kAfpjDxnhS/VvzIS8RvA=;
 b=DogwnE6SuOXruivn6wC1fHqCVf/SXe7ZFUKpUFM+P/bZBaEpXAJGoKWp2WYjRZxu/I
 O+V8UWMvn3wrfwKD4143enKXke+sW5iVM3f7Hw0E+sILIVK6/OAGGXuDsj+M7G7euMsq
 JYlO+lsf6uqEaKTjTp1w8727JRa2vtP73TSKPBPj5+/Xx2/KZugXN9F87nYvgXGAgNXf
 zeqNJnwSFYosEKXKNfPI4iac8DCo5CrIQn7UYBQ2MBf90CFAGD1yuKtHIRMxsvwjFXTp
 xIYFnzZ3ruHQEJvVbK570UfdsWIOvMob6gwm+drDwvz/DZEqdlKi5OW9TuU0Iwdqbw94
 lubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=foAxF6mYacFRcXDpBZFah23kAfpjDxnhS/VvzIS8RvA=;
 b=4Tu5bD7QDC1AAOgsqEYnKTDQY2ketlecpIuwafuBwjhioQSIHfWCVCl/XubBrzTxd0
 y9Qqcu/kwc2XLEjoNFjQzSH3TQi/NLct+JOH2jAr7+dK2U5pTPlv56wvO3lFPw7jJl+u
 GL/TEgQAG/KfOVh1/dhWCn+P1joqLpf/FiDHn/BbHZqUNJI1WYqWEgikmKrcjyocuEwS
 LenHzh3ubG/D7HzUmhR5Mx1O5aZ86t6rmZN4jEg44B+MMpeOJyHIa8sdBst+wkUpSnRq
 tuO6ZefknQfX0P42Y6hUN6F9UFmINZJw+EeSmI+wxfNMgutylXf/ltPNwC/gNTO+ga8H
 vQ2Q==
X-Gm-Message-State: AFqh2kqS598fyGivck95OT/jLlkNmbqusJ9+qNuAabOvhomYObU/2Z8q
 MJUXtQpcFR5vYih0jEoSJARzCTEVmBNJ90f4+P0bQw==
X-Google-Smtp-Source: AMrXdXsvN6N/k22W1GQut9nBbvq2zqSXCzWBjF5+CxUQvfsE1ENCQdnOPcZutip6+lEbLuXEz91lEbLQsERpFhXLgLo=
X-Received: by 2002:a17:902:9890:b0:189:b0a3:cf4a with SMTP id
 s16-20020a170902989000b00189b0a3cf4amr2226532plp.60.1672858620881; Wed, 04
 Jan 2023 10:57:00 -0800 (PST)
MIME-Version: 1.0
References: <20221223172135.3450109-1-alex.bennee@linaro.org>
In-Reply-To: <20221223172135.3450109-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Jan 2023 18:56:49 +0000
Message-ID: <CAFEAcA-HBkV-OnYSef_LoVyUpBKh=p6q9Gb_fNvk5TLqsPrO6A@mail.gmail.com>
Subject: Re: [PULL v2 0/6] testing updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 23 Dec 2022 at 17:21, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 222059a0fccf4af3be776fe35a5ea2d6a68f9a=
0b:
>
>   Merge tag 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into =
staging (2022-12-21 18:08:09 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-231222-1
>
> for you to fetch changes up to 3b4f911921e4233df0ba78d4acd2077da0b144ef:
>
>   gitlab-ci: Disable docs and GUIs for the build-tci and build-tcg-disabl=
ed jobs (2022-12-23 15:17:13 +0000)
>
> ----------------------------------------------------------------
> testing updates:
>
>   - fix minor shell-ism that can break check-tcg
>   - turn off verbose logging on custom runners
>   - make configure echo call in CI
>   - fix unused variable in linux-test
>   - add binary compiler docker image for hexagon
>   - disable doc and gui builds for tci and disable-tcg builds
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

