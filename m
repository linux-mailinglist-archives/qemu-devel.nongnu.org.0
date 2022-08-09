Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F67258E15A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 22:52:18 +0200 (CEST)
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLWCz-0008Qi-HV
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 16:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLWBP-0006C0-Ai
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 16:50:35 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:40893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLWBM-0003nW-UW
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 16:50:35 -0400
Received: by mail-yb1-xb35.google.com with SMTP id 123so20250273ybv.7
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 13:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=N25F2AJKXvO9lt1Y9urN2LQ10+yqCuRW8/sQDN0FfQU=;
 b=vRqZ/tK59tKc6IglnjQxk5v6h5Of/r7H+fUxbJ93cwBYXkeL3MWRvQHScZPqLLaxrl
 rqz1jvUDZ5jx8slEDRYYKuFQ2B+XT5bVjdw7nPswOLUgqaIhDwf5zLkU16JsG8CYt3lz
 YGT+eu1f3I0Nj15SdH5v8bgGOa155z24QajNT7u0+GN9EJMQze5mbkk9naq2MppPibfR
 j+Vi6DSAafhAB4fG7HVlWULeJyyqmvhHj7RrzggU3ZrqXmQ/lXujlYN4YoEehrOKsrbX
 cupIUI9hmAlo4Am9J1WFvaWXUAZdLJ9VEGNOALg3HLnpJhyCMYfTsIZ0pI8hWEB+Ztgj
 I4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=N25F2AJKXvO9lt1Y9urN2LQ10+yqCuRW8/sQDN0FfQU=;
 b=ytSVhTGeZUNvD86b8yNIjVYHi96QVHo+EBJEJJnSgLzivALmhpkw7VEwSYGcc0LC2e
 PtCoxrFsUdhTk7Q6WsygFLEHsP3t6XYBTl23GA7sfW5KaD6CptH9sEMlMIy1/FVPXTPF
 4i5Ju1ZYHQ/K4b/fwrTiznSgjnnx3pdD+RIXUnNmVFPvpMwrZBCiBJl5nZmUxBQkMldV
 9ImfMxFahbKJXgsY9PDVXcE4xo/Ra2jU39RDMi5xwg1fxQ3VO86EdGCcqqcv44Rzoavy
 R73fW2jPbxE0IrOFtBdPWW2WGhjEJtJluLfeqzA2ULO1CD4Z5wZfoVJ6EBZ3ymYGhQwr
 JqHA==
X-Gm-Message-State: ACgBeo08BEvsZ4pjR5YE2gbD+Y3xo4ZlKvvjJXqSmVAwpXOVXwROkz5n
 DAM0BMi5sBEqfu+KtRKKoSL4Wdstv7YFxOKUf9OuAnWGLRk=
X-Google-Smtp-Source: AA6agR6Zzj1eNDQCL7YjTX5VfAxqGymAVjZIcuWrF7St2179EVh0mJAogcN/6S3ufizvxGUIXbatUrpqSazH91+r7Ek=
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr23237480ybn.479.1660078231664; Tue, 09
 Aug 2022 13:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-4-qemu@ben.fluff.org>
 <CAFEAcA9QxwtyB1muGCJh9THdGCu3gEvFAqemvYMUHca6Z1PvAg@mail.gmail.com>
 <20220809185016.kyw6kzlqect4h5rp@hetzy.fluff.org>
In-Reply-To: <20220809185016.kyw6kzlqect4h5rp@hetzy.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Aug 2022 21:49:50 +0100
Message-ID: <CAFEAcA_HAnE9-YqUXA17G30ZHUWY5VqDt6dP+uKciyebofkcHw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/core: use qemu_fdt_setprop_strings()
To: Ben Dooks <ben@fluff.org>
Cc: Ben Dooks <qemu@ben.fluff.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 9 Aug 2022 at 19:50, Ben Dooks <ben@fluff.org> wrote:
>
> On Mon, Aug 01, 2022 at 12:30:22PM +0100, Peter Maydell wrote:
> > On Wed, 27 Jul 2022 at 23:39, Ben Dooks <qemu@ben.fluff.org> wrote:
> > >
> > > Change to using the qemu_fdt_setprop_strings() helper in
> > > hw/core code.
> > >
> > > Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> > > ---
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> I've had to make a second version, so assuming it'll need
> reviewing again

If you didn't change the specific patch that I gave a reviewed-by
tag for, then you should put that tag into the commit message
next to your signed-off-by line in the patch you send in the v2
series, to indicate it's already been reviewed and doesn't need
re-doing in v2.

thanks
-- PMM

