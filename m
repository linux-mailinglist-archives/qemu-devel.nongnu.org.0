Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819E44BF8F2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 14:17:37 +0100 (CET)
Received: from localhost ([::1]:51488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMV2u-0005DK-4S
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 08:17:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMUta-0001v0-7R
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:08:03 -0500
Received: from [2607:f8b0:4864:20::112e] (port=43788
 helo=mail-yw1-x112e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMUt5-00034b-Uw
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:07:48 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2d6d0cb5da4so117811987b3.10
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 05:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lNs3v8uQD//dLCHYOd1cNoSEqbjEKFPQJkoZjbaxsUA=;
 b=w0sr6Ed0ZjxL/iqjRe9EC+sLCcagjEg//p5A61SsuzdOKzS1IsZQuwran4fMn1LSh+
 REHhQAhJm2zulqXhKIh0F1y/c3pdAx5Pa9Tzm0fYe+UIKMggh4ToTTq63y62Ib5Yq0mB
 08iuX0YE25AEA6vir1nJuFcSoIlrddr004D7Nvtv17/uIS/eSC6+7cPO/smk1jUZlvUN
 C/Nt+64OUjTEWacFWu6mAbKp4iuKPTSC+3TdMALttIiZXqdWntQL2I1e+72n+VXQxi21
 DHZoRhPfKBPUW2JC0Vs/Ntc5tP7FwYJdc2kUCjXDPkZ9Lc4sbxfokgzmSYjJaqZ2LDgJ
 ntQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lNs3v8uQD//dLCHYOd1cNoSEqbjEKFPQJkoZjbaxsUA=;
 b=nYeqdP/BijpU3kIwv+CMrU1t+2X8x9h3apVQvJr7MFmeOnSKSza1SmKWAhM2YdUISS
 OVUoOt6Wj6rgDJURNkVhVSDan9EsAK+wm/B8jtSA4ARvXE/DL1VJw2kEaZrMlYx/uuXS
 OBaQWguwCBVZx+IMtdxgBWV5iv/ejXHZOwI4MnJavOqVHoRqhCLB1RBm9ztPNK8y/J04
 U/Al6fmuVll2UyEky1hL7DRiOo390o/IewDnRD8hnb4ShI7OXW3L4cMw29hzCDPo2+th
 J1wtHZx3jer3FNCTCCrfziYhGcQ8JkaAdcXj6WUyCtdtCSungxSebkhcogoVERzg+cvo
 cVfQ==
X-Gm-Message-State: AOAM53313smU6yZkPey57SoUlP/LjxLpL5vlVkmZzwVYQdC+zmcgMo8v
 X7uO+mQpNiVfekebRF0aOxv00EGORt/gAfQYx8T6Kw==
X-Google-Smtp-Source: ABdhPJyy0UsR+EI4+RJMvQpJPszsw4PT+qmzGZaTtX3KcluMWIIkq1cPYTyC2G75f1ekCQ+qdqCrMTTnFxnY0tc3sdw=
X-Received: by 2002:a05:690c:314:b0:2d6:b95b:bf41 with SMTP id
 bg20-20020a05690c031400b002d6b95bbf41mr20134465ywb.64.1645535246017; Tue, 22
 Feb 2022 05:07:26 -0800 (PST)
MIME-Version: 1.0
References: <20220221103435.65501-1-pbonzini@redhat.com>
In-Reply-To: <20220221103435.65501-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Feb 2022 13:07:15 +0000
Message-ID: <CAFEAcA888__aRs6=R+kjqE3Kr4r2kgAJovzjLSPuwdTZwipckA@mail.gmail.com>
Subject: Re: [PULL v3 00/29] Misc mostly build system patches for 2022-02-15
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Feb 2022 at 10:39, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit ad38520bdeb2b1e0b487db317f29119e94c1c88d:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2022-02-15 19:30:33 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 5dc4618e781f36c4bea1b0cdd1bea75b48640c5a:
>
>   configure, meson: move CONFIG_IASL to a Meson option (2022-02-21 10:35:54 +0100)
>
> ----------------------------------------------------------------
> * More Meson conversions (0.59.x now required rather than suggested)
> * UMIP support for TCG x86
> * Fix migration crash
> * Restore error output for check-block
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

