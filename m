Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33864F992C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 17:13:30 +0200 (CEST)
Received: from localhost ([::1]:36280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncqIj-0002EO-D5
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 11:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncq9j-0003F6-5q
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 11:04:12 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:36391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncq9g-00025Q-2b
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 11:04:09 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id f38so15609823ybi.3
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 08:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8RbjXUpY1rLaSv2zJ1/dU4XpD5WCOloawXgyPKQKLfQ=;
 b=sibtuVTLuqshZImn5fzow533f/rdCEHfEJbjUoqVQqMT3B8Wkdfuz+Cdr66kbOiiSh
 xSswsXWBtKTWkLvYfF0p9Louy64Yn7g/vItXdY/2mx9se2l+c8xe/5IH+fiFlCIvqqKY
 DfZUPTz8Q2Krxseh9jqRSxni57teuKvIyMjY/pVcpfIB8AHSqdKTvYWeMKKfxad2G692
 IxtecQggSBIOLlfGIPMMiicY6QBambrvlKhawlOQvD2TVDVMvMuzGnFlk8iJBzPlzEob
 tJ8nprGSzn69GYdgGK2QZgHqiwySvgaYXsLZL28PFYfKZV0mjrjEOy5aU3XgdEq4Dx34
 bXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8RbjXUpY1rLaSv2zJ1/dU4XpD5WCOloawXgyPKQKLfQ=;
 b=Iau2Nyq7ucT9ONaSmj3sH3Yn9X/LCiArO3zrU1NIUX6Rdg7oZydPjwdGrF1ecdmmUq
 VjuWbk8DcTr0pWhxWS8ZjAW2S8Yw735HPxUh672E1dijEn3mCblMnXuH0x5TDQqZaQTR
 QMF5Ea1Uoq5X9VaCdZR2A+BMWc3r0sAbzUl7e1JGFN2Qfj/m5q3WJD3siaA9zSkJ4NJv
 je+iOLZuhp8VNP3R8WXpKcHXuqEWHbgofvHpRI38uLWfwvSmTj8aYzvRg4QKR+K1F6GZ
 5W6TXqxiHqcnOi6qLcxoJ+qR3kYfrPEXD7AWJuaq9EcTVZdfMPi4wMTdy7ZE8+axf+Q6
 tN2A==
X-Gm-Message-State: AOAM531SmphF7itKdf3AvbJTD0SuiHi5wTrmIv1A71ES2mmRCelDlmda
 6UUu53buSiDvKFlD1KdfDyzom30E2gONpKT1/+2H7A==
X-Google-Smtp-Source: ABdhPJx8IPkhYvuT8GTEYowyzGbjcGvhpFW/hc41l/aVKQ5X/xksT+WXtzcyS51BXNPLmRsukpwPZ0ysZFmVueuiIVg=
X-Received: by 2002:a05:6902:1546:b0:63d:a6af:1c87 with SMTP id
 r6-20020a056902154600b0063da6af1c87mr14581934ybu.39.1649430246957; Fri, 08
 Apr 2022 08:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyuNovUDh7EpRni_f_pQBZv4g4E2QFWxaNW6amh9h-yanw@mail.gmail.com>
In-Reply-To: <CANW9uyuNovUDh7EpRni_f_pQBZv4g4E2QFWxaNW6amh9h-yanw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Apr 2022 16:03:55 +0100
Message-ID: <CAFEAcA9UsOqNhCu+o71YCMr6Og5as7Ht+LD3XLiujkKjSygc1g@mail.gmail.com>
Subject: Re: Procedures adding new CPUs in sbsa-ref
To: Itaru Kitayama <itaru.kitayama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, Radoslaw Biernacki <rad@semihalf.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Apr 2022 at 15:59, Itaru Kitayama <itaru.kitayama@gmail.com> wrote:
> I'd like to add a64fx cpu to the sbsa-ref board, if there's a quick and dirty
> way of completing that, advice from the  maintainers is greatly appreciated.

I have cc'd the sbsa-ref maintainers (as listed in the MAINTAINERS file).

However, I'm not sure why you want to add the a64fx CPU to this
board model? The sbsa-ref board is intended as a platform for
developing firmware that runs on Server Base System Architecture
hardware, so it deliberately doesn't have support for every CPU
type QEMU implements.

thanks
-- PMM

