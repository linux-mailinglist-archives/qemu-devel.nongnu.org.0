Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC59EDC436
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 13:54:50 +0200 (CEST)
Received: from localhost ([::1]:38434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLQqH-00049t-Vc
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 07:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLQpM-0003d3-59
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 07:53:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLQpK-0001Gv-OO
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 07:53:51 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:43477)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLQpK-0001GL-IR
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 07:53:50 -0400
Received: by mail-oi1-x230.google.com with SMTP id t84so4928391oih.10
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 04:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TAp7akDBp+m+p70PlrZfvmenov/HhcjneicNL3r6XpI=;
 b=i3Gs40AWgf8sUao6R9Csj636cUCQLMPqUMLJzfxvQadDFQ8MMs4rCdqkJhQM8jt0IR
 o+qDBtK5znyN/UNLwHNIMhKyz495BX2Y3HVHmMk47tc07r2BNVPQmFA9zAf0GvlmfTzo
 oxFOFssyyoXR/31Nm8eDN/pItbJDW6NWhm3jNyEpq1/KK2jjp95/IONF10tz45BPVsjq
 F6rqcpkFG5628Avf6fvPHN/rGpp0bzmzf4DyyhwV+vNAldkuXjitD4deGEZz1Hik8S5E
 HGswM8DaPrrzn0iIi490lvpp5cpRE5IVSwVCVBQk0E2BdCl0seyOsr9ktseUzm8WgN+i
 wjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TAp7akDBp+m+p70PlrZfvmenov/HhcjneicNL3r6XpI=;
 b=sFF5Op4Iuq2KpczJUT13fUH2F1ttEROpCIUIogCBU03m7hS9WKWda7bTBtq/twjYfm
 YtfUggzVaIfGU3sRc8HgMzSQf/pZscBiQPBrR1HXk5v2DtNkel6f1t9PXTMukaGqhu7I
 +iDFm1olrMx+esiMW6nn7OMA97gh6CUnzOJpT8T37wg7m0r7ZIU/hENFVflldY3V47CP
 r5rdJfmxoVaZsJiP2ZKaXm5H8fd6Yc91opHbaXnZXeEZahrDv2544Zn5rBGQww0/Xdpt
 vz6Mwc3jzNnj6RCvagiYlos+xMnKrR447ji9IALNjeB4bwPrEXO58/PPxIMbmBpihipg
 ERFg==
X-Gm-Message-State: APjAAAVZwATL3V79QF+qNdwA0o6I9rH+mtuW8uBUJlQtAoKikhpdGjhe
 4O/kb1aeUpVzoxeNTw2eUMwcuhcex0bQhXi8rhgJdA==
X-Google-Smtp-Source: APXvYqx1tX3OG10qWJTY8CTY+UylRoy3vBXD/0pcEHYpFM69Hcwr2IynW7eIGdBYAJfJLttt2kFfLAcKt3ans1CAarw=
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr7745777oic.98.1571399629715; 
 Fri, 18 Oct 2019 04:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191018101711.24105-1-kraxel@redhat.com>
In-Reply-To: <20191018101711.24105-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 12:53:38 +0100
Message-ID: <CAFEAcA9bhW2CJ4ZiAeFK9TWdrmR3p08LDr1Hh+iyK92LWDt7fQ@mail.gmail.com>
Subject: Re: [PULL 0/4] Ui 20191018 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::230
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

On Fri, 18 Oct 2019 at 11:17, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit f22f553efffd083ff624be116726f843a39f1148:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20191013' into staging (2019-10-17 16:48:56 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20191018-pull-request
>
> for you to fetch changes up to 707f75070a94c28889f887deef0ab4da09e25ddf:
>
>   ui: fix keymap file search in input-barrier object (2019-10-18 10:40:46 +0200)
>
> ----------------------------------------------------------------
> ui: bugfixes for cocoa, curses and input-barrier.
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

