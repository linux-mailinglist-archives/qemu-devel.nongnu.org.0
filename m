Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA525EB2D8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 23:08:53 +0200 (CEST)
Received: from localhost ([::1]:50082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocvLQ-0002VA-1T
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 17:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ocvHF-0007JV-Cg
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:04:33 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:34756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ocvHD-0000N4-OH
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:04:33 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-351cee25568so15317b3.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 14:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=wqCwb/M1WlRhM2ahDhk3n7H2FTyBIg7up07CHrNGqtY=;
 b=OTVFpiqCTO5/2AH+SYYdsQYn8KJhnFo0E5R/qX92NyabZQeAzqC89lbHXWO3WzWd4S
 HxO/sVoBK2sahoZc9BzfPQT02EclR0mQVf8+G+52AbUdZz90xWW9feuieyG93Fu+WrK7
 Fo/SyKdTQDSRjT+aTSDLhmwZhSDYF2XQ+1XRH/GLRCXMudYa4H4Q0ypQZZfTO88GXREY
 482LcDQp5+jVEumchCUFkYTkv6Xr9Zb6HsBoSCXpzKEYJO2/KcDKxdEWDNwNBHvdOz0u
 O6LnJ1jMz7AUQAomHEpHpg+cgpOFsTyaooMa2jBfPs3b38lThyNozZ9yfIWjk7W5KZWM
 fnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=wqCwb/M1WlRhM2ahDhk3n7H2FTyBIg7up07CHrNGqtY=;
 b=vvr8pBBioS+LUIjlq274zhYbsHp/hcNiRALBQTrTdjjZVj5DoAuj5/fR4EKB8d7YrW
 2pJD+SWxa/1I/1PnvUDZx6gRRO4o2h1B0qp/+QfQ0/5fmSjbi5ya6+0snEmS8k0r6NX0
 IcF09EPEw+WKiyF4DFzPE+gKUQOyxsa+uv/pDU5SeiQKWNkemlVUyG6ZXL25tQdjFJQY
 gVuPgfwqBR/DFc6RgmmPmGZzGeMRq9he9PMszSsOpsQ7dtXDScOI8XxxDFjbAjBbaaxd
 BU0vv+1qv14y9TwFsXRJYOfHDEzNoj5kB/qniW5vVJ3yqMKj4N/gVaOeh959Ci7IeHMe
 h9IA==
X-Gm-Message-State: ACrzQf0TMm+iMNeG0B5TWM76MX+8yvCuS9oW+KZIE3ZtBf0cRB4q4WpY
 bskh0A8VZoGeeIAiFEJxN6mwc84glvX9JLHoZW4=
X-Google-Smtp-Source: AMsMyM4z4Mm8HY97r6lIsNAtx9849IpGgHahWgjDoUdsbj+r4y6yKtemKa915ZzMXJcZIPPzwW3RHoPqGhTbjbdywlI=
X-Received: by 2002:a0d:cc83:0:b0:345:14a5:a2b0 with SMTP id
 o125-20020a0dcc83000000b0034514a5a2b0mr22363097ywd.206.1664226268988; Mon, 26
 Sep 2022 14:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
 <CAJSP0QWi_xpNynSKsxH5gdK8gqt1jOjZqEsJ=eiJkypVShuc4g@mail.gmail.com>
 <CAKmqyKP4bTGUtDA39F_W1Bp6PxRVgcQr_-Zsh2aKG6wFjGeVpA@mail.gmail.com>
In-Reply-To: <CAKmqyKP4bTGUtDA39F_W1Bp6PxRVgcQr_-Zsh2aKG6wFjGeVpA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 26 Sep 2022 17:04:16 -0400
Message-ID: <CAJSP0QX=Z6Xjp_w5v1zzR_jFKkNArCDvFMP3RYH8XJr5BBt7CQ@mail.gmail.com>
Subject: Re: [PULL 00/12] riscv-to-apply queue
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Sept 2022 at 17:00, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Sep 27, 2022 at 5:29 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >
> > On Fri, 23 Sept 2022 at 00:08, Alistair Francis
> > <alistair.francis@opensource.wdc.com> wrote:
> > > are available in the Git repository at:
> > >
> > >   git@github.com:alistair23/qemu.git pull-riscv-to-apply-20220923-2
> >
> > Hi Alistair,
> > Please use the HTTPS GitHub repo URL in pull requests. Setting
> > separate "url" (HTTPS) and "pushUrl" (ssh) settings for your remote in
> > git-config(1) should solve this problem.
>
> Ah! Ok, now I see. I do have a separate `pushUrl` but I didn't update
> my script. I wasn't clear on what you were asking for last time. I'll
> update and resend.

Thanks!

Stefan

