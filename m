Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A905A25E9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:34:34 +0200 (CEST)
Received: from localhost ([::1]:36386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWfW-0004N9-Dg
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRWbi-0001JH-8x
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:30:34 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:44939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRWbg-0003fC-Lc
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:30:33 -0400
Received: by mail-qv1-xf29.google.com with SMTP id s1so714576qvn.11
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=DRxeASoi1qWSiLY1RbSxkH7zuCpYdup2uBWiAKdvJu0=;
 b=Sn+R6BcOu+GvtOcu03A/YrXZBT9TXwkayCvWF10QOtP0urWqp/ya0rSy9j6sWS0oVy
 cwiF0Z/fmZYoIGH3Zsii1n6kbQwhaO4u93xiPDY+s1qFVLB8buDHOYH3aEf7leaevkLQ
 dZAVHaWZk1w0oewSfWOW/u08WllMbPtGQ1OQZJPG4ry4pNJuYD2P/1zGSJjC5UZCYT6E
 g2srbmCbqSTaNuniifLa3scUHeNVIg1Y2eLVjIyIyK6mvcgY7iDUW0j1QTHy8hxczrCr
 EvCNAaTa2YDCnUpKzXMt/vDn+mTl3PU7wMXw/P4OxAHDE61VVWIz0msVQkxap6V1SoOC
 xGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=DRxeASoi1qWSiLY1RbSxkH7zuCpYdup2uBWiAKdvJu0=;
 b=XmIFTBA+PjmML6VTgNLkhneF4WMoCpUuJb+8VCNyphFLZRUY2w4EY7A0ENON9VkSyT
 0cSadD8rIJOVn3jzVmvwRUaBWzEd3GOXc6rjsC7ItXYQn3Vf0bX6/0bWPviCagYgvX0D
 hm2tZyJLCsvfAI1cXaTUukxR3EPzQMvLIqdugJEDSgo1kmLIuwhSw6X39xnvBEeJ5Pe6
 V1bjF0IozC/0R5P7ewALBvZDANvVvlohORtIlpCQKrAI28gGlcM0qcsK4CEqZ+/7j5TI
 ZUzf4jkb1gX9+obz1eRLet9PKz3gquNf/cGv6FcUrhWAdnbKRCOmDtY0zLoEEZKD40Wu
 1j/w==
X-Gm-Message-State: ACgBeo0gMN3SENuM4qwu8Eb00NnUiIpiQCfaWdfDXl+GKV689NqVZxnU
 ejjLGxtNsUUq1AMvKjrhl1yUFyBBxO6UclGJfKLrJtTNaWE=
X-Google-Smtp-Source: AA6agR4viq3NSA4GsfuQ08EA3DYSO0yk3QFVS9MtyO0Q0V9tJQlGKHUjjvMrom8BVVSh5dGRjAIcmtTLONNzbQyMvwc=
X-Received: by 2002:a05:6214:629:b0:497:2c65:32c3 with SMTP id
 a9-20020a056214062900b004972c6532c3mr5010553qvx.122.1661509831737; Fri, 26
 Aug 2022 03:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-10-bmeng.cn@gmail.com>
 <1709102.QJTYiT9k8f@silver>
In-Reply-To: <1709102.QJTYiT9k8f@silver>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Aug 2022 18:30:20 +0800
Message-ID: <CAEUhbmUWScohEG7aV9UfU1ARj5y6wmam+uqJ4zyFMHnyfwzr=Q@mail.gmail.com>
Subject: Re: [PATCH 09/51] fsdev/virtfs-proxy-helper: Use
 g_mkdir_with_parents()
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf29.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 26, 2022 at 6:09 PM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Mittwoch, 24. August 2022 11:39:47 CEST Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Use the same g_mkdir_with_parents() call to create a directory on
> > all platforms.
>
> The same would be g_mkdir(), not g_mkdir_with_parents(), so please use that
> instead.
>

No, g_mkdir() is a deprecated API.

Search result (https://docs.gtk.org/glib/?q=mkdir) shows only
g_mkdir_with_parents().

Regards,
Bin

