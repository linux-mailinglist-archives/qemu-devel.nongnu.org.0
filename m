Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489372E8873
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:19:08 +0100 (CET)
Received: from localhost ([::1]:52390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnMh-0000xt-BQ
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnKV-00007e-EL
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:16:51 -0500
Received: from mail-il1-f176.google.com ([209.85.166.176]:38368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnKT-0003LE-VH
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:16:51 -0500
Received: by mail-il1-f176.google.com with SMTP id v3so21753546ilo.5
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZJZoES9TP1seFVwtHuriRUUrOf6TgEQY9l0baZOE02A=;
 b=oGBc/XDy/m32exkbRsRqMiAt9le9BpcuMFayvTqPTu9siClgYT4DHs2bqyn+wTlGZ+
 9CeZ+q+orpKtNEyeaCev73Cstn/mhSEXKlIBqgz/KmIik31FTHaB1h051HZfi6FQcWET
 apIJGVJ+5xufN7L3D1zfoxlBRy5F4iph7yK3L1iVIhi0z21dBYzcKYcds7T8fx8WY6e/
 F8uR5/BeY4eFT4yEqHNyiZnkHEmbW1FPp7qOtEwdt9aZvxb4yQnHSQqzQGeo+cHMIQTc
 /vRIWj+sztaZyUZt/jvR8mVtEXu5rbbJUwPrjWBfqEomaP3ZtSyCuqayNGaZ/AEq2A0M
 Hopg==
X-Gm-Message-State: AOAM530p7oetdx+zdceCfjcP3QyTUzfMetSPhv9b1iryQtdmUp037ed1
 kO2fQe6Jj9c2HTsnmFTLxnxcBZGZOSM=
X-Google-Smtp-Source: ABdhPJyhqNb4eV3Wa/Ml+qm+dhDFVqa7ShqSRHgjcs+k1G8f55xdEBIZ5BuaNmqi+3fwStgjJmVqBA==
X-Received: by 2002:a92:c990:: with SMTP id y16mr65280335iln.35.1609618609101; 
 Sat, 02 Jan 2021 12:16:49 -0800 (PST)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com.
 [209.85.166.175])
 by smtp.gmail.com with ESMTPSA id w3sm39362834ilk.17.2021.01.02.12.16.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:16:49 -0800 (PST)
Received: by mail-il1-f175.google.com with SMTP id x15so21771764ilq.1
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:16:48 -0800 (PST)
X-Received: by 2002:a92:84c1:: with SMTP id y62mr63529841ilk.191.1609618608815; 
 Sat, 02 Jan 2021 12:16:48 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-24-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-24-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:16:38 -0800
X-Gmail-Original-Message-ID: <CA+E+eSCWfDxUMHEVY6o3+Fu0nEvrNNVeOKkzBWpEFU8t8Z40Lw@mail.gmail.com>
Message-ID: <CA+E+eSCWfDxUMHEVY6o3+Fu0nEvrNNVeOKkzBWpEFU8t8Z40Lw@mail.gmail.com>
Subject: Re: [PATCH v4 23/43] tcg/aarch64: Support split-wx code generation
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.176; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f176.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.h     |  2 +-
>  tcg/aarch64/tcg-target.c.inc | 57 ++++++++++++++++++++----------------
>  2 files changed, 33 insertions(+), 26 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

