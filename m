Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1D85BA6B9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 08:23:58 +0200 (CEST)
Received: from localhost ([::1]:38596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ4lZ-0000g8-Ly
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 02:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ4fx-00068N-Uq; Fri, 16 Sep 2022 02:18:09 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:40630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ4fw-0003Jv-B0; Fri, 16 Sep 2022 02:18:09 -0400
Received: by mail-qt1-x829.google.com with SMTP id cj27so3106696qtb.7;
 Thu, 15 Sep 2022 23:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=RoRBFXiq2umaYEq4fcyBa/xggTTkCbUQoARqmbeHGfc=;
 b=m5XHQkS5Of/OxSSYPocgElWBkZioswg7/Rxc7YOHyYcGzK18UZePxiXsV84TF3dz/d
 Qz5n/rtq5DeyhGBCtIy/XaXMOl1tRVKQH0U/bVWx8xBziGvIbggred2prFP2QdckuLzo
 GYeGeTls0eXw81LAd7nUXYDo2siOXNE+Ml4U1UzTd/jk3zNzdy3yYt1e59MzwwkQIr0R
 HnoRkYFk+UvDxKqQTEDHqWnlh0NZtHx2VxXdgUEHlxTjEieve3aiFQKdt2WqDS8zDd0r
 wnG1CoOEXbeF7M2HBABRSXBjQUhnfwZ7vMxlQWVknPxCeV569c1BAWKw8+sIne8RjkBo
 ufvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=RoRBFXiq2umaYEq4fcyBa/xggTTkCbUQoARqmbeHGfc=;
 b=CPxsNxMzTgp2Fv3FqZamG6zMdJLQvIDhr0phEnsg18h/Fhf3qNu63CmcgIt9WUGN8i
 aHkFYD2w0sJbRNvrIEH0A05Wb0YsgfbL8ZD2cphtJIVA1XWmQ82rtQ4utHTKI08qf4hc
 wSkfB5O2unGlY5kVAcUKQhcfSr/hkq7oRo/mxbQxgyR3CWLEaBW/KrGL9hgNT2hy1j65
 Ng87HAjnRqg+IqyCYs2KhzBD65topgNUVuQCF0ghy/TLQj4EtURSOfufIJU4EAaeiwop
 iG+GpAR43NZwAm1cosVUBxGcarWjtuH2ru6UjqWxibT3saDR2V2Vm7Hqo4sIEreMiUe5
 pMsg==
X-Gm-Message-State: ACrzQf06IAo78AowZN/YuJ6utkr8AXZZeFKJiw/aaOqbq+6+1FFPIi1v
 AyBsRRHgvcBKK7VxzZ9AKhimARBZaWN0QpByY1X29LFw7WM=
X-Google-Smtp-Source: AMsMyM5xdt2ZHEA19wFNweJscFZNUHu7vbniSg+ptI2c+RjI8Jnu3cs36VX6mjTVw57cWC0ccYjUKI3oakOjOyiBpgo=
X-Received: by 2002:ac8:5b0d:0:b0:344:8ba5:420b with SMTP id
 m13-20020ac85b0d000000b003448ba5420bmr3137145qtw.391.1663309086844; Thu, 15
 Sep 2022 23:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-6-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-6-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Sep 2022 14:17:55 +0800
Message-ID: <CAEUhbmUfU=WJjd1dwT7s7t1_45ShOM+LaotX1EeXVY3g-t_4Uw@mail.gmail.com>
Subject: Re: [PATCH 05/11] hw/ppc/e500: Remove if statement which is now
 always true
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x829.google.com
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

On Thu, Sep 15, 2022 at 11:34 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Now that the MPC8544DS board also has a platform bus, the if statement
> was always true.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/ppc/e500.c      | 30 ++++++++++++++----------------
>  hw/ppc/e500.h      |  1 -
>  hw/ppc/e500plat.c  |  1 -
>  hw/ppc/mpc8544ds.c |  1 -
>  4 files changed, 14 insertions(+), 19 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

