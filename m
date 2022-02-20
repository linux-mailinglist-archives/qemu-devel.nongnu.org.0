Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F304BCF3B
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 16:07:10 +0100 (CET)
Received: from localhost ([::1]:57010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLnno-0007nE-6z
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 10:07:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLnmU-0006xf-5A
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 10:05:46 -0500
Received: from [2607:f8b0:4864:20::1136] (port=37273
 helo=mail-yw1-x1136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLnmQ-0001Mo-VB
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 10:05:44 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2d646fffcc2so113134317b3.4
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 07:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mfoaHmtYn7qQB93RGFLpowS77DV1zylNQFTokSnR44s=;
 b=mfJaFZA+WVxHnKlaKPES8d/dIVZ6cyh/NafzQm3btcrR9g2Vkt2A6W1W/OOkSbYVES
 rziXsDH6uEaiqcaJ+bG/R7BgVH5kAXyjxJmc7mreDIRh1NBW8xwRZL77XTbrRY+3qixQ
 f35oUB/1N+LyR/7eMeNUztALjkIKR8J+R+S/kC0eoPAyh0bZq0C+oA2yvfaeEOwuOumb
 ENEQnh56DYiIEtun95lxWyY1dWtXJXApJY+tHaYFtdbr1AKBG3tJqT2KTzsdLOXfqrk4
 9sFWRcyb4WzuPqeHmMfwnN4IDUDwC+a05E2t2TRZH+wr7Vy1oYbxHodH+9zkNih/+GyY
 1/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mfoaHmtYn7qQB93RGFLpowS77DV1zylNQFTokSnR44s=;
 b=JKKVlW/wEMWB1S6F3oVMwDNH+HUe6W8D4NJs76zhLuQ+tm67NkbN+Lm8/W9IFpdhEL
 bF3eWRTr5gcCspBEt0JoEenGD4dwzq71gstHI2BRawZh09Pq31QDZ545h/cCY7CmLQKa
 UXS18UyWM58fyJaTn1J9hRp6uoTHTY2xxkixxvJ9KD4m9ssUzBxe7Ja72q3EGIxW2EHT
 VU63qFIg+s8XYodmrLvGaz0S06023qLM4jmZFQQDn/KYKknQ56m3FNN0hYjzyj+GUZDo
 KycBp7cR/GKcriaeU4Cow0NFJxkFQjyQbo3wdSRWsViG+5Ho7NYZW+gWUx2fax3Y7Xnf
 BMKg==
X-Gm-Message-State: AOAM533Xk/bTtVHa3CrJDVcN0iBdI6gNFdTnuBJAFFQF5ozUEp0McYvb
 w2xStjNC2YfsBBDJPc6u2d9UHSuvzwqEPXHlfC+LbA==
X-Google-Smtp-Source: ABdhPJzyRjPos1gfVJBb9xHJvKRivCkFsIa38yuJ2t2+cpoJh7EMCSWe+udvmi5ookiA87/uGkevTaBT2M1Xemq9ptI=
X-Received: by 2002:a81:3907:0:b0:2d2:dc34:44ee with SMTP id
 g7-20020a813907000000b002d2dc3444eemr16588900ywa.347.1645369541510; Sun, 20
 Feb 2022 07:05:41 -0800 (PST)
MIME-Version: 1.0
References: <20220217172500.60500-1-dgilbert@redhat.com>
In-Reply-To: <20220217172500.60500-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 Feb 2022 15:05:30 +0000
Message-ID: <CAFEAcA8TQJ8Wx0+Ns4XoFCG3JKC8VrcnTJ-=Oo+WuBhtd_qkUg@mail.gmail.com>
Subject: Re: [PULL 00/12] virtiofs queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: slp@redhat.com, sebastian.hasler@stuvus.uni-stuttgart.de,
 qemu-devel@nongnu.org, groug@kaod.org, virtio-fs@redhat.com,
 stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Feb 2022 at 17:30, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit c13b8e9973635f34f3ce4356af27a311c993729c:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20220216' into staging (2022-02-16 09:57:11 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20220217b
>
> for you to fetch changes up to 45b04ef48dbbeb18d93c2631bf5584ac493de749:
>
>   virtiofsd: Add basic support for FUSE_SYNCFS request (2022-02-17 17:22:26 +0000)
>
> ----------------------------------------------------------------
> V3: virtiofs pull 2022-02-17
>
> Security label improvements from Vivek
>   - includes a fix for building against new kernel headers
>   [V3: checkpatch style fixes]
>   [V2: Fix building on old Linux]
> Blocking flock disable from Sebastian
> SYNCFS support from Greg
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

