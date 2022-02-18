Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1524BB8A1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:49:27 +0100 (CET)
Received: from localhost ([::1]:58096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL1lO-0003m5-9Z
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:49:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL1in-0002Eh-IO
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 06:46:46 -0500
Received: from [2607:f8b0:4864:20::112a] (port=34639
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL1il-00005j-In
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 06:46:45 -0500
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2d625082ae2so63408087b3.1
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 03:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Eek7CrqDLgW+tSNXu17CAxIBjx7ODAFHP+KmLbVFi6c=;
 b=bNgeYQ+Y9PTUvW8OoPwKxKHqp6UbjPSnsoxTkzkUjQtEj8TUVBTI8w0wPcQh3E+lo2
 WeNz6r16/8IdBOY0EMF5oDHSOtXtj7Gbc+8BbxCNj7G7Ub6WQu4cxyejipbfUpRG0gWs
 qsxB8i5DPA9BwDczxQV5atOJQsVxkccH0FlbeAJsxM+qvboNqKzd6UsyoF8AQltyXwQa
 aJNLdujmETuBkVtOMmaFOTXRmHo7ViDR0w2sgZHW4EmoTvnIC+i1eeB0jpot2R82Fk1I
 cI5adGHxV/uRUrYUjouyWcHdPzj2v9RRpMIdu0JRpwevOvceDmDOfV16OjLTOUSk9MmD
 pUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eek7CrqDLgW+tSNXu17CAxIBjx7ODAFHP+KmLbVFi6c=;
 b=uI/sn4AJq9ulD2UMNe72gXssB9Y4HhaVxdqttuFPq7tMP/SU1D7vcD4qAUlsdCVd05
 MPtHQL1bKgH4IQdslvQXShGgzHkTlSJf6SukquhG/Lc0bhXLmtxXhqat9FOrjyjfpweG
 m1S1Mz600MHWE5NKzmSnYFtH+zNVZim/YgNiU8X/jPndnebcSC0w87na+bTO0wwUIqH6
 Fl94cDHr/3Jfxk18wnhn1LAFIoRTWvCNNiBLkYKqQYpXCcHSpy7hXyVzqJ4o2IsqCH/b
 I8jf/JOR3Dl2m78HUIRdDCH4ifc85WQvZADQcCFqM+/OfJaubvEPe7TU3N+wvn5pwpNe
 LN9A==
X-Gm-Message-State: AOAM531r1RYH1sKaSTbQ/HIm7m/AXkLk9NrLSedXl8s1B9i6VZ+H6VNR
 0WpXhFkDQTCcEZu8SFweMnj7tKRaTsHgvRf9L9lyNQ==
X-Google-Smtp-Source: ABdhPJxl1jutfAACLIGfO/tXb3LjmxC2Sp4C61VfJnFyyEJ+5iYCoaVOH9Lj5PibGRq5wPbPVXfurKcOJyr11SyuE/g=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr7152840ywh.329.1645184802213; Fri, 18
 Feb 2022 03:46:42 -0800 (PST)
MIME-Version: 1.0
References: <20220210063009.1048751-1-shorne@gmail.com>
 <20220210063009.1048751-4-shorne@gmail.com>
 <CAFEAcA_kMsoO26G-KhuNkUH=fJpdWPP_aKCwWva8RnV6ZDKkvg@mail.gmail.com>
 <Yg7AeSuZOEW3nT26@antec>
In-Reply-To: <Yg7AeSuZOEW3nT26@antec>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 11:46:31 +0000
Message-ID: <CAFEAcA8z=xUAS-BjL-UjBgo95Fm=a9v+phk=9w+Y8EjB+Qk01g@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/openrisc/openrisc_sim; Add support for loading a
 decice tree
To: Stafford Horne <shorne@gmail.com>
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
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: QEMU Development <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Feb 2022 at 21:39, Stafford Horne <shorne@gmail.com> wrote:
>
> On Thu, Feb 17, 2022 at 06:18:58PM +0000, Peter Maydell wrote:
> > If the user doesn't specify a kernel file, we'll still load the FDT,
> > at address zero. Is that sensible/intended behaviour ?
>
> Good point,  I guess we can add some space to not override the interrupt
> vectors.  The system booting with no kernel will probably not very useful
> anyway.  But I imaging one could connect a debugger and load some binary into
> memory and having the FDT in memory would be helpful.
>
> So moving the fdt offset to 0 + 1-page would give enough space.  Does this sound
> OK?

I don't have a strong opinion -- you can not load the fdt, or you can
define a "this is probably sensible for firmware" FDT load location.
If you do define something like that you should document it, though.
Bear in mind that if you put the FDT at 0+1-page then it will prevent
users loading a bare-metal binary with eg the generic loader that starts
at address 0, though (because it will show up as two overlapping
ROM blobs). So unless you have a definite use case in mind that will
want the fdt in memory it might be better to not load it. You can always
add code to load it later if there is a concrete requirement later.

-- PMM

