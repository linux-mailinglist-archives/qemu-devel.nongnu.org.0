Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8ED337D20
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 20:02:04 +0100 (CET)
Received: from localhost ([::1]:44812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQZP-0005ss-7i
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 14:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKQTA-0000UG-4J
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:55:36 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:44025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKQT0-0001pg-RU
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:55:35 -0500
Received: by mail-ed1-x52b.google.com with SMTP id e7so4397708edu.10
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V4Y3RzYqbumd5LZEz9u72t0cfxuDn7uQjedkdu8KLrE=;
 b=fdM0lsfTYMry17dk9HSJu+2oQsCtMNXUV0LMQcCvSMP6BthIfr+5rLNF/MNV1LBs7J
 abJ5d+6Ayhsg0cUOJ9z3R9QMCFvH7EnWBNsGtbvtm4MqfBZ05hhzQFp8QRytOt9oxHy7
 HSu9MI79y/+TTKi90XG6M+H/CCV/ViYbYVEQtT/lCwZyAyu28FGZT5rSMWjcuD2a47FQ
 BJnOt9gdADfrQWmgfaADmKyuhP2+/6ozI97BgZN1JMmCllT+JG0nGzCp26S7UGFxT3xS
 S8fPSoLhIzNy+a42rJfr7CBm0G1qn2Jz+tmeFmVXo5uvN1QBURvoC2c9JT8ncDPN6pVo
 NOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V4Y3RzYqbumd5LZEz9u72t0cfxuDn7uQjedkdu8KLrE=;
 b=oXZ78AYfa0J/LpWvJQKIbYYIicXeviq/HFSBPjFY1z6K0IyweEcmgmv07XolSwJl/k
 QrdRMf0+937YFRxY3gsACMhduEW/fcYGKpyNFJnJ1gF+Uja858gTkLNUbCighXhByA60
 H+kVNsSHoU6vgRPPb7ePANaJPlNt35RMmr+1je02BP0BQftXtY2S8itROaLXBPXFftMX
 Yj29ZcK8SST/wrLf9ouEKlAqfFhHGNhFAlB8jYB+dGi/UHzM8OpbVSTpQzmpER+xZFvG
 vlEJvYHz4U7EjJwYJ+JUGG1KAsH2/9kNeSjqraW0Er7mv293z4Aq1qpCAOTJAitdX44I
 ek6A==
X-Gm-Message-State: AOAM532/8krOiau8W6MBCCPf5uLqecV/1OlqcrELwwuEYvmQh769IwfO
 TnHKHNGVyNQ6zWol8JMrWmEuwbBgPu/f8sczcl+8KA==
X-Google-Smtp-Source: ABdhPJyGIGO7WHn3YvzFc9rpkl5Fd2s+cQOXGUjbwq+TNEToYqfG4viadIZA7Rn5A2q8Wt5XM4EEKCcncnKnBBKW4Fw=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr9845006edt.251.1615488924887; 
 Thu, 11 Mar 2021 10:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20210310160002.11659-1-alex.bennee@linaro.org>
In-Reply-To: <20210310160002.11659-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 18:55:06 +0000
Message-ID: <CAFEAcA_kJsE5+-CmymRX075uO==WtcFHH_iyojiXF_7Ek_uVxA@mail.gmail.com>
Subject: Re: [PULL v2 00/15] testing, docs, semihosting move and guest-loader
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Wed, 10 Mar 2021 at 16:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> v2 drops the hexagon docker patches.
>
> The following changes since commit a557b00469bca61a058fc1db4855503cac1c32=
19:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into sta=
ging (2021-03-09 21:31:18 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-docs-xen-updates-=
100321-2
>
> for you to fetch changes up to 8df9f0c3d7f53c5a123ebb873d1c22daec003c22:
>
>   semihosting: Move hw/semihosting/ -> semihosting/ (2021-03-10 15:34:12 =
+0000)
>
> ----------------------------------------------------------------
> Testing, guest-loader and other misc tweaks
>
>   - add warning text to quickstart example
>   - add CFI tests to CI
>   - use --arch-only for docker pre-requisites
>   - fix .editorconfig for emacs
>   - add guest-loader for Xen-like hypervisor testing
>   - move generic-loader docs into manual proper
>   - move semihosting out of hw/
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

