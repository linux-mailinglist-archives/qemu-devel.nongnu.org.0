Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E572E3B420C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 13:02:25 +0200 (CEST)
Received: from localhost ([::1]:50668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwjbM-00028c-JY
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 07:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwjZH-00018s-Cr
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:00:15 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwjZF-0000zh-0O
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:00:15 -0400
Received: by mail-ed1-x52a.google.com with SMTP id t3so12808827edc.7
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 04:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P7V3YH/kukA9NGCmw2nzgaiMD0XrcoOgyTuoVXVa3xs=;
 b=Svg4NVNByDFtLg5UcfG+o+zbJuOJ/XQGVwB+1+PH2pCv60kWjBDo5VVIRj5T7hPVSm
 r3h26HCMaYpptX41P7rns7JRHYnIRR+tg1XIKfutI2+Y8hJFI+MFRNTkXVK5GxzlTnMQ
 YeoSV3spKUT1BD4IxN9iHF4dRHeQix2vrl81n0VS4ifbmKQo7KJAG8iW+G/l1pHc2nV7
 OY0TaaR/DUzw+3kLkNHqcopzxD8rInbn3lCIwDQOiobPEyJELWfxREv8ccsfrPE1dze+
 Y5/JZf6WiXjERKrh2TP+3T/h7BXCmH94ogluY9ulqa3KXtYcs9Cq+5w2fCWp1WIHW/dG
 2ZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P7V3YH/kukA9NGCmw2nzgaiMD0XrcoOgyTuoVXVa3xs=;
 b=dKS95xUFM3h5uxyrBGqfPtrj6a+5Aa7+ksY+2IYYPnd4f4xtC1u/WRGzgjDbTOcovM
 IsFDlRZCuZ6HRFay4CcUPCuR6m1WQZOaOw/jFZA6MuT+8EDGh3POft7kUMuclPwVOaRR
 ely/1UVi2LDnC2GVWddaBuO/IKFHr/uH3OFTYigUewPglCifLC6KBttYZiZnvvoDpBu0
 Yd8FG201g1gZ0AbTeytiCpiLoeMVVeYpt4c3RBGjVpQhoFSwOJgTzGSealJirGtpljIN
 Bnp1F7s8X8Lu6DzDo5NmE5Vqjoq2Pp2SYwMmZH4ZGp01LZ7GpDWv9bGy8MhmHfyxuM1I
 rTZQ==
X-Gm-Message-State: AOAM531TgTPBC307alc2HaHLI/4CHMGSYlVUHNdGkrF2Dp2czGX/WRqg
 dPgDjuCQE/tBY9ocLYqe3ORgqftaRYz3IdETuUAjGQ==
X-Google-Smtp-Source: ABdhPJzzpeD0d+DUgn0i99qhrrO1kTIGBj1S0q+mFi5+P54y3/WLxCAb+ffSIunHeWsbLae16Q1TDk7XKKh1gcHqTbA=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr13691883edz.44.1624618811113; 
 Fri, 25 Jun 2021 04:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210624083246.2297440-1-kraxel@redhat.com>
In-Reply-To: <20210624083246.2297440-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jun 2021 11:59:34 +0100
Message-ID: <CAFEAcA8QdekRN1hF2aPi9f09v+14ocP2u_VT8wiwqTzaOfQSiA@mail.gmail.com>
Subject: Re: [PULL 0/5] Ui 20210624 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Jun 2021 at 09:32, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit b22726abdfa54592d6ad88f65b0297c0e8b363e2:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-06-22 16:07:53 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20210624-pull-request
>
> for you to fetch changes up to 66c2207fd28a6025792fbb75151ee848b911dc35:
>
>   ui: Make the DisplayType enum entries conditional (2021-06-23 14:42:30 +0200)
>
> ----------------------------------------------------------------
> ui: better cocoa integration (ui info + clipboard).
> ui: add lang1+lang2 keys, fixes, doc updates.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

