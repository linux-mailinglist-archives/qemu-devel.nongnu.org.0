Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFCA3FA635
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 16:15:12 +0200 (CEST)
Received: from localhost ([::1]:60332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJz6w-0002I3-IJ
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 10:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJz68-0001Nx-QV
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 10:14:16 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJz67-0004Ki-2l
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 10:14:16 -0400
Received: by mail-ej1-x62e.google.com with SMTP id i21so20426461ejd.2
 for <qemu-devel@nongnu.org>; Sat, 28 Aug 2021 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4V424xuUFhf6+XCY1022UvlV3WOaDvrlZ6vcenGy1RE=;
 b=iR5Q8Z5goL6NFzHs9/GcGUZMnW3NK4g9q/1TvLRmNol8/klBK4zIyYDqzSTcfU5If/
 dbz1H8JkI6YQZP8+q4/nCK+CID3cJ+Bl/2fLHPq9lCrWgaw7pxhC4tiTfyfVGHu8c5rL
 Iz8m0RXEkq8+Svq2lyzn+hu2bzyccwEyKSsgLbCaURYw7148+LciJVekU18/J6FlR4y5
 J4lIBOUzgF1mVZy6iO6rLUJt/7wwaT9qDxwrodjmve1AdzytVoVM3bqNpsMQTk8yVxIa
 BDgEj4PmL832Hs6+q9DR3aPUU6cXa4LWzFuq3DXtLoEDN1oAFaXO1o8ISsB3ssiM3ghX
 OY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4V424xuUFhf6+XCY1022UvlV3WOaDvrlZ6vcenGy1RE=;
 b=b30HqMMEvU+5uXA/NDc5+B/eyFAracOe9Y7pVUbMfCf5V762ImHsfC+YJbiVEhQmTs
 sI9PuaOUq4fazDt6FKNb/66PtKY+9JVScUlNFCjSMLyK4Jz0lDzz3CLAtlX5pQL8SZXz
 8c6ZE6+lailYZ9Kb/mTpASwoTpXbsFUI2xmTdbA7TKaYKcJ5OHxxjCllRvGrcMNj4Qvi
 +0sJ8GATpRUMadrYPkcf95dYuElmfbkb+DlNkCIu9+RKEzuTsYJC+RcqpjBQSwbOJJ/Z
 /jTDkZEhACUEQ+P19maT1OVufeJKxv9hYWpgVTfPSH5MvfXqLRTfIi4T0Q+WaG2wZ3US
 9nrA==
X-Gm-Message-State: AOAM533opU1zHaNDWfIadLNXVl0nwL04KFMR5X14qkvOkC8Qv4JMVBrx
 4Jm3D6dd5KfgCVO2OfQfR6npdBdZD5mkC1/5L9DLqw==
X-Google-Smtp-Source: ABdhPJyaMDDAwoddqmznh+IePLUfvPqMWs9pKxL5kDXMDPHwsgmPSJJQ/zqUL+IgX5JrhC8whvbVcmPBV6idnEanHYc=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr15592609ejy.407.1630160053428; 
 Sat, 28 Aug 2021 07:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 28 Aug 2021 15:13:26 +0100
Message-ID: <CAFEAcA8tPo7Ldbpm=oi1cT+zpHAdQph=AHJBTuYNTP_MLtBevw@mail.gmail.com>
Subject: Re: [PULL 00/18] ppc-for-6.2 queue 20210827
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Aug 2021 at 08:09, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit f214d8e0150766c31172e16ef4b17674f549d852:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210826' into staging (2021-08-26 18:03:57 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.2-20210827
>
> for you to fetch changes up to 0ff16b6b78831240c39cfaaeab1f22ae52c84b09:
>
>   target/ppc: fix vector registers access in gdbstub for little-endian (2021-08-27 12:43:13 +1000)
>
> ----------------------------------------------------------------
> ppc patch queue 2021-08-27
>
> First ppc pull request for qemu-6.2.  As usual, there's a fair bit
> here, since it's been queued during the 6.1 freeze.  Highlights are:
>
>  * Some fixes for 128 bit arithmetic and some vector opcodes that use
>    them
>  * Significant improvements to the powernv to support POWER10 cpus
>    (more to come though)
>  * Several cleanups to the ppc softmmu code
>  * A few other assorted fixes
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

