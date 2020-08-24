Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9780324FDE7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 14:33:32 +0200 (CEST)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kABfH-0003Er-Mb
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 08:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kABeQ-0002bL-Lm
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 08:32:38 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:39454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kABeP-0002P6-1Z
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 08:32:38 -0400
Received: by mail-ed1-x544.google.com with SMTP id c10so7860691edk.6
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rMK0/FniwyWf4KWHkbMYaxzTP4BArbpXeho7YYhd4Lk=;
 b=ReiAXTJK08wrn4ZKJmA+QX4UafYzrShVydE+XJiJEWTmmBrhaJDFgz658ODpT3JHX6
 PsMlCLuvyyLdSG9IjrDIl2J6QGd+sKYeNm3Ga+8hDcqAEFisuxjQvu/KuKkzix4Osifs
 fqHBSYj5otKcJbkcCr3qAivrWvEDSsPthCajzG9UnLr+VCx/7cRZcpxmIhicClsn9LHK
 awBnN5d3PpZ55eUknL4xpdHUrrxWD2c6GQZLs3WT5thW4Kj/+8RyepCflSUhMw6S1wfh
 4/kOlDd0/4skMhVReygeDDGLoq2Q39kFGFKJnhbr+F8bvMQkCTwFuMQ15UIUQFnIiA8n
 tYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rMK0/FniwyWf4KWHkbMYaxzTP4BArbpXeho7YYhd4Lk=;
 b=HGULjCjGoVHBoGFsmdNQQAJx+pQxK8/JJ7Ga60x++lG1nZE0hCkNinrLUs4XdLZklv
 tunKhl0pYJVakEG4xWqXdsmmqDOUG2Obm4pWDXlRpxPQydNL4UUVcEN5v/HgPYofZCq+
 SghKVlzGXK3RJDATqUsXd2e+FH7CuApl/8Wxjn6+uiq4bjuva58eO4aiRkA4Jf29kNt9
 rR2GFb9mTcrD8IbVSHT65cBxLrWAjPQMhXtMxtWUG+hNqYMS4NHGRnZK7zznHuEaeGbc
 +92VoG46JZVFnk9/I3RikFPsYYUBF4jGoiC3sNJar+vPdDtdxh8gKSzbJaPcXRwyaZNQ
 9o/w==
X-Gm-Message-State: AOAM530EeGM+allhIc/g3jQYLI11ZrN+nYzrb7/Db5QaCOfn58F/gz/l
 +I0EZhZWGTXHGb7EvnvPyH+J8MBezQkaVWjhyyfqQg==
X-Google-Smtp-Source: ABdhPJxsGyKu0kiQa0OM/SLxEzfqX8NntAUEmATwEMP9BXudyrTu9BPVFZ6DgJEbf/vel9CwZZxlos+Ss8l/P1Lprf4=
X-Received: by 2002:aa7:d596:: with SMTP id r22mr5222837edq.204.1598272355151; 
 Mon, 24 Aug 2020 05:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200812101500.2066-1-zhaolichang@huawei.com>
 <20200812101500.2066-3-zhaolichang@huawei.com>
In-Reply-To: <20200812101500.2066-3-zhaolichang@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 13:32:23 +0100
Message-ID: <CAFEAcA-BPNHL3yDOUVjgRqGJfzXsfgZqV0+mgYbijOEAAajrPQ@mail.gmail.com>
Subject: Re: [PATCH RFC 02/10] migration/: fix some comment spelling errors
To: zhaolichang <zhaolichang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Aug 2020 at 14:46, zhaolichang <zhaolichang@huawei.com> wrote:
>
> I found that there are many spelling errors in the comments of qemu,
> so I used the spellcheck tool to check the spelling errors
> and finally found some spelling errors in the migration folder.
>
> Signed-off-by: zhaolichang <zhaolichang@huawei.com>

> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -731,7 +731,7 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
>          qemu_sem_post(&p->sem_sync);
>          /*
>           * Although multifd_send_thread is not created, but main migration
> -         * thread neet to judge whether it is running, so we need to mark
> +         * thread need to judge whether it is running, so we need to mark

should be "needs"

>           * its status.
>           */
>          p->quit = true;

otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

