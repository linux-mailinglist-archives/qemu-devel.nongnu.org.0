Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E66164FC6A
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 22:21:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6ecF-0001Zw-Uu; Sat, 17 Dec 2022 16:21:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ecD-0001Zo-Vm
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 16:21:06 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ec5-0007zD-0b
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 16:21:05 -0500
Received: by mail-pf1-x42e.google.com with SMTP id 21so3912037pfw.4
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 13:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jbm4RVKfm2BLa3lDN1e+npSXUTuBC31rXakHj7kYxvs=;
 b=i4wVK5XiY4HKtPZy8O/MQFLYbc4x2veuWzV5M3uxU0Re+O4Dn+kdLvCCzzrI67VkOs
 SQcopygjysFbfZkagFWoOGnT2r5XoY89O9s3QegvLJnQmL2Bc1zQtVUCwKfL2LL9AlvA
 qro20olnlXUm+MBN6OQqKPHCZxq++bv2kj++gSHXAVycd874CE857+gx6WiMAO8LBmeg
 xUCW6h9PJltNqAOVPG123TQFB/z5gaLBETSy9G3Y7hT0FtvhjfHyGGPKcTqJYg26Wnwp
 xppocIlNOrxvktdrewn33EiIVIx9zaJOqmCu8iQUrmBbnzJFlm2r+H4+vuaY0gCb7j1K
 6Oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jbm4RVKfm2BLa3lDN1e+npSXUTuBC31rXakHj7kYxvs=;
 b=2WmvsHInzeCXk6tLWWJsqRO02qVp9ENfA+mSpRPE9dFZBKS8y598hbCvUwVQ1VWmF5
 tYMy2q1mCu23jBb9MEhKJocdunARra/CRSCyAPjU/SBOgRng/6dehyIXObdFjzTuqf3Z
 ueQtE/iHyYcGbP+4Y+r28Djb7o134YGs5bjegbwiXxw8if+3PNo2drreVI898jG+avX2
 X0DPTr5ac3u9JSArn8WSYhypl0kGpAS6AN/iDsJ0fzf/hPbx1tEKCjyo+Ij7b6/GhHmk
 bP1NgyyTyyRMGYarIQwq8AIwiQAdINKB3dWWHecTuG0uU/1FXRcshzwxmK0Y2ymQCbqT
 WPOg==
X-Gm-Message-State: ANoB5pnlPXsbDL+oHduEQrN+csl2Z2scgR7GqI3CxhQxl1jkJWKluWDc
 HPQZpp2uSvNws1uYgjmwQHoMtHfvvNaSpPjRQ0aw+w==
X-Google-Smtp-Source: AA0mqf4Gm6ijP6XVXtpUL6CNAewGw8Y+dwgHChC9Wr3QR9SMAq2c/s4l0tQYBquY9DQ6k7Ih2QguSLxMc56Zmw1KTLE=
X-Received: by 2002:a63:c149:0:b0:477:86c1:640f with SMTP id
 p9-20020a63c149000000b0047786c1640fmr1780997pgi.231.1671312053418; Sat, 17
 Dec 2022 13:20:53 -0800 (PST)
MIME-Version: 1.0
References: <20221217090740.522093-1-kkostiuk@redhat.com>
In-Reply-To: <20221217090740.522093-1-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Dec 2022 21:20:42 +0000
Message-ID: <CAFEAcA-c5vXMfmA+_9ZTc-Bsq-hCGHExRhE_SKX8i1_kuk1bCA@mail.gmail.com>
Subject: Re: [PULL v2 0/6] QEMU Guest Agent misc patches
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
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

On Sat, 17 Dec 2022 at 09:07, Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
> The following changes since commit d038d2645acabf6f52fd61baeaa021c3ebe97714:
>
>   Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2022-12-16 13:26:09 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:kostyanf14/qemu.git tags/qga-pull-2022-12-17
>
> for you to fetch changes up to ea5ea85c5894ac220cdb52b3f07c6ad6e4544900:
>
>   qga-win: choose the right libpcre version to include in MSI package (2022-12-17 10:53:38 +0200)
>
> ----------------------------------------------------------------
> qga-pull-2022-12-17
>
> v1 -> v2:
>   removed 'qga: Add ZFS TRIM support for FreeBSD' series
>   that failed to merge
>
> ----------------------------------------------------------------
> Andrey Drobyshev via (3):
>       qga-win: add logging to Windows event log
>       qga: map GLib log levels to system levels
>       qga-win: choose the right libpcre version to include in MSI package

These commits all have an author tag with an email 'qemu-devel@nongnu.org';
you need to fix those up and resend, please. (checkpatch catches this,
if you want to detect this locally.)

thanks
-- PMM

