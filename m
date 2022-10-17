Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C226010A6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 15:59:21 +0200 (CEST)
Received: from localhost ([::1]:54376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQeG-0000ZM-7g
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 09:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okQbY-0006ep-9H
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:56:32 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:38706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okQbW-0007yG-Nt
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:56:32 -0400
Received: by mail-qk1-x730.google.com with SMTP id d13so6630372qko.5
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 06:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BER8oeTFw4BUzRWsrbwujgXT30gbTMGfUf59q6pl5yI=;
 b=it6WrMyjHjpBfPn5WDW4rO8BrS7n+H9JCczJbXThxp3JiyBvXw+F653aPlY5wPn77r
 AdGPeTl9/R4DygSXzCbOd3j+rPWOxf5GA0YV9ErC8AQgGCC7vyPih+AbXnxrSlaDm+83
 1oJIFP2qgbHX1DThM2Zkn/F5cNdgY0hrs+WKTA5aiNwXu8Q5LJmrhQR1VRbEwgBDh6yf
 +PCqQ5VsN3kTmKnnjIgCLFQTcTJk9ZUnOejI1nzFrTzChus5lfoj40PNFNPPpNGYTQtS
 f1+UwGiUAr0KEfcZHfQQTXXwgOzgc5gzJtfziAHC1kgewjTE77EATSdkIZKvWvw+Fzw6
 MwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BER8oeTFw4BUzRWsrbwujgXT30gbTMGfUf59q6pl5yI=;
 b=MAgB5NWIwWFtvJGlDpzr0TdoCTLminGpwFDt/JucaQfUfnHBYDlQxEneyyvammtuK5
 MJwr83Wlf3rMMq9K+hULvH7bmH6t8daTB7ShgvW1eBR5y9yz+3FQfxTZFWXXaNkWCKx7
 w6kCy7c5Hflhl0Hev6T7r+BQ0GwPE9NY9kq3j0BozQsjEmbNNXepaaqd/OQCV/jFac35
 Rma/GhT43Rmd5vulZDJyOupWJftN629WpPaFRmc39grTAP8DEabVwJiL0+qcjWEiAZZS
 2qe1p2/erTmwXXQ1Kn516XpkQxLmhkiDrnp2UFoBJEe8xXmwj3Bau7m9EYlXN/OiJNei
 hN+g==
X-Gm-Message-State: ACrzQf2/jPY1RsAhj02NTeHTiTPIy72cUFacHnEF8+eqm9jIcbb2bTEB
 vvdZIx1E1sqSilxk9k2W8378rur5KFlNTIy5isy9VueCKQ8=
X-Google-Smtp-Source: AMsMyM4jxCmUCrfaavNfoaF5KfkMt5cXzA59x/eWrX22BOialSXGY92F7CrJpWKmKRaBjvEtrvSWcdEWmfvg08uxsuk=
X-Received: by 2002:a05:620a:304:b0:6ee:77f1:ecf9 with SMTP id
 s4-20020a05620a030400b006ee77f1ecf9mr7615927qkm.94.1666014989466; Mon, 17 Oct
 2022 06:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221017114647.2226535-1-bmeng.cn@gmail.com>
 <878rle7hxl.fsf@pond.sub.org>
In-Reply-To: <878rle7hxl.fsf@pond.sub.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 Oct 2022 21:56:18 +0800
Message-ID: <CAEUhbmWc2fwHKyW2ypMXVD51s3Uaf=AMb2_KK1NrMSQanHcfuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] tests/qtest: migration-test: Fix
 [-Werror=format-overflow=] build warning
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Shengjiang Wu <shengjiang.wu@windriver.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x730.google.com
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

On Mon, Oct 17, 2022 at 8:28 PM Markus Armbruster <armbru@redhat.com> wrote:
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
> > Fixes: e5553c1b8d28 ("tests/qtest: migration-test: Avoid using hardcoded /tmp")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  tests/qtest/migration-test.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index ef4427ff4d..83a8998e40 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -2481,7 +2481,7 @@ int main(int argc, char **argv)
> >
> >      tmpfs = g_dir_make_tmp("migration-test-XXXXXX", &err);
> >      if (!tmpfs) {
> > -        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> > +        g_test_message("g_dir_make_tmp on path (%s): %s", g_get_tmp_dir(),
> >                         err->message);
> >      }
> >      g_assert(tmpfs);
>
> Thomas posted the same fix as "[PATCH] tests/qtest/migration-test: Do
> not try to print NULL pointer string".  You guys figure out which one
> you like better :)
>

Oops, almost the same time :)

Will let Thomas decide.

> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

Regards,
Bin

