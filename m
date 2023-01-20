Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F726759BD
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 17:19:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIu5d-0000Jf-IX; Fri, 20 Jan 2023 11:18:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIu5b-0000JQ-Js
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 11:18:03 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIu5Z-0001r9-3s
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 11:18:03 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 m3-20020a17090a414300b00229ef93c5b0so4664005pjg.2
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 08:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pmJkJUIg79UA1MWw13kPlmVs0GwZfvpKpjkhKpyKdrE=;
 b=eWTY4UgMpUzMV5u7KY5LviRp2B5CWYoYAfSckupn+III09zucZuacqgaAOUpDlRZl+
 MrfcjYdNB4c6+m8JDjncrEP9vnjXO5TLijXGH04kq4yne6c0TsB+u4QeeyMaecxXyKQi
 38bwmvCIiOAqqWWI6QDDGdpXDRZbAHTq9E4wCHYRYSV1cWDWPGN6XO10xpwd7s2aAvXx
 yBp/UML6jMsats7vKFyFONP7xq3isLwdYjJdQvx11oZDQK9vx8JB56KiXKJiiTGtNlI2
 4m5DbTk7WZgpLud+kE9ualOy79W48OUFoy2Wy0KnLO6YZRmtRhPwR8xyxjT07qwzu7Xo
 HIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pmJkJUIg79UA1MWw13kPlmVs0GwZfvpKpjkhKpyKdrE=;
 b=HdZpPIuvsI+xq9RPRxaW9eKAkGHoU7ukc+T7utbAoI1THRTbssI64gmOfj9h8WDzwK
 Y5VdDu+8JDUdk54TICSv9gkRdtNWxcwU21Vs1jHRaSiOZFQ5MPqtTnvT1bXmFJvqK1i5
 zHGB6eX2kvqkwS3/zW5b4ukXZhu+qmVCuMt0+brP7IgfkZvmTr8cmCk6x2oL1bbNNTJe
 EmV06C2GKwwzkFHCMeQauamcCd48IK4aULLv3oUc4g+iO9uahEWAzPA5G2UFBGWtgOxk
 uhrU6tWSdZVf7IgR1OG4vUNIwTPAbhTfL773bQ6jh8UV0JvXGc04fxxm7G+1BzYEkNY0
 bELA==
X-Gm-Message-State: AFqh2kpzELqU/hcQXHo7sd6rYGbXfGRsjUvKlAM4IB9ejnB81dgPh0Oe
 KYCVEDaPDBKH7Bm/Mu1AdCMb53+ITkSDBJTVkUlwDg==
X-Google-Smtp-Source: AMrXdXvIQMbX0lJngQVdmHj1sdelOTnt8h/EisI5eLIKQHiGSctz47y2FWguYlAC1AWyFCTqWs/6O/9/J/dcCw6QdLg=
X-Received: by 2002:a17:903:1053:b0:194:5066:2630 with SMTP id
 f19-20020a170903105300b0019450662630mr1555952plc.28.1674231474376; Fri, 20
 Jan 2023 08:17:54 -0800 (PST)
MIME-Version: 1.0
References: <20230120070122.3982588-1-armbru@redhat.com>
In-Reply-To: <20230120070122.3982588-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 16:17:42 +0000
Message-ID: <CAFEAcA-_hgRcm2PZCD7OzuuSAMB3oFC7SocoaV6W=0tS8fvKGg@mail.gmail.com>
Subject: Re: [PULL 00/12] Header cleanup patches for 2023-01-20
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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

On Fri, 20 Jan 2023 at 07:01, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 7ec8aeb6048018680c06fb9205c01ca6bda08846:
>
>   Merge tag 'pull-tpm-2023-01-17-1' of https://github.com/stefanberger/qemu-tpm into staging (2023-01-17 15:47:53 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/armbru.git tags/pull-include-2023-01-20
>
> for you to fetch changes up to b6c80037ed3ba275eea2b33bc17e36af2b89813a:
>
>   include/hw/ppc include/hw/pci-host: Drop extra typedefs (2023-01-20 07:25:22 +0100)
>
> ----------------------------------------------------------------
> Header cleanup patches for 2023-01-20
>
> ----------------------------------------------------------------
> Markus Armbruster (12):
>       coroutine: Clean up superfluous inclusion of qemu/coroutine.h
>       coroutine: Move coroutine_fn to qemu/osdep.h, trim includes
>       coroutine: Clean up superfluous inclusion of qemu/lockable.h
>       coroutine: Split qemu/coroutine-core.h off qemu/coroutine.h
>       coroutine: Use Coroutine typedef name instead of structure tag
>       include/block: Untangle inclusion loops
>       hw/sparc64/niagara: Use blk_name() instead of open-coding it
>       include/hw/block: Include hw/block/block.h where needed
>       include/hw/ppc: Split pnv_chip.h off pnv.h
>       include/hw/ppc: Supply a few missing includes
>       include/hw/ppc: Don't include hw/pci-host/pnv_phb.h from pnv.h
>       include/hw/ppc include/hw/pci-host: Drop extra typedefs
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

