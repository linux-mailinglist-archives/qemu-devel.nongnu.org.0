Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB243D572D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 12:11:43 +0200 (CEST)
Received: from localhost ([::1]:52462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7xaI-0007N3-Vo
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 06:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7xZV-0006MO-87
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:10:53 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7xZT-00070d-K6
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:10:52 -0400
Received: by mail-ed1-x52c.google.com with SMTP id h8so9843644ede.4
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 03:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XJsxPOR99auVIhFBVkyYvbDulikkLn5sALZIPLzp3hM=;
 b=IrhTO+vaFpk6sIMup9jpFF1R0oS+1gKqxBDTYh2dH3X8AulN15fNkcmNGWocJZks/m
 wt+UeWqS8I0V/WTelZPXqepWX5PhKzc4XMNo6uTwDJ8JuDzxf4eGqkqK3UQZ8diu7KO2
 6E847cUa0cAxq5khM6DeVv6FpF8s/mqCt+jm7h3FrbXHmM3LvBN58JQMAH5Pe38WQ36J
 VawG2tB9JBIlI5CkAr0Zd5ks/ExvXZpxODfIyyo9eNkocs6LRBkou2NGPWe/gS3sbPTg
 5xsGZZJncGl/wHYZVSXhzyFLw/ulsNLygKVpsrCXOM24qPfxR+//s6KdCr8JoEKhyCPY
 GKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XJsxPOR99auVIhFBVkyYvbDulikkLn5sALZIPLzp3hM=;
 b=IvRACAH18DGp7P3TOE19c0qwUd0xE1083DQMguNXWOJgYAw5ZzTR8Xn/S+Kw5gUngz
 /KuDHG74DscfP5lHxfsRrFJ7hUc0g9uaksG62DYjOauxO9mO9PeCfZEpKZa3j3GVyGoe
 74Rzj4ZZr1AdrZbvQc5X20QKeAVPAczu+tnF0R64OHjWIfYTgYG4jYA1XSwBW46jmCwS
 Bp66g3z8c/k/YO59wWiiheJJStUKOk1p3tgZAjriLMfZwPwZcWfdZl/KwILiVrtAvGsE
 3IyoyMPjiQVKQChBF4Qs3LVKTLt8vKSCdV5IBLiFZvY/a8zlbKc3ChfUCWsYZ2lhjAwX
 knrg==
X-Gm-Message-State: AOAM533ux2w9S4iSr8FISP18RIkHmX9yELi+7lTeAJKQj1aK9MFt/xKn
 VGZwSO2rX4BP2dl1EBHayaCttWFJhC4PPhVxCxj74KstQKA=
X-Google-Smtp-Source: ABdhPJzyBzwrktp5xggyN1U+as21d3mc29X/Q/599lKc71FRvd9rSruZ1j8eoNbuUKg9j5fFS29Rf90Th56CJ7/tOtM=
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr20440550edb.52.1627294249982; 
 Mon, 26 Jul 2021 03:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210719105257.3599-1-peter.maydell@linaro.org>
 <20210719150705.26db8ed4@redhat.com>
In-Reply-To: <20210719150705.26db8ed4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 11:10:08 +0100
Message-ID: <CAFEAcA9-cP+HiK792cJX12cacGP7Mmu4kOGU=bApNwzXzDumbA@mail.gmail.com>
Subject: Re: [PATCH] qemu-options.hx: Fix formatting of -machine
 memory-backend option
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 at 14:07, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Mon, 19 Jul 2021 11:52:57 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > The documentation of the -machine memory-backend has some minor
> > formatting errors:
> >  * Misindentation of the initial line meant that the whole option
> >    section is incorrectly indented in the HTML output compared to
> >    the other -machine options
> >  * The examples weren't indented, which meant that they were formatted
> >    as plain run-on text including outputting the "::" as text.
> >  * The a) b) list has no rst-format markup so it is rendered as
> >    a single run-on paragraph
> >
> > Fix the formatting.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>

Thanks for the review; I'll take this via target-arm.next since I'm
doing a pullreq for the next rc anyway, unless anybody would prefer
otherwise.

-- PMM

