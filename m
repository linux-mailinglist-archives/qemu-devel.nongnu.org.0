Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24C82D76EF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:51:49 +0100 (CET)
Received: from localhost ([::1]:51538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knipo-0001bD-7F
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knioc-0000s4-6b
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:50:34 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knioa-0005Qf-5l
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:50:33 -0500
Received: by mail-ej1-x633.google.com with SMTP id jx16so12410279ejb.10
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 05:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vnzKzdoOWF9dQ+tpxyZJ717IplnMH+SCIhQfcjz/H/w=;
 b=JNgDrZekA7Z4YNpUth+WgM1L3Rv5D08+DUlvIb1h0eXt6EA0aHD35kuJnAvaMLDgUA
 jPqoVFzMvxaurab+0mjwXkhXpnljhdxzBHjgsir5pb1pzLkInTQ0ndk214mX50zVnPWS
 PIevdSPjbWfQepBYC/aAXqiSmBEnT0m5B26N0cKFXmawrXm9gmOqKkjqEZSqXojTeodM
 /tlZuFcsM6TIWkl3YoifQ4Ef425G1FEBu1gfvv6Sb7bD2uYyxiaIxrBWxZuUvNDkwdYQ
 4REZz//icbqPCZtRNwmsfOdAsiU4pO+DTyNHdGa14ns39gvO8V8rEYH2a0CmQRZUOt1K
 4//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vnzKzdoOWF9dQ+tpxyZJ717IplnMH+SCIhQfcjz/H/w=;
 b=LvdFjWHvTH7szJuY70OOrt2egiAwp30JlJ1MlOnXj8KWC+OAoTJg9kOphCXo9UwcxX
 QD/zWauRnXqPVmvql+3tfV0VnaPFeZJDh69wG1id8jj4bUVQ+6gu3GFAJmNQZ86SmI3U
 3C6w1H06TNzmefRC1dr7CoYHRM8eGdVhxJeWFWnOqDzU55wgVtaLl3ddUnIx5N4CyVjR
 4VgxqYdp+vyJPLfI5rz7jXBIdDbzaQWKABoYXGUtX60u6FPnQ3qJToAuIESYoYl5SR01
 a0USLYeN7oU69BUw3UkPAdFURFQ17JbOW1l0eD7ZXsG6OG579EUym8GcmpQ1QsYK3GDW
 9mvQ==
X-Gm-Message-State: AOAM5321aV3yzVj5sKdkCm+0fAd3C0nccEFIebGBOxlYoRhlLCmiCfaT
 UUKZgkXkA65d9LNkU0m4zk/dVGkcm56R4+SKTtnlcg==
X-Google-Smtp-Source: ABdhPJzjRrfAqkHANkGb5bE3qxFv4eTco7m09x2kkfppn4hyjTlK7Vl10ZANwTDADArRJErKUnhjOutTgHSPxD0ugFY=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr10751351ejd.382.1607694630445; 
 Fri, 11 Dec 2020 05:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20201210224212.2052368-1-ehabkost@redhat.com>
In-Reply-To: <20201210224212.2052368-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 13:50:19 +0000
Message-ID: <CAFEAcA_RRe-mngcYOeck3Dc=KSQuo7i8nV1LtEzW-_QAAgtrrw@mail.gmail.com>
Subject: Re: [PULL 0/3] Machine and x86 queue, 2020-12-10
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Dec 2020 at 22:42, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The following changes since commit 2ecfc0657afa5d29a373271b342f704a1a3c6737:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2020-12-10' into staging (2020-12-10 17:01:05 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to d1615ea575b08fc96aeeb2630c40c5e51364b95c:
>
>   i386/cpu: Make the Intel PT LIP feature configurable (2020-12-10 17:33:23 -0500)
>
> ----------------------------------------------------------------
> Machine queue, 2020-12-10
>
> Some patches that were queued after 5.2 soft freeze.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

