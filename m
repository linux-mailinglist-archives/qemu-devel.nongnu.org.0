Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5BD3E2A40
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 14:02:34 +0200 (CEST)
Received: from localhost ([::1]:45558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mByYa-0002G0-9X
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 08:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mByWz-0001VZ-SL
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 08:00:53 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mByWw-000614-Ld
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 08:00:53 -0400
Received: by mail-ed1-x52b.google.com with SMTP id d6so12672099edt.7
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 05:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v3gM6ekPZd9tqXfm04uJUnj+wQkzaKtdj0yCOiDCAdQ=;
 b=HzaluWbryBqsY34PjI1xHrpErAWOtUx1R+0wpDcCGQOvO/PaqCGTngFD+1jIgj5Ukf
 kJ+FNBJo6KgVqTKIIggqeIqAnBgUrBSgrsTJ9M5jzZVKvxlQto9Hc/alTr+JrIymsumq
 ODcfB/d+qpvdTTNrCNFS8MQEzONRDJqMmCzBu60yRE+9v5U+fz8rx/ZS863KPBDJuiAa
 0hBzZN3N/WjESBjGB4kcFMyL0fAcVKXo8RGttW341e5nPvrUMT9mZ07I/7LCm9tOJqmH
 uZdi9LmeT7dHE6k6hAgGXZ9Jiz0kzcxa8ZaUhCA/pms772n2C0tQtfPnYawgniQ1cdCj
 XpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v3gM6ekPZd9tqXfm04uJUnj+wQkzaKtdj0yCOiDCAdQ=;
 b=nTe5giyFBUb8W78JJw15D50YIrIW2uwSI4UKls0Z30tEpP0aRL2O4TxbNtmvbYYTYx
 +717cyBXMl+VHgHAaRL537eP6iESw3SoIE6HEVn8wzzV+DH0qxM4kbk1z0LlYAnLW3E6
 8WRSKFRRUv48ccNns6nAX4/iQbBgQES9BVPaZHOTYTOAaaUp0aQQzzCUHHq5Mg+WHN7L
 sW4vDxRAu00wFQ2Bd7N7gkgzxx/0ilm8KzQzuNefAbGC5kP3uPPpaXoqw7xTs3pbj4uv
 /165V8ZbTwIezOLI8umZ1cHGpCvM2b3WAOROSzaQ4whNbwieP1PZW023vQuYEy+Z6KlO
 T99A==
X-Gm-Message-State: AOAM530Mpvw5+SJAqXqVu5435o68TueoD3os0jF+9S7Q1mQBRBFDyAT+
 8vHZsyAqqdKcu6yUtSgr9Tr2G81DrdiGP+z+bcf7sQ==
X-Google-Smtp-Source: ABdhPJyFTGMPaKwjzWK5MEEMz0qiFnI3Rm68p6SIctHkZxbQ8VSaIBrgfqXFlen8iSrey4LSKo1K7eFXvJyVQ6KD5js=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr2816362edu.100.1628251249089; 
 Fri, 06 Aug 2021 05:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210806091709.2465239-1-laurent@vivier.eu>
In-Reply-To: <20210806091709.2465239-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Aug 2021 13:00:05 +0100
Message-ID: <CAFEAcA8hjNAzQhdNsn=CY-K34frVO6phE6LCLsO5m3kUVoMwrA@mail.gmail.com>
Subject: Re: [PULL 0/2] Linux user for 6.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 6 Aug 2021 at 10:18, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit bccabb3a5d60182645c7749e89f21a9ff307a9eb:
>
>   Update version for v6.1.0-rc2 release (2021-08-04 16:56:14 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.1-pull-request
>
> for you to fetch changes up to 030912e01c0385b6b09e76549c1a8a04b624f49a:
>
>   linux-user/elfload: byteswap i386 registers when dumping core (2021-08-05 12:17:30 +0200)
>
> ----------------------------------------------------------------
> linux-user pull request 20210806
>
> Fix endianness and addresses in i386 linux-user target
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

