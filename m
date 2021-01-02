Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDA52E886F
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:16:49 +0100 (CET)
Received: from localhost ([::1]:48684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnKS-0007pW-DB
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnJJ-0006o2-5b
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:15:37 -0500
Received: from mail-io1-f47.google.com ([209.85.166.47]:43666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnJH-0002wA-Rz
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:15:36 -0500
Received: by mail-io1-f47.google.com with SMTP id o6so21431805iob.10
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UbRJXwGdhg66Y6gDOtOYF6jFy8X/+G0jYvU3Ik2vzoY=;
 b=sdO988iQut71NiPpWstW8i6tpBWYxh9xgdIcqOCJc0DQrRaK1qJYVQg4bQdZVVmrus
 U/HfK9nK2C3EPzaS0vOvUwbQJpWSO+bAl9AaNaCfIOSkFAFgM33oGqgRuHk4TQ5SNw9j
 Yt3Jlz8E8GzUkOyG6GYwE1/tbhViJLWA9M3k3HvwvHJ1IaY98/tMAPbxm5RNre/XD0tz
 F7N2er+fYk5V36+eVTCE1fQc0KZOVe7vAav8wnbjsxSylEvzCbIzYj3zwyy4FmSTUpa7
 5esTfJrtCmeFCs9SDj+r5EVMAXG0LZwQxQP6VAqEuAyBC80IdED5hCkGSMS6YRMGHA6/
 bfpQ==
X-Gm-Message-State: AOAM530FbuUxBSqY6QjzMFlzYlhHXy4d4eV7pU/kvykSED3uC5VrZn2M
 KjmTWlP6pZ17+CtucQYvvGMwtUO/yq8=
X-Google-Smtp-Source: ABdhPJxdthzHdlHVsFU7YWliYlqFYFQgV73o3sUZ7Nk6gtBHuFuVUD1+BTTkeY1esQl9PeqB40Uu1w==
X-Received: by 2002:a05:6602:2d0c:: with SMTP id
 c12mr52689166iow.58.1609618534954; 
 Sat, 02 Jan 2021 12:15:34 -0800 (PST)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53])
 by smtp.gmail.com with ESMTPSA id f2sm23684061ilh.68.2021.01.02.12.15.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:15:34 -0800 (PST)
Received: by mail-io1-f53.google.com with SMTP id r9so21462256ioo.7
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:15:34 -0800 (PST)
X-Received: by 2002:a02:b607:: with SMTP id h7mr57808059jam.120.1609618534685; 
 Sat, 02 Jan 2021 12:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-22-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-22-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:15:24 -0800
X-Gmail-Original-Message-ID: <CA+E+eSCPy6ympRe78T5wMTS48aAM8eyPADWF01MEiq-095kM-Q@mail.gmail.com>
Message-ID: <CA+E+eSCPy6ympRe78T5wMTS48aAM8eyPADWF01MEiq-095kM-Q@mail.gmail.com>
Subject: Re: [PATCH v4 21/43] tcg/i386: Support split-wx code generation
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.47; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f47.google.com
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
>  tcg/i386/tcg-target.h     |  2 +-
>  tcg/i386/tcg-target.c.inc | 20 +++++++++++---------
>  2 files changed, 12 insertions(+), 10 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

