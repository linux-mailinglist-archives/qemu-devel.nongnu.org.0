Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17F9377D14
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:24:59 +0200 (CEST)
Received: from localhost ([::1]:54314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg0Hi-00043A-7V
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lg0DF-0001kO-5a; Mon, 10 May 2021 03:20:21 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:34659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lg0DD-0002tf-9I; Mon, 10 May 2021 03:20:20 -0400
Received: by mail-qk1-x736.google.com with SMTP id q127so14486802qkb.1;
 Mon, 10 May 2021 00:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w6Iq2HqplC+makTPcxbfwWjM3P10y//4+6kOL15hviM=;
 b=iKgKXnKh7HXyuV6RgGtdl0fRM6YYvkur0DOKn/YnPaM/kEq58wPdF8I6YPWIruOXTB
 6mi/BapExxFOfYSnZQZihP18fs1yocdeldx56X5iNztL/CD7iIX0Eu5rTcN3vTQFCqDx
 zs7zDotl8kR+Q9Fp3FxAFhLM7dqpFhJz5mUug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w6Iq2HqplC+makTPcxbfwWjM3P10y//4+6kOL15hviM=;
 b=PdDF0Ep7ZHL3XXEQ3Z3xzDf9qGsK4y58rloGkV/d+z8G7FSrUg9gXPCuwBNZlFfHbq
 g68UYuGTgW9BYsmVd2T3uJliAsNCaPeobJdSr2xsY1IIJT6QNS2r0vfKxhm1HVKecYA8
 uQkXFbFxyEAndFS+a+CuikBCUiG5VuDpxHoSh/YwAg3H0Ar0k+bdau8IzGjLqXNDYs5N
 S1nACwLzQcN5S1U7EY5id0euczKtY5j7BDdJ+kMA5h/OMcXFgEr8eemCRUvDzSmCdFX6
 8ckKNkdhWfA+EdKweZbWthA8S5rAtN6DQhamRJwKj459qiZaGmMDe6YVW3+tFkGbof/y
 jJvg==
X-Gm-Message-State: AOAM531t3DAUka9qThIh99qIgUDdtumN34tlbtoue+qsEzpyZZRb7DDb
 lthWE0/JmqNxoH98ob5UCxBZKLmNpLhYAwhZSJM=
X-Google-Smtp-Source: ABdhPJyB3qZ61csD4LX5AYsbXQEjVvjPK57NAqJtG8FOIAOf0uYG17jgDqiIWe1TpOXzL2gxj5N5CJHeTmPiHxXuCpE=
X-Received: by 2002:a37:f91a:: with SMTP id l26mr21250961qkj.55.1620631216774; 
 Mon, 10 May 2021 00:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210505170101.3297395-1-titusr@google.com>
 <20210505170101.3297395-3-titusr@google.com>
In-Reply-To: <20210505170101.3297395-3-titusr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 May 2021 07:20:04 +0000
Message-ID: <CACPK8Xc+iPifDBgo7B0VjYFCwtJMpf3unJ0CC_qPYNX5VLeEjg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] hw/misc: add ADM1272 device
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Hao Wu <wuhaotsh@google.com>, Corey Minyard <cminyard@mvista.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 May 2021 at 17:07, Titus Rwantare <titusr@google.com> wrote:
>
> The ADM1272 is a PMBus compliant Hot Swap Controller and Digital Power
> Monitor by Analog Devices.
>
> This commit adds support for interfacing with it, and support for
> setting and monitoring sensor limits.
>
> Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ADM1272.pdf
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

