Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43073CA283
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 18:36:18 +0200 (CEST)
Received: from localhost ([::1]:34222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m44LR-00040w-Iq
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 12:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m44KN-0003Ab-J3
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 12:35:11 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m44KM-0006nb-0p
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 12:35:11 -0400
Received: by mail-ed1-x529.google.com with SMTP id dj21so9101344edb.0
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 09:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J46MRTT/tr9dwggeea7Izur39ST1U17b3+TtAkrsaw4=;
 b=bmS5iNJA8hZPEeA/vdx/zxzLNYVPwURHY0ZOkdtoMGuoDDDwaEe0wWQO8sH0Dtrpc0
 r/jNfUsWMYGxqueOMizsZ+psagQ5yKp28kMHtrwjBnh7/Y2NzYtoNUHw7avVLdbS6Ol8
 x7KeCyeDNWUyHaOBe/6M39evd/whCFMjdUNuLA63RAK1rDUnICUNgELfmqWG1NcNyIf4
 IASyoFfbMAnT2mQb2hfv6ocQhC02b1TWL3yFcJRu5HCBuWxsgtndLVWY4ZRLnpOum2nA
 QigfM0ALSu9hyeGh+GGLJXClUA68qbD26HgVvnyKPVtmaQB9GSKau99QwkxVbd6dp6AS
 3pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J46MRTT/tr9dwggeea7Izur39ST1U17b3+TtAkrsaw4=;
 b=efXYcdjyr9dccsyZtn/bkUm4HK9yVJ2FgCT8s8jP3TM2+1dfxjY65sezRtW9RWzM03
 GpKtD8z89eHrct47fQMZx/qCk84Sw3KkHSRhlYql8N6qhTocrXAxpAmTwRVl14f2rcP1
 aIK0+gSbpuJEB/jjircnyrdLCEuuKbKT7YSf7+0up/YRg1nxgBpmjXjBHNkpJmLgXqhU
 TYGIJtQdG2PLPNg4WQhJQGsozQO0/bFANdQtYPOVbziLd3Ma56DQ2mVoNoV0H3MZwdsO
 RyjumpYvdbyRwWLFyvtA1fG5Rm/t1qO6+Sn9yGahharmnsmOh2qRNCsxiiD5gTWQHTDV
 /QYA==
X-Gm-Message-State: AOAM530WZfIIu5v0AAzUXjvQ68EcSbM6Tir+rCBZrX4R5z57C7DvfAOT
 vbtd6XKOYuD6uhtyIj0+uOe9kbMm89ls9OOOCJbA6g==
X-Google-Smtp-Source: ABdhPJxZXvcCZao9Rt8LA3n3WGHeYmPB+dclkZqyZZ7SFDJICemxDbTwQ2k5oQIJ2slDOdfk8cu+nzdNVjX4D991W54=
X-Received: by 2002:aa7:d809:: with SMTP id v9mr8387541edq.146.1626366907975; 
 Thu, 15 Jul 2021 09:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp_5vmoL1xFr6rVUzbyb2LyxyndOrxKMsyvgkqq_EX=hOg@mail.gmail.com>
 <CAFEAcA_jBPwqHCyCAq6yJPfHtwV-h2xdNARX=GTe6gn1Cao97Q@mail.gmail.com>
 <CAK7rcp99ZiRw1zVMAGAO6t=yaDuZyNPwToRd1x34JzEvNHtj2w@mail.gmail.com>
In-Reply-To: <CAK7rcp99ZiRw1zVMAGAO6t=yaDuZyNPwToRd1x34JzEvNHtj2w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jul 2021 17:34:28 +0100
Message-ID: <CAFEAcA8dcouHz=UnDyksZ17fsGom4r=ciHu7oX-f3gDjnCX54Q@mail.gmail.com>
Subject: Re: QEMU System and User targets
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Jul 2021 at 17:25, Kenneth Adam Miller
<kennethadammiller@gmail.com> wrote:
>
> Well certainly, I know they are different executables. I'm just trying to understand how the different targets work.
>
> By subsumes, I mean that just looking at the meson.build for i386, you can see that there are files added to the i386_ss, but not visibly added to the softmmu target. But the softmmu target has those files built whenever you configure and build it.

In the meson.build files, i386_ss is files built for both softmmu and user;
i386_user_ss is files built for usermode only; i386_softmmu_ss is files
built for softmmu only. target/i386/meson.build sets target_arch,
target_softmmu_arch and target_user_arch to these sourcesets.
The top level meson.build adds the relevant target_* sourcesets to the
set of sources required to build the various executables.

Some source files also use #ifdefs: you can look for ifdefs on
CONFIG_USER_ONLY and CONFIG_SOFTMMU to find code that's conditionally
compiled in different ways for the two executables.

-- PMM

