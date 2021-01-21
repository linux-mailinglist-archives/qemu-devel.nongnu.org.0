Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E992FE68F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 10:42:12 +0100 (CET)
Received: from localhost ([::1]:51282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2WTk-0005cy-22
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 04:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2WSf-0004fc-5J
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:41:05 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2WSd-0000aK-4o
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:41:04 -0500
Received: by mail-ej1-x636.google.com with SMTP id rv9so1633565ejb.13
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 01:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RotmlN4HxR8MpSb0A7qOvd7xoreDQyO2ZGtcSX4l79k=;
 b=QCZoZSNCRp3SGYChefRAQ3uZkqXTj0jxsadc5Ad/GicKXmIhp/EPBBZDcwP54G1ysg
 iiwjsNuMZTkht6U2+JrT0WPG4CEVtzj1EMOTujWvo7me6PAO88b7z2hfmkpnZrW3tJJ3
 m1EyAG2ShoD+roNhIpJs11e/lF4kAbJybkiDqp0/a2qZBw7Gq3tSwgkn5SFBQ6gr2Jbg
 g/9S5PbNbkFWXXR/2Zd+3kAciprCo50mzKJaJSywtZHtfGxfo1JW/CRn7udFCXNFwKfw
 aq3NQKld2dDQJGBO0BLDAn8Fvt+SD8qRBOvqcvGO49z0oeAUnnayuDpjXd7dWxstdXEW
 gO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RotmlN4HxR8MpSb0A7qOvd7xoreDQyO2ZGtcSX4l79k=;
 b=uHZxx2Nr89uxBJhQrj7FJsDvkfqs0eJR7oC+cOwddT51MayXSggk9rDd4PrvWdUkJB
 hCvvtJ1iMs+pbrFzDr6miwDb7iSXE+CZyOiuYKjsm3Srm0eS/jxk5Ik5wPoGTlev9zUP
 /81mHI190qjzRunEsSUaNQguUBghdq56Fo5203fe5r7FHHEo4Yv2+PNYi8rGIfHIbucF
 U4Cnm26yz8g0a0yTT2egXTbCa3zZEEpAf4rOvmsSjpCx7ZhAQe8riIZeWDk1Tg1KG0l4
 icA81QGiwDeoKh/SNzduKUrk460VRabzji0Eojc4ITbOLG9ktCAvGoaGXFwz0ZqyGcgg
 wktA==
X-Gm-Message-State: AOAM533QxXx9W2TeoXz3qKO+IbfHMfn/RqEQtX9vFyP/0aBeOEcey8ya
 mrltuUWB4voMNLTLDYfBo2XXwmubRcogNHj89UwHNw==
X-Google-Smtp-Source: ABdhPJwQTujJH8OFTbhKaMF7F1qwVwkDxjIQZO+X1HWVpvnqvymnH/eXsfvknpb3EpkxCDdHPmbnS/FPZtWnvwhf1Qg=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr8764997ejf.85.1611222059132; 
 Thu, 21 Jan 2021 01:40:59 -0800 (PST)
MIME-Version: 1.0
References: <20210120151751.520597-1-thuth@redhat.com>
In-Reply-To: <20210120151751.520597-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jan 2021 09:40:48 +0000
Message-ID: <CAFEAcA-7Ko=JLsboS4Lg57G0VYhyxBoBhiGc_QOFZSLYKhDQaw@mail.gmail.com>
Subject: Re: [PULL 00/14] gitlab-CI, qtests and misc patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Wed, 20 Jan 2021 at 15:17, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit 48202c712412c803ddb56365c7bca322aa4e7506:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210119-1' into staging (2021-01-19 15:47:23 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2021-01-20
>
> for you to fetch changes up to 4251dfb082f6b81c382e69ccd2700fcfa7d7aa82:
>
>   MAINTAINERS: Make status spellings consistent (2021-01-20 10:46:54 +0100)
>
> ----------------------------------------------------------------
> * Fixes for compiling QEMU on Alpine Linux
> * Add Alpine Linux to the gitlab-CI
> * Some small fixes for qtests
> * Updates to the MAINTAINERS file
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

