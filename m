Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0331632EED9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:31:48 +0100 (CET)
Received: from localhost ([::1]:51640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICQc-0002XF-W5
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lIByt-0004ow-I2
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:03:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lIByr-0005FC-PR
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614956583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Q9ujsNgBFgsOJnCRVP2+qYb0WQIZU3v31Gosxpeiy8=;
 b=BRc3qDmaMSNCKpYIPzBcSO0JyW1w3L6OuhztUYWnBKH+KoJTaD+WewH9AaCU911sNnztax
 dwr9Fam1H6S8GR16b4WlSeapv/2H9bMb1OXNVTNmkwv5fM0+gNjhFJz2bnC4vgNj+7Zi58
 PEX8cpb1pbSwaJJuqLIQSVnKXu1lkVE=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-PyncCA_LP4qIr_feTiEaPg-1; Fri, 05 Mar 2021 10:02:59 -0500
X-MC-Unique: PyncCA_LP4qIr_feTiEaPg-1
Received: by mail-vk1-f200.google.com with SMTP id k7so690135vka.7
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:02:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Q9ujsNgBFgsOJnCRVP2+qYb0WQIZU3v31Gosxpeiy8=;
 b=FZXMJZPT3BbXPHS1w/QmSkA9XWT4RnDkLWlUtA9hSGLsKu2EZa1Ztp26aC+21DnDYJ
 5NFPEg6d03u3cPezx3UAzg4tOB2/iEqUbp2J3UhJcAbuUXV/r+xaNcKG29Du9F+3zYqc
 RXy0CBUUYiMdECbbdkztxJPHiIZJiKaS4X6+LHT2OeicurzzXNmMHaubBS5tF9fiH8n1
 pt1MwNoo2noAzPNGKaY4G5ANnqhqJAsI+/OvqwxP5FGtPSrqh3D2j96RzUVDGruExllO
 4eaWphEkfRFk9Jv9Fkuvzx5ryyfH+i0Ma6XD+ehesqJdLN+Z1O1oG0RGIuDnrC2wQ+ni
 zz0w==
X-Gm-Message-State: AOAM530Avu7XBj2r4a/KDYfcjdZcLMfUFDgN+5Q5uX+zL9lOtPRCyDDO
 Fj/EdJ4Nt9rk+eX3gtwakWyj893e+7yanqO22HlHWF2UZy7I/TUK8SIMtD9HIVfQsSZqylVeuU7
 K9RnW0WXfHRRIU4EBRz1qdi1YivkyeG4=
X-Received: by 2002:a1f:b250:: with SMTP id b77mr7093510vkf.7.1614956578598;
 Fri, 05 Mar 2021 07:02:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUKdE09lJOWndisT6A+sBvzJbT68FVaC5vSqlgPr+/Zt9shFWvpNq4BPzEs1IHwKv1oVQH5gcIhQakETLjMag=
X-Received: by 2002:a1f:b250:: with SMTP id b77mr7093476vkf.7.1614956578286;
 Fri, 05 Mar 2021 07:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-6-nieklinnenbank@gmail.com>
In-Reply-To: <20210304203540.41614-6-nieklinnenbank@gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 5 Mar 2021 12:02:32 -0300
Message-ID: <CAKJDGDZpLE9febf3AG5zDO=TTaxzq4t=8RR_EXrGam4kb08wpw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] tests/acceptance: drop ARMBIAN_ARTIFACTS_CACHED
 condition for orangepi-pc, cubieboard tests
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 b.galvani@gmail.com, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 4, 2021 at 5:48 PM Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> Previously the ARMBIAN_ARTIFACTS_CACHED pre-condition was added to allow running
> tests that have already existing armbian.com artifacts stored in the local avocado cache,
> but do not have working URLs to download a fresh copy.
>
> At this time of writing the URLs for artifacts on the armbian.com server are updated and working.
> Any future broken URLs will result in a skipped acceptance test, for example:
>
>  (1/5) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
>   CANCEL: Missing asset https://apt.armbian.com/pool/main/l/linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb (0.53 s)
>
> This commits removes the ARMBIAN_ARTIFACTS_CACHED pre-condition such that
> the acceptance tests for the orangepi-pc and cubieboard machines can run.
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  tests/acceptance/boot_linux_console.py | 12 ------------
>  tests/acceptance/replay_kernel.py      |  2 --
>  2 files changed, 14 deletions(-)
>

Considering the tests are already canceled when an asset is not
available, this makes a lot of sense, so:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


