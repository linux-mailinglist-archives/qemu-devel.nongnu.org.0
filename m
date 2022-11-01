Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424006151DA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 20:00:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opwUj-0004of-2i; Tue, 01 Nov 2022 15:00:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1opwUh-0004mT-1w
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 15:00:15 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1opwUf-0003zN-FS
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 15:00:14 -0400
Received: by mail-ed1-x52a.google.com with SMTP id i21so23106659edj.10
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2O8ZlGSVDKZndQvf2m4HnCZIG9O2zGDm3iTLRqE5QRk=;
 b=D8/eLbKbtmgmg/BecUfSvN9/jVjh4l35HLzfrPbXJC/dtdeHcS5I6wqwgdzdVhzjAz
 n5uaVOb9A7Jn+ofnPUJH74C0JbeZfAzV0CqzpI7t51TWxOVv19StOyQ9ZZVH+OsHojmM
 GB29UOYIT6wyNThZRhauJAmrPT76Ouk0jBY44HmoXeKZ8uz33rutpxSqRYvE7BAqRfQ7
 CwZMmEzXJxEifeu5AEqF5JnxAYL0LUpnQXtZeZTKZhCi1HdfP2b1UbbyvbS6a8euXluf
 IToiBT7nb63j7Rz98hfRYHViVgrm5sZSA5jcCTdfbiWT/xEJV2u9g5dneeGynJyh/Z6/
 fCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2O8ZlGSVDKZndQvf2m4HnCZIG9O2zGDm3iTLRqE5QRk=;
 b=zUTC3F5fEsdcBwHpPnM8gYFLmQhvs9hqJDD1ca5/WdnoXV/F7rnohQ5GrU4+3KznZS
 /d6mJj9QF5jYe4W7SgieMun8Nw6eCc2e71K1SV+iQHqGxk98y3IN8upKdP4FYiNkhUOp
 CqkyS9QKcA6Xs6oMdX5hVfC+4gvLPWrVs85KfvKgMmsq6EoK3S5jq8bydbyEdk6GoFnq
 ehxbc4vZZNvS1+gMVb4plGmxac/04AG3aXWWkfoUFPRSAs9awXoXgIG6lYEuXxOQPcVH
 nUL5PkyM4WYe6gkXgNgOyCVnzSs0FpXIqZK8PVVgUJ5g5Ws3X7D+g1bqqeW82nyyT6CB
 C1IQ==
X-Gm-Message-State: ACrzQf29E5oJ4y02Y+v2/p5oo4dY/OjkZswAOaB7S4MrMf2c25rBt0I9
 sMxJxWjwxRdMVh9lmoDVuW259R9wVR6oAbF27KQ=
X-Google-Smtp-Source: AMsMyM4CfVVLEQlzCMQok2/nDgeEYYkVlv53NNMOTH+112Ls7uUgf/NnlSmBKSiBusAlpm3gV8EWGaP1XAsRR6Hno+0=
X-Received: by 2002:a05:6402:847:b0:453:944a:ba8e with SMTP id
 b7-20020a056402084700b00453944aba8emr20216594edz.326.1667329211086; Tue, 01
 Nov 2022 12:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221015211025.16781-1-chrisfriedt@gmail.com>
 <79e5307d-1c6e-614b-815b-4e796db71b17@kernel.org>
 <CAF4BF-QcCbBfMSXwJ=eB--vaZeA4rUiC5946dz-M0hU9CO882w@mail.gmail.com>
In-Reply-To: <CAF4BF-QcCbBfMSXwJ=eB--vaZeA4rUiC5946dz-M0hU9CO882w@mail.gmail.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Tue, 1 Nov 2022 14:59:59 -0400
Message-ID: <CAF4BF-QG_eMHn8j9whE8U0z+MUo+3Wx8=SyJELCDVw+3xH7gBQ@mail.gmail.com>
Subject: Re: [v2] hw: misc: edu: fix 2 off-by-one errors
To: Jiri Slaby <jirislaby@kernel.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, cfriedt@meta.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=chrisfriedt@gmail.com; helo=mail-ed1-x52a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Jiri, Peter,

Are you able to review the more recent version of this change?

Look for the subject "[PATCH v4 x/3] hw: misc: edu: ..."

I believe I addressed all concerns.

Cheers,

C


On Mon, Oct 17, 2022 at 12:36 PM Christopher Friedt
<chrisfriedt@gmail.com> wrote:
>
> On Mon, Oct 17, 2022 at 2:23 AM Jiri Slaby <jirislaby@kernel.org> wrote:
> > On 15. 10. 22, 23:10, Chris Friedt wrote:
> > > From: Christopher Friedt <cfriedt@meta.com>
> > This should be split into two patches. This way, it's hard to review.
>
> I can do that :-)
>
> Thanks for the review

