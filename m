Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A886010C7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 16:09:18 +0200 (CEST)
Received: from localhost ([::1]:37986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQns-00006D-Bn
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 10:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okQcO-0007Mj-8t
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:57:24 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:45713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okQcM-00086F-Jk
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:57:24 -0400
Received: by mail-qt1-x833.google.com with SMTP id s3so7693686qtn.12
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 06:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WZtdNp9sTFBrKnF/uWxkKMnkF9nwgnY+3CnPWetCtiU=;
 b=dOyynzQyJ8cIVdzJ9qtSM92dic4uNDudjEire6o7Q4EDb3wpTix2Y6lIgbWAd9y+Qa
 L5lREZ59GmQ43txk06775nUBbJrXRZHsYu5onQgRryQvmpij4kxMztmgLhk0rwIQgQEy
 xA70tUD1vDVuK6PZMHT/+rB+ITs3QJTpe9hAzslVRbO5Ho9gC31b1e5yvw4uLRUED10J
 cYp62YX4b94uza66biEYGiisDxlRvmultIbBTxbzaCPQr5u7YpZFaKOl6H9IlK3s7Oq0
 LwNEt6ve4ZuGL6G3YfCPGuNY7/m/C76qXNof8WEqrBeBqRyKc03cjt9dutnIJmPU2SV1
 ReiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WZtdNp9sTFBrKnF/uWxkKMnkF9nwgnY+3CnPWetCtiU=;
 b=o6NhBAcVOGWI9RUFfe/dnX2AhE0Iz6vozdL2vIRdGfDzBuoFvTstfyzEScK+CqsiSv
 t3sXpSijsVDT1ysV4Nonuvg9bcW3zjiTiVXaYSOX6k/PNICJQPAP/81PVSyCpQagxqsr
 yrKRvojSb5+HwH7bh+yXjrN4KS7x0EP5FNSQLgaSQFB1B1b3J3VD8i8pV5O1fApcG/wK
 coJIf4jqYHHD2GcwG8sczA6kzD7e6bpdYgI2xFiB0iYCAaYF9sqUIA99atukfy1JwWsg
 pEx9SYOzeISA1wm2761toedPZ59Y6oZ1h/wftam+KTt5uUewIOPLJ/ru3ZmyF4fLppd7
 ammQ==
X-Gm-Message-State: ACrzQf1M3zeincRHvuGZI+aZJHb2JjX8I7//xR/1iJZ9PYGNy9HlLfwM
 ZyvP+beuuQqVDAnSsL/4DPSuUWwaXA17EQgsGEw=
X-Google-Smtp-Source: AMsMyM7TLHGhI7dcHPoQJ1PsgFzxladzl+EPvrGwDdDmxhjN2dEt36RMpX3Zet3yEbqwPRRlEs3aHzFX+lJuYp7pkJQ=
X-Received: by 2002:a05:622a:449:b0:39c:d73a:e7d5 with SMTP id
 o9-20020a05622a044900b0039cd73ae7d5mr8819245qtx.276.1666015038285; Mon, 17
 Oct 2022 06:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221017114647.2226535-1-bmeng.cn@gmail.com>
 <20221017114647.2226535-2-bmeng.cn@gmail.com>
 <87v8oi635r.fsf@pond.sub.org>
In-Reply-To: <87v8oi635r.fsf@pond.sub.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 Oct 2022 21:57:07 +0800
Message-ID: <CAEUhbmXF2i05gyrY0eeZkmUNm6+zyOC0EtC6XaxT64SdDRTN2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests/qtest: vhost-user-test: Fix
 [-Werror=format-overflow=] build warning
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Shengjiang Wu <shengjiang.wu@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x833.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 17, 2022 at 8:33 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > When tmpfs is NULL, a build warning is seen with GCC 9.3.0.
> > It's strange that GCC 11.2.0 on Ubuntu 22.04 does not catch this,
> > neither did the QEMU CI.
> >
> > Reported-by: Shengjiang Wu <shengjiang.wu@windriver.com>
> > Fixes: e6efe236c1d1 ("tests/qtest: vhost-user-test: Avoid using hardcoded /tmp")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  tests/qtest/vhost-user-test.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
> > index e8d2da7228..819b87df3c 100644
> > --- a/tests/qtest/vhost-user-test.c
> > +++ b/tests/qtest/vhost-user-test.c
> > @@ -571,7 +571,7 @@ static TestServer *test_server_new(const gchar *name,
> >
> >      tmpfs = g_dir_make_tmp("vhost-test-XXXXXX", &err);
> >      if (!tmpfs) {
> > -        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> > +        g_test_message("g_dir_make_tmp on path (%s): %s", g_get_tmp_dir(),
> >                         err->message);
> >          g_error_free(err);
> >      }
>
> Suggest to improve the error message while there: "can't create
> temporary file in %s: %s"

Thanks for the review. I've sent v2 with the suggested improvement on
the error message.

>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

Regards,
Bin

