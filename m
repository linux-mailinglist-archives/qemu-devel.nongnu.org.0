Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1772E8867
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:12:15 +0100 (CET)
Received: from localhost ([::1]:39362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnG2-0003nf-Nk
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:12:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnFE-0003Dk-DJ
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:11:25 -0500
Received: from mail-il1-f175.google.com ([209.85.166.175]:38065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnFB-0001R1-0I
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:11:23 -0500
Received: by mail-il1-f175.google.com with SMTP id v3so21745932ilo.5
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:11:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Icupdmu9U27/sDzf7zT4iWfvUBoyKpRz8gV7vODoUGk=;
 b=mB4oVYQIM7wLID35PxI+fmSe5mKDFijpnri9sYaRsLBIretrrVxXGtBpz9Q6BJvtjP
 VfwkyZNo/hZCpzG15c0vIppQ7N79mbCvAZvlL/84CgbDOiN5UOpzxc0oVT76kH5Nxzop
 ggjCXNbWEiJ9ORxGL7UI9WtoVGXkgGl06ahhprkLRAp+ZQHCBJ9GN6lSY4zg7ITMbAaM
 JKiO4Ah9MOdBXMFteOnpt4lKtqtjxFcN9Lv7EzlJjdQEzwDI9RyHEWwJLy4BvkRe3Hvo
 xQ5hokPlXGBeaJtLdKkgzgqnFp98RrhHmxvL4ddVKQ2PI8yqWzvtuYld9uya1UoGVzDp
 G0Rg==
X-Gm-Message-State: AOAM533vrNbms5KNguwix+uTBaixK2cf1G8sXyu8Kxxx3kdsYWAgBPGm
 3SECcrtWRv9Q4/4h8Ir7LoVph8Q3SaQ=
X-Google-Smtp-Source: ABdhPJzspwpgRRsg/KrBcGbhBvaH2CJ24t+TczrQj69+mn/oLCCI1PY6O/mtTr+ve0b9JL3yFkOWRA==
X-Received: by 2002:a92:d152:: with SMTP id t18mr63045884ilg.76.1609618280021; 
 Sat, 02 Jan 2021 12:11:20 -0800 (PST)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177])
 by smtp.gmail.com with ESMTPSA id o195sm37820479ila.38.2021.01.02.12.11.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:11:19 -0800 (PST)
Received: by mail-il1-f177.google.com with SMTP id u12so21736282ilv.3
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:11:19 -0800 (PST)
X-Received: by 2002:a92:84c1:: with SMTP id y62mr63515134ilk.191.1609618279779; 
 Sat, 02 Jan 2021 12:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-19-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-19-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:11:09 -0800
X-Gmail-Original-Message-ID: <CA+E+eSCbFiuGef6tVadscet58-F4hzuGqCLeVOU3kGTN0tzS5A@mail.gmail.com>
Message-ID: <CA+E+eSCbFiuGef6tVadscet58-F4hzuGqCLeVOU3kGTN0tzS5A@mail.gmail.com>
Subject: Re: [PATCH v4 18/43] accel/tcg: Support split-wx for linux with memfd
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.175; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f175.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We cannot use a real temp file, because we would need to find
> a filesystem that does not have noexec enabled.  However, a
> memfd is not associated with any filesystem.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/translate-all.c | 84 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 76 insertions(+), 8 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

