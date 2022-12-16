Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4103664EB2F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:05:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p69S6-0005n5-5Q; Fri, 16 Dec 2022 07:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p69Rz-0005lX-4T
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:04:32 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p69Ru-0000pX-Bx
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:04:26 -0500
Received: by mail-pj1-x102c.google.com with SMTP id u5so2240855pjy.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 04:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xXITDvwQ4IVkaInDt6pKeacrlDIAozIgV5/lO+uJrcA=;
 b=mmfxaw3aRckaPt52A+7jWFo1Ch04ZFVnuDg4W9k2GK7woJ5bxfvI+M0uXYj70KoB/k
 ic3j3j+K4tlJkDqgdJERI/ZhgFtk7Z96bV88HXmXsLz+QN+tA0DQSVCklPBUg7ihRzT7
 jx2nV/bWtanMvuCJ1d4T9PRgPfoCTnnDtKih825Omb1cb5sJUhnBCdtTR3wYL2gCjoS/
 f8YLD+4tFl4Iw9lWgKMp4Q9F0mPWfGpiGRWggsh9TslvicWIZJHul3abqqDA+mqyVEhd
 yVEve4a16Df/zBH7Tk5arv32Yv3iTMfEKX3xDt8R72it7ue3X4UQl+Tvo1Aw5GdXAwws
 0vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xXITDvwQ4IVkaInDt6pKeacrlDIAozIgV5/lO+uJrcA=;
 b=07t1EhTYhDnpePZNr2ncs5AEmyq896oH5kkijpdQv9CzK+7VraW6rkwVwh5FVzqUFA
 46AZqylPav3N4xTWBbYPeBWPnpbCD5xvhHilJOvkUtpjpVBB0DjKSOoTXuFQPGTcyGJj
 0iugNwbtqakjfVublgPBXQpPmLIi3bHo31hYsN340QZZiF45RHl/vMWo6AH3uae5QrLs
 qMtI2pbWQKWUK+nIA84Pzm1063ddXt7pIKV7S9jhoV7E3/yYo3rl5nMtaIERHbXkTjEj
 WBYjP5BVW3yjaTwZhGGm8gHLkmBG4uoLCAq3izZHT6Ci7RdLy/yo6Vq4pvM++j8MCJmo
 wEnA==
X-Gm-Message-State: AFqh2kokt7XaG5gJ+NWz+skZtOsrkK01wi3GPIfQ9gU6CApCeQjhmB3r
 jWif1wJCXl5v5KfdEt0wXulmmWePbcdXac/CriQgBQ==
X-Google-Smtp-Source: AMrXdXvW56t3mvUlYkcbvf8bgGEJGo44M+9Swr7Kbk9ajTCFbSEkTDIfuFPGnvzyGxeO+WY/DxcFVN4qsZJRp6oWcW8=
X-Received: by 2002:a17:90b:4f8d:b0:219:9874:c7d3 with SMTP id
 qe13-20020a17090b4f8d00b002199874c7d3mr588183pjb.221.1671192260728; Fri, 16
 Dec 2022 04:04:20 -0800 (PST)
MIME-Version: 1.0
References: <20221215151215.414567-1-thuth@redhat.com>
In-Reply-To: <20221215151215.414567-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 12:04:09 +0000
Message-ID: <CAFEAcA-GqHTyExpzgXO-3mKop4aQ7b3rnaAg89sdWERAmvqE3g@mail.gmail.com>
Subject: Re: [PULL v2 00/23] First batch of s390x, qtest, CI and misc patches
 for 8.0
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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

On Thu, 15 Dec 2022 at 15:12, Thomas Huth <thuth@redhat.com> wrote:
>
> The following changes since commit 48804eebd4a327e4b11f902ba80a00876ee53a43:
>
>   Merge tag 'pull-misc-2022-12-14' of https://repo.or.cz/qemu/armbru into staging (2022-12-15 10:13:46 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2022-12-15
>
> for you to fetch changes up to 4bf1b66908a21a8271f261fe533e4fe3f416f3e3:
>
>   tests/qtest/vhost-user-blk-test: don't abort all qtests on missing envar (2022-12-15 15:19:24 +0100)
>
> ----------------------------------------------------------------
> * s390x PCI fixes and improvements (for the ISM device)
> * Fix emulated MVCP and MVCS s390x instructions
> * Clean-ups for the e1000e qtest
> * Enable qtests on Windows
> * Update FreeBSD CI to version 12.4
> * Check --disable-tcg for ppc64 in the CI
> * Improve scripts/make-releases a little bit
> * Many other misc small clean-ups and fixes here and there
>
> v2: Adapt the query-command-line-options" patch to work with the
>     recent changes in the master branch
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

