Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC14E35D14A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 21:43:33 +0200 (CEST)
Received: from localhost ([::1]:33246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW2T6-0006Gw-DH
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 15:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lW2RO-0004az-I6
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 15:41:46 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lW2RM-0004Fs-O7
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 15:41:46 -0400
Received: by mail-ej1-x62f.google.com with SMTP id x12so1422881ejc.1
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 12:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U+5AoYS0fsgXfvOc84zjwO14BzC0IVOQ2UgjEGJ82bM=;
 b=POOhHeJEldDGv85QFaPrOKeMOoUTNvH94OUI1YGhalPsIkGlI3r7UZL20ZZwF0T0yz
 DZoZsxQBQ2VrmZPa58uFUw7qzsinPhuZIqHjO5XnlB+2Z/MdfPBJszVR/jMdy8Wcg1Nx
 NYYduXgcISbrSF6GUp1hlrWvW6noJU8Cg4G3UoFmQ4373OJnYHyAmB4IDE5egq8wLXaH
 gFieTuwVMsfJ5dVbp1o3A57NyxlQGs6kz3llgB4LaWDEaruVrZaAHZCJx2DJZwSIKETj
 wmmJln8Gp663SPnZPJ+xE0pal6EH02sFjGGWXCKukH2MfWH4SjBbeqcpzdH2I1ysH8db
 riGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U+5AoYS0fsgXfvOc84zjwO14BzC0IVOQ2UgjEGJ82bM=;
 b=uoQf+/i/zXfq1ZkAfVoypNyXaLGswY33ediQs/NKH41qUiLGL/YYDteBYCRPyfKadR
 97j8k/TBjeuMVJItJG9VphnlsrbhP7tdUtzFYXtcZ/D9stLdDmZmrTZmzODsrQm4pJXv
 +B3kb/Foshde4dPyTO5YwatgLC/z/goFvaYWSJNRkTBhaJfAJh7vpmtRIohHJdgkl6UK
 jZ+YXrz/qvzBDWxW411cCAjkOgHylqaqoLJh40rEv609oc9uJhYKcCIxc8vHvoqJypAh
 y55nQfYIBHwvCN/ar4LLNiVR7oapxr6d87eEcjT4qz/W0qhUJndO+gcrlZ4NUsFNJIHT
 UoaQ==
X-Gm-Message-State: AOAM533ZcCQOPqSoXSLQkA6KG2D3VIypcZQLIzRzB/8VQycFSXVxNbZZ
 OTf8IS+g5r/UAb2p4P2r0sQXFM8hns0VrOynqbILzw==
X-Google-Smtp-Source: ABdhPJzsuabhHed6zXmfFgHhcoBDTdFCvHl1FtAK4Vt04PU+Zq5AG6+vToyMel5zLtbYErDLgzMkx4qYBvncO9raA2k=
X-Received: by 2002:a17:906:8303:: with SMTP id
 j3mr9269491ejx.85.1618256502769; 
 Mon, 12 Apr 2021 12:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <dabec806-51e3-5f3c-463b-0ac7f5ba854a@ilande.co.uk>
In-Reply-To: <dabec806-51e3-5f3c-463b-0ac7f5ba854a@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 20:40:58 +0100
Message-ID: <CAFEAcA8=G=O58FCaZBUqpqtFGaAYJT=PsDnEYjHu0qEGL22oBQ@mail.gmail.com>
Subject: Re: any remaining for-6.0 issues?
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Mon, 12 Apr 2021 at 19:44, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 12/04/2021 16:32, Peter Maydell wrote:
>
> > Last call to note anything we need to fix for 6.0 on
> > https://wiki.qemu.org/Planning/6.0#Known_issues please.
> > The schedule is to tag rc3 tomorrow, which I would ideally like
> > to be the last rc before release. After rc3 I will only be taking
> > fixes for bugs which are absolutely critical...
>
> Thanks for reviewing one of the patches from the ESP security patchset earlier.
>
> Should I send a PR for the ESP security patchset and the acceptance test fix?
> Unfortunately the timing of the holidays has meant that these are missing a review
> from a SCSI maintainer but IMO both of these are worthy for 6.0.

Yes, please do. If you could add your missing copyright line to
the comment in the new file in patch 12 as well that would be great.

thanks
-- PMM

