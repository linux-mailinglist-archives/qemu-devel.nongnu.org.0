Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8325346DEF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:48:33 +0100 (CET)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqlE-0006Tv-Se
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOqkH-0005u9-20
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 19:47:33 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOqkE-0003zk-8s
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 19:47:32 -0400
Received: by mail-ej1-x630.google.com with SMTP id u5so29920648ejn.8
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 16:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rvuDAPRIXMQdRTBoP6Yt5pUsWnPTgWMD9PpvxX5pvqc=;
 b=L6m1xjEI/UW/G69sw4vJyXi5p0Qa6qv2S7E+c1BygcMp7PFSCF1ebLzC67wlgvSaE/
 Y0qZVZjpP/FX9UbW0ku3xBossm381woF5DHfor52iZ1cBw6xliJwZqfqKv3K0BCkz8dQ
 fcZV1GyNWDTErUEyHmXZpYcvrkbL+rMkLHSC0p49cAGmT2BJZAnF1NQRng8etHKsx+Wj
 6IekkDy7v2n032cP8NoBexZiyY1IRWzZBo6LkBZ6VlJJetIdQ580zRIX2SmRLhC5JkH+
 bnCLcy6HSyHiHsz4SM4fhBVPaCbdyzs1CWoXX8WHhgLgIjbBMlnkzaRAl5SFfTb/piiX
 e4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rvuDAPRIXMQdRTBoP6Yt5pUsWnPTgWMD9PpvxX5pvqc=;
 b=AZ3BDGroZ/DmULbu5284G7phba1+6BPQGOLk4LD/8TnV7ZYBYT9es4eP4x6Q+QOgTF
 Eq49x7RS6dNayjfUfJS/rirb0p9KBK9WnhvRQJujdsYgRxQT5+EGOgsyF1VvlxgqIxBq
 r5wf2hsOTc+eiHTQzJBOIGQZTZEgn5dEx0gQiF57EVhwlABqBEStxH/G+12NpWCXOIX5
 eJ83nWz/aXwN+dIYp0d4N/YiOteNWOa3Fqb6PAYLCHfYsMG3lY0073JsZELm7BjakWPd
 5i8MNnEPsVXw6UOJifFTkqeavrAs1+N93zHj6NGAc5BohDlFXEi0fkoEIAXFNP7W9R6z
 RIbg==
X-Gm-Message-State: AOAM5327TKmF8nPvmte7JA0CYbubh+J9+rjt7IpSlYAKXgHKTVEVLUuL
 MceezBizCRoNayy87Brj1/QmqNqrw2BwFKZyW8WclQ==
X-Google-Smtp-Source: ABdhPJwxcZyORZxhj09ln0Ok617ryOdzRZgNqQXrvisKuBatC0X//+CrpCnv4fNWYEda6l2yzQ5S2OpSAZlGUe34TPM=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr657864ejc.407.1616543248730; 
 Tue, 23 Mar 2021 16:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210323215658.3840228-1-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 23:46:59 +0000
Message-ID: <CAFEAcA9271JXDsTqQBn6MJjZ=Tj3G6r5xDdqEzE3sNCW2uiNUQ@mail.gmail.com>
Subject: Re: [PULL 00/29] QAPI patches patches for 2021-03-23
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Tue, 23 Mar 2021 at 21:57, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 9950da284fa5e2ea9ab57d87e05b693fb60c79ce:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210322-2' into staging (2021-03-23 15:30:46 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-03-23
>
> for you to fetch changes up to bdabafc6836edc0f34732cac473899cb4e77a296:
>
>   block: Remove monitor command block_passwd (2021-03-23 22:31:56 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-03-23
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

