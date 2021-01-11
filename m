Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F682F1D02
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:49:41 +0100 (CET)
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1K0-0000x5-PP
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kz1Hx-000818-QU
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:47:33 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kz1Hw-0004r1-2T
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:47:33 -0500
Received: by mail-ej1-x629.google.com with SMTP id ce23so829346ejb.8
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7H5ai7q+5Ij8piKUv98iOCkHyc+4BIO8i4DES0Riw7w=;
 b=kfBPzd4Muv3JXUloHCEHamAkGkg+jDoSDPvLSbve+EJ3OypCMKcCU38vBXblGq1HzS
 l1a0Y0c2vTD9zdR5x89aCsZ7JXxNfg7zERNZupxsnSfuogAEAFSZZsu/7A8iIpfW3qRU
 IInkd/amFK2soCTITk1M4YBqGApyFz54Q/xuZK1UyHfXDfQB/ZueJ3FNypSt0uEHDQbM
 zSL2Egxwv9SXb0MIPPE2rirrJ2jlaM/MEDbSpbE5ovj2Yxcj1K0DtKoTDFfRGTuR+btZ
 BNfr35lDLrilOkdQgG6RRzJMChnqoPr/5MYrcjKS5TpCKERE6eW6yI2nQui9UXjh/pkO
 cmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7H5ai7q+5Ij8piKUv98iOCkHyc+4BIO8i4DES0Riw7w=;
 b=YVmJodERGG87hWVkpdXcsGIEiCN3joEh2Vw8hv7ql9ZSasUgvlwZ7MegcpMCX4z7To
 9qdic1hUv/1YVoBPvNqJPTlHgFTS1NKwqDpVz3IdmNMBJzdV5UTjEuZCL+Srhc3D9i8y
 3ECMhMuYJ/1iscahwFiPzu8L7ZrWFyI11qovr+rz27Jlh+YOfKLi0++O6SUXnKy3ltYq
 sYDYo/p+1hp7hmL/q7UlG4Yy+nMWC2VjzLfCq3cYW3saFrfoLO0qfRCLJu7hRHnxVkSI
 Hi+iW7yru4uaV3+Mn+EOV7h4fGMNKoM6pLmuPbvASrBj2g6DzELDD5RWIA/1jDpk8SBo
 UM3Q==
X-Gm-Message-State: AOAM531oEDUl5aasbwaOIF6CeDdNwJ2vuYRX5hrFWjDw45+t0YVmTmVX
 qPqDnSi0sp1GRj8G8zvEg4woRJzwr8UHRr87gIUHNg==
X-Google-Smtp-Source: ABdhPJy49hLLjh56VxYdBNUDvfwluSxUZrnEBsDs1ybRrtPuupVBzcT1Hqki/4mM0LetPYfC7iu5fMEXkLicCU7t3l4=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr395787ejf.407.1610387250608; 
 Mon, 11 Jan 2021 09:47:30 -0800 (PST)
MIME-Version: 1.0
References: <20210111140602.159377-1-thuth@redhat.com>
In-Reply-To: <20210111140602.159377-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jan 2021 17:47:19 +0000
Message-ID: <CAFEAcA-8FQjRpHgLccArXj9ALeErRyFJmMcMsHphi+KT_NOVCw@mail.gmail.com>
Subject: Re: [PULL v2 00/15] Testing, CI and bsd-user patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, acho@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021 at 14:06, Thomas Huth <thuth@redhat.com> wrote:
>
> The following changes since commit 7b09f127738ae3d0e71716cea086fc8f847a5686:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210108' into staging (2021-01-08 15:37:04 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2021-01-11v2
>
> for you to fetch changes up to b677001d70529df271a5d9314440bb201da40acf:
>
>   fuzz: map all BARs and enable PCI devices (2021-01-11 14:59:21 +0100)
>
> ----------------------------------------------------------------
> * Fuzzer improvements
> * Add OpenSUSE leap to the gitlab-CI
> * Some fixes to get our CI "green" again
> * Some initial patches to update bsd-user
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

