Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CD067E038
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 10:31:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLL49-0002zm-Vj; Fri, 27 Jan 2023 04:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pLL41-0002xi-A0; Fri, 27 Jan 2023 04:30:29 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pLL3z-0006r9-O2; Fri, 27 Jan 2023 04:30:29 -0500
Received: by mail-ej1-x62a.google.com with SMTP id gs13so1337087ejc.0;
 Fri, 27 Jan 2023 01:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R7ob1AVmHBK5OIyMnGMukLKHcCGZNe8i+JDZmQUdO/U=;
 b=kWu2KxEsQudQiacqoxoCm4SnppK3fkVwnDzpX1QXQiRweST54fIed7G1U8uca0zDlP
 ifGpzLjMuFjv3D6Nvi+92TrW41WGn83eDPiYyakIVSPY7ftvz3uT8d6sIKirNUZZKZj0
 7qFTIGSTmQ0BK+0kW3xyycoP9j7cu88BZbhx+IcA2AXBQtLlajlpZjf6fcXo7DB5cv/3
 oQ0afWUSTSpx431OpadtDtnq+MJFRTL3mXXYdIke3chj3zmWYL1WtPKGGwMHpVEDd1B9
 W20ktikiOOzJOtBiIcURYEPobml/hLy8UiBND/EMGWs1GM3Nawo2ynQBtxBD2mCUcIX8
 IPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R7ob1AVmHBK5OIyMnGMukLKHcCGZNe8i+JDZmQUdO/U=;
 b=fI/KgWpkoeyYMLdH478mWLIgqIvnqkhNH2A6ro312ViGSJI92ys6FgDYpcR6duHH9k
 MHQ6muXeaQouIP8dFjOmKdYqft22822hNs6/WLzqeU/7rqt0rw7a5xc3zsMHgSquSp2E
 Uc0yrw+c0jyF0fp8yYsAzha5kXkWf9sjaURnwJI+RROahSqkkfEpcQWRFoedEbe25RoF
 PLN2jU5zXL+1diKMNizGsJw2mTY9ANeK/t2MDvY3QyJDGEZ2HQcPpwsUwp9ChgQJgGTK
 mGYH8F2OP8L0Df7hOjXbAMFfBEOl0SBgru+kXV1UCdHiK561/f58k0QvF+gdhx0rA4i2
 BBhw==
X-Gm-Message-State: AO0yUKUUMM8GVcI+sJpiDD1xlm0Hlm+QL0PTIsNGIbe3DRii3864WTjx
 YwzrI/Mi5GiB3Utawq4VApUNgMS+nyLaDJXFPDo=
X-Google-Smtp-Source: AK7set9TX/D/8MBtsWc7JDn3kb7pX6CuD/iI/NboXPiLEtczkhD6xfv6dTiVFDKW3VGBqnOi+zEzMBSCjK88FhT68qo=
X-Received: by 2002:a17:907:78ce:b0:87b:dac5:eb78 with SMTP id
 kv14-20020a17090778ce00b0087bdac5eb78mr188689ejc.59.1674811824848; Fri, 27
 Jan 2023 01:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20230115123932.2564966-1-oro@il.ibm.com>
In-Reply-To: <20230115123932.2564966-1-oro@il.ibm.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 27 Jan 2023 10:30:12 +0100
Message-ID: <CAOi1vP--GzooUmGgOfZ+3=f92b2kcZktCbpdEfK+rDtyAGoEHg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] block/rbd: Add support for layered encryption
To: Or Ozeri <oro@il.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=idryomov@gmail.com; helo=mail-ej1-x62a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Jan 15, 2023 at 1:40 PM Or Ozeri <oro@il.ibm.com> wrote:
>
> v5: nit fixes
> v4: split to multiple commits
>     add support for more than just luks-any in layered encryption
>     nit fixes
> v3: further nit fixes suggested by @idryomov
> v2: nit fixes suggested by @idryomov
>
> Or Ozeri (3):
>   block/rbd: Remove redundant stack variable passphrase_len
>   block/rbd: Add luks-any encryption opening option
>   block/rbd: Add support for layered encryption
>
>  block/rbd.c          | 189 ++++++++++++++++++++++++++++++++++++++++---
>  qapi/block-core.json |  31 ++++++-
>  2 files changed, 206 insertions(+), 14 deletions(-)
>
> --
> 2.25.1
>
>

Hi Or,

Looks good, just a couple of really minor nits which can be ignored if
you don't end up reposting.

Reviewed-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

