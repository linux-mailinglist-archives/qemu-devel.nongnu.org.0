Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D292B915E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 12:51:36 +0100 (CET)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfiTP-0004R4-DD
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 06:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfiRl-0003nr-3g
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:49:53 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfiRj-0000Uq-Bh
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:49:52 -0500
Received: by mail-ej1-x636.google.com with SMTP id o21so7495529ejb.3
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 03:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vack5qun4bfePNmEf7xJCbbib05vWumREb8/lNHmWA0=;
 b=eQxP69ZmWR2lXW8WaLi1XFXtieUc5S7yyntAl1EIQAxMB3L33/6dla7ysCJX5lDimc
 Qv7hHWy41XYoPC2igUo8X9Mnr8Ox2dhupT9nbsOrXX4T5692V5sYrwv9d7LUQvezLB7E
 yJme/kdjzKMik9ud8CTCeVZ3I6bNid+SKCnPE1rTWxuXlz+qQ1Xx6gxCQyD+yl8W3+fG
 Z91KWnSk2rHkNzzahVX/EOrYKyh2v6iz79QOJHqFn/iJQtRqgreEoCl8Yl7s7n2rRFNj
 vubo4D10b/dz5VOPgcODkXsSQ8Ov2MlL8c1sgWxfWZChrDC+0y5EiHNpZDPz/Tq0IN3z
 BIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vack5qun4bfePNmEf7xJCbbib05vWumREb8/lNHmWA0=;
 b=j2QMp4Vufq2S3epXjpB8vCG537xktlmu1WDltnE9d3toW+lKl2lU60LYYZWqhlO8J3
 ZsTHXGykTmPJ1dT9v60R1EvAAf/lbiCQEM6qsyEpXmm5fKtewKWwxebyshFQ3biEF932
 F0GhUmw+fNqlpKWkHUOxA/fsG/Nb7C6vBShvekjTBfrY7B5C5vEeE2D70jpIKjUL8VK5
 MXnv+g7bNq2vnDwfsS2wzLRQBsY5oCFNnYy395jBwNLIc0xee1OTaJ+jvsIM1OTVCwRo
 MR7wiYlL7WqsBhDhWOzz690MpZaJhNt1mu6vB4dTRyz9TS4YE1mBvC8QfpLUp1XrYRmj
 vdqg==
X-Gm-Message-State: AOAM531oAy6Fa4Y/zk9FbCirZ4Rdpm4KoQ/ktZHZWSU3jTeso/vHtW90
 odGOEZcbJ5HwPgbpxO09nbBXEy/eMSbtW4JuTlhQ6g==
X-Google-Smtp-Source: ABdhPJyhSQgisLeOHHEdzVzBtYc8BJjzrDWRjmF7gdEbhrqMLC1fDDjYSuB5nZqRdMLzE3iSp00J0GZq3YMpNq4tlS4=
X-Received: by 2002:a17:906:c084:: with SMTP id
 f4mr13971066ejz.4.1605786589397; 
 Thu, 19 Nov 2020 03:49:49 -0800 (PST)
MIME-Version: 1.0
References: <20201119102325.1314765-1-cohuck@redhat.com>
In-Reply-To: <20201119102325.1314765-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Nov 2020 11:49:38 +0000
Message-ID: <CAFEAcA-KUUDs2E0QJZWwJTurJ_bS+Bvo55dt7Qj=d4j=LW_kFA@mail.gmail.com>
Subject: Re: [PULL for-5.2 0/3] s390x fixes
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 at 10:23, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit b696f2c6ba8c92ffb5eca49b88a5c7276d0a3e1e:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2020-11-18 13:42:42 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/cohuck/qemu tags/s390x-20201119
>
> for you to fetch changes up to a4e2fff1b104f2b235ea2673968d0b0383f541dc:
>
>   s390x/pci: fix endianness issues (2020-11-18 16:59:29 +0100)
>
> ----------------------------------------------------------------
> s390x fixes:
> - fix propagation and reset for the new diag318 call
> - fix hot-unplug for vfio-pci devices
> - fix endianness issues in zPCI (regression fix)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

