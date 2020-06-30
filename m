Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11EC20F88F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 17:41:12 +0200 (CEST)
Received: from localhost ([::1]:44402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqINj-0007Ol-LV
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 11:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jqILJ-0003yV-N5
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 11:38:41 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jqILI-0003Fr-2w
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 11:38:41 -0400
Received: by mail-wr1-x442.google.com with SMTP id g18so20704549wrm.2
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 08:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1GbJ3qR8DbeArfmr/fgMB2nbWQEYgRsT+hJBwHxLbKY=;
 b=pfty3Mmn0wpkMG1+vuXJazh3KcumB9EsESuEuaTUYL4VIA72QUlAX20MQ9XOKdvZxu
 evodc3bS/zh4OiYw5jog3ziLsqHiKwe6mH77axBKKI6hybLYH9t1K1ZwiXxkIo1Ewxpz
 0MLAqXzUh9XdpeKIcfoDJHOs5xGh0gFMUhYpc/mfrmfykeIFuEQubcKTYTRsGvWd3mU4
 4WcgaPRs4i8E7TURMy0gcN74zb9Thk9sqCKMLTcBuHFcLIqMsv49aTLmd1mtBUr+R6bp
 LoAFqnwAKbM/aQnmcY2fFeyhyIegPUagm3/1Xpv4GFc4+0Vp3ivcmCQZTH6nVijJyAPy
 87Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1GbJ3qR8DbeArfmr/fgMB2nbWQEYgRsT+hJBwHxLbKY=;
 b=grXv2oD0hTzo+4xhq0Vmrj7NsbMdR3URMBN9u6CVGdOvTfEDGfl0RrawX2YB4F35Gy
 KQKLfyZ7SXhRHNTJ21hasnjdp7KvE8j1MnDk7M73JaNb/Up0u07UYKhKG1BXk4Rx21Ok
 6kGQ3uKYkVB0cpIi4UjhFzGHT2bz6WKTiQHQ23LyKiHTb6MnS3CwI2AMgBngIBDySluO
 G0LgIcQ9zZ4huNjupFChX++hfRk5uJEXMDCPz9Kz2KxFtE3twpDR7Z55sVN7JlMUarLk
 wiZw1sUMJXi4rtXNXpUkUFVDxyhWSxS3wvLbsVW9K+dSttW5wfPQ1vQ9BzWCNFTz/O74
 EyeQ==
X-Gm-Message-State: AOAM533io9VZRi+Itqt9rBh1AW5PEe2JvAIwDvip7c+RrjGqH9cqL2gQ
 hxkSlrpN8+Iv02wP2uLXtQ9aNpSoG7IjLt87cY4=
X-Google-Smtp-Source: ABdhPJz0gm2HZ9DsOqVgr1PrEUNoVoUfRyoq5lD0Gs5uOB912TgHE1ZA0bmHRqRdRwpc+wul+ZdMPevCO2iy7Mdo5ek=
X-Received: by 2002:a5d:6907:: with SMTP id t7mr22303156wru.329.1593531518419; 
 Tue, 30 Jun 2020 08:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200630145236.27529-1-f4bug@amsat.org>
In-Reply-To: <20200630145236.27529-1-f4bug@amsat.org>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Tue, 30 Jun 2020 17:38:25 +0200
Message-ID: <CAHiYmc4=pmzEyhVTHaqxBnCotE8V+vaptMFincyurvAyDHNn6g@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] hw/mips/malta: Add the 'malta-strict' machine,
 matching Malta hardware
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yunqiang Su <ysu@wavecomp.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=D1=83=D1=82=D0=BE, 30. =D1=98=D1=83=D0=BD 2020. =D1=83 16:52 Philippe Math=
ieu-Daud=C3=A9 <f4bug@amsat.org> =D1=98=D0=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> Hi,
>
> This series add a new 'malta-strict' machine, that aims to properly
> model the real hardware (which is not what the current 'malta'
> machine models).
>
> As a bonus for Debian builders, a 'malta-unleashed' machine RFC
> patch is included. This might start another endless discussion
> upstream, but this is not the point of, so I still include it
> for people to test. The rest of the series is candidate for merging
> in mainstream QEMU.
>
> Philippe Mathieu-Daud=C3=A9 (6):
>   hw/mips/malta: Trivial code movement
>   hw/mips/malta: Register the machine as a TypeInfo
>   hw/mips/malta: Introduce MaltaMachineClass::max_ramsize
>   hw/mips/malta: Introduce the 'malta-strict' machine
>   hw/mips/malta: Verify malta-strict machine uses correct DIMM sizes
>   hw/mips/malta: Introduce the 'malta-unleashed' 64-bit machine
>
>  hw/mips/malta.c | 125 ++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 111 insertions(+), 14 deletions(-)
>
> --

This whole series is based on idea of emulating physically
non-existing feature, and as such violates the fundamental principles
of QEMU.

As such, not acceptable for upstreaming.

I don't see the point of sending again the same series, in just
cosmetically different form, if it was said to you that the concept is
wrong.

Regards,
Aleksandar


> 2.21.3
>

