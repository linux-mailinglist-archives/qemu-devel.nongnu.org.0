Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4672B629FA2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 17:53:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouzAv-0001aQ-OL; Tue, 15 Nov 2022 11:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ouzAl-0001a3-VM
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:52:33 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ouzAk-0004ld-91
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:52:31 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-36cbcda2157so142473617b3.11
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 08:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aQLDZNaLfBlFmsFWiA8knP7bpwluyhGINsHOee4FGIk=;
 b=g+aFNzmJuvhn7FR2qMwPqvYxaQEU64CLjaveqqk+/sh/t0TYCDUm5V78TwvSVY4YCg
 PuyYOeYHMnWeVoLlgU1mXCj1TfcldxU6uvIGLj7dFuFIIcGoj2WdSRg6kypQ2uKXqdHm
 T+NDVWXGsxRiExhNOtnoFA54ptyduP45MvbkHfdSEWLhL4+X8/m9diburogk4k4GOiyn
 +xU8xRSpiieKEWpaUHBqJGqoBW7A9nqI4C0lKEQy629Z6I2ytayLTNsKuQWP0BZ1tnfQ
 Ysf9FFjGlyTOsHG+QxRrpmbgr3OZLwBfoluwtBFgRRy5EHKa+7TSm9WD9PsDyLmaYv+T
 fEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aQLDZNaLfBlFmsFWiA8knP7bpwluyhGINsHOee4FGIk=;
 b=BmsOM7AoRLDjcancurazpXI81bJj01sxAcsPJE9IuMP25uXePLkpqgV1Ek6D06+mFs
 4WUWUDk323sSCAauwUx6/AuMdDv0P6KvPl1FJSeqNRSIT7xnLoV08x6IdgrSL75ffZ8f
 GGpuWe8jAqbPJnGxK5I9CYC1SrYkVJO7TUEFVmJT4LytDTM6ySGlLc6t2HtwuMA9moai
 jBtzA8EN7gtzimmmZcahM645FWBuUkrUpmbvGMqgZZSuCiMXeyOCXDSM6PMP8R7wKDdd
 Ww2NDx0/NqkgHglsEmif+0XyyjRfuLe8yInCQjYFuQch/k3kH14FBUBYFNuz5ei+1J75
 /gdQ==
X-Gm-Message-State: ANoB5pmt3sCxa6S9G2qgbiyiHjIoGlXWl3Pas7AvcfC+QyQEBzVRJ6p9
 BZ45PVVdxs9kjskiyuErJ6nfmp52QGclGkgLgC0=
X-Google-Smtp-Source: AA0mqf40p+rrfObe3aZH8wbg+5JMrtZdasH5vGM3Upb7TcYutR+2NNESbxRwO8mTLt3/MP44G5vD6pTdw5eP/UYqDIg=
X-Received: by 2002:a05:690c:a9c:b0:388:a098:bb1a with SMTP id
 ci28-20020a05690c0a9c00b00388a098bb1amr1207908ywb.111.1668531149119; Tue, 15
 Nov 2022 08:52:29 -0800 (PST)
MIME-Version: 1.0
References: <20221111005214.22764-1-tsimpson@quicinc.com>
 <CAJSP0QXYdLGuX=dRUw2y4qn04K-SCn0eWjWfC2T+gnsq2_+OKQ@mail.gmail.com>
 <SN4PR0201MB8808E53696703AA2AA339763DE049@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB8808E53696703AA2AA339763DE049@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 15 Nov 2022 11:52:17 -0500
Message-ID: <CAJSP0QVh0ynmSa5W2FSSR5T+8FRGmnC3kX-1o78qLXoiXn6O0A@mail.gmail.com>
Subject: Re: [PULL 00/11] Hexagon bug fixes and performance improvement
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, 
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Brian Cain <bcain@quicinc.com>, 
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1131.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 15 Nov 2022 at 11:16, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> OK.  I wasn't sure if performance improvements would be considered new features or not.

No problem! If there is a performance regression in the upcoming
release, then fixes will be accepted. For example, if QEMU 7.1 was
fast but the upcoming QEMU 7.2 release is going to be slow then a
performance fix will be accepted to avoid a regression in 7.2.

On the other hand, if it's a fix for something that was already slow
in the last release (7.1), then it's less likely to be accepted during
freeze.

These are general guidelines and maintainers have a say in what gets
merged. In this case I looked at the pull request and I wasn't sure if
you had decided based on these guidelines or not. It helps when it's
clear from the commit message (or from the commit description in more
involved cases) that the commit fixes a bug or has some other
justification.

Thanks,
Stefan

