Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD0E4EAF23
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 16:19:11 +0200 (CEST)
Received: from localhost ([::1]:44792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZCgg-0000c3-Bn
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 10:19:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZCfJ-0007bY-IT
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:17:45 -0400
Received: from [2607:f8b0:4864:20::112b] (port=35967
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZCfH-0004Kx-EV
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:17:44 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2e64a6b20eeso184925917b3.3
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 07:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rSn1LdK9IMgXN6RnwnwiBShrWvTsOjImPP6bW0hiLxI=;
 b=kakVpCsSJMUfu0xfk98QDMu6hAoWraKIfYCQXthkII570fVXD71kFthlPCCPQmhMOQ
 afc/4Rc02WadzOjzpo7own8K23ioqB0w9lcsjbe8/tk3kIGWWzJ4nyM8Zsk5OV0pFGlK
 IE51jN6x3PcI/cww0/QNva0jEtpBBgr50A06PHYicD+X7RvNjAFfcrxUhrvttBrcdXPD
 lH+SSDC7dA3ulg2iwmf0g8eFnVlZbkK6tDNd4sZf9vg45Yj4tWtA64k3kLPDMj/D9Sbe
 Z2mJa2BX2xjN7Ik8y0XcJIvVsrVtFGjKwafr5gzZXnuoGtpX6rI24y1+prhvAwOlixcw
 0ZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rSn1LdK9IMgXN6RnwnwiBShrWvTsOjImPP6bW0hiLxI=;
 b=icHmxHa6YNC/x10iXxkYdPtQB/nunnxX122UXoq6foVJ1quZ4+x+Mneh0vkUoABwnP
 NKj6K7BfQVtWroGUMPqP8esSAegX/p+cIkcoZeKyNlTZJEEYZPrnbIR5fjmH79KNSv5O
 /k0/7/7Hd1puZEvg9qa8WQXUcfHuMSZRmJWoyGYNiCpe74RKvC6mQot4M4fJXT3uP3ur
 J3pycxF3LMpL/TB373jGLjOw2ma5tJ5eiJHYX8D1O2I6rGWvPHi/X4E9tQgPV4jBASG6
 l1uBws59cysEU8EK3sw7FxsetwMYSakRzoCw7zEAth8uQEBVw5qwTHD8qJcP86j4tIA/
 TszQ==
X-Gm-Message-State: AOAM5321geSv7vFYtS+sM78a4S3kXdVQH5+bvl/PnRYPnhAI3R4jztyy
 bBkKR9Pnae2WJ5ixM3Q3QQOWhz3ZjtHZpfwrdZlnbQ==
X-Google-Smtp-Source: ABdhPJxlcilgdPJkt4pGPYTWjc8YuCnxNjMkbn0hlu2whT9d4q4MMQCuW2UWs+om1IaWTM7Y41QmInuzV0HxJao77go=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr31642423ywf.347.1648563462189; Tue, 29
 Mar 2022 07:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220329103604.41208-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220329103604.41208-1-philippe.mathieu.daude@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2022 14:17:28 +0000
Message-ID: <CAFEAcA83t1qcJWHQVZ3Lg4MrVLY3GupdTptDAHU3vNb+B-rwWw@mail.gmail.com>
Subject: Re: [PULL 0/3] MIPS patches for 2022-03-29
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 at 11:40, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The following changes since commit 27fc9f365d6f60ff86c2e2be57289bb47a2be8=
82:
>
>   Merge tag 'pull-ppc-20220326' of https://github.com/legoater/qemu into =
staging (2022-03-28 10:16:33 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-20220329
>
> for you to fetch changes up to 77d119dd335f910c7f953a265726e3753c69a0bb:
>
>   qemu-binfmt-conf.sh: mips: allow nonzero EI_ABIVERSION, distinguish o32=
 and n32 (2022-03-29 00:51:55 +0200)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - ABI fixes (Xuerui, Andreas)
> - Memory API alias fix (David)
>
> ----------------------------------------------------------------
>
> Andreas K. H=C3=BCttel (1):
>   qemu-binfmt-conf.sh: mips: allow nonzero EI_ABIVERSION, distinguish
>     o32 and n32
>
> David Hildenbrand (1):
>   memory: Make memory_region_readd_subregion() properly handle mapped
>     aliases
>
> WANG Xuerui (1):
>   target/mips: Fix address space range declaration on n32
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

