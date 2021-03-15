Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0533C345
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:04:16 +0100 (CET)
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqdb-0008AM-RS
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLqZK-0006X7-NF
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:59:50 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLqZI-0008Qg-Qn
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:59:50 -0400
Received: by mail-ej1-x62b.google.com with SMTP id c10so67380777ejx.9
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5arqLts+L9ZeZmyVxdVQ6EyUjd4y8yQ8avGP15D23gU=;
 b=z4DfV8f3J2EJnuH9ZK6Nx4DP+C/PtCB4u175WtPu8dC5CwBdoiPwTd18auO7X8evv7
 qPAEUdRivheF40r43KvtBzP1YSkdIS2vyVX/8L//wQaI9WnKHVCgjqy6XlJ05lYQBvqn
 SZsWTaeYxdfoIrUrgtlwCZexp6o9KkLaB2w5pNBKK9ohgZHhOJQPTkOQ29gdim8NbZj0
 rOXorZ3dDlYWfUTWNCr7v3mrpmM9uLoqle98Cy+4HQUeNS1jIa1zE7mzbOSBkupW0kd4
 KqHdD+jWGRqDKQmYsRlxgKlgxL3ED0rpf2X5Xtr2dTFv7IAEJpCA+HBMYSbmxy4GHv8y
 467g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5arqLts+L9ZeZmyVxdVQ6EyUjd4y8yQ8avGP15D23gU=;
 b=Du91fKgl/ffboVLPQ0VQyGfhfIvgsru7Mg3EE71W0c+9AmETNciqHeY+WltqBuGdrT
 WF/Oti4HbqqxWfn3d0HmhsNYEYlF78jX/CD4ij38uU962aoOwuGa9HHesPeOKbH7GK9D
 id3vFAlCauWpCYgyttGA/aRiToq0h0wNl72JZseQBF6hEfzbi2txWuT/arfETXAQW9LJ
 xx1H/B9c20eaZdbdUo5946CC3Q7bJiXjoUgGqnwg1l8saJhAgxyfIB01yfro2LyPYGH5
 mp6Iq01AAQAiu3TileHYDbGeJnf8SNaEJswNXVYE83pNVYYvzDcxrWEdJmQ3RUwdAzEL
 8u6w==
X-Gm-Message-State: AOAM5326xULlmz7pTYQ/LVux0mc9lqarB3ir/BAl1nW3SAPiiJmPEOYe
 7AcHwQTM09xwjKXNXDT+EP5/IXULUJOYUNB0I7uUxQ==
X-Google-Smtp-Source: ABdhPJw//tZ4wGxiSUFqFS85NJTZF5H6Bs/jojd/+PW8zxH0BuDC7i4vbDbv6rmCoFUXL6wI6UleapRGvUnsDx9xfA4=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr25076091ejd.85.1615827587220; 
 Mon, 15 Mar 2021 09:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210314175025.114723-1-pbonzini@redhat.com>
In-Reply-To: <20210314175025.114723-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Mar 2021 16:59:25 +0000
Message-ID: <CAFEAcA8+nJj-zkaF+XFHRLKW2RrRP1sMk=VT_VFYTd08uUS7zA@mail.gmail.com>
Subject: Re: [PULL 0/5] Meson version update
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, 14 Mar 2021 at 17:54, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 0436c55edf6b357ff56e2a5bf688df8636f83456:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-03-08 13:51:41 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream-meson-0.57
>
> for you to fetch changes up to ddbac656401866a1a48d4829b5d02c239d1e8fc3:
>
>   hexagon: use env keyword argument to pass PYTHONPATH (2021-03-13 19:26:03 +0100)
>
> ----------------------------------------------------------------
> Update Meson to 0.57.
>
> ----------------------------------------------------------------

Merge conflict in tests/meson.build -- could you fix up and resend, please?

thanks
-- PMM

