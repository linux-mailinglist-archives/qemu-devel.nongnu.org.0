Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B450CD9F
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 23:28:27 +0200 (CEST)
Received: from localhost ([::1]:47440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niNIo-00050q-E0
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 17:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1niNHV-0004HX-1K
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 17:27:05 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1niNHT-000122-Cw
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 17:27:04 -0400
Received: by mail-ed1-x530.google.com with SMTP id be20so5984691edb.12
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 14:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6F1sK7QWFL5qYR+9UDVSqlk1uunx1eaTllJ6kMd3vyE=;
 b=WDr1dO2xAy+eaiB/rkTxZnGABptEmaN7ajhfIPzrTbpzakVNh6n7HjR3siahHR/3gB
 rByNuetNU49JcOsLhB9MnppSBT0vRahASXUQ25EGKFaFzqjStCSvXGYJusttX4qJ+68l
 1wt+rHnDpmbm7vT2R8tNmkf+VEifClIUiqJ3zsGeWbFEwxBZ4Cm9yKeBuQ2cc3Wv5a7H
 M2MoNRK13vIt7adaCnK93ETfGSr4xLv+q5xC5FV27VaDTmPBRCqma7c1ED60TP7ENlWM
 /u8c6FG90onxdZean488LMXJUYJWKG9xzsSxPlKMuIWhRw84Gs/sxx5a6Wv7IN3F5VWp
 akrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6F1sK7QWFL5qYR+9UDVSqlk1uunx1eaTllJ6kMd3vyE=;
 b=BD7wM+CDHkHYqVfUrxuVrnBFkDBAI1vxaRwrP6T30ZLBiweGLs0Qp55aaJGhachNf1
 xUFFMJCORwkmHZfv2hhB7neQT/YcV2F/9atYMaCEUvLM6rWs82qLCq/TfhgVO3fGZE5o
 PjldvpJEondFbwimaINoNxNs0Y6q6T2XmB4C0MN62J4trRTV91tBh5s04O8FJIuijrUL
 25F+YeQjb/9xAZTr+q+GJbjJH4KIK1OqK1S13wsNCjtQU6arb1qhHAJqoQ+738SjFBVL
 HU9iM7/4hl0AygGY67+34YAIYXC4raQ5sQ96YEEXl2D/3A99bpE2fkSwIsd0TGHQ/g2r
 /mfg==
X-Gm-Message-State: AOAM531qGq+mraiwtxlbjBv+lIxasTamRNZFOyQYQtY8e56fih7L8z7R
 y0oqWy2aE/1GZ7eyX6wz0BFJ8Mx1av+/otx7S5s=
X-Google-Smtp-Source: ABdhPJxS3omDHbTllI4zp5lwYiy7Im95lNiTTW3S9pPcrX2DWg+iXRsH25eqYVTzL3EpCjeS5+FMscRXTwrUi8wCxRE=
X-Received: by 2002:a05:6402:26c7:b0:423:e5d6:b6c6 with SMTP id
 x7-20020a05640226c700b00423e5d6b6c6mr11577272edd.61.1650749221340; Sat, 23
 Apr 2022 14:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220421155726.31986-1-simon@simonsafar.com>
 <CAMo8BfKPgZ29ReVE9CYmzfZ0sfem-fXqLf-2TW8qYQpO6fPA3g@mail.gmail.com>
 <331420f7-9bc8-44b6-b9db-e1d82cfdd399@www.fastmail.com>
In-Reply-To: <331420f7-9bc8-44b6-b9db-e1d82cfdd399@www.fastmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 23 Apr 2022 14:26:50 -0700
Message-ID: <CAMo8Bf+6gg4w1D_V8GBmePhC0Opf08Ctp3G90QpO69Yfk87B8w@mail.gmail.com>
Subject: Re: [PATCH] target/xtensa: import core lx106
To: Simon Safar <simon@simonsafar.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 8:16 PM Simon Safar <simon@simonsafar.com> wrote:
> It's for a (future...) Lisp compiler! Somewhat in the style of MicroPython; the idea
> is to make code editable on the fly, without reflashing (... or restarting, even).

Interesting. Do you use libisa or do you do instruction encoding on your own?

-- 
Thanks.
-- Max

