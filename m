Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF5349542E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:28:32 +0100 (CET)
Received: from localhost ([::1]:47796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAcAi-0005Gk-2A
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:28:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nAXRD-0004vk-UT; Thu, 20 Jan 2022 08:25:17 -0500
Received: from [2607:f8b0:4864:20::32d] (port=33472
 helo=mail-ot1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nAXRB-0001nX-C2; Thu, 20 Jan 2022 08:25:14 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 y11-20020a0568302a0b00b0059a54d66106so7605752otu.0; 
 Thu, 20 Jan 2022 05:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gs7Ffha53uK3YVT+dSJxUXUTb6+iAMqAz3gA/1VAJtk=;
 b=Ow6DepfZU7+e6RysDwKitLXLpQuRs6Q+U7zOI/q84EsFY96o6RnVHrIV/Kdearb/Cg
 W40+Unr6edD2iWlByJJ3LY5XhOinsVgbPIqBQtw5kDLbHNSAe18ZdoJlc1ixqcI0xcmH
 b9RXvxTcPOX/ofA5Gnoix9/WBKyqWI+swWt89Ef9K9BAGeHmNP28VBzZXmUHBbJ2UHx6
 IfoBnAs/ldyMnxHcQfe0LW/KxBc/D38RiIXfSlkDFMA8xyo3Ta6dsWpgSOwSVaZzSNZ7
 7QmSFLVGAtr3COmy6l4vk/URkztdKiNnMYvnc3lq9psjkzDek8TVRU8ltynPp0/BcT4z
 tDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gs7Ffha53uK3YVT+dSJxUXUTb6+iAMqAz3gA/1VAJtk=;
 b=zmvFl12yPqBhgONAgQFpCjlh+Y6Ebrms6jP7SNGp310Oa1lu6djbQBUSZ/eEHMMuAE
 wDVqhL4z/AYzjsnhFGZXmo5lofqDAHXGHhiMUb74IQG2HpKaFHhJkaVlQtehLIhMUbMT
 CGXWdg17VWKkYyAq3xk6B7GwHmOU1htTboEvKeOpXcLn9M/FZ7OfmE4Bbsj1G1r8A8hx
 SIAkUQ8Au7F41yv/Uk6Hax6LHNx0OXOgQi+/4O3JjpL0FySoyBnpvZ+elZPCA7W2Pusc
 DeG5n4H0mspki+XYwwfTC+XBXuj6xCbuTG/hi3DT4lLS4mN/MhybbEhAjdVV6eq3CHgX
 xj2w==
X-Gm-Message-State: AOAM5302wuj37mvlgGs1ILMTR3/OqNqiTvhcr1/UZK4zVPDH/K9H+bsO
 ZwDRY4QgKmTOpzNH3S1VD0MyHx2Dgcl37quYmuw=
X-Google-Smtp-Source: ABdhPJwnDziYoGw/9MjZuwVgcqoVDuzofJrKhZofmFoEP2eOTR4JTa2Sj7k60ObjOzQXt8UWr0o2wksjcagdbrj5AvQ=
X-Received: by 2002:a9d:27c1:: with SMTP id c59mr26331794otb.150.1642685103338; 
 Thu, 20 Jan 2022 05:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20220114004033.295199-1-idan.horowitz@gmail.com>
 <CAFEAcA96gKH8r_a2aV0bfcOR418WnRkmEsV73Uss0kDEQ2Tx4w@mail.gmail.com>
 <CA+4MfE+nh4LRAbmT2GnNiZWTU=xfmkReNWWTgOhqWLddXdV_hQ@mail.gmail.com>
 <CAFEAcA-MnRazq5GNZSbK_a_LmF3F4dcaJWadR9ni6JeS9wPhug@mail.gmail.com>
In-Reply-To: <CAFEAcA-MnRazq5GNZSbK_a_LmF3F4dcaJWadR9ni6JeS9wPhug@mail.gmail.com>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Thu, 20 Jan 2022 15:24:52 +0200
Message-ID: <CA+4MfE+EGpnXn5WHwCgT+-bE7u7ZOdNqK2bjenuheoskFZqSMw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Allow only specific instructions based on the
 SCTLR_EL1.UCI bit
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=idan.horowitz@gmail.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Jan 2022 at 14:32, Peter Maydell <peter.maydell@linaro.org> wrote:
>
>
> But the code you are effectively removing is never executed
> for the instructions where you're changing the access function.
> If you're proposing this as a performance improvement, can
> you provide before-and-after benchmarks demonstrating that
> improvement ?
>

I wanted to say that in my micro-benchmark of DC IVAC I saw a 1%
decrease in runtime, but I failed to replicate it again now, so I must
have accidentally ran it together with one of my other patches last
time.
Sorry for wasting your time with the review.

>
> thanks
> -- PMM

Regards,
Idan Horowitz

