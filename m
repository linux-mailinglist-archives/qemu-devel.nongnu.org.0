Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976584B9FF5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:19:54 +0100 (CET)
Received: from localhost ([::1]:50864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKflJ-0000aW-LZ
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:19:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKfbX-0004zt-JG
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:09:47 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=41689
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKfbS-0003Pj-Bx
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:09:47 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id j12so12552295ybh.8
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 04:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AxT3GYqb0GmTSaRDS4G1IlBIVR9UlMzc1VconxXO1SM=;
 b=cwc6ZUtrxN/sfip0nBnq6Sh7nqa0QZ63OSK1AWanl4C7mYG7BsqymDDGN9J6auytXq
 ut8+ndrxBwp4sUHZ7hQnbmQSTuRaIlEI5Kn6StyzZJOl86+/sUsx7S39Hp7GP0q6yZeD
 Cqmyw2XqgQToO8Jv0nr8NOzAWs9XJIVWLZz7bzcw9k5s8eQ+xVgsxrpAU6vYiUL+L0C5
 N3GVEB06awgBG9UzH/v8e4BYHH7mLjlkJM7VGq/njdnNGeK7Q8AqF8+QOfqokmvP8kJg
 1cx6OuQHkRsvYDI4gFPrJmZ8yY2/C+WFAMaGduDjX8sobZ7Xt15nAEjGNWN8Ct32gmz1
 2Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AxT3GYqb0GmTSaRDS4G1IlBIVR9UlMzc1VconxXO1SM=;
 b=UhYBDwgMV2g4bp9gq7YaS9s61lwXjPk3S9oSDMRWVUVsM5p+7NXgBKszfnxbzA0lCU
 gCbOuDi07ulDEdb78twXAbQkW6HUIkA8cjjH/Gyt9i0ijJ0gcbQFBXoALRLCBl/VJ0OD
 74rbnwhVp6hKPgC9S9jWzMMstE/J4/r5irTOx36KhcNidA8br2Zf4NiPNKpvBhwfpCZK
 CV+mLUWesdHvPlQ7PdGRUR4mYy14MAzQxAK7SqvHpyXpumJ5DZ2vnpTWautaZy9qZA/N
 m0bOL5UB3SuL2cq2HdyFdPntLJBTgvGe0kY4Rm4Yl8taqcfDs2Qd4cR7IzUO6GFu+ylP
 uSow==
X-Gm-Message-State: AOAM532e7QD48Uww8geTEMgOtN0FHsuxD5CQkIm0VV6dbh6pI+FaNQAT
 nZ4csFjxTeY7hi0+8f+9l3Kn0iEwaUIMgknUhCP/wg==
X-Google-Smtp-Source: ABdhPJzyLDIiiqFALyiTN29umBRljmujSucT4okcLXiHDUSdsyLNDqciAJ1AmtNk8prbGUCCWyvZKEzSQkrW/dKIzuo=
X-Received: by 2002:a25:dec2:0:b0:61d:e09e:94d1 with SMTP id
 v185-20020a25dec2000000b0061de09e94d1mr2122643ybg.287.1645099781410; Thu, 17
 Feb 2022 04:09:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645079934.git.jag.raman@oracle.com>
 <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
In-Reply-To: <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Feb 2022 12:09:30 +0000
Message-ID: <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
Subject: Re: [PATCH v6 01/19] configure, meson: override C compiler for cmake
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, berrange@redhat.com,
 bleal@redhat.com, john.g.johnson@oracle.com, john.levon@nutanix.com,
 qemu-devel@nongnu.org, armbru@redhat.com, quintela@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com, mst@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Feb 2022 at 07:56, Jagannathan Raman <jag.raman@oracle.com> wrote:
>
> The compiler path that cmake gets from meson is corrupted. It results in
> the following error:
> | -- The C compiler identification is unknown
> | CMake Error at CMakeLists.txt:35 (project):
> | The CMAKE_C_COMPILER:
> | /opt/rh/devtoolset-9/root/bin/cc;-m64;-mcx16
> | is not a full path to an existing compiler tool.
>
> Explicitly specify the C compiler for cmake to avoid this error

This sounds like a bug in Meson. Is there a Meson bug report
we can reference in the commit message here ?

thanks
-- PMM

