Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78EC5F88D7
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 04:22:35 +0200 (CEST)
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohLxa-0004pN-QU
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 22:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ohLwX-0003UG-Ml; Sat, 08 Oct 2022 22:21:29 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:45996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ohLwV-0005Lj-Pr; Sat, 08 Oct 2022 22:21:29 -0400
Received: by mail-qt1-x82c.google.com with SMTP id fb18so4864969qtb.12;
 Sat, 08 Oct 2022 19:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P1U4oa6YGtSErPiKjQw2GvyDCiSwfNfPDDfhSlUoaO4=;
 b=DHy6AyOyyxE5L32X9P6KPkvhLuWKZlrdTB8y88LvUr8Sw7l+cEdPEOE/Gh78RMCoJ/
 SbQDypy7+c2IdXsUKKP0PTVCLoQ+3BcybZcwS8SIyOvbSZLZkcxd+hDNU8LNEfitRpZC
 XtXbfOuDVtbB4wn51eqfy9GrPSFS/tWgKeoM5m4QaOpEGsnxLr+2Pp73nwSQr4YXgRKO
 z12b1eSLz/8eadX5OkLhkf+e57EUwOsCJ9AzGseDVtXOfyZeUnxfVZ7a3MHJJ8aw+1KL
 hh2MVBZPRLfgBXKym4/xR1SzHQoDIz9gOCYQu7IaGBWt7fOahI/QyfHtC7s9F7/+JCi2
 MMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P1U4oa6YGtSErPiKjQw2GvyDCiSwfNfPDDfhSlUoaO4=;
 b=SwA0IU3NRSSruts74iY2vKvCTRJUvri8nQmlrcZ5w7klJ+b7QiWmN3xz4GJB8S+qEa
 XNJBVvgGA3sNgk5oh5a5+Py1oEYvnQrkygLSTPnCVpPeXN2qMx4cRr79me+NP0w46JUy
 Eq/QH/Nvwp52N4Qv9LjGqlP5BXXuDpXm2vwqDkAEGIcFm2er14hq/qQSzgFIntZbu573
 XqhZt4VE6451NzR0D8WoHUA+s9LK1A02oQrzRCCL33tgEPPLLB40A7thKP/n9QDJgia2
 XBkC468uOFURSsFTWNHrSS/MEWAVN/xPTuzm5LnLY9RtwnSiTzUHcVXrnwMcVr1ybwoq
 OWKw==
X-Gm-Message-State: ACrzQf1Wlll+voC+yz6XVRUtxp+G/J1Ne3ajR31LOqB2wAz+masEQT0g
 MNHNTw+N7g0WIcjhJkCrf0QY0dYKcL0+hfSTWYjhd0sVva0=
X-Google-Smtp-Source: AMsMyM4vDsiXSCTOhDdUOMqf+Zar3a6UpD+uKdKds/annLjooZaWBVt1TfR09lGEwH3pQg0FlD6nY5/joGu6Tg2Uhm8=
X-Received: by 2002:a05:622a:258b:b0:388:aaf0:62b0 with SMTP id
 cj11-20020a05622a258b00b00388aaf062b0mr10107776qtb.543.1665282086127; Sat, 08
 Oct 2022 19:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221003203142.24355-1-shentey@gmail.com>
 <20221003203142.24355-6-shentey@gmail.com>
In-Reply-To: <20221003203142.24355-6-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 9 Oct 2022 10:21:15 +0800
Message-ID: <CAEUhbmXCV2aUheyHuiJwHUi6ExRiPJ_db2SWdmJUFMv+WV3o9g@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] hw/ppc/mpc8544ds: Rename wrongly named method
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

On Tue, Oct 4, 2022 at 5:15 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/ppc/mpc8544ds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

