Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4075039E2D3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:19:56 +0200 (CEST)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHyl-0004Yw-BD
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqHxL-0002rq-Qe
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:18:27 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqHxH-0007fJ-T7
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:18:27 -0400
Received: by mail-ej1-x634.google.com with SMTP id h24so27683676ejy.2
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4hJLVlSClUoOYL767XXGvW374Acb4DUXB5mDN6xJIJM=;
 b=ThMvXNldj6gASMy1A1xQwzZYm2i3xCe/aLmKtUEYyKQJLT5XgUpeyQoFEK0Z/fk4Mr
 9Ftu4faDivbPNzPlYv/AeOEOfvn64K3KbOHiCtKZkePaj4LK40LNIrV58lnvJ9rqcWXc
 zOP+mTEtn0pbYoSgpQZvQk04b/cKffAWPSpz2n6w1y/MgHBl0Dqn/SS6HdcW1y0vH3LC
 8P4kmrQ1d+AoPyOFUFpxb1Ri3ZfOo416f5gDMjMWnE2u283nrmLsC7DhtvdgJXVytvT5
 e+5vOyLn4oLDYkY4/Ysl+auyuc6YE0sW5S2sscZrRtMLlpQj3vVvUZzKHuMCx5pyde0A
 4ddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4hJLVlSClUoOYL767XXGvW374Acb4DUXB5mDN6xJIJM=;
 b=maPRUWftDDhRZ+bHxRkC0mDz4lt+KtI2N9YsUsb2/UkPX5H542SlNoDNPnlWoUkOEA
 HJOI6sJ5gFY38jQQaTZ6Uvbwe12wC3s1iIfsUM2z9+lhNwLJD3zM+147NG2F3+vzKaeV
 764KMQ21uKolGqa2f7nifHTOSoxRpQYi7mij07Tpqre5dbP4XRG2m+uuaBFnuw3AHUar
 6du78pDo4nMBAt2g0QhC/gdoL5ow3CABN8gzG7oM8e9tymUp3X2chIkQ/boEgHg1B4RK
 1gy+SNSTGZNIACC06+jKpY1A9DU9KTbene8Aiz99QL+WmX6h04nzuuQiOsUEdIKeP7U3
 9rDg==
X-Gm-Message-State: AOAM533fNAape1YxOR9tGq2zRrRLJQNEJ/t7IX8+nGYlWvv0RUkRBPKS
 GPPX6FyF0J+it+LGRKnKojkBeECQhLxtd0M7DplUAZEnZyI=
X-Google-Smtp-Source: ABdhPJwadV552F2v3+bIpDQpozdVjtuvGzkXnuA1u5qVUDYjIz/qzOSxtlYWDlqDyCexIbr5+PjBVQBJh8ZY02UUPeA=
X-Received: by 2002:a17:907:9047:: with SMTP id
 az7mr18576586ejc.4.1623082701641; 
 Mon, 07 Jun 2021 09:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210607143303.28572-1-alex.bennee@linaro.org>
In-Reply-To: <20210607143303.28572-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jun 2021 17:17:48 +0100
Message-ID: <CAFEAcA_E_CCiY0R0HkD9+Ku=RTMFiBm-KvprjRZUmR7xyqqmzw@mail.gmail.com>
Subject: Re: [PULL 0/8] testing and misc updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Mon, 7 Jun 2021 at 15:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The following changes since commit 6f398e533f5e259b4f937f4aa9de970f7201d1=
66:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210604=
' into staging (2021-06-05 11:25:52 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-updates-070621-2
>
> for you to fetch changes up to 72205289a0799c6d0a73107198098b830dbea2f9:
>
>   scripts/checkpatch.pl: process .c.inc and .h.inc files as C source (202=
1-06-07 14:49:30 +0100)
>
> ----------------------------------------------------------------
> A few testing and configure updates:
>
>   - add the multiarch signals stress test
>   - fix display of multi-word compiler stanzas in meson
>   - fix quoting of multi-word compiler stazas in configure.sh
>   - tag some acceptance tests as TCG only
>   - make checkpatch test work harder to find clean diffs
>   - split gprof/gconv job to avoid timeouts
>   - fix centos8 VM build by adding --source-path
>   - make checkpatch aware of .h.inc and .c.inc paths
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

