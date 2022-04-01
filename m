Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01D74EF995
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 20:13:40 +0200 (CEST)
Received: from localhost ([::1]:53630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naLmF-0004zx-Jo
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 14:13:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naLl3-0004Ca-1V
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 14:12:25 -0400
Received: from [2607:f8b0:4864:20::112a] (port=40436
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naLl0-0001SD-6g
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 14:12:24 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2e5e9025c20so41749577b3.7
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 11:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EC6wNc+cLAl5/ZpbJgLBtYkehR9JmTAxPB9VGMnIHqk=;
 b=NZwHIFUNVC736YWI9e6kJoGC/Tp0TRUwXUflAmVOnBS58wYtKOq1qyuX8zpmPB0hdm
 BlrkISlO+dBTSDdXc4LYBRB8F2d2QOyM+FkpN/s+amDQtK7hAt6lHLTw17BbbYoOSBSt
 IKy/F7p9GerPvaYbNPMpu/+vBUu7AjcSmOJYK3g9AHmtWbF5DLmfq/Izz4GIa5cjzQ8l
 Og2WwESepBzKP4gA5CpA07szu010Eud0ryoJEHTvWxHCaLnej+Elw/B4juEh0VZsShxQ
 woc3P9RwoM+gomJa9Q5LKhFrtEBY5XrK+mwzxEsUMrqEfKKjIC4tzgM6zAOhybImNBHA
 qgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EC6wNc+cLAl5/ZpbJgLBtYkehR9JmTAxPB9VGMnIHqk=;
 b=tTlYkZ/3bHcmLGnu5YwakZ5/+wwS3Iec3RGT8xcpKsIilwyno/gvYqQsbVVXt80ORY
 lWsDzCtOWrK9aRwGTL3SimggkUGoZ4dWxr2JPMY5F+Sbv71ZC+XIPB4W1GWQ1HHijTxb
 E0xFNKgDGs/fKOhpUqvckd6Am+l52/I8GJsLI5WrROYfq+dA51b206TVPQhtMPOrr+F0
 I3qLGm4j/cQTDqIzKIRPDagZc6aLcrENZuW3RXXjzHJ8FDB1KyPgWnonV2mIGpEBcJZJ
 XplgGKd/L03HfB2lZimR5wmZxJOGdU3kqydMz18KY4BYxcNh4k0ocWXqG3Dj2hT/c61f
 4EqA==
X-Gm-Message-State: AOAM532cZFQqORpimoM2Q5tjn4xRun5UT0GnuqbZHF+LdDePz6YLhPgp
 3YRVfP9CIbMgDirouQIv0HnScZOD4VCXgfETp2FrUw==
X-Google-Smtp-Source: ABdhPJx+2AT+u8GNUwZDHQGoYKezetJWAhUJhezKGNpUcXzmVJ3aGuf/1dmoOp1Rhh+MiaV2oGL3XDD0SogUlRI2DLE=
X-Received: by 2002:a81:4655:0:b0:2eb:2e0e:9d47 with SMTP id
 t82-20020a814655000000b002eb2e0e9d47mr1951347ywa.455.1648836741190; Fri, 01
 Apr 2022 11:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220401132240.79730-1-richard.henderson@linaro.org>
 <20220401132240.79730-2-richard.henderson@linaro.org>
 <a368bfa7-484a-6adf-33c6-5d85e16524b0@linaro.org>
In-Reply-To: <a368bfa7-484a-6adf-33c6-5d85e16524b0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 19:12:10 +0100
Message-ID: <CAFEAcA-U7d6VN6XKA6oadp2mLqn2kiYY6kbCqcFhgXAYihOn_g@mail.gmail.com>
Subject: Re: [PATCH 1/3] softfloat: Fix declaration of partsN_compare
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Apr 2022 at 19:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/1/22 07:22, Richard Henderson wrote:
> > The declaration used 'int', while the definition used 'FloatRelation'.
> > This should have resulted in a compiler error, but mysteriously didn't.
>
> Bah, of course there's no error -- this is C not C++.
>
> The enumeration has values -1 ... 2, which means that the enumeration is compatible with
> an implementation defined signed integer type, which for our set of hosts will be 'int'.
> So, no conflict.

The types are compatible, but it's weird that the compiler doesn't
warn that the prototype and definition are different types: it
seems like the kind of "technically valid but usually a bug" that
a warning would be nice for.

-- PMM

