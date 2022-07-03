Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B64564364
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:14:50 +0200 (CEST)
Received: from localhost ([::1]:47588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nGD-000252-Sk
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o7nE1-0007qA-Ru
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:33 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o7nDz-0001iD-E0
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:33 -0400
Received: by mail-pl1-x62c.google.com with SMTP id jh14so5566070plb.1
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 17:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6tMOk1gzfhwDNEPw+XjKywN3fVhhTOrMFLik1IhW3uo=;
 b=ljdEEqycm7qduQYcxnX79dZRiTUDWRi6ET77IVHDGbeEWT6mNym1xQSmUrqXySG/DK
 aKA/A1+kX3LkTTOqLzIF4aJpmE/cys6jStjgN7XMfAHnP0RpQAR9U1TN8474TD7sY3em
 +pDhvMWykiTcS/CnH8Epm5FJIHFxuBp/eHbQcRR1m0fT8NUW7Mx/1m1kmcurA3b8RUNG
 t79C48odB35+YH6trJZXPfaYXEHa+mncnMZwA8m5wlMr4MLRVxub14QRU2+9i5jMFAbI
 spp9kmlCsRSYs3oVSthKwwLafsWPkJl7Ybx8G4f/N1WxCUvPScErsFck/P9sPZ+n1dZE
 BzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6tMOk1gzfhwDNEPw+XjKywN3fVhhTOrMFLik1IhW3uo=;
 b=w/s8o+P/dSzbWOG/ntMULgHaGQkLmIIZRypEW0+gYljZRnmaPrF8EtN5TVU0Vz6NRu
 hZw4Vjf9V5xbjz5HroBIlNhEeGS9LqYCONouh3bEtwn9/VDtPAUObGKtDWNCxbFUlfuW
 mjoiyj+ovh5K1skNdxT+lj1Eoqw676Ysf7h/AhG64zlCASYBOnw6Xah9cncpbBzEYsk2
 44nEUadhUYCeXzVGFHNvh1MGgH9t4dSbxOONjse75x60stLEBoFaEnBz+r66swflV8cO
 1UKHeuFITE+iSgDvIZiBMXzscvzVFZmNBioYZN463/Q4nqtpawP46tEVNYxrKyZ+J/3f
 TuDA==
X-Gm-Message-State: AJIora9YywnPX+LiaFgKVipgVZJG2eGyH2Q4UtK2yiT1WletBb8Op9U4
 rQsqht52Q3vqUsTk+2Z6I6otHp9t6tTWsm5+y9M=
X-Google-Smtp-Source: AGRyM1vor1tWIU1Tb9sIUOXVeU5GWcy7k3bXmKr+NUq2WJUsKbDpzj/BoHmziIeotm9CGA9Mo3zsWsM3BozohaUhZ5E=
X-Received: by 2002:a17:903:2284:b0:16a:6ffa:c674 with SMTP id
 b4-20020a170903228400b0016a6ffac674mr28847909plh.121.1656807149919; Sat, 02
 Jul 2022 17:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220703000938.437765-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220703000938.437765-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 3 Jul 2022 10:12:03 +1000
Message-ID: <CAKmqyKPp=-WHkiFtxTW7LUMPwJdtNk=_4-1ubA=U=oBP_TL4ZQ@mail.gmail.com>
Subject: Re: [PULL 00/19] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sun, Jul 3, 2022 at 10:09 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair@alistair23.me>
>
> The following changes since commit d495e432c04a6394126c35cf96517749708b410f:
>
>   Merge tag 'pull-aspeed-20220630' of https://github.com/legoater/qemu into staging (2022-06-30 22:04:12 +0530)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220703
>
> for you to fetch changes up to 435774992e82d2d16f025afbb20b4f7be9b242b0:
>
>   target/riscv: Update default priority table for local interrupts (2022-07-03 10:03:20 +1000)

Urgh, this is wrong. Sending a v2

Alistair

