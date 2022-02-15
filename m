Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907434B74E7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:59:20 +0100 (CET)
Received: from localhost ([::1]:41562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3yp-00064s-29
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:59:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK3XD-0003OT-C7
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:30:47 -0500
Received: from [2a00:1450:4864:20::335] (port=40630
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK3XB-0006qB-Rl
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:30:47 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso2197579wme.5
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NovkQHzPHZJkhg/HvMKcerIaNuGaq5LEpB+uZFKyWAM=;
 b=moujulJPoPR/VE0R361vdkgpH5HdsFillPPeN32yjApV44dBVEosPZ4/6r0HKuGpwP
 v8I9DnntIIMOzJRakLz7PJQvSr10CkX2s1rrDbbyERcxAxAo7390bMexPzjYvVIgi4/e
 JbxzDHyqtDumQaKH1EonmUTyIXl9JFeNBZ/Qds80dArfmfj6GN3/nayb1JJrwLHXoRD9
 eMtpPXmJP9tqyGm9mk82+tPuZAhWGWkGSuO/WW84gvKUd+WB1DZPqNH44UsOItZgKRFM
 0Fyd3BVR4wOvF+gLWB/NcU/f0REecje8bakhq+iLHM6GyoJPdpFjpUD2qUyjxMadg9In
 I7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NovkQHzPHZJkhg/HvMKcerIaNuGaq5LEpB+uZFKyWAM=;
 b=P6xGkmH768XnzwJJBAytbX9phM7NjbkgF90xAcA2izj7+PfUCTsmtwss0iZTDJ89+p
 BWBvK08R+ggzrhBFm31clKDx3FFlnbeTAoayFQ1cLljfv0g3kRDznPxfhZ5SRMUcVfT7
 I9zgqE4UXkirHjOucJvPSgC0yig7AgSBgId6qEPRrXQURp+824grufc6wk4oB7mfyBhJ
 vOj4PtWGWWxfdajPbuhbcZ6TxcXsALC7kLllCVzAD0XGeAR8lwwA+P+3zaKEPGseb1/E
 TmLOacbOmBLL53seM0llnZmDgwcMjKxIUUaMihjOzXv4B7xUiRz8+tSBj+3QE8Bs7vNC
 Bf0g==
X-Gm-Message-State: AOAM533YeFFmHJ8mEoXDW/5C5+oS5Ku72UPmMNOa01H4khzjoz6pfK2v
 CMw4XNTrGFZqnbuHHdx52JC8ZvLoXalyxzKcASuzvg==
X-Google-Smtp-Source: ABdhPJz3cFt7HJ98cvsk0q9YWuJ+JMmOl95KdjYmoKZ7E/cV/CNz0XxW8V7tdA+Hf3Y+5qw8y1wKdOTY+SG7m/kumu8=
X-Received: by 2002:a1c:f705:0:b0:37d:f2e5:d8ec with SMTP id
 v5-20020a1cf705000000b0037df2e5d8ecmr265994wmh.21.1644953432643; Tue, 15 Feb
 2022 11:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20220214080801.13627-1-its@irrelevant.dk>
In-Reply-To: <20220214080801.13627-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 19:30:21 +0000
Message-ID: <CAFEAcA8Lj-FcnO=ocQWH1UC6KS=GQesVR8cdTDxCGNSFsSuH-g@mail.gmail.com>
Subject: Re: [PULL 0/6] hw/nvme updates
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 08:08, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> The following changes since commit 48033ad678ae2def43bf0d543a2c4c3d2a93feaf:
>
>   Merge remote-tracking branch 'remotes/vsementsov/tags/pull-nbd-2022-02-09-v2' into staging (2022-02-12 22:04:07 +0000)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
>
> for you to fetch changes up to e321b4cdc2dd0b5e806ecf759138be7f83774142:
>
>   hw/nvme: add support for zoned random write area (2022-02-14 08:58:29 +0100)
>
> ----------------------------------------------------------------
> hw/nvme updates
>
>   - fix CVE-2021-3929
>   - add zone random write area support
>   - misc cleanups from Philippe
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

