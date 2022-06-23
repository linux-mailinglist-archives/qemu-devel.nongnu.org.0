Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB29557A15
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 14:15:47 +0200 (CEST)
Received: from localhost ([::1]:37270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4LkP-0004It-Ns
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 08:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4Ler-0001QB-8L
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:10:03 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:46840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4Lep-0007ml-LK
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:10:00 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-3178ea840easo153733397b3.13
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 05:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rj2IQIRXEwPO3MqdpLjbc2Opunh49LwrJk1NZLdjUA0=;
 b=qOxVxK5b14uQCqT5tdHZOo8VILOVSdjdE2TuIRKvnDEnD7HjwP9kfRqbUx9jnZZptC
 IqRhbxc4Oz1T2vhU0cLlKtOy4QNi6avs9VpMLX3eRY2uGLdzMucyDeMhR1sUvUjdniyb
 /QAXcMX65NkF0UpDSCnZrsASMm6pWR6bHQ+jfpBZkDbSyx1j5NfGz49+MdGp0TL5DBB9
 CGbXAK9qZcjabJW5LE/d4yLbKcP1KsOc6seyt6Z+++RF7se6HKXlKsJt7CoGKLAgctbU
 HJcpX0JtcyoR/oLIDFknhKYW6d7VN1NBIRTViwPo9Im1b53ZEySoLr3UZ1hy9C6ylhQ5
 1XHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rj2IQIRXEwPO3MqdpLjbc2Opunh49LwrJk1NZLdjUA0=;
 b=izednlC4+G1Ss2rj3eJkXHX9ceM0xlwj2zhpKCdNlhEEcbRcIKKUqyA6MXZcVvd22Z
 nF6K08WR1yP726Yq8kCZZAodzcb/+Rc3wZHp4tG8RS3FVKY9E2N+ZrrEzruuZDnYw7r8
 vorUs+E+o/pRLRkn/Hzp0wSPDGIGPSgC3REst8Wg5d3UzGy3wKodP60tSgzsKM3nUma+
 Ddzeicrmy4QKw+TXaZuQ7w7EHt1qTD9bw0ERqrZG8vAGTntQM6KYZ41xDBZIbl66RWA0
 QsUGGRQvvpcGiBu4mr9FGhIFk8uCG/wi+rXqkhyBXZrOF0MtrwxTBf91aGdDKFwOHHhu
 s8Ng==
X-Gm-Message-State: AJIora+TwtH/0ccXpt0ChwX2ccPiJ0DNK1CSsCTLAWcBRo3gMItN7X1B
 6uGXWwSWpZ5Sbm+bTVc7Lps0qJVgitvr8PFpmX3r4Q==
X-Google-Smtp-Source: AGRyM1tyJZqd/fnzLf/54TmRZs9xPiMmG1239b969IpTCsQivjCPiQc3gp2HtcId9tsJQiw71gBsdhWaAE22bNhNfDE=
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr10191655ywf.455.1655986198507; Thu, 23
 Jun 2022 05:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220623095825.2038562-1-pdel@fb.com>
 <20220623095825.2038562-2-pdel@fb.com>
In-Reply-To: <20220623095825.2038562-2-pdel@fb.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 13:09:47 +0100
Message-ID: <CAFEAcA_V5m4dfmKgO9vgPHr5cg_MWp_MqOsZNJcGnA9t1JmS=A@mail.gmail.com>
Subject: Re: [PATCH 01/14] sysbus: Remove sysbus_mmio_unmap
To: Peter Delevoryas <pdel@fb.com>
Cc: clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com, 
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 richard.henderson@linaro.org, f4bug@amsat.org, ani@anisinha.ca, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 23 Jun 2022 at 11:59, Peter Delevoryas <pdel@fb.com> wrote:
>
> Cedric removed usage of this function in a previous commit.
>
> Fixes: 981b1c6266c6 ("spapr/xive: rework the mapping the KVM memory regions")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

We only added this function for the XIVE in the first place
so I guess it makes sense to remove it now it's unused.
(People doing complicated stuff that needs to unmap MRs
should probably not be using sysbus_mmio_map()/unmap()
anyway...)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

