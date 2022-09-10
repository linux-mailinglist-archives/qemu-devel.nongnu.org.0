Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD69E5B436A
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 02:34:22 +0200 (CEST)
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWoRx-0005Eu-Fu
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 20:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWoQc-0003e5-Km
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 20:33:00 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:44681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWoQb-0008UJ-0P
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 20:32:58 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id v15so2488288qvi.11
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 17:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=mQroqDt3cvqJO1O8Sw4d9ytYv5g3l6R7B92GzTaAGjw=;
 b=aixKZRVboRAafGSLJoCoe57DCvuCoodf0Xc5lJU7GcJEwzeTi65jDm6WjrzhFP7gGt
 AfHhvyhfYPqElEM4E/9a+d5h1MeMhtZcNWol5azlsliRoRGhrZ+GP83Ncg2riyyB2Zuy
 mSHgwSTedu49wOFfZJEDgFWjagoU89OycaEJ6gEdqxWRcDiugELkBwNf0TOVw/H3Wsvw
 mStYqmR6Ex5LjslL4+wT2VVUh6X2I3hRpp6uBQfNoKbOCBe157KcrPs0bfsB4CToWVbS
 gSb49HDmSb4i9c6gtcf7Lub2pKCEr5oCJxR93ti4dpuB1w0g1UaJMjCcxPYI20mJLhxJ
 wHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=mQroqDt3cvqJO1O8Sw4d9ytYv5g3l6R7B92GzTaAGjw=;
 b=CUTbHYG5P0Z58wFzNYyv+S8TzJVzpz3NnKX1+I/CyWMG9CsyOhw4SYtxG1sJgJQ9sZ
 Lf0Ul8jFQoEhU83D/EfU+YgmZgw3Ydexopcd2b623lVHyMJ2Css7s6TCNhj9AwVpZRN/
 YSXLzTkm6QUNhKAhxNZWUnG2POwWbND0yN0fz8nMwMQnxewMEa1XAX88DwYaAXj0XhXD
 RVLV6Saz5gAtMEk7uuHKvH3V5VLTK6OIWHvAPd66abtf6n7LRfHKw6bmjPEKd+xv9JRI
 rFRHru7Lup+XQWGQNzPeFD+Jxmem/m24pkc/3k5TRwTjxyfMqRA+V30h+MTz11Kr9wpL
 CUog==
X-Gm-Message-State: ACgBeo1u/gHm4FpQtmr47UygvztdEMtQBSVlwLbWPYewlzWNzIV+K79t
 4DATDvqRR0r+3O0hRj5N+6QrlLDGoJZj5WfhURE=
X-Google-Smtp-Source: AA6agR4meJeJdRqqC6J3Yeuvolditz7UNX/4X690RQdDjzKrmuFLyQIc+DWVovtMkDfRHl8QxPkZEPpR1/2NYJmCuJI=
X-Received: by 2002:a0c:e511:0:b0:4aa:73d9:f4c3 with SMTP id
 l17-20020a0ce511000000b004aa73d9f4c3mr14425390qvm.51.1662769975546; Fri, 09
 Sep 2022 17:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-7-bmeng.cn@gmail.com>
 <85f915c4-938c-8a23-a4c2-01fba0f87b63@redhat.com>
In-Reply-To: <85f915c4-938c-8a23-a4c2-01fba0f87b63@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 10 Sep 2022 08:32:44 +0800
Message-ID: <CAEUhbmVNNuSRgjHiewKhqOifTF2_Rzn+8uUNphay6aXRYHg=kw@mail.gmail.com>
Subject: Re: [PATCH 6/7] .gitlab-ci.d/windows.yml: Unify the prerequisite
 packages
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2b.google.com
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

On Sat, Sep 10, 2022 at 12:32 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 08/09/2022 15.28, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present the prerequisite packages for 64-bit and 32-bit builds
> > are slightly different. Let's use the same packages for both.
>
> Not sure whether that's a good idea ... I did that on purpose to save some
> few time during compilation (since the Windows jobs are running very long
> already) ... did you check whether it makes a difference in the run time now?
>

Not much difference on the build time. Actually I found after we
switched to single thread build the time did not increase too.

One side note regarding the gitlab shared runner:

It seems the shared runner Windows VM is quite slow. Is it possible to
get a faster VM externally?

Regards,
Bin

