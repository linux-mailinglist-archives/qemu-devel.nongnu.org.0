Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62AE1EFD44
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 18:10:41 +0200 (CEST)
Received: from localhost ([::1]:36978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhEvW-0003CA-Kq
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 12:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhEqc-00051g-Sf
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 12:05:34 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:42657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhEqb-0007Hn-Ks
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 12:05:34 -0400
Received: by mail-ot1-x32d.google.com with SMTP id o7so7994183oti.9
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 09:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gn9A1UDT9Nviv+ZLlszCnBoEittxZ1HabSpzTWFRJh4=;
 b=UhO8uO30fj+bSnAv4r+6oAVBsdwoAorRrVgpTSRbf/cuRfUC7bQpCzc3JClXefDCNv
 lKAnGEAESFnMx8y1NN8th3AmiCvVHo8BuoT6SlNLItTnmdThnFxL+6XMwAirLu3be7ZN
 Ci0rEjip3pGS8Hvzk3rbi6C1VJNw+cQqIAC4OGUMA5/delI71yTldhgTwCEiAOjV2inp
 PaueqfwSALxtHgWGyQtLiZksJQWwRId1kFyYgW2I+G+A7gAANasHNw9NJ5Kd/kklhqiR
 4Wt+tWvAjfLSQL2jrmUJeBKXjtsJVn4yKamNrVifVfhtU1BEZYcDDOCP9qXyF6+LoFLw
 GUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gn9A1UDT9Nviv+ZLlszCnBoEittxZ1HabSpzTWFRJh4=;
 b=rAUmv7HkTrE3lOaS6+qGrAFswZ8RLW1B1rUeVnPdzwiHXadJ1ERcvXJsGrUAdIqePz
 rWWnI3Yd1ZvoyHmu2UKPoDiR25+ZI8VLX6XQA+HQotvz9gCTl9ZO6ToYEuLLh9hfrnSx
 9/5nyFQ5VFFGcVjHcZwNrGQVVUDD7Fkys8fnwmfja0dBbx176mdX5mTv4rsxXq4+us3I
 XrS0WJHQmcRHJhJFp5LRpPvmGOt7udBqLRE1sEPad+ST006A3F0P/CT7I6M/QluEwnBg
 uOjKjKA7O1nhIpxYrI5G4J7cO4xG3iP2+WtB/9l59U97OlqthbpQ8OUGtcyZfjQg3FCm
 kYKg==
X-Gm-Message-State: AOAM532XZmmHHJDdW0Rghzh1OLMiR8fajCetgaeG4pCoIRXFHyznp1/x
 lz1lkNXbXor52u+sTzJLRkdKFRlyJ/lw8MPbGGSm9Q==
X-Google-Smtp-Source: ABdhPJxai7NrUCnQPC/sEUc1BEDr1BpwU1b5VZ6pNKZzFIky9bqHAE05F6QT308QQ4XOi35eMnmbaJaQsjg3r5fUOXQ=
X-Received: by 2002:a9d:b82:: with SMTP id 2mr7747803oth.221.1591373131609;
 Fri, 05 Jun 2020 09:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200605112724.18622-1-kraxel@redhat.com>
In-Reply-To: <20200605112724.18622-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jun 2020 17:05:20 +0100
Message-ID: <CAFEAcA8JOmW3U95W6VLO8bJrjUVNWAt7kn6aomfczJmvYKgjgg@mail.gmail.com>
Subject: Re: [PULL 0/2] Vga 20200605 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On Fri, 5 Jun 2020 at 12:28, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 66234fee9c2d37bfbc523aa8d0ae5300a14cc10e:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20200603' into staging (2020-06-04 11:38:48 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20200605-pull-request
>
> for you to fetch changes up to ae3887e6f08c0031b669d4613987ee51df8f1769:
>
>   hw/display/cirrus_vga: Fix code mis-indentation (2020-06-05 09:17:23 +0200)
>
> ----------------------------------------------------------------
> vga: ati security fix, cirrus cleanup.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

