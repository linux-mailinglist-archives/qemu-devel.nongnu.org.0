Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7777C40B7AB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 21:13:18 +0200 (CEST)
Received: from localhost ([::1]:38446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQDrp-0002Fm-DG
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 15:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQDqT-0001Us-9X
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 15:11:53 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQDqR-0005L2-Dm
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 15:11:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t18so34554wrb.0
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 12:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qxXWCjXMrKW4EdvEUQST0G7Z3Vxm3pEumVcLrpId/HU=;
 b=kZD9lCu23I9J44Dm7t9b/g+igIm4Dj2W8w7kayA+kaYC/9oOk56b/e1n3eog4D0hCC
 ztUzwkB7GXpRp4kMgN4p4vmCd8cyI1tLa/J9ynwiNE2G0K3Wl1PO6oh+V39bIYCUn5y4
 BnIbjo1h2WOCN5WPqAebZzWhZPtabc6zZOz8UQ3SjzbmkJq3hydIHhdDpkt1hSsT9pk5
 0ZLkq6HkBHG/PBBH7S33Uh/KV2NnrVyme3XOAce/ZDfNiYF0MWqtTDdiNATOYB597Vh0
 hXajWTFgQALLybdhWZz8yyArICHrEMwSvs208S+3Xpiaa2eatrFOEZRC5Ho/EEj6reVB
 76Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qxXWCjXMrKW4EdvEUQST0G7Z3Vxm3pEumVcLrpId/HU=;
 b=YfTp3n9iYq3P8Md8Pank3DfAC8QUffv0e+3+guvDaA5lNv1oIeaK7r2y1sRklw5Lpx
 K+eBdArzxTGsVEGw/iBLxi0Kd/fN6PsJxuyOSZsvi84wMaDL6jrf3HPcatE5AytgX7Pa
 iT7PUK/NnauMlgLOb9TfXQ7OCJOBSezaO+KCgOPqHECiIDAbSU63ClGSMlLXQvnl0g6s
 JfTk1RzT+WG7vDfYzUScz2OJjaAxkyinkW4ABc7zybIlFiqLYeDEdvpTeU01B8sncXbz
 kChlxRjJBQsfdJNhY0aJbeAgBbdSC9asUq8OgCv1eeU5dpc5ec5DzMtaBhPCsBKG+71Y
 bXVw==
X-Gm-Message-State: AOAM530X9G2BJRogDpEJvHy5q35ZlRFC0t56ZP+cjcaoseAToqe6CK2a
 iA9JVoNIALJxnr9+AErAEIUkiBQiaqtgd7t4sep+JQ==
X-Google-Smtp-Source: ABdhPJycbBGXo84phWB9PaigX+vTCr1s4h54d0Dd0RLBq64BZaf5Nz0ALxeOgNiXpcHUqBRlSPSpZnwGKhRIxHyG6Ag=
X-Received: by 2002:adf:fd12:: with SMTP id e18mr767060wrr.275.1631646709957; 
 Tue, 14 Sep 2021 12:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210914130128.298226-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210914130128.298226-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 20:10:59 +0100
Message-ID: <CAFEAcA-TH6pumKzoyXvAg6WeEULF-X5V0aTxwm4W2Q9S-H_5gw@mail.gmail.com>
Subject: Re: [PULL 0/5] Misc patches
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

On Tue, 14 Sept 2021 at 14:01, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit c6f5e042d89e79206cd1ce5525d3df219f13c3=
cc:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
10913-3' into staging (2021-09-13 21:06:15 +0100)
>
> are available in the Git repository at:
>
>   git@gitlab.com:marcandre.lureau/qemu.git tags/misc-pull-request
>
> for you to fetch changes up to 78e3e1d046e64b86e8c9bf3011d5a2a795b5e373:
>
>   chardev: add some comments about the class methods (2021-09-14 16:57:11=
 +0400)
>
> ----------------------------------------------------------------
> chardev & doc misc
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

