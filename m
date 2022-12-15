Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E20964DC21
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:20:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nx7-00048j-Vi; Thu, 15 Dec 2022 08:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nwS-00044M-EB
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:06:32 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nwQ-0002dr-QF
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:06:28 -0500
Received: by mail-pf1-x435.google.com with SMTP id t18so6623815pfq.13
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 05:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PRFJb250/P4bD8r92mLR3GOTZwQFX7oMhNTNMIWy7pw=;
 b=H+skwy+SFmLOq1FINuw3X++VLsGj0gDCmbrrSGmjSI7Erttu0H5XTQcu4yhAYqugm2
 mK2LvfKfqyW3mh4Djdhfi1lyO/kifWN6Xk40u8loPc3+6IynE/Y1M9EFyi5WgwdpmcLp
 oUw9yu1hcP0tBilvS3YWy0KQXEK7Pe6Jcmx+cAaXu7CpU51mGrtDxAxag/eAn5V5zEnQ
 aJFkuOQxqEmhRTJofz4WJJlZQtivzD4T0Unjq/XcRujx3SCNzKImWWeJSagaZRgQyPpt
 Cckwhx9RhXSDrGhhRu/4F8xedX03qg0YrIK3C3Wf//nFqcdF7jEv6INt0mN/JZ5BgZ89
 bwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PRFJb250/P4bD8r92mLR3GOTZwQFX7oMhNTNMIWy7pw=;
 b=0yGB7XEHtHT3xXK1MJPkrXb4PSSNVNC+JDx9SjYa1RRUlHDchZbWO6A9ude5h6HDzJ
 LZQ5zrlz1eLTbLw0gaxUdNFmk5+IuOTcsJjKG98wHaKazmFfHmfduj1G9kKKMwIuCnVK
 xBveb0gLXf5r/LYrT+AoUGoBHVDLbUXqvrDMnRWDzcC4A+Z9eXOv1f67pDfr4NsYo8kM
 B/fJl2w35VPeXepwXTuryc1DGx80QnqcRqoY5RDY0/GbhMpGeguH1oyqx+AOn8JxBLkE
 BKKEYPHKK2n0nxauFCiRdrXzQpKuJbdIzAWCB7jsfUwWXy+pDELZLYydOC3R9we2P54K
 JMWA==
X-Gm-Message-State: ANoB5pmXRxiW2T7F8xibGSpVKEl2L3uSDttCmaker/akQKSmIDF2ixvr
 E7tvbZPonbv+Mg9gPlWO7OQ/Vfe7qBXm2aSm/6S0Cg==
X-Google-Smtp-Source: AA0mqf6m9dyWOTHilda4lGna77R+2z+PJPfTypiUT8PxfZuy7m8HGdtHL5abtmlzqJaHgHG5L0DmoBdpAf/04HO96Yo=
X-Received: by 2002:a63:c149:0:b0:477:86c1:640f with SMTP id
 p9-20020a63c149000000b0047786c1640fmr1166760pgi.231.1671109585046; Thu, 15
 Dec 2022 05:06:25 -0800 (PST)
MIME-Version: 1.0
References: <20221214164629.919880-1-armbru@redhat.com>
In-Reply-To: <20221214164629.919880-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Dec 2022 13:06:13 +0000
Message-ID: <CAFEAcA8AsDK=y6Wy07PNabojrFr_xQRutSQhe3xnD2sOJjaRQA@mail.gmail.com>
Subject: Re: [PULL 00/14] Miscellaneous patches for 2022-12-14
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
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

On Wed, 14 Dec 2022 at 16:46, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit ea3a008d2d9ced9c4f93871c823baee237047f93:
>
>   Update VERSION for v7.2.0-rc4 (2022-12-06 19:53:34 -0500)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/armbru.git tags/pull-misc-2022-12-14
>
> for you to fetch changes up to 6c5aaee4b61eb8bf60c7c30365432710b4346421:
>
>   ppc4xx_sdram: Simplify sdram_ddr_size() to return (2022-12-14 16:19:35 +0100)
>
> ----------------------------------------------------------------
> Miscellaneous patches for 2022-12-14
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

