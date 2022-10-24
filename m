Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF56609C22
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 10:12:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omru8-0007NC-9T; Mon, 24 Oct 2022 03:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1omrtw-0007Mk-8R
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 03:29:40 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1omrtu-0003TN-Hw
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 03:29:35 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MXoxG-1oam053hSW-00YBei for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022
 09:29:30 +0200
Message-ID: <f7ccc508-5dd0-d6d8-a599-5d11de71db1b@vivier.eu>
Date: Mon, 24 Oct 2022 09:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PULL 0/2] M68k for 7.2 patches
Content-Language: fr
To: qemu-devel@nongnu.org
References: <20221022091750.2713763-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221022091750.2713763-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tl4lrMmVXu2cc1ISR8xQlEaFLyWVhpLVbeSkFFRSILW4vEBchG5
 IOmKtD5MyrE7w61j7c+Yd5RMKic0g/8jiCX78I2F2BXSQXN0oIz6e9mZhhyYx/y0WpJ4YNp
 6XUdnABkgWC5N2su0gtBY9KbONxRUQ5dRbLZ8FngYgpcJlNT+xynBwv0H8NQRVso5GBKgNi
 YGwqA5MJYjKANouneoPEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gl0U/RreDJg=:2k5xekQYdTAugzjD0DsOj4
 yaoqLc6Ow2BzHPpl14iqRnc5RvoMclysMD4A0+oXxgvBZPBaB15jnhmAyeZLJiraJzlkoXMfG
 sb1i52WgrauRga1b3SpVq17DCIwt4ZWNMuIARygMTIzlE7Gv73oJQm24xmyT7Il+xH9dY4qio
 jFqvvjS7jE+ICJXmTAQSGBj9c7Ff5+d7h7CGmry1veNqGmwo3mUdgsQY3KuACKvFCBSvkZaOP
 V/Bm/4Aepj/gAhZoXFbSGQ7qSKmQjptYAF1a22ZJLAQuSSgBekLIwThZO7gS27WfNvByPSzRJ
 hNrV9LakeyqLmPts3jgdCh6kAl4Fu37BjWa5Bw8ftTePhKv6HAPttWrwR1FDreW4FEaeB4vU1
 Ndrjdag+v/5uGEmblAeS/hj7ItAvu/1slqTYbEkd5yMIb8lGU2hWMELduSHqf4e3DPnxsWM/Z
 BmOYAoyzx9A4EL7zzypeMmQvNbFdL3xAJYPW+txJaiQQPL1A9qEooSeJzGhl/iHL4AVksoq/Z
 jFzSVxOGfn1Ud9zZbyMsVTzdSpnE6yiOmUBlhipTqNgavWHuFU+CTM/ZSm6elmspsnWPzkwny
 QO6X3799ZGtz1kPXQ+2+SK0W8/v7FhenzqGVwdU9MudFsbZBh77t7WkLLw51qql0Fh7RKzLMS
 4pJ16ChjJoFGdTIqAYCjisN8ohalOlDyw2gaC+W6XMpT9bkMq17PleNHSJ+AFrbDl9P1zz92G
 KeDtK/iees5ljofvfAEycwStUrOuhFBZRtg4Ledt2aM9Nrr6vgRIhpzED/xHHUvBBWjZmnz46
 GYtEdQX
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 22/10/2022 à 11:17, Laurent Vivier a écrit :
> The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:
> 
>    Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/vivier/qemu-m68k.git tags/m68k-for-7.2-pull-request
> 
> for you to fetch changes up to d3c7b59be912d257ae7773eb3f1127f81a710a4d:
> 
>    m68k: write bootinfo as rom section and re-randomize on reboot (2022-10-22 09:58:24 +0200)
> 
> ----------------------------------------------------------------
> Pull request m68k branch 20221022
> 
> Update rng seed boot parameter
> 
> ----------------------------------------------------------------
> 
> Jason A. Donenfeld (2):
>    m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
>    m68k: write bootinfo as rom section and re-randomize on reboot

Please, cancel this pull request, there is a new version of PATCH 2.

Thanks,
Laurent


