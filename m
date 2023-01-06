Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB936601C5
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 15:05:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDnKv-0007JY-6c; Fri, 06 Jan 2023 09:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDnKs-0007Ca-C8
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 09:04:42 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDnKp-0005aC-Fo
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 09:04:40 -0500
Received: by mail-pg1-x530.google.com with SMTP id g68so123951pgc.11
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 06:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kixNz6BI8kGXwDi1e3Vfl8TLJ62BrZr4/yK2z8yezrk=;
 b=LheryMe3Iuj98QUqzh1EI3FRhaqaLoUwzof3Wh4CgcMHZGqw/r1PqqzEfVwVcrbiKR
 cR8N2ecrpL5mshiLecwoMkqlDRJIaaTVOCiACMA6zyjXyuev31j+KCKqpHU0CryBrrqS
 nS8RqPCLT5kBehDxQmnGba7GlLmjM1rS3AEinTB/TWIJpz4j0bcy3jY9vjojBug4eoza
 Fqo3ktMMMJgGirCeTQIQpqnhIYJAii5LW6bZMbAC2H4gaqBncfXZo2a9d0+GCBO1/j9J
 mesMsbw0DTAt7HStrHivtm3n9XU9G0Q6nR9eVbo77VnnbfKH1WeLzBNCvMMBD9xpuBkM
 UGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kixNz6BI8kGXwDi1e3Vfl8TLJ62BrZr4/yK2z8yezrk=;
 b=ZoXMZX9Bqo96KXVWN28GdV0mBHxRNNGObS/qilbOdAzh3H1oGW7zzpG9rEXwyhihiR
 skYr/1qEscGb4501EowO0Dj5N++v8RVguk49BAxENE0uQcYrKGcUp3oK5d7fv72NLTY3
 Z3bgXJO3HQjd5PCtwMrWDqsR2yVX+C9JcmuV69cEDumk7y19KvY/G1t+7Oceb8DWwHtH
 8oRDH19ZOjoNh4k9xLsffsIqfoRxx0RKYOU0SiWmu/Hea4/WgZOx+2pG//YvY4wjO63C
 ejbrcyQLOMHDNMwk5EWwno5k+LcGw6+rH9wFEKb1Bv2P5ywwYcV/L1OHBhXEoQhUl9M+
 qDDw==
X-Gm-Message-State: AFqh2koCpydy6veTEBWvhJaqEBBKOrcJGTuiDuyhkjA5MzgIyhVDVTz3
 ZVzZzCT8cgIaVa4YBuGoxsYLDKK1U06x+MbBxK+7ZQ==
X-Google-Smtp-Source: AMrXdXs6aXO7GkSa2jknZR9HHIsssrplRPCOG+mu1VCU9o20GObemYBYLKVIJ1ki2BvMguvIqX9eudroDef+83BAMvU=
X-Received: by 2002:aa7:999c:0:b0:582:74a2:1e4e with SMTP id
 k28-20020aa7999c000000b0058274a21e4emr1391716pfh.26.1673013877749; Fri, 06
 Jan 2023 06:04:37 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-f39VfWEwb-zRabjVoO-XQ-0V=iCFu1PVjg7eYChszbA@mail.gmail.com>
 <96cc9cde-ad7c-2704-187f-25e9751c894a@linux.ibm.com>
In-Reply-To: <96cc9cde-ad7c-2704-187f-25e9751c894a@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 14:04:26 +0000
Message-ID: <CAFEAcA-dpip8soXFAyu1fxg9H+FkNRzXDpb_FP-OVFQ+LG==cA@mail.gmail.com>
Subject: Re: intermittent hang, s390x host, bios-tables-test test, TPM
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 6 Jan 2023 at 13:53, Stefan Berger <stefanb@linux.ibm.com> wrote:
>
>
>
> On 1/6/23 07:10, Peter Maydell wrote:
> > I'm seeing an intermittent hang on the s390 CI runner in the
> Is this a new hang or has this been occurring for a while? I am asking because the test case is not new.

It's intermittent, so no idea.

-- PMM

