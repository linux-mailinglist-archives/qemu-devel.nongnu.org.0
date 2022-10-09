Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12555F891C
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 05:22:57 +0200 (CEST)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohMu0-0001Tm-C1
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 23:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ohMsR-0007Hd-FQ; Sat, 08 Oct 2022 23:21:19 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:38677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ohMsQ-0006DD-1R; Sat, 08 Oct 2022 23:21:19 -0400
Received: by mail-qt1-x82c.google.com with SMTP id z8so397514qtv.5;
 Sat, 08 Oct 2022 20:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+ZEdFEILKemBeG1S7wqCHbrRI/uK5PdjGsPjwpKMz60=;
 b=a+eBk6c4XpkGX6C0kXtBioHxl7n/nvSyAq2egV/m9yHjrVPXiE7ieBthiPtWsOcdkb
 qdg4Lics552GEJiCdrtgUuq6i3YyccAT7X0tEcGiUgGK0SRUs93EGeF4KriaaU8XzdUb
 ffWeArthVtJTTjR6PnxKV9Q9HydGnMf1M18dbLQdop51fAKNiBr6L5We0O9QDjY8t1KZ
 MRv/OhOgK/FTxgtI9an8mI1ujk+C//N5uKmOT9jYRDX6wwJdOqHH17AcsyMmJ1SrWa1d
 b+R7P/ewwCOD7YGwwWc7ziNNZi1nZg7vTdSZ4zl95GQrr6qzmx8dXgFZCdf0pSBrSbNI
 nBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ZEdFEILKemBeG1S7wqCHbrRI/uK5PdjGsPjwpKMz60=;
 b=FRFteooj2cvhVNTzj3XBZfch/wgCjgrdBbcvKoZVkzIR7+OPFjE7Xvdcu1h+UeT2hA
 XqSN6yV5hBVIT8bLKOY1vSvHNeNF1XIZvk0jWKdxNGli3M6nuKXIayqZGslYRHAmACcc
 b2fdl1Vk60NrnohxAI+wzhY6TWLkqzxZGRGxdFufeg7lUZ5QVV5RptG05WXPaaIXZkTU
 lG+z60z6P4POzQEfa4vMDNTcsoswB61cBxqHpZ/G575iax5WtOprFnD7G6KK/I6t2MOJ
 sfeiT5PAl2m88Ljl2YZ8gCqp9EX6259n1uHuN7UQI+RGpmCn9JCXUdZfzrJGjUovIpgT
 x3uw==
X-Gm-Message-State: ACrzQf0AwCsKWddTHgwdYlBOABVWYiQ50x/RuXEhkb+eMTBcQq8sRRo6
 L/EdjNORDWH1rRYSsuPqU1rIucpe6eHMiArAyoc=
X-Google-Smtp-Source: AMsMyM4BQ1qrLTPhrXaIhL/hnlySNcdhc3XvxEDRcHXc2EKN9SY93C7PLkx9bWxxC1VYeUEXq7w3I8/inB5vTCbt+Zk=
X-Received: by 2002:a05:622a:92:b0:35d:58bc:4a4a with SMTP id
 o18-20020a05622a009200b0035d58bc4a4amr10501374qtw.391.1665285676414; Sat, 08
 Oct 2022 20:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221003203142.24355-1-shentey@gmail.com>
 <20221003203142.24355-7-shentey@gmail.com>
In-Reply-To: <20221003203142.24355-7-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 9 Oct 2022 11:21:05 +0800
Message-ID: <CAEUhbmUFpd0o7gB=1VdFX0i79FDfsVcyvHq8qgaSNE20_QMnWA@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] hw/ppc/mpc8544ds: Add platform bus
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82c.google.com
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

On Tue, Oct 4, 2022 at 5:22 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Models the real device more closely.
>
> Address and size values are taken from mpc8544.dts from the linux-5.17.7
> tree. The IRQ range is taken from e500plat.c.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/ppc/mpc8544ds.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

