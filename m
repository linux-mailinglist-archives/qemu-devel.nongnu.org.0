Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767FB36FCFB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 17:03:52 +0200 (CEST)
Received: from localhost ([::1]:34340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcUgJ-00063R-1J
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 11:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcUdO-0004Sv-Cm
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:00:50 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcUdM-0007O4-CR
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:00:49 -0400
Received: by mail-ed1-x52a.google.com with SMTP id q6so23721081edr.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uRgQS2okwtgqny/NiUqmw2rKVLqaJ+Ina8935USIjmo=;
 b=f01+tvGsmuSloqd6fKHE6lfx2AcBMX0WqQzF0sym0eo6b5FbTapVmYcQTrv7EFhtM8
 TCmZXt3VxKBrnyk61awBaAq81+G+YEPKzc1N6G4NUWzv/IpCAEfifldX/r6+rtKDiDfv
 6UtNvybuwfYq/6r/d7fy5z8PBVOZ/7LMcCW3n53lXrR43nG6NGr8twPLyFdbvo5PS5Dl
 ao4/TamVSfMDGacbogI07BQqc+4SzO8svYyp2Wm1SxX64lpJaDgcMD44q4ACLlaF+NOc
 fyejmpi1zA4dOJhSNX5C1ZmuPI5LwttkEaoRlP38QU/S3LNuKY6Bdf75FmYLzhbhYkEN
 7uKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uRgQS2okwtgqny/NiUqmw2rKVLqaJ+Ina8935USIjmo=;
 b=CXpn+MzmXQzWUfM8/58s3hj0LVyZVVSYSFFhbl/C4wyn6PUEFNn05Prpr9wa2yy1SE
 KkHFSgUuiU/Btz4EVp9HqcvhI8ARgpzoPaW0qFLFbzoq+FcbA1heA2ByjnUraWNUEr+K
 tY+RzkjWZixbkr84599oFqN+90iWuZgTDWRdaLPgxJjsu/z8cbRhnz4HqmE6Vh4aljmk
 jk70qBdelBRouT8cWRNkbCoGXkiUwNOzoIJqoNkc6BuBQoYahNbu6yo2sfzcLxIn2tXy
 P+vOvgzQcbH9R5crkNlyF464e3YOli6g6KBi89HBZvVwgr6hFjvtcpknoIc44wvmj1RQ
 PQDA==
X-Gm-Message-State: AOAM53001jybbzpOPIscM8GUx7y2nucsE1nNQW5Hf5UysqQHJIIjle81
 ubVWzi6RXgUgqoEDmWtHKTG0VYV/FD32V9rstsDmNw==
X-Google-Smtp-Source: ABdhPJx/U0S4sMRjPUK5I440Fp7hcZLR4XbOIeXkr+Y78cgq1LLagmSEkzVIocA1h7sTYwLlAtC2F2Y1owf9H3094/w=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr6468389edv.204.1619794846597; 
 Fri, 30 Apr 2021 08:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210430145220.303801-1-pbonzini@redhat.com>
In-Reply-To: <20210430145220.303801-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 15:59:44 +0100
Message-ID: <CAFEAcA_snF5tQ5VaO=t=o9cz4HPm9ECRpaOLDWbkXW=zcVtiuA@mail.gmail.com>
Subject: Re: [PATCH] coverity-scan: list components,
 move model to scripts/coverity-scan
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 15:52, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Place all files that can be useful to rebuild the Coverity
> configuration in scripts/coverity-scan: the existing model
> file, and the components setup.
>
> The Markdown syntax was tested with Pandoc (but in any case
> is meant more as a human-readable reference than as a part
> of documentation).
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/coverity-scan/COMPONENTS.md           | 154 ++++++++++++++++++
>  .../model.c}                                  |   0
>  2 files changed, 154 insertions(+)
>  create mode 100644 scripts/coverity-scan/COMPONENTS.md
>  rename scripts/{coverity-model.c => coverity-scan/model.c} (100%)

MAINTAINERS has a section

# Coverity model
# M: Markus Armbruster <armbru@redhat.com>
# S: Supported
# F: scripts/coverity-model.c

which needs updating for the file move.

Should we just combine that with the following section?
# Coverity Scan integration
# M: Peter Maydell <peter.maydell@linaro.org>
# S: Maintained
# F: scripts/coverity-scan/

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

