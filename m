Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225CD41AE7A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 14:08:54 +0200 (CEST)
Received: from localhost ([::1]:46856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVBun-0006Uo-7u
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 08:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVBtV-00054h-SR
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:07:33 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVBtU-00074G-87
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:07:33 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t8so57752876wri.1
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yLzO+mhpock4isuB2IsQekcsQw8IgjG2LHCOzoZJobQ=;
 b=rO9Tk1KU1tRWwdJVO0QWYrnKnkv86I0tUJQB17BF188BM/vXn/FPdbq+2S7FV8IHsM
 ivEz++/8oe473PAzebOgGa+X3aGvrdvog04bmmGw0l95aILJA3QeNU8RbptdQfVSMnQ+
 6dJ+mKF5Ipt4esvSkpb4oZmknp74l9LuBd49y4vAnW5HJS1Aqk0wghC3/RI7PpHMuIlC
 h14o5NjxILWubNDlbDXtq9h4fkB1uOZRW3oOoyuw0f3S34bSIQ7ykfJgbYGDM6HPsrux
 G1FHT3O+pAkhp01P03HmAugWoNu/fPUCTS8dflV0oEajfsFqpe72hLJ4i41WG7lzEjsr
 viZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yLzO+mhpock4isuB2IsQekcsQw8IgjG2LHCOzoZJobQ=;
 b=jihWiCNeJUwppZJ+GKdMxcDQru0tRV3ihDFD9KUBJkUPV4Lb3veBUcAWTZk0sH43wQ
 wkzFObQ1p74ZmFul1nL1t10GAPkqUY7gXVqeNxkvfpkl2iViCVtKn79yq/tC65gAZPd2
 Dce20qKX6rM8mL6t8NKHRhUKsDRUKRjFSpYGunuSebgCHUDxs2wtZyv6slIAgoZNd51X
 zjnczNnSoNVwQBARSnirZafjVRjX1kICohh4JEhT9yOzExm6k2PYr2rlIjj99Gkun+y+
 bxZUvWZRMNP7Qry6o/InyI5A209e9Tj/tY9SXaNdwj4NhocujNrNMP/8VwAcLv8QRpwJ
 WEnw==
X-Gm-Message-State: AOAM5309CAWklzUyvEt7OKUTmI1rc3ypxfERCLqQHRKSp3SCTLgXNsXI
 fo20xleqWMSe3F8fDeyfykrgXIRAXJFY3baWHGketA==
X-Google-Smtp-Source: ABdhPJyQsyNrruP0k6HlD/UAfri5LJrya3GM+V5ZaCtWiHEXfxMaSKcoYsR4cwC4T5aNzsasT7yrec6xA+glzwmMjUg=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr5919485wrw.376.1632830850519; 
 Tue, 28 Sep 2021 05:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210927172626.2026308-1-philmd@redhat.com>
In-Reply-To: <20210927172626.2026308-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Sep 2021 13:06:36 +0100
Message-ID: <CAFEAcA_F3z-hhen3C1GiJGW5cnAZH7PvGQuWY6YOvj5kZoZaPg@mail.gmail.com>
Subject: Re: [PULL v2 00/22] Integration testing patches for 2021-09-27
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

On Mon, 27 Sept 2021 at 18:43, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> The following changes since commit de8ed1055c2ce18c95f597eb10df360dcb534f=
99:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-25-=
v2' into staging (2021-09-27 15:03:42 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/integration-testing-20210927
>
> for you to fetch changes up to 4c5fc0c5fc496c147adb15536e4ac808feccf2cf:
>
>   tests/acceptance: Test powernv machines (2021-09-27 19:21:37 +0200)
>
> ----------------------------------------------------------------
> Integration testing patches
>
> - More Linux kernel record/replay tests (Pavel Dovgalyuk)
> - Various fixes (Willian Rampazzo, Cleber Rosa)
> - Split machine_ppc.py per machine (David Gibson)
> - Add AVOCADO_TESTS command line environment variable (Willian Rampazzo)
> - Test PowerPC PowerNV 8/9 machines (C=C3=A9dric Le Goater)
>
> v2:
> - Added missing test from C=C3=A9dric.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

