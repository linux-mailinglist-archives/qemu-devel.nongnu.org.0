Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2273331C4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 23:54:05 +0100 (CET)
Received: from localhost ([::1]:34552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJlEq-00040v-Cr
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 17:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lJlAy-0002sR-OD
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 17:50:05 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:44600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lJlAx-0006YJ-1s
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 17:50:04 -0500
Received: by mail-qk1-x735.google.com with SMTP id 130so14884866qkh.11
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 14:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LBoMEznxpbUHqr02K0crGliNNJhF8QUMOIS46J3udkU=;
 b=Qp0KioZVJwRJOeMAAOVxit/UjVwIcG0gcxSYc2S4QSrSMdfVEwQ9gUuT/ino4nwaKC
 ZEq5ALt5RIuafAeA3qSQy9xJF9s8chtxSOCtMfCqQpFJ66vDIvDwwWXmCp0V5ImKmQbo
 VjWq20GE+gW6DQ9wAkphbXq1n0SfwRpSpbNaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LBoMEznxpbUHqr02K0crGliNNJhF8QUMOIS46J3udkU=;
 b=Z0FtrkAuY6pSXiBniphwsseBThYKgDbWEFn2IEiGUEkg34+1oLgEmWJVayWI7Ab2L7
 JDByyepsSHSRWPqP6m3aNPEFbMbp9v5dZRNkcneIAdVk1mWVNoutnJYgPRaO1GDYBFZ7
 gIUB3PqC6gD2rhAqp3dP43CNxijT2KbB795NmXRT7u9gwPSDkRVAN5V6mwN0SdDAF6ad
 vomzzfRVUD9tF8HdGVfd9KIAPKkWN6rx/HS0B7FVyRUdK8QYLMaG8rRrBlrsPa/ecy4t
 UAxJl5E1V3+Vvhy7XDYkgjc7sed0/4f0kf5hk31gMbSgCmSE4GwcoINpBeLUeb+fvRtq
 2yaQ==
X-Gm-Message-State: AOAM531j404a7r6WI0Ovh34idqgFRLj0+3yPZjRpF0OdsqoqNC1WPGW3
 oozbTo++Bm0f/i0a12SQowO6/CkGKCacJuzVyQI=
X-Google-Smtp-Source: ABdhPJyMVR0YvoZJKOU1QiZvPDRyXGB9G3P3NgbVeJBg3EFaRLiKZ2fMOargbrrDbMbHIBGLdizAF6/vZz4hn8/xDWY=
X-Received: by 2002:a05:620a:24cd:: with SMTP id
 m13mr28499414qkn.273.1615330201809; 
 Tue, 09 Mar 2021 14:50:01 -0800 (PST)
MIME-Version: 1.0
References: <20210309153507.1905682-1-wainersm@redhat.com>
In-Reply-To: <20210309153507.1905682-1-wainersm@redhat.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Mar 2021 22:49:49 +0000
Message-ID: <CACPK8XftT1enddLKnj8+9p+Wd3O9C6w-FqgnNR2yBFx62GuBRg@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: Print expected message on
 wait_for_console_pattern
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x735.google.com
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
Cc: willianr@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 16:00, Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> For the sake of improve debuggability of tests which use the
> wait_for_console_pattern(), this changed the _console_interaction() so that
> the expected message is printed if the test fail.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
> While I was testing  "[PATCH v2 2/2] tests/acceptance: Test ast2600 machine"
> I could not clearly determine which of the called wait_for_console_pattern()
> was failing. So this patch improves debuggability in such as situations.

Nice!

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
>  tests/acceptance/avocado_qemu/__init__.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index df167b142c..ed338caaba 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -97,7 +97,8 @@ def _console_interaction(test, success_message, failure_message,
>              break
>          if failure_message and failure_message in msg:
>              console.close()
> -            fail = 'Failure message found in console: %s' % failure_message
> +            fail = 'Failure message found in console: "%s". Expected: "%s"' % \
> +                    (failure_message, success_message)
>              test.fail(fail)
>
>  def interrupt_interactive_console_until_pattern(test, success_message,
> --
> 2.29.2
>
>

