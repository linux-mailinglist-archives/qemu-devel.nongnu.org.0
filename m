Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF345F19B0
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 05:49:08 +0200 (CEST)
Received: from localhost ([::1]:36828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeTUx-00070K-48
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 23:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeTT0-0005P8-Ug; Fri, 30 Sep 2022 23:47:07 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:33375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeTSz-0000ze-E9; Fri, 30 Sep 2022 23:47:06 -0400
Received: by mail-yb1-xb30.google.com with SMTP id o123so7411407yba.0;
 Fri, 30 Sep 2022 20:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=zBywMX03c0HvYnXO2yvVQKcqPeufbcO8ZPsW38lGE+w=;
 b=Oz+WyZtglW2xJf8MwXpVaBSXQv3B/FzUc+F6GYnZ6LvC/aVJ+AhxUfK5KW47NP96Tq
 +si3G1swMOcQFxCCmxqzhVVN1HwSUD13xe89zyFZFYfdC1jbeVyQZJaEpINhVKwrXLga
 3H8sjd0nokY77NvAI8AM7gV8EGBGAdP4BcsxHZdD82HY5kgLs/tvDSje5jl1nuI90wNb
 q5O9cen+hc7kH72Qh4oFyykR0qwmEDx8SdDIICIQtl0wvlmCsJQcBeLfBMsedhWty+Qj
 s5smYjR3wcecXXHKTjWQZUx4Id/pWGiGlH3PYeNzNC5RF0aPuq2dlQs4q7b9LkoZm2ia
 MdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zBywMX03c0HvYnXO2yvVQKcqPeufbcO8ZPsW38lGE+w=;
 b=K8Dj84wZsQYYUzOhnGbKmIJdy/pkxNxSe5oKs1OJFINZMMAC2Iskez3ww0+k5zw/h2
 2P0TSnpbdeCyoAlJcA/mqzdxSLJHr/C6RuJeArJ38vh0lxqhpqCyaIRZwd7/yOiP5GvM
 ADqpcK+bilmokHabaaop2doajmbd4Rz3Y4ObqxLMikgIT8zPxznmVuN2wdl+8Yxuz1aF
 sLxBiR43HpATCoItV6b0wpEp2EPijtV9fL9zAICcpDpUW3saGTg9uNCe3tZu/DK8Qr4b
 5DL8+5rIrdJGchXiZVOQSQEHwiNxR9ZvwyAUNAxPK8BIVuDGcYxufcYGmLa/ishx/RBr
 Z4vg==
X-Gm-Message-State: ACrzQf1H8hdAY1sN/9tuZZRW/aK3Vs4KTmvlX636/Eefnv8A7/5JaiEr
 6NH4xW99jvDMFb5fDMo0aF5RptBbtL/8eRY88I7g0eJl
X-Google-Smtp-Source: AMsMyM7FPMScnYoMkwBS/MXGMexeupfkw+p1+JFwGkp4UQic3HYRejnRF4wlcCZghWUDEgB32g6rMhWEf8lVK+nA6Cg=
X-Received: by 2002:a05:6902:42:b0:695:9d03:f138 with SMTP id
 m2-20020a056902004200b006959d03f138mr10305797ybh.503.1664596023739; Fri, 30
 Sep 2022 20:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-26-bmeng.cn@gmail.com>
In-Reply-To: <20220927110632.1973965-26-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 1 Oct 2022 11:46:52 +0800
Message-ID: <CAEUhbmWqnQ=QipPW7tS3SJOcHzvJVUgL39RyNn8TTFcVk-6bDw@mail.gmail.com>
Subject: Re: [PATCH v4 25/54] block/vvfat: Unify the mkdir() call
To: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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

Hi Kevin,

On Tue, Sep 27, 2022 at 7:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> There is a difference in the mkdir() call for win32 and non-win32
> platforms, and currently is handled in the codes with #ifdefs.
>
> glib provides a portable g_mkdir() API and we can use it to unify
> the codes without #ifdefs.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Change to use g_mkdir()
>
>  block/vvfat.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>

Would you pick up this patch in your queue?

Regards,
Bin

