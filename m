Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2B750B315
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 10:40:20 +0200 (CEST)
Received: from localhost ([::1]:53772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhopv-0007WL-Fa
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 04:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhohT-0000SG-Kt; Fri, 22 Apr 2022 04:31:39 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:40705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhohS-0005FA-5i; Fri, 22 Apr 2022 04:31:35 -0400
Received: by mail-yb1-xb34.google.com with SMTP id i20so13191440ybj.7;
 Fri, 22 Apr 2022 01:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=939h+OgPaz+YZ/EgCxfvd8Bd7SSMSV7IbQleJ5D5K4k=;
 b=YRy5lvnKz9+BE7NkhGUPi1EfTVUab7gTaIZ4+H0+ze6GzVK5fpGx0wUYPICtEwUukA
 qepEm8dU0FXDxn3RuDRXAJsTfBbhKHPnglF0nkgRHtnYteGFCspMHEZITJ+z/Dho0XEn
 dOhCBpgBZAez0Z2uMTyJPdNzicK4lDUHpUP8Qb1/oaVKUaOdW3F00eoR7Kd0h+hzkf4r
 3FoCe1DGB5jZ+m2BIBgrtomm/fZAhIT0+Tg/nUYQXq8AplhCHUcgWen7fdlsEfiQiBTb
 diPwMJ5FXQ9cU7Om6h0U9wzMZ2Yop3otOqeSfVBsSvhSDbI4M5goSQ7VyYoDjCeffPlq
 qxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=939h+OgPaz+YZ/EgCxfvd8Bd7SSMSV7IbQleJ5D5K4k=;
 b=E01dGdM7QMz8nASRZT9SPFkRK4GIr42wnBMoMHlASsoLrVjqGmy7GJl9B7ODS7h0Id
 Z6ZZDAVFFPZr1scl0QVKeKgIvClm2AEjFPkviSCJl100ib5tI0QWPEvm6Nwj2uyRz0w1
 e2M2XSrvH3SQzlkhwZ1+pzL7EbX1rmMOQ6QKVPyC84sG4o25mMPqbSxfhzBUhnCnqhW3
 DtQZAgiTbwQ1olOfU8XgFcbuAHqzxzTRq/aSDplqpCzj0N6Ip+v7yOPRpquGxbsi4sQK
 6zoWE8CbKUou4NdZcmEL/hfLjSt8Z/ouTam7jNBR0prvt7SCGBNpM+yi74/zIn6/KmPL
 7TZA==
X-Gm-Message-State: AOAM532HizKasqRzP+XbegrypMzWoPs4ozM0eGKe7d1M9M1XndD7CdFp
 0CNbn6FoqCpduCkrhIsuhw0Cbtz/no7ULaX8pcE=
X-Google-Smtp-Source: ABdhPJwjcqtkFVl4tnVVVCvnjg5JVj9FSfTRuqSbfR70vqBr8APMqwjCl/yd6VZrnYi0pSmpi9SFdVCkEITL9O4ngFM=
X-Received: by 2002:a25:f625:0:b0:645:d7a7:f688 with SMTP id
 t37-20020a25f625000000b00645d7a7f688mr466132ybd.239.1650616292887; Fri, 22
 Apr 2022 01:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220422083007.1082667-1-sw@weilnetz.de>
In-Reply-To: <20220422083007.1082667-1-sw@weilnetz.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Apr 2022 16:31:21 +0800
Message-ID: <CAEUhbmWykNV2_mU6AiAK-HP8xNT6Tbhqc-ce=b_t0j8pFoekng@mail.gmail.com>
Subject: Re: [PATCH] docs: Replace Qemu -> QEMU
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Knut Omang <knut.omang@oracle.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 4:30 PM Stefan Weil <sw@weilnetz.de> wrote:
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/pcie_sriov.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

