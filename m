Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263EB336A69
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 04:08:33 +0100 (CET)
Received: from localhost ([::1]:42884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKBge-0003Ul-4n
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 22:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKBdl-0001Sw-AV; Wed, 10 Mar 2021 22:05:33 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:43090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKBdi-0004nD-IW; Wed, 10 Mar 2021 22:05:33 -0500
Received: by mail-yb1-xb31.google.com with SMTP id u75so20154569ybi.10;
 Wed, 10 Mar 2021 19:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1ptbtlIP36bOSFRDtZzIYVX/sw4w/I3HupOmWNFPq6Q=;
 b=Q8JS7utTsrKEAOXLwi5RlPDeIBGKI4LBzjZizXSx79G2YmzTA4+3gBHPNjxndTvNhJ
 FbrEADjNBJXBfTW5FglIyfU2a7rRYvPoI9V4L0t2fkSHzBDIgMcGumgKLm7Oje5G+0DH
 wmNFWIHHMjvwamnS0CZzOhi834mIFolycEl6ZqjB+j6kL7Rs7WiEADjkirUXTgqMu8DT
 QMX5qJge3YJzEP5OV8HRAyYVBTwe/Kw5nwzGYyrfxfU5A2UAumaJxjTUTH5rgex1lW0f
 R303BSmHYBhm6Qg7DIg9AzStJevc/IMKNAFxFYHmrU8pTbBf0P12rxMNDhDAzDKOgJNc
 kvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1ptbtlIP36bOSFRDtZzIYVX/sw4w/I3HupOmWNFPq6Q=;
 b=TNflqCKVDIJ5vTXtRXZq6TY8XqQu522QM2ZB5DQ1hlE7sbi2Rx2i8Lt6bzkxy3hvy8
 dejrrNd7SiTQWNCdjgX9C0b990tJI5fnTU8rkt/UOPmiCzyzW+w6J8dj3lsa8eGBk5PN
 P2LYiqCVO8xXnt2Z4e54o5kYIE8+rVFtZ3gQzt6FH4bJ95JCE8jKN5YoNFl93kg+CuKc
 WRcM+KyP1/pqEhCIjGJdI6IdYvI37btEuni9VjkJs/OtOOC/y2qYXoISsnZhNFXbUh33
 5es7nDM74pMIgzXoU+OWmaAvr9B1jtwcTc0Ef5v07+RWQ4JfWoiWOOdI8hZrQ4EeapDn
 /2Ug==
X-Gm-Message-State: AOAM533ggyKjt2pSLMpPYR063Eud6pssQHv6U1uQBHuqPrlNsccRH1en
 oskicjxHakdgyr23D5roZpl6tsiz2fFFGcqbQFA=
X-Google-Smtp-Source: ABdhPJyGiVfJ5dig7hSMmnEEqUz34SX9wMAe4XiOVdcfIbmIphSGnvKg6sU3Uzy/Sfgr4zPNDOTGSE2EOFlNYu/QJg4=
X-Received: by 2002:a25:d28b:: with SMTP id j133mr8107498ybg.517.1615431928185; 
 Wed, 10 Mar 2021 19:05:28 -0800 (PST)
MIME-Version: 1.0
References: <20210310170528.1184868-1-philmd@redhat.com>
 <20210310170528.1184868-13-philmd@redhat.com>
In-Reply-To: <20210310170528.1184868-13-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 11 Mar 2021 11:05:15 +0800
Message-ID: <CAEUhbmUHHkuSK6P8fgUYhAwzdE-+d_X-J=iQHunYY2qG4vmy8g@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] hw/block/pflash_cfi: Replace DPRINTF with trace
 events
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 1:43 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> From: David Edmondson <david.edmondson@oracle.com>
>
> Rather than having a device specific debug implementation in
> pflash_cfi01.c and pflash_cfi02.c, use the standard tracing facility.
>
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Message-Id: <20210216142721.1985543-2-david.edmondson@oracle.com>
> [PMD: Rebased]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi01.c | 81 +++++++++++++++++------------------------
>  hw/block/pflash_cfi02.c | 78 ++++++++++++++++-----------------------
>  hw/block/trace-events   | 41 ++++++++++++++++-----
>  3 files changed, 95 insertions(+), 105 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

