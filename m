Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC493DAA7F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 19:50:45 +0200 (CEST)
Received: from localhost ([::1]:38636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9AB9-0002c3-M6
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 13:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9AAB-0001wE-6k
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:49:43 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9AA9-0003VP-BI
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:49:42 -0400
Received: by mail-ej1-x62d.google.com with SMTP id ga41so12038525ejc.10
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 10:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LuY57zYo9o4wapd2F4+7/AqnC38zpxwgaFjMGo9zptc=;
 b=t0AxsLvZf8UkacmMWA5ULDVfGN7omBdwutkNvumABj8sc9FbLffXvgyKwLxNK9ZZjR
 p/wLW6HuDe9TQyS2aoBOoy+g2Pzf9TVt5ti4Pf7uD3MmEuBqrZsZ0M/Nnb0cM6d6qgFi
 GsTnwx+uU+mcIgbL3tXWHf6V4rEEZGgB2/hobIcgCU0lY1e82WxiAifxpkRtVwfq/FOn
 QLTJn7LhYUawY9UalPrIlqLOUTlxMwpH/rdImy33VLjplpINvu6uw66WQgNvsZEQWA6L
 eU2yL2FkWppmvFu4sfho7y1iiNvcZZsGSbl6bkFhh/ZgF7vu75Bx8o0S/drb3ooAIAAj
 Y46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LuY57zYo9o4wapd2F4+7/AqnC38zpxwgaFjMGo9zptc=;
 b=KSCFQExj54KJeXHt1XO2y8fvZgeifuFGOyz2F4wLa/7MX0B2K+/AzzYTEXva1WXyXG
 5hiEtSpx7OKU66w+6Pd9PD0FowpTjky15DCrRKaPwzj1OSTxIUruRNpWBLo4q3cvanCD
 hoC1uCB6hbTzd7+v2KOwjyWBZvuVNyIlstDOBxB+kJbA+sl4YVrQb1WnNr/AXftpJzsx
 cPHKDMzEcKqnpBT+BrMhTSfPvp9/8SS/gWVe8QKoCKFgHGNlcVyg3F1Rm+v85QMtdkN4
 AxgCOydX1aqQy2SAyNgi8k4Mg1DRaaqmGcJW8e/eVIVF0lUOJcX02Byyl1GI3ESHj01t
 DRhw==
X-Gm-Message-State: AOAM5318Zh5gQzqnL0xPIV6sNTCdwfFkKAGnPpdOkgaenxibfcbmUhfi
 aAiEKqyQUfxlYIGx69n9lXHPnG1KQgKfbq5KtRUo7g==
X-Google-Smtp-Source: ABdhPJy9WeRFU26kKzqx5PbKI5f7C+ZduaaYjDDMak1psw9MbkuWWhGJwsvO11tIkLLanzmYcL6mtGd1j+KgV27u6qE=
X-Received: by 2002:a17:906:6cb:: with SMTP id
 v11mr5729318ejb.482.1627580979459; 
 Thu, 29 Jul 2021 10:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210729124713.208422-1-pbonzini@redhat.com>
In-Reply-To: <20210729124713.208422-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 18:48:57 +0100
Message-ID: <CAFEAcA8o2FiRyCiOkmTMKa87i-qNEjG=3cUvK--akqvEbhmEPw@mail.gmail.com>
Subject: Re: [PULL 0/7] Misc patches for QEMU 6.1-rc2
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Thu, 29 Jul 2021 at 13:49, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 69ea12b19a15ae006521cd5cc0f627f27f738746:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2021-07-27' into staging (2021-07-28 13:32:12 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 4fe29344bef6c54a6eff7aa0343754f8a9df5715:
>
>   libvhost-user: fix -Werror=format= warnings with __u64 fields (2021-07-29 10:15:52 +0200)
>
> ----------------------------------------------------------------
> Bugfixes.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

