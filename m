Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DC266A159
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:59:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGOJ7-0005PU-Sd; Fri, 13 Jan 2023 12:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGOJ6-0005P3-0d
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:57:36 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGOJ4-0002Vf-Dy
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:57:35 -0500
Received: by mail-pg1-x52f.google.com with SMTP id v3so15499530pgh.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 09:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRH8ZMy8imiovA1VJSN88XM2el7MKl84mS/lD1kOads=;
 b=v+DoB3jmfGGuQykcEQkHV5XI4vm5C4Yd4hb5GXGedJbQJX7eXgE+RCfague71zWC87
 ZW+n1LkoZbS6qdA5LqKtD3a5nmZI9mDqjybDmcmaN9AITCpsR2YLKVMyneHoWlKeBIEN
 KDU4ojtn4uIw+tNgWRYUaZg66tq02N4pP7puXtZLcMNz+qnZw1f1ILzhaNkfHEdVlRi8
 OonN+9XWGNyZnIYOEOi4q1LREaXvFzuU+xTp/KLhe+BSwM/6yEFGO8SMk6G8UuyR03OY
 GHqBQaXnPqmHMfPOdmb4XFBbKx5uDkOh9jEmWJIHVDMk89hNyvWeyDj337JQkDmVijQN
 9P/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRH8ZMy8imiovA1VJSN88XM2el7MKl84mS/lD1kOads=;
 b=JNBr7CRbB80mVg4p6fMB+csm1143I9lBNACkedGprc7sUn3KopND17XEwgLWIWClN0
 he1O0LwbmZEllpCTmGE1KUyKhmTJd6+VErduOmBKz8c5yQGyGG0Y5QnOzB1BEIzNpo8Z
 zMeuwBcWO1hXSdUpoFZeR0ZcINh0fokv5dohPi+EKzG+Pu0a4rRyO66qbieBwg1mFGM4
 OtaEw59LozdVVABHSDI4T9s6VnyT6YTxTWnOcvhxTDWz8dPSz5xpvGQ26ma9yLPAW9CW
 zPD/F7pwHRur9cWx1lcYoYevyKti1nRPL5aPZkEqb+PJVG+EzyTPFN9M1LvDTVKQ6Emo
 VE4A==
X-Gm-Message-State: AFqh2kp6KZvwkmTHdraVyYH8ywq3jpg25rj1wmBgT6sQdUumnR1aj0f8
 VBBhhiH+CAyUqjPXR4SdRgVsfIUDOOEE3WOI6/D7qZ4Vwhs2wQ==
X-Google-Smtp-Source: AMrXdXv+I7chUfXNnF8Tv1v8N8mnt+x6qOBBTEr+FY9EMZhxiyfBoEMNm5D2BITknkhiESXBYkf5AtWNUpzcmNnCpfc=
X-Received: by 2002:a65:694b:0:b0:477:86c1:640f with SMTP id
 w11-20020a65694b000000b0047786c1640fmr6025014pgq.231.1673632652985; Fri, 13
 Jan 2023 09:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20230113154532.49979-1-philmd@linaro.org>
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 17:57:21 +0000
Message-ID: <CAFEAcA9mKmOahpvVQUUwyxcbJE2aNeB+Y_a1brgnq1kPNtv_nQ@mail.gmail.com>
Subject: Re: [PULL 00/46] MIPS patches for 2023-01-13
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
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

On Fri, 13 Jan 2023 at 16:05, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The following changes since commit 3db29dcac23da85486704ef9e7a8e7217f7829=
cd:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into stagin=
g (2023-01-12 13:51:36 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-20230113
>
> for you to fetch changes up to 4828656f65324249273ad2f2db80844ba90eeb9b:
>
>   scripts/git.orderfile: Display MAINTAINERS changes first (2023-01-13 16=
:22:57 +0100)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> Confronting my triskaidekaphobia, here goes
> a bunch of cleanups from various people:
>
> - Improved GT64120 on big-endian hosts
> - GT64120 north bridge and MC146818 RTC devices are now target independen=
t
> - Bonito64 north bridge converted to 3-phase reset API
> - PCI refactors around PIIX devices
> - Support for nanoMIPS in bootloader generator API
> - New YAMON Malta Avocado test
> - Removal of 'trap and emulate' KVM support
> - System-specific QMP commands restricted to system emulation

Hi; gpg says your key has expired -- which keyserver can
I get an updated version from?

thanks
-- PMM

