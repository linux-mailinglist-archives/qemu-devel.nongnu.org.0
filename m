Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB0665DAA6
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 17:48:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD6vI-0005lo-7R; Wed, 04 Jan 2023 11:47:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pD6vE-0005l3-I5
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 11:47:24 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pD6vC-0001s5-Kx
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 11:47:24 -0500
Received: by mail-pg1-x536.google.com with SMTP id q9so5649012pgq.5
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 08:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vS1WkGSN6euddb1YuoT/joE7wrkmHxgeqr9YUHsFlM8=;
 b=PmMbKaoASrDYAOPfRy8030/HZrShXm6x+mhJasM9vleKP2cgUuo9do9j+QdlBaC2gd
 aqsq5VYoY5FcPAV7O0QmzCXH4VGMfUJyYCBfdfpZNsr0jcW/JsoJnN3nwmCsa+LkkRRk
 8Hq72JqXmNyRBAoDcYlH5JoA6zjhxQKfkTz1aGvziDf9Fa2EsDqVf90PPHxvTeSE1spo
 i2mwDWuq8h2RmDrgcnSuSTKfW0v7Q4MHEV1bmrEsJXXCeEa3+buH/AuzHoXnPXr01USk
 hIPyzPKAvVnqFyQ8aL1aATyHO9XOT/mjaPeVWNHrYbKBwH60k4IicQuYg6oP6fnrBe+2
 GqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vS1WkGSN6euddb1YuoT/joE7wrkmHxgeqr9YUHsFlM8=;
 b=F8ZEOpsxTVyk2ZB8M1pdNig1/1DDTNOgnGCMLBFhcCyfxVFRbVqU5nPaVbzVaHFzgs
 5h2J1L8CDiaU1gEd4hqbxs79TV35wy08UJkzfR5p0Xo5UTFJDPXyM+mJgEzgIwNHDWFF
 Iwx5J8fwst9q57ZQ9ovQ7Y0ciQbllNDM+u3kOzAFXy5szAGLuuxFLH55hkTQw9SeWy2O
 gclApJKOgGn/HE8dwvJXL1eoN1wkNZyLpfmf1nVjn84aXoGacDHluCTH+9r6U80mSl7u
 /EiLdFkppjh5d2ilftp//zbh8VHrH50rTvYZnnALk+cGWI4Kw30xUJdwSGwGIKllbRtN
 mXag==
X-Gm-Message-State: AFqh2kpo+Lpe6YHxAfC6/s2PE9sV1dgN6wy3o3eEYVMF62gTUHfH5yND
 M4ARkhkkxLGG6fc26zhIkSyNqNuRso9tCpqhZY0CPQ==
X-Google-Smtp-Source: AMrXdXtE54mNZubMUSxGgdU5hDGV3n9lQeWlKLutpdAwxSOmcCSNja35EQsGFJwBDAYxfMfsOXu2pWz2GYAavk+X/bA=
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr2158475pgd.192.1672850841039; Wed, 04
 Jan 2023 08:47:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1671793476.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1671793476.git.qemu_oss@crudebyte.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Jan 2023 16:47:09 +0000
Message-ID: <CAFEAcA8VmM_smB_Tgv3GSYYdBKEYxHBvLDfVcrnboxfU-Nc=_g@mail.gmail.com>
Subject: Re: [PULL 0/5] 9p queue 2022-12-23
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, 
 Bin Meng <bin.meng@windriver.com>, Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
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

On Fri, 23 Dec 2022 at 11:12, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> The following changes since commit 222059a0fccf4af3be776fe35a5ea2d6a68f9a0b:
>
>   Merge tag 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into staging (2022-12-21 18:08:09 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20221223
>
> for you to fetch changes up to 6ca60cd7a388a776d72739e5a404e65c19460511:
>
>   hw/9pfs: Replace the direct call to xxxat() APIs with a wrapper (2022-12-23 11:48:13 +0100)
>
> ----------------------------------------------------------------
> 9pfs: Windows host prep, cleanup
>
> * Next preparatory patches for upcoming Windows host support.
>
> * Cleanup patches.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

