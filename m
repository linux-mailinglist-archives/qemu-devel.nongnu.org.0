Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB3A69DED3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:27:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQoA-0000L7-2l; Tue, 21 Feb 2023 06:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUQo6-0000JG-0i
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:27:38 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUQo4-0003vC-8U
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:27:37 -0500
Received: by mail-pg1-x532.google.com with SMTP id i31so1489825pgi.10
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 03:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gj+DIygL1Caao01aT9KsQMDFIv0uVYcO98f6aXSUWjc=;
 b=MRNwWFGbDeZ9LaXFK59yJ03nl8+ZzD+7DO98hdGI+/fPsP4svDatIYDuZgfbzEOMsI
 ZXA0nfqzRcPKjcZeC/sMO2W6Yj5B3WMlBGd1SFtRKri9og+5wp6vXP5V/GFVSOPZSnV7
 6lWA+3VNPzIi8Eh2Xwi2FmbJ3mTPstQYaQlCKlogKHZ6qqSRsdbBewUKlkEwqyAzkBHw
 9eVt1n+mLvpwgNxYE0wly/ZpCjAPO2LgX4KgUu69U+l7FhPbs95/gotw5SuAM8aGoP4+
 AaDANoM/tQSr75HpYlhCRdRX/O+M82Q12qZmsuZj1pGXQbg31D8RGTauSMjj/eCKFpOn
 WRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gj+DIygL1Caao01aT9KsQMDFIv0uVYcO98f6aXSUWjc=;
 b=5Qa6Z01DmHMvgKyIZkjxAxW2SrayZ+GTfeTlf56nbXOSbbyYExzFpHlPIUFizPMR/u
 24W95Fi6iR7fPdmlDZN2YYDD1diQGc9b2dcWCjV0A5smAQDheLPLMTxO3VHva1k6L1In
 yJZU4tVn93eeAiN7tbcGb6GeZ1bAVjv7vbzP2L3VTIyrNF95RtqkKJzk0PiFYauOIbu+
 jBANhdozRvpQN0G0UgwmSdspXmVOZUtsfJVY6fjqlKpYnyXhIDDWn4iFRHY4YVClPmxs
 uyGBptD84ansdn6b5OjXWKr16h+nqBf2s2OHeaxIponXDnvE09J90Y5lAAu9zhsShQbw
 04Gw==
X-Gm-Message-State: AO0yUKV4BeZa/RxRjMvQSTYwEjuq860mbUrJPi6ekmVaS634lnXUjeny
 ZzA+oDahukLA9iSNyoUoWzg+r/umuVhJd5Rk9JJJMQ==
X-Google-Smtp-Source: AK7set+HGP/dPYoVQ+BHddTOLCcYH3leoU468mhRN/4ePMEVg/bc6qyUBl0oTAIb0nmlqQWcgcKqs9MDgeVcZ2BI5Bw=
X-Received: by 2002:a63:8c12:0:b0:4eb:1c07:e5d7 with SMTP id
 m18-20020a638c12000000b004eb1c07e5d7mr536684pgd.6.1676978854513; Tue, 21 Feb
 2023 03:27:34 -0800 (PST)
MIME-Version: 1.0
References: <167658846945.932837.1420176491103357684.stgit@omen>
In-Reply-To: <167658846945.932837.1420176491103357684.stgit@omen>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 11:27:23 +0000
Message-ID: <CAFEAcA9-L_JO1NjDG8RwCaM-vuK+tHcTTYcimgNyrv2aNuwx2Q@mail.gmail.com>
Subject: Re: [PULL 00/12] VFIO updates 2023-02-16
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, avihaih@nvidia.com, clg@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
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

On Thu, 16 Feb 2023 at 23:03, Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> The following changes since commit 6dffbe36af79e26a4d23f94a9a1c1201de99c2=
61:
>
>   Merge tag 'migration-20230215-pull-request' of https://gitlab.com/juan.=
quintela/qemu into staging (2023-02-16 13:09:51 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/alex.williamson/qemu.git tags/vfio-updates-20230216.=
0
>
> for you to fetch changes up to 57edb7e44489ec4d85075acba47223127ecf1521:
>
>   MAINTAINERS: Add myself as VFIO reviewer (2023-02-16 12:14:40 -0700)
>
> ----------------------------------------------------------------
> VFIO updates 2023-02-16
>
>  * Initial v2 migration support for vfio (Avihai Horon)
>
>  * Add C=C3=A9dric as vfio reviewer (C=C3=A9dric Le Goater)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

