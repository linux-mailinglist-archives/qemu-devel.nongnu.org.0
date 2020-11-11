Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BA22AF951
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 20:55:19 +0100 (CET)
Received: from localhost ([::1]:57360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcwD7-0007Lv-MD
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 14:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwBA-0006T4-6U
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 14:53:16 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwB6-0007bT-Ja
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 14:53:15 -0500
Received: by mail-ej1-x62b.google.com with SMTP id za3so4412223ejb.5
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 11:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rr4v2Xt4ZO4mMmzXIYh2YiOeO+hfGWQP4l2mpANHTbo=;
 b=R2JGtOGhy0yrv+dU2ev3xQWoBC/2q1eLaI88Bmcow22Vl5SAsrqLjvT/8kHz/kJtcV
 moedNMOOsn66oEU1RH06f8iNwRRE79GjXdC+ks2RhcczU6ZyMpO8S+uNd2FsFmfw66Nz
 kvcMiutDMcAdE0s+VoIbHB126kB5db3pb/Qz5L65A6rFY/49YpJkuURl2oDAvdQJEEa1
 FugBIe055RUvHY7yXx2lvC3GPb4IvjKPl0qVEcdKbiATCJLjiiMa4FRY+SfWrt1M0Fvp
 a7UEfAbd5MqGEGEpHgDDGq6Vg2LIqZ9mWwmbnePWcLwQz8rICKqM/AU9CLWKsHSvN1fF
 OXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rr4v2Xt4ZO4mMmzXIYh2YiOeO+hfGWQP4l2mpANHTbo=;
 b=pQYAtwyPTBfXaC5Vn2BlHQXGu35hnCObZDCzOIwpG8TcrAZCCo61GTjewhB0VT8DXN
 5sNARdxZBlRfonLiSaghqajXIXYtVQ91gty8GS7477Q222Ci8kxi/HMtDFhv7uiSMrn4
 Z6onQ+FjrHr4Ck5iLhO9s75wj30eQMs9O14Rs4JY9ZdEKyk1kVXVSQo0obu5ZhAplSLQ
 cXT6SlzPKknQ9Hbvq4/QN2B5vQfBVsPoMwI+fP+3heIS1Fi1lCZUPXRNiBBR39ipTdPz
 CmrKAtu9DCsZgHVQ7rHBJ8ReaRRI/EMsrTXtV7CtvZwl/WGHpJT/n7N9KygWMBiTLia+
 zozA==
X-Gm-Message-State: AOAM531+cxGNaYnWFn2qqkMh9JyFPxWCvSxWCQQS5evxk47iYQKCXKHk
 n7liEWieXJVwj04kmt7PARsTUvAGN8AqIddqtqiqgQ==
X-Google-Smtp-Source: ABdhPJzvAia90ety4AhJklUGF9ipShZEQ0PGbwFs3BCkSiqWAkFlHckU3YdolqT2feyrY6ZHo/ZWnR2N5Fql8ubzPCY=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr17095691ejq.407.1605124390488; 
 Wed, 11 Nov 2020 11:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20201111144946.1213713-1-pbonzini@redhat.com>
In-Reply-To: <20201111144946.1213713-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 19:52:59 +0000
Message-ID: <CAFEAcA_9x790SOxqTHYXwHjPfzYG0OZWAucne-2AcG_ii8aAaA@mail.gmail.com>
Subject: Re: [PULL v2 0/6] Misc fixes for QEMU 5.2-rc2
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Wed, 11 Nov 2020 at 14:51, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 3493c36f0371777c62d1d72b205b0eb6117e2156:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20201106' into staging (2020-11-06 13:43:28 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to b1b0393c3c58c0e96c7c44e2e98baa252d6c6813:
>
>   pvpanic: Advertise the PVPANIC_CRASHLOADED event support (2020-11-11 03:59:05 -0500)
>
> ----------------------------------------------------------------
> Bug fixes
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

