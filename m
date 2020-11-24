Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F482C2B3C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:27:08 +0100 (CET)
Received: from localhost ([::1]:35214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khaDj-0001ZV-So
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kha9j-0005wg-RJ
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:22:59 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kha9h-0008Gk-HX
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:22:59 -0500
Received: by mail-ej1-x62f.google.com with SMTP id mc24so7943526ejb.6
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 07:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z+iYsQFeY83szMJLLCN8fYxIG6dv0pq5igOzVeIiOnw=;
 b=NZOlYLm7DRhjCM7frLoqM8FDN6v8lngiR98FcKG065YdcONnbzEyj+mSAN60Scba3S
 k0Bsw5JZBxb17jZzshCvppKMmktdXPyiLl0dU6KIcR0O0Jy9SeFLUH2LAZz3jtVqbZ26
 2uKCpZnl/DCdMDLAynjuVUZJGzlGS4RWPHKzySfGlgRwGoBFmhYaPEFevp8ZhmGe7v/h
 3SALDW0EaLRVtqrcisZyMDwRJHYFEnsWecQxBzEaSH57aKl43ioyS2FgtUhMStY+1bQZ
 9Lfi2vtXk8RfwfMEhYGdV8PS827LaavyB4uu7hTKhwthvl8cDayRtnRokqKWe9PGgB66
 Fvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+iYsQFeY83szMJLLCN8fYxIG6dv0pq5igOzVeIiOnw=;
 b=aPM9jl9WvTyIqQEyPeS3V3MXjLiMbh/dbxRpbE+it/xVRT8bhaXQ9T6KKu6EQtcZFT
 b/H9vCQfGI3Tnhxa2PAYBoFQfA7T7BRd3/P9Ak36KzqjOXwaZ1hZXrZAqLhbQv3pS1Zg
 +4pJgLSgQSrPWDB2/s53ntkdzt9f5TGNOlI2HXpUQBb/WGg1+lZ6VSiYScfsjFCs4/ve
 InlWyropVwMqscePWJq9b2WlbkGGY0QrRzfQNFqtwjQAqdGCaXygtzAbHCAgUSAb3+tr
 UD5gONG2FY1ekrbeogJz8K9os/Vib5l0QOL17QtZMKeb9QXVSx1FaQYUHlo9kI90VA3d
 snLg==
X-Gm-Message-State: AOAM531LkOqvxQgM1fxjTaZ2p4A2dPgptyXx7/RefK172d2aqmZhnXX1
 LwhTrizp0jvwhoR1gOsyNVD7KlxYzJ16PhfWRTlYSQ==
X-Google-Smtp-Source: ABdhPJyXdQugoafLykcPsWJghROgNgFNol76+Dcu2yHWchHuP5O4bIkHcF+NF2h9Gq3OgF71E5hvLn46jl824FZJBt8=
X-Received: by 2002:a17:906:680d:: with SMTP id
 k13mr4492164ejr.482.1606231375234; 
 Tue, 24 Nov 2020 07:22:55 -0800 (PST)
MIME-Version: 1.0
References: <20201124055114.1017066-1-david@gibson.dropbear.id.au>
In-Reply-To: <20201124055114.1017066-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2020 15:22:44 +0000
Message-ID: <CAFEAcA9jNLPMyCxKmC+StCbrNFjrznK1-a=UVkbCF-_2mucPkw@mail.gmail.com>
Subject: Re: [PULL 0/1] ppc-for-5.2 queue 20201124
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Nov 2020 at 05:51, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 23895cbd82be95428e90168b12e925d0d3ca2f06:
>
>   Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-20201123.0' into staging (2020-11-23 18:51:13 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-5.2-20201124
>
> for you to fetch changes up to afae37d98ae991c0792c867dbd9f32f988044318:
>
>   ppc/translate: Implement lxvwsx opcode (2020-11-24 11:34:18 +1100)
>
> ----------------------------------------------------------------
> ppc patch queue for 2020-11-24
>
> One final update for qemu-5.2, implementing an instruction that we
> already should have, given the ISA version we claim to support.  Sorry
> for the lateness, I've been on holiday.
>
> This isn't a regression, obviously, so if it misses qemu-5.2 it's not
> a disaster, but it would be nice to have.  The risk is low that it
> would break any existing instructions.
>
> ----------------------------------------------------------------
> LemonBoy (1):
>       ppc/translate: Implement lxvwsx opcode


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

