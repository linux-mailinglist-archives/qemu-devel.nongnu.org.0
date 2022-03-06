Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA724CEB6E
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 12:59:10 +0100 (CET)
Received: from localhost ([::1]:38638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQpXZ-0005k2-6U
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 06:59:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQpWF-0004SD-DU
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:57:47 -0500
Received: from [2607:f8b0:4864:20::b29] (port=35389
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQpWD-0008UA-T4
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:57:47 -0500
Received: by mail-yb1-xb29.google.com with SMTP id z30so12963730ybi.2
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 03:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=moombtcN5es1yJGI8gJ4LsDUMffX0cJpKcsmkr3hzOY=;
 b=eFkm2lbY8FNRJI1OHzkqS8Cf7lMQFB+EVlEWhUhPatp6V8SxQgyNrZWb/bIELcAX6n
 i7dWNmI8R0VdQfR5xBHgDJzfO10XAqQz96vyVezPFLD2p1qmeHYhCh6B+rQW7tb9HNGi
 pW9zTqTdc19jVK7S9tNO3nTE1jc/fcLf8OSEWpHxx4lOp4KpzEzA96pxjRBeYRTq3Skc
 NCw6HAEFKUxDbTctaUb4WMzNZk70UpfPodC2lnwzjP1c0tSekZZs1MraWYz1fbz8KNFC
 juhxtlivof0Rwr/PYGfAoCa/xB/P/KTpmBEX0+ByI/K4l7ZaT3QDVLSXMe70n1BfqZv8
 TLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=moombtcN5es1yJGI8gJ4LsDUMffX0cJpKcsmkr3hzOY=;
 b=hO/LBtCOMBdz3w2EXUAEsYQFDxO93ATfX4CaroiyIzqcN81yiw979Kxmz5LU25L7rM
 eUrrcnyIvARvedwNsbzoGQmokC44LlUq2/nIxAGKojKXeMEY5pmEI7Kh1kxQc3NmK0hd
 QjSOt/dl00TFjrL7onUj7dKFmAFYu8rmMmkLxl0IkyfprzsCk8JAhJcJwgo8pkryP+Iu
 GiuTvEgjolQZMHxS8yFdAjaBCvRKA7wRx9IeV042vXzUDzaCod6UfVFJ7aez0ExKDvwA
 BBYL7cnKA/izpI17yqnRM9rHVWik0foGXB4CX/Basj9WSTcYgMY+6ry4q2/xanw9iwaz
 pKQQ==
X-Gm-Message-State: AOAM533sVUSLe7BA1S226FxNS8gu5TOf/yCRCtU0iIuLa+t8bdDgZpw8
 06UHh4LShKfae5P23IHDg5coqqqp79xaNnZc7hLOciWBIGPgfw==
X-Google-Smtp-Source: ABdhPJyL4+/RARwIY2gaTfjzL8BSWWVa3vCc4XAEEnZ/1wyx2MgAEfren6jwT3i2nThCd0FBulVPNldsl2A4JtH8gj0=
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr4871384ybc.288.1646567863700; Sun, 06
 Mar 2022 03:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20220305110010.1283654-1-clg@kaod.org>
In-Reply-To: <20220305110010.1283654-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 6 Mar 2022 11:57:32 +0000
Message-ID: <CAFEAcA9OFtHs6NqZF=7rXvEiroKPFH3FAQbHkwA4L-5Z7Vj4MQ@mail.gmail.com>
Subject: Re: [PULL 00/13] ppc queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 5 Mar 2022 at 11:00, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 3d1fbc59665ff8a5d74b0fd30583044fe99e11=
17:
>
>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request'=
 into staging (2022-03-04 15:31:23 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-ppc-20220305
>
> for you to fetch changes up to a9eb50376ffb27a3f348b0bccf70a34b26be2a3c:
>
>   target/ppc: Add missing helper_reset_fpstatus to helper_XVCVSPBF16 (202=
2-03-05 07:16:48 +0100)
>
> ----------------------------------------------------------------
> ppc-7.0 queue :
>
> * Clang fixes
> * Vector/VSX instruction batch fixes
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

