Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044C648F6E6
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 13:54:32 +0100 (CET)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8iZi-0003Xm-JE
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 07:54:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8iMD-0001cP-9I
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 07:40:33 -0500
Received: from [2a00:1450:4864:20::331] (port=38813
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8iMB-0007Qi-Fh
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 07:40:32 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso12756132wmc.3
 for <qemu-devel@nongnu.org>; Sat, 15 Jan 2022 04:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kgaILkzEgx9KakTc5YyuGY51owyYmR8X+Z4MAHeHoEQ=;
 b=iBGrkH6OCpYLTk766HGxDs5T0v2Fx7jGx9ssKq8i3NZMXv8kqly70xbS+dH8yc3oRv
 kDTV7XkbvEMZVNjcWmNqSlAmTQ/IfXdYgT0OxuFKWK7iLf5oGzH4k9xVgYLAmIH5qCLv
 bTjPm6gkaRMuP3U2OzUkqGp1nvx8fP4Eve0ylEwkp128OofNYZN1rBFz8a7Ucjlw0+lc
 h0OSPcHh7FqNv4WUexZe7/EBtGh7SoqpQ/Ib7+xY3NBhy7eFEjFJg2iIQzyVHoOrwTee
 dq/7eCrUATj4LpMVNFyIgKHhlZH+mY+O2ciKP7sOsQFCkZjFuVEgeWXwBAEid2QQhh2g
 JS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kgaILkzEgx9KakTc5YyuGY51owyYmR8X+Z4MAHeHoEQ=;
 b=xRTBg+dlR/lEYF0uyG8YgjlnirbeTkqMNok9PLpVEeF2SgxnEqHfcgbpYjIB2Ow2lw
 xTBSwQ/UX69DPGo+FxKLoNAEDUGM033SsQHtMXbApVUlKFeIfWabdNwKdlwJMlKyJJiE
 pb6Eyg2SvXqQ9Ms8nCgKJPo8EYW1DZDpXjgTLlgCIex69Cwly0nHhadDrNRPizl02fuy
 O+HvzHa9bl6H27xVyplUEng1CgahRa6NF10fzTK20ngUZxcgmcmpIDbLq16kbIn6wVXM
 K8TmMpd/IJc+cO7nDtf24g+8lVCYwBE4i6w1B3E4YvA+ISCACAl3I3db26+yjmllRcOB
 FHig==
X-Gm-Message-State: AOAM532Z0xMm0432AWd0o8NGhS4sCYVkoqUsQ9ZtBxwrAMPQQeW0+KlE
 +pv+6T5p4yKMeZOKDThrlb8LSQ6By21Ww4CPvTXHCQ==
X-Google-Smtp-Source: ABdhPJyuyTD6kHCZoL1XBW6iOIl+lvrE1ll39BSleViKZCsyjkuicOAZMV0I4TpUCNjNALSxjCAxIneS4RCSAc1oTDY=
X-Received: by 2002:a05:600c:28c8:: with SMTP id
 h8mr19678979wmd.37.1642250426753; 
 Sat, 15 Jan 2022 04:40:26 -0800 (PST)
MIME-Version: 1.0
References: <20220110134644.107375-1-kkostiuk@redhat.com>
In-Reply-To: <20220110134644.107375-1-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 15 Jan 2022 12:40:15 +0000
Message-ID: <CAFEAcA_fgs1JAjMDXjd76xFWfmTMba1BfhYHFPrXCQyUk6o-eg@mail.gmail.com>
Subject: Re: [PULL 0/9] qemu-ga-win patches
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 10 Jan 2022 at 13:46, Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
> The following changes since commit df722e33d5da26ea8604500ca8f509245a0ea524:
>
>   Merge tag 'bsd-user-arm-pull-request' of gitlab.com:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)
>
> are available in the Git repository at:
>
>   https://github.com/kostyanf14/qemu.git tags/qga-win32-pull-2022-01-10
>
> for you to fetch changes up to 206ce9699fae1f631ac74b7e1115db2affc759fd:
>
>   qga-win: Detect Windows 11 by build number (2022-01-10 13:05:25 +0000)

Hi; this tag doesn't seem to be gpg-signed. QEMU only alloows pullreqs
which are for gpg-signed tags, so you'll need to sign it. Please make
sure you've uploaded your gpg key to a suitable keyserver (eg
keyserver.ubuntu.com and/or keys.openpgp.org) and let me know which
one so I can download it. If you can arrange to get your key signed by
some of your RedHat colleagues (and upload the key with those signatures)
that would also be helpful.

thanks
-- PMM

