Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7FC25E4C2
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 02:46:13 +0200 (CEST)
Received: from localhost ([::1]:43848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEMLL-0002jv-KG
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 20:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kEMK4-0001tZ-UL
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 20:44:52 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kEMK3-0005cT-7v
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 20:44:52 -0400
Received: by mail-ot1-x341.google.com with SMTP id 37so7513446oto.4
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 17:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8KuhqHgtkRVWvOKolrbTGviPXza6sCvr3zYEivYnqhU=;
 b=BjcdFuon1XAKB/0e/ufbMngMr2jpsHtUpAOkspTSzd5+usj3ttQhcaE0jFJxEQd+ZC
 s9PmDM7/JMWWcmzJGto650nETQ3C1kchtrTqz9IHMofNkh23n6YL0AoXCY0CLw1NCh59
 cT7J9Ga4W3pl2Lk9DIy7T1pSnCo0N00/MeA2oGUJT4OwUGPtjPCSS1RIcFvr48uGjfsG
 Uzaq1GKz0CxBANqBtNm7C6ISxOFFLDyA+tcNJ3rzGEFTLR6JMpWXwb3Xq0R3tcKEOMyY
 WnclOdVvNNO17n2Qh89N958CoNtXAswlx01d8Tb8lLA1hjIe4/CzXjCu7wZ2ObJCJPiD
 He8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8KuhqHgtkRVWvOKolrbTGviPXza6sCvr3zYEivYnqhU=;
 b=jPsQ2GPtwwern0RTr0dwG9d2MIMefZy023spqy4OX3LIdvY3IHUjcTsWOmnYwL7Ize
 QZRPHo98tiefXXbykW7QVsTMw+Zuw3HYyaLrYelNfeew5v0ZBmRpSaw593DmooGGwHqN
 CGC5Em80E+lLqAXWZdk4EsJhKfqac0oqpC/rFpQcHWj9gI8vk8Mt6nrT/DdQx3vd1Jvx
 Q/TY1XUPbZs5a/KUpxIHw87lwHSznVumHRIy21AZ4TTdyE/9Aj9RjKpowMCZ+7Hm4pjL
 ioQa99bdIA2xzH6o5892iGnMP2IFWnHqeO0erkLKYfR0Aw3CIs0EHOT1JLzrnItjiNgB
 uu2w==
X-Gm-Message-State: AOAM5318iBkyH6ao1AO31l6TeSyn7hoR4LCTFw/xRK1GvoIPZqEN75aW
 cxW6bLXkzPJS7DOQeUS+yz7es/8BDGffSd5vJck=
X-Google-Smtp-Source: ABdhPJxPfbWKv1c/KmJ2yAF1AbH3q+5CquZgVA8dsd4nYPnHr7STdU+AAzvTfQK6mW2IwWwznzjwEDz/rVW9ISALkbs=
X-Received: by 2002:a05:6830:10c8:: with SMTP id
 z8mr7177565oto.333.1599266689325; 
 Fri, 04 Sep 2020 17:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200904134908.1396-1-pannengyuan@huawei.com>
In-Reply-To: <20200904134908.1396-1-pannengyuan@huawei.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Sat, 5 Sep 2020 08:44:13 +0800
Message-ID: <CAKXe6SJL8Y2frr1-d06=Ovoo=45+kJSGM2vhDGFeJf4YuUfN4A@mail.gmail.com>
Subject: Re: [PATCH] net/filter-rewriter: destroy g_hash_table in
 colo_rewriter_cleanup
To: Pan Nengyuan <pannengyuan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>, Chen Qun <kuhn.chenqun@huawei.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pan Nengyuan <pannengyuan@huawei.com> =E4=BA=8E2020=E5=B9=B49=E6=9C=884=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=883:23=E5=86=99=E9=81=93=EF=BC=9A
>
> s->connection_track_table forgot to destroy in colo_rewriter_cleanup. Fix=
 it.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  net/filter-rewriter.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
> index 1aaad101b6..9ff366d44f 100644
> --- a/net/filter-rewriter.c
> +++ b/net/filter-rewriter.c
> @@ -376,6 +376,8 @@ static void colo_rewriter_cleanup(NetFilterState *nf)
>          filter_rewriter_flush(nf);
>          g_free(s->incoming_queue);
>      }
> +
> +    g_hash_table_destroy(s->connection_track_table);
>  }
>
>  static void colo_rewriter_setup(NetFilterState *nf, Error **errp)
> --
> 2.18.2
>
>

