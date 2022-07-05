Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9234A567026
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:01:47 +0200 (CEST)
Received: from localhost ([::1]:47628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8j7Y-0007eU-Lb
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8j3b-0004mH-1d
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:57:39 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:43618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8j3Z-0007gV-F3
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:57:38 -0400
Received: by mail-yb1-xb32.google.com with SMTP id j7so15602547ybj.10
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 06:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DGSrZNRfyKLjMtcSnWzJNxaLVlJRE4dWYFoq1IaErOU=;
 b=l8zlJh1cjPaB0cxgBf30f2RX4W7IaykTklm03fw21Gzvi7ZF1v+fNVLYUD50vpCfe2
 WXb4HrD4r9BYpPjDcIxhj+H3qm9Kw1UCddIWUb2NAEiVUqcqEhloOXR35xJlxFIzqdrW
 A6ia6TWoGN9VSYi60kJBmuCwYjHLejEXi0oG63ALfaKZWGQoZj1S/z8tywTTwcaVTYdF
 u0UAl71mgbLSE2H0LEAdGwkH+YfqfjqFBqaCu3JNG6hffr5dLT5dGjgbhfPKwAWWUlQV
 BjM11gPfg2Uck4PFOiifVSNaE8COjSSm8rxPd81PsjFMiZ9j7pqlaDkik9lG1Zds6FP7
 2oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DGSrZNRfyKLjMtcSnWzJNxaLVlJRE4dWYFoq1IaErOU=;
 b=JI3JM/7AhfvJKWgHI3SJNDCy4uGRSAkL0BI0f+xAML3Eff3nqPzGxnDdt9/ol+vHbZ
 IoqdNF1XnRsyG5xD4bLyqWhfPazfWfJczjrhX99UQkaHkjTlbsLLtrWgWgL5fcLuOF1N
 3yx3h3naZMcqzMSpnijATByb0f8hPvzbgSW3Rfg1qiDIlB5uhH+X3ctX1UvadTAS8vnT
 M6S8Sjcq2YKkSXUEtAaefXDkHR2UrguTm6+WqrRkzO8Zpz8jLKXZUP3sNQCfAn9STCzm
 JW89l//gE9kMNyhRo3LRyppO/P2Q3um8DmKmZdhKjKgeZMy1hcesEgvoQYMJGtK2oaF2
 X0mA==
X-Gm-Message-State: AJIora/7xkXpUboDIA44gri/OkYKjykxr9MRxS7ep6V06jvHCsiXfnsp
 c1kxdSauemqOgg4gbN49BhVSSsPHZ/z6Hhtad8FeoA==
X-Google-Smtp-Source: AGRyM1tFJkK1N1HJTRWLTwOm0SVHcY6lSQAuCIyMPletjNXfCNGLflzJKn6oW1T6qE5cnUtSp1zx4ZNw+9DXERRGJ9I=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr36561243ybr.39.1657029456368; Tue, 05
 Jul 2022 06:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220704224844.2903473-1-iii@linux.ibm.com>
 <YsQ1fuMRPpA+9AzX@redhat.com>
In-Reply-To: <YsQ1fuMRPpA+9AzX@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 14:57:25 +0100
Message-ID: <CAFEAcA-4=A6NWrpCo5=cBO=v2-GVwK+b5RcgFiJcZN6e-Kb=GQ@mail.gmail.com>
Subject: Re: [RFC] gitlab: introduce s390x wasmtime job
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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

On Tue, 5 Jul 2022 at 14:04, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> If we put this job in QEMU CI someone will have to be able to
> interpret the results when it fails.

In particular since this is qemu-user, the answer is probably
at least some of the time going to be "oh, well, qemu-user isn't reliable
if you do complicated things in the guest". I'd be pretty wary of our havin=
g
a "pass a big complicated guest code test suite under linux-user mode"
in the CI path.

-- PMM

