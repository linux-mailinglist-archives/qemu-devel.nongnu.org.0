Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1024E708C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 11:07:31 +0100 (CET)
Received: from localhost ([::1]:39352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXgqu-0000dV-2j
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 06:07:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXgnG-0007JI-67
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 06:03:42 -0400
Received: from [2607:f8b0:4864:20::b30] (port=34629
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXgnA-0001b7-73
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 06:03:38 -0400
Received: by mail-yb1-xb30.google.com with SMTP id g9so10716126ybf.1
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 03:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SODTzq0RawXAwhsgPmnKlSH28MCktGReHipSx31pDIY=;
 b=MebPpb+Az3YZcT3Rr4+KSv+r5ytwLV4Zwdd9sSIH+tNXPc2kfFDHL4KdU6a7ggeIox
 sR+c7FtnmGOWRhmvEfawwywH2GTSjh1J3fiYs3N4IJDWKXGCAR6YrrQ26AiKYNilH0JB
 ab6Au8VUqlos7PgXVPF7bhA4jo7uN0+7hGXGwVTa6Cux16ScU/F9vqbesOnCchlAjFud
 redRwdhn8Yk37GIz6K0SmrKtW/uV8tNSGTMTyogxC9dJgH5ZbtDxYvVjO9uxTxg66RBZ
 g2cLzxClcsVTVXb//H8slGZ/I22RM3CAAU6MPN8r4+FpEG2s3bS4Ss22MmQY2HAV3axU
 l8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SODTzq0RawXAwhsgPmnKlSH28MCktGReHipSx31pDIY=;
 b=DybTyKohX6jC0GFH3DIyMjuETQIl/bITsyroPvM5t/bDqX98rHRFIdccCJvwNG5cr8
 XLrp70DqKdD2IDcVRzPwwYUkN5VzqLX93pIn/vYl+BbaoX8NU14UUzJ7kuiThKsXG2kI
 LyIYrYo+Bx/ky4yaVCfeAaAJsB24NwCKmMhf0BuU04ROPRcBe+L0M8Eeh7PBW+fxXTDC
 Adm8k9lymJtdE6ymu2T9O1P0bUM52YT/TWI55xp9sU+xG9DLGOCN2CLRA1b+JcErrRhI
 wnyVnRdJB7WQyZflQUtMQUX7RTxyK8QyJCQB2sln/G84KfNsonKdT1wE14Z3X+iDY7/J
 7oaw==
X-Gm-Message-State: AOAM5311A64yePdGel3xrav05HAybE6kTrGdUt8Lo32bJXQ1Yw84N0SL
 FkMTmvqRAPoxzAt2OMDlPjf7LhJa2SFziA9cQEa1cg==
X-Google-Smtp-Source: ABdhPJzKm2oKYsOTY/ObMJskb+3voW5tMlACzHjcslk3epkfqZcVtRD8bUJOQCeGjp0bjHSYNdDwW9qxevZdfP7l3es=
X-Received: by 2002:a05:6902:701:b0:638:9404:baff with SMTP id
 k1-20020a056902070100b006389404baffmr6117296ybt.479.1648202615254; Fri, 25
 Mar 2022 03:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220322075400.8627-1-philippe.mathieu.daude@gmail.com>
 <7230eb78-0d9c-b636-f412-328b874280b3@redhat.com>
 <7ae621b5-7451-4a70-d109-f1adbcdaac68@gmail.com>
In-Reply-To: <7ae621b5-7451-4a70-d109-f1adbcdaac68@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 10:03:21 +0000
Message-ID: <CAFEAcA-t0YUmggDSKNG1ArRcSKta9siQz700C3zG5JzY0wkDjg@mail.gmail.com>
Subject: Re: [PATCH-for-7.0 v2] qemu/main-loop: Disable block backend global
 state assertion on Cocoa
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Mar 2022 at 09:35, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> What is preferred between #2 and #3? I don't have enough knowledge to
> take the decision, which is why I suggested the chicken-hearted "disable
> assert" option #1.

I don't have a strong opinion, but I do strongly think we need
to get a fix of some kind into the tree before rc2, and we
are rapidly running out of time for that. Pick something,
and send patches/pullreq as appropriate, please.

thanks
-- PMM

