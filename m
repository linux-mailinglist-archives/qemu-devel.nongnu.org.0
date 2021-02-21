Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744B6320A15
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 12:50:16 +0100 (CET)
Received: from localhost ([::1]:36436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDnFf-0001X9-CM
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 06:50:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDnBV-00009v-S9
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 06:45:57 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDnBT-0007sD-RP
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 06:45:57 -0500
Received: by mail-ed1-x529.google.com with SMTP id d2so18170986edq.10
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 03:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9NF4rRrQiVd0HTSdYjdRUsptQOl1hrHxP2RpjkEfQuE=;
 b=pPtVBBp3a1frychJrPOiT/ZiAfOC58zGhXuhmCTGC+1LgVPJyh79eCODOPsebFbIcH
 W6d5h73YdK1GdzluSWLnmoaaONGBcryXzkZ4phduwicwgxqFo9OdWBcig4FURQqrRqKT
 u1cXYqgVTF78MM30ayfmKhrq/sHtGpCYAEZyvJ55BLbh0iiqiAoIfuwKT/CJVRJGOpHX
 pyxuSIQcgOQ8UxV3Acvvz33dZjWp9iAmpF38WAV1H/Xdhz/77veXUpp2q59iztWevXBI
 FJuQAym9OXZWPayc9UuH6KfzSSULHo8RFtZtfC+PiI/ywdWdNpnNaUC+0DEZTd5dxue4
 KuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9NF4rRrQiVd0HTSdYjdRUsptQOl1hrHxP2RpjkEfQuE=;
 b=NgliMgTQ5WRVm5BG53/xomoLF0CWoZ+/GIm7T13Kt8ZVZpjOiHrJeCEc7tefRUKgVd
 WWBqnguUVKJs1wd5uu4TZeT1v20k5b9M6qYgfojArcrvnEQWgMSYFfb//PpdmO4UXfMZ
 YUxFoOthkgLyXHJxfATwQqpD/musDiqsypgLAkwpDyuybEqoc/qx21yA7P64L0EDU//p
 HYnyVQouKceAgZ3wTJgfuwYIpE3B6fLe+Q77OWrm6beebpWNgCjZ3Mlh0rCoPpw/KsDn
 IgeFopiTiYZjcdzUdh+LDAhn+W5bOJLWsIZEVCbNoaViqvkAucp7AVrZ2gx4MCaEAm/f
 07Nw==
X-Gm-Message-State: AOAM533SZWXrZLB4qezm77dKgu7bUMf7PlrtXKcm9Jh6oZ5wHdt53cXL
 Hqu0WI+9dzsxr5lRjFE7aUpmAkNaVZ3FN23icdApRA==
X-Google-Smtp-Source: ABdhPJw3z5g9vzmDdQXlfJYy9X3LiFpGkLaBXQab5mLJ8avg5rP/JtV0NQa1aeYWChnNNd/jVxBLiybkqiRaZ8ytuZU=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr17301530edd.100.1613907954291; 
 Sun, 21 Feb 2021 03:45:54 -0800 (PST)
MIME-Version: 1.0
References: <20210220001309.2225022-1-f4bug@amsat.org>
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 11:45:43 +0000
Message-ID: <CAFEAcA_T24_j_pN0tc-2WxH1eFVYW95EpoF=asrSEmpzrkSeUw@mail.gmail.com>
Subject: Re: [PULL 00/18] SD/MMC patches for 2021-02-20
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Feb 2021 at 00:15, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit e90ef02389dc8b57eaea22b290244609d720a8=
bf:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-02-18'=
 into staging (2021-02-19 17:22:42 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/sdmmc-20210220
>
> for you to fetch changes up to 3e0a7693be30d6a6eda8a56f3862ac2e502a9e81:
>
>   MAINTAINERS: Add Bin Meng as co-maintainer for SD/MMC cards (2021-02-20=
 01:08:59 +0100)
>
> ----------------------------------------------------------------
> SD/MMC patches
>
> - Various improvements for SD cards in SPI mode (Bin Meng)
> - Add Bin Meng as SD/MMC cards co-maintainer
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

