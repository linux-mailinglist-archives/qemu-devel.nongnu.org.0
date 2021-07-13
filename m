Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2B33C6E9F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:33:17 +0200 (CEST)
Received: from localhost ([::1]:38672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Fj2-0007U7-3x
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Fhv-0006fi-Nx
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:32:07 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Fht-0002sB-56
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:32:07 -0400
Received: by mail-ej1-x631.google.com with SMTP id go30so13497930ejc.8
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PDhq+cQ+MYBvFgi/xqJzTQRXObhxfi9MQv1birT/z30=;
 b=WptNMkVGkqL9Yd2MNolF1DyatkCjIo/Z0M51Fy4dwylDtvjR2SWPYjZeDi7y6KYAju
 zFdezDqeETLwo8yo+VWzkTKIjyDcK4tUjVcgGYxXLOXVnVDJ4yjrNWptVilWuyzxiCKT
 S720lgjlwG4XaZAbVTNDol+YLG2BP1bxAX0uz3koHGQzCSdwWorcAUf/A478L39bw1TX
 Urr9JoJY1GVoOB7dkERBFtyTp8babx79Q9Eo5873BXZH17AAyFnFUoIWaA1rwQdoQpra
 kgLHybgpwpbxHIA/ymAJcsQoNkicyvoS1AQVCNJmeNZGHfh2dif/1vvNjv0sNFncJ7E9
 +0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PDhq+cQ+MYBvFgi/xqJzTQRXObhxfi9MQv1birT/z30=;
 b=jS3nuVPEddNlw/MbBSd+QOedBSHgJFtL61ZhICDNrs5fjFiwMVAyH4lLYm0yPAb4qW
 B8zV7ZN7OOgMf5DxbUt0zS+payFceWXH/uajTZ64Ybf+o8pUnRzC2mV1Ya8EJvFDrDMP
 CErv5NwWqMsdkkUAkn2jQprewh3NoWfDJSPekYbrJexT4tX1bRFcaug6xfBRDhxu+1We
 ySpMSmhbnnSAroo6socaqynd1Gyh47P+czw898OIQ0YiZ9117g/FEMq6N6FrqrXNfwhi
 OoCHSzYaSWuDbWhtbETC0TAHT00rtZfRB7Ft4UknypHnYwxb0x9jhjCH+6nyUurrXTbl
 U/7A==
X-Gm-Message-State: AOAM531kNhwOwmgOxXxjM3o198nP57zo1x+Rq13FAY4WVtrNuogOgFsW
 I7Uud1lZpeOHUCbthzA0GQQpZxQePrCmra8KD4x4Nw==
X-Google-Smtp-Source: ABdhPJz9hYtidU3cQvV0znyGcQQTM6yx7Nc3wZmwP2jsOBoI+NTsy3c6pVBFQK/JI/YcIvXIUvi4shGVq5rabTB5f30=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr4704426ejc.4.1626172323559; 
 Tue, 13 Jul 2021 03:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210713054359.831878-1-its@irrelevant.dk>
 <CAFEAcA8Qo7xfjAHNbZmDiVUkhnL2WRrEWp7U-urxOTBnao8Oyg@mail.gmail.com>
 <YO1ori+GqpbhxARg@apples.localdomain>
In-Reply-To: <YO1ori+GqpbhxARg@apples.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 11:31:24 +0100
Message-ID: <CAFEAcA-9V9RtOq+QCn-d+HMrxsKxRgpjkOPV0Ta4W5sh6WWo7w@mail.gmail.com>
Subject: Re: [PATCH] hw/nvme: fix mmio read
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Jul 2021 at 11:19, Klaus Jensen <its@irrelevant.dk> wrote:
>
> On Jul 13 11:07, Peter Maydell wrote:
> > Looking at the surrounding code, I notice that we guard this "read size bytes
> > from &n->bar + addr" with
> >     if (addr < sizeof(n->bar)) {
> >
> > but that doesn't account for 'size', so if the guest asks to read
> > 4 bytes starting at offset sizeof(n->bar)-1 then we'll still read
> > 3 bytes beyond the end of the buffer...
>
> The buffer is at least sizeof(n->bar) + 8 bytes (there are two doorbell
> registers following the controller registers). It is wrong for the host
> to read those, but as per the spec it is undefined behavior.

I don't know about the doorbell registers, but with this code
(or the old memcpy()) you'll access whatever the next thing after
"NvmeBar bar" in the NvmeCtrl struct is, which looks like it's the
first part of 'struct NvmeParams".

thanks
-- PMM

