Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4FA3516A2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 18:10:52 +0200 (CEST)
Received: from localhost ([::1]:38954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRzuE-0003Do-Hv
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 12:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRzsE-00020N-Az
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 12:08:46 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRzsC-0008N2-Lo
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 12:08:45 -0400
Received: by mail-ej1-x634.google.com with SMTP id l4so3642227ejc.10
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ck3oEkjBNoLYPcYjwnjEPyELcmquA+Wm7xRLlrnkRX0=;
 b=dn9P7YvUDZeDJRHViOLOAqh08vCb8kNAN0jn05jU57rd5RzOBI3Cu8O/eeULta3BLx
 JxMZtg2oesqRDAqJdoSoN7u/WakJecHoQFyNP+TKR0WqRkrlMgkpmm6LqH/hI02tAfyJ
 66ge+ql3hq/DYa5oJdKsyzTPy015YEgqr000knUuh+kyJo5mhRucaQsqL9sdsMiSx35e
 b/cQAZWy+praa8eU3oLzL1yAWhX2GWhQuOauTAFSphXFJ3dg02P4+iZ0gVj5HYfcMCMh
 bUYUGDIbeXkE4DMB4utIbKofrWBxoRpfgznLj+MPjKmhZdTiL3ZiN2Neu9w3CHxizoUI
 ATkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ck3oEkjBNoLYPcYjwnjEPyELcmquA+Wm7xRLlrnkRX0=;
 b=cnOkeU/ZMrHiUogWDni5zjw1KxYMU7eLaGhYT68eMCj/fANYoczVNuugGvapaJ160S
 xm2SpIssy6xEp3aJla82AEg9OGi3kWmJ75qaK8uYt6Di4rujZNy5hz9sYNicfaZuCS7F
 NT0c80SSWtQAwLRXOQjD8N6VLszdhUUehc5nehY9LQakv4R3HldhnI5wIRi6tRZW7QXg
 cKPi0tYfn1IQ3JJhuEDSHwoemPJ4iRO1sF0Id+vG4iAdNQaQZ6/q0QbNQgDtYpykvhQc
 y1PDKgSTb3YnWT2ocOSp2Ct4li33Y6fogSEfv5/nBr5Yp59NLYwSs1r9al5uAJlgAwu7
 e5pg==
X-Gm-Message-State: AOAM53250vxrkyJ3dqMLCHlBlp0bK/cuGI8saMxdf0x/KsRYYKreXhnY
 YUWcG15s3TdueMP7YKWborqCQArv8rdY+TYjNJB6Hg==
X-Google-Smtp-Source: ABdhPJyogb5d7j8Qc+HCaqN/xP43452PCHLOBDpIAqT/4tpbeGo6gj+w4Y9qGQq4T3B3ToDmcic0Bi471NicajT0yvQ=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr10140246ejb.56.1617293322805; 
 Thu, 01 Apr 2021 09:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210401112223.55711-1-pbonzini@redhat.com>
In-Reply-To: <20210401112223.55711-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Apr 2021 16:08:09 +0000
Message-ID: <CAFEAcA-HL9zvX5R-vNXwvPCZ1xLXPd8LOAbMd3vzMSAfc0ttkQ@mail.gmail.com>
Subject: Re: [PULL 00/12] Misc patches for QEMU 6.0-rc2
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 1 Apr 2021 at 12:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 6ee55e1d10c25c2f6bf5ce2084ad2327e17affa5:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.0-20210331' into staging (2021-03-31 13:14:18 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 7dd6acc82fa6fbc2ff99f173635ac6be0c72b1eb:
>
>   docs: Add a QEMU Code of Conduct and Conflict Resolution Policy document (2021-04-01 10:37:20 +0200)
>
> ----------------------------------------------------------------
> * Bugfixes
> * Code of conduct and conflict resolution policy
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

