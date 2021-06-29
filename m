Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87033B6F8C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 10:39:21 +0200 (CEST)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly9H6-0001aI-Cj
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 04:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9GH-0000sT-R0
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 04:38:29 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9GG-00047O-2m
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 04:38:29 -0400
Received: by mail-ej1-x62c.google.com with SMTP id v20so16413321eji.10
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EWWhvUFNRtUgnc3E5+rqMHAQEXlscKp+ipqZe0o4g9Q=;
 b=mcR+sw+4bHShQeUkCl9pRjjbVmg0c3G8jalR0mqiVKIiwSjCUKaDoFDMZdChts6qHB
 9h/Zx85vhemRJQJWdCOdB11ST1rjqDJq5SfPrYGOe76uVd+4d2v7TfRMtgcPJ2rhn1IH
 NaWGeI9Tz2ce6XskilK5xpL3Zf1c080RiknKl64HgWRFqrJ0OHSna3JN7qsNK/Ok7x/X
 x7Q5B6onqkFdFD32Gxb5pSBJRt5BbSSGKONyt0lbfLrjWCZt7eUUr+W6tSvmFxk5Z22o
 MbuT/I5oGkuppFVXa8UcQwmehdE0OTI2PYelPrkSQ08yP0S2nyQ1txmQM/RkZpoM28OK
 CqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EWWhvUFNRtUgnc3E5+rqMHAQEXlscKp+ipqZe0o4g9Q=;
 b=eqFjWTGgkEOVGmD6dSmwGeO3H5KROD0XMdc7uSywVz0TEIC4Nqg0tJV7WLna5n9SXj
 pNPRKapZJ+yws0Yi/DtdvxQZ3tDfRrk3E43jvnPg0iV2My3vx5/3/GPMax2V/zfe8lzR
 h2GR/mfhK/f/MMc9RTicaqPG9kVp59kO7ACthtVoUkewt5fmtpc2wzuaIlngfLzddORX
 iW0J5Es5QjcKoqbKcbZ/NSzsjsCh+jSUi/YJXk3kS+3U+CgpzJPHfRZFL3vNB+WPJELB
 m+ltsyus+l95IzM0/XKfheDWUDr/XGUaMtyEInctsqYelrnEMMR7/u7VRp1z0oANRQjn
 Ziqw==
X-Gm-Message-State: AOAM533GlHGBYDsO7NXP6S0N0XBMwqLJzPabKe//fNQKapcMcIuZb6wY
 u+rx4YNPemyggEer8KSPuYSHBDvgVFOcPsPz1D5O4Q==
X-Google-Smtp-Source: ABdhPJy3WUWH4GGjuMAlAWJUSsQVY2Ow0aIBTDxymw5c2Fmesv1hwKm6nc89FyRVNXo/c+k8y4QNnFv+M82I1sTdB78=
X-Received: by 2002:a17:907:98eb:: with SMTP id
 ke11mr29179488ejc.85.1624955906263; 
 Tue, 29 Jun 2021 01:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210625141822.1368639-1-pbonzini@redhat.com>
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 09:37:49 +0100
Message-ID: <CAFEAcA_opaSv4TLHtz-szOk92oWgQP1=vjEZdeSpsWVXyizjhA@mail.gmail.com>
Subject: Re: [PULL v2 00/28] Misc (including block file-posix) for 2021-06-23
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Fri, 25 Jun 2021 at 15:20, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit ecba223da6215d6f6ce2d343b70b2e9a19bfb90b:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210624' into staging (2021-06-24 15:00:34 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 0aebebb561c9c23b9c6d3d58040f83547f059b5c:
>
>   machine: reject -smp dies!=1 for non-PC machines (2021-06-25 16:16:11 +0200)
>
> Starting to flush my own queue before 6.1 soft freeze.  The
> block/file-posix.c patches have been reviewed/acked by Max.
>
> ----------------------------------------------------------------
> * Some Meson test conversions
> * KVM dirty page ring buffer fix
> * KVM TSC scaling support
> * Fixes for SG_IO with /dev/sdX devices
> * (Non)support for host devices on iOS
> * -smp cleanups


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

