Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C219935F073
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 11:09:11 +0200 (CEST)
Received: from localhost ([::1]:58500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWbWI-0001ne-BK
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 05:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWbUA-0001Lh-Ty
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 05:06:59 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWbU9-0006tv-4c
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 05:06:58 -0400
Received: by mail-ed1-x530.google.com with SMTP id e7so22730314edu.10
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 02:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FWuW72cxW+MIP1a5ij1lqw/R1p7Qr5dxIaoDkQCM6wo=;
 b=IkZbRaDqlgwHfyy+4ZWQGCVbcHvnmQW0tb7iVCMqvpzMd1oz1GXDXnqsu/gVWM5Mua
 Y32NoBpLcUsrLtZaux2Qfa6d8KoSYtkoDwMbPOnCxiEUtAvLmx1rmFHvtNkV47I01sZp
 BmvDHYQO+AjfBR+a5nyTXVJECWUvUXQvI2TPHbBPDIm4b9YqxQF1xj4ldeoeCTXmavmV
 K5YhnV+BVTJr0NfZLXzjavK0Q1Nv6Ld0QElfV0inXU/9AXF/uztbSzrpFqr/rqTl3K2i
 Q2V1HhUWTSF4tNph3A/NxfqOIKfEBgbRPQKgk8+3TxvU8BrxEiut+z/vO+MtcwbzhOeM
 UnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FWuW72cxW+MIP1a5ij1lqw/R1p7Qr5dxIaoDkQCM6wo=;
 b=iqPpsVJ8H/Jy6z7FjkbC+FfVoWV4YBRP9n/3BH6gItPq+0bZ3CrYszttgpnMwU7WzE
 1eD8LCwk+jNVb+QABJSWsqiXtOikRA7K3QWEfdAAYkp/4kUcdPsvX0etCubD5FSyDIb/
 r6C4buSdHn6TgigXI/gi/34vslfmjOsjuPOWbpSWqC0IqxQDOQB9v/+c9FXFFcHoCisF
 21c9vY0i59xfaX/jyKd9MtVPp1609sMHkkomfj3tRQZ2eP97pETKP8kulcrTZmjkUiiI
 AAWc5U9tyZJCkk9ouIDEqsxUjJez7dNK1dhFuDEGSJKS10pzS70fSrhU2HPwOuuqUlTP
 L9HQ==
X-Gm-Message-State: AOAM533hq25MHZef8t83x9dFf+2qGakR09SbxUH2wBNptjfeB+UcGfgQ
 Db/6U+9vljRdx98YkSa8euhLSrPPxmMIBLRHZ78dbQ==
X-Google-Smtp-Source: ABdhPJy3Wy8nWjYDyjAZZ43fmilxaMvYdkXqOhYldQGd/Zx/YuVY1hFTbc1K2iGLt8cpgHMe5Zr8eBjyiow9URiIBsw=
X-Received: by 2002:aa7:d843:: with SMTP id f3mr34175112eds.52.1618391215484; 
 Wed, 14 Apr 2021 02:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210413152246.72950-1-dgilbert@redhat.com>
In-Reply-To: <20210413152246.72950-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Apr 2021 10:06:09 +0100
Message-ID: <CAFEAcA_fAf3T1pioTrKOJJv44a5nNQ+oBV=7-G2c5akyJFw17w@mail.gmail.com>
Subject: Re: [PULL 0/1] virtiofs queue for 6.0
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, antonkuchin@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Apr 2021 at 16:25, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit dce628a97fde2594f99d738883a157f05aa0a14f:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.0-20210412' into staging (2021-04-13 13:05:07 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210413
>
> for you to fetch changes up to ace66791cd15657320b11b1a421afc055f28efca:
>
>   vhost-user-fs: fix features handling (2021-04-13 16:13:41 +0100)
>
> ----------------------------------------------------------------
> virtiofs: Fix feature negotiation (for 6.0)
>
> A 6.0 fix for feature negotiation on vhost-user.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

