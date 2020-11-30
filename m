Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3562C84AC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:07:56 +0100 (CET)
Received: from localhost ([::1]:58600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiuJ-00016h-7z
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjihu-0001KI-G8
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:55:07 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:33732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjihr-0002RZ-9L
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:55:06 -0500
Received: by mail-ej1-x642.google.com with SMTP id 7so21641431ejm.0
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 04:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cCK2dF3NA3U7jjGNhrTKvI22hSApBR5+1tBSb3U1QOM=;
 b=wZUgRxwl3qssNsTKa+VilSLjX76gF/cNs07LkVm0k7N/mshzrz71QaYaL4TBvRhlxr
 W1qj5MB/4NBrNwARA4exAq5w9ibdzsikPX73+hpLoUHhxxkKGSkRlPapZcTceRLLOfgi
 O6yMluQnV0cKdpUF9qNY59nG3AZVozIDxqyn7UabIg7Ev43dbnKQ0xdiSGUHvhdGmYgD
 AK2oeUr+d+FnFB5i1J8WR19hhl2ldrsVUoLhmVo7NGmBUy3gBNib0rJIwxnDuuy8S9Lh
 X8SF5Jwuf3wKYOWEtg5dITYI3JJC63jQGPcXZJFfSyON8XEFua7ok78+jL5BmYP6usm/
 fsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cCK2dF3NA3U7jjGNhrTKvI22hSApBR5+1tBSb3U1QOM=;
 b=HPhoiGa/e6EK4iz7kY8gq1B4oiIgFR53AcIymkoTzz+Rr3nRhIy1LRmAw39Y+QERBZ
 MJzd9YgfmHEpEqTn9TnlNEzixGCSX/Im+JDqruDYNe68zG5+lM/ARMkXzrqtwLIcRx3U
 PnU/xfDaiIWjj/+4PwKV3Onb62T9MmH8weoan5dhjeOq0c7mlRHZUlDOObXxyNm/3ETC
 a0+3bCJO90p635sKFtQqdqMMQ4nC80j0yU90i/dZVnVxnk6qR/4JtXc0LmeK3o3IZO6m
 nGHFFi5w6k2RIF8jPxeItzDaSQFOFsyjs8GWu7/gjwO50mV2zJ7+/gpnm//r4p1nH6it
 m3eg==
X-Gm-Message-State: AOAM532zJYGZ4IPyduoGV4s3XO7af59zKn1gCxP8hqY4y89wcQSWrQ1S
 C1P+rXj9oiJ4YBwFord3ySuyPQ/8ItV7zdXKNyoNUg==
X-Google-Smtp-Source: ABdhPJxPraN2X7zyHdb1nGfg+ULeBVwXDk/pPpZoh3Cr8a87M3cELOQB0k4ErcCg5CxhZ8rCsU26caQjCG+ICoEdJCk=
X-Received: by 2002:a17:906:d8a9:: with SMTP id
 qc9mr20454744ejb.482.1606740901654; 
 Mon, 30 Nov 2020 04:55:01 -0800 (PST)
MIME-Version: 1.0
References: <20201117105219.1185736-1-f4bug@amsat.org>
 <20201117105219.1185736-2-f4bug@amsat.org>
 <CAEUhbmXRND_nb5oMEM4RdeAjnC2DKYzoYtyz5aJusCs2p8vo8w@mail.gmail.com>
In-Reply-To: <CAEUhbmXRND_nb5oMEM4RdeAjnC2DKYzoYtyz5aJusCs2p8vo8w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 12:54:49 +0000
Message-ID: <CAFEAcA_CcWGjX-O+NGxE3zRv8s6fQ_vKuXWXy3Q-qQjrmBvKnw@mail.gmail.com>
Subject: Re: [PULL 1/1] hw/sd: Fix 2 GiB card CSD register values
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Nov 2020 at 12:53, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> +Peter,
>
> On Tue, Nov 17, 2020 at 6:52 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Per the SD spec, to indicate a 2 GiB card, BLOCK_LEN shall be 1024
> > bytes, hence the READ_BL_LEN field in the CSD register shall be 10
> > instead of 9.
> >
> > This fixes the acceptance test error for the NetBSD 9.0 test of the
> > Orange Pi PC that has an expanded SD card image of 2 GiB size.
> >
> > Fixes: 6d2d4069c47e ("hw/sd: Correct the maximum size of a Standard Cap=
acity SD Memory Card")
> > Reported-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > Message-Id: <20201025152357.11865-1-bmeng.cn@gmail.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  hw/sd/sd.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
>
> Any chance to get this patch applied to 5.2 since it's a bug fix?

It's already in -- commit 575094b786e999e5fbd0.

thanks
-- PMM

