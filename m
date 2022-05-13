Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E401F526676
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:46:35 +0200 (CEST)
Received: from localhost ([::1]:53856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXUx-0002v6-1p
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npXTN-0001w2-NV
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:44:57 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:44881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npXTM-0008Oc-5V
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:44:57 -0400
Received: by mail-yb1-xb32.google.com with SMTP id e12so15915966ybc.11
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CkARPZoCDTclIwjbGMz47VXumY7LlF+/foAEP0pamCk=;
 b=FETyLxtPGRiOr5Y9PrGvACampGfgm23sAztiLWqGK61ID3uGikUgyWOvM6Y3FVNpDz
 +rQsC3xhrInEGwgiv7Sf4qutN4KcBm6kwmlbxUhmj0SEm7pQK3Mqclo7891EvjOWJO0Q
 GbugdpO4HX3sDAN73QHiF5Phu7lweUBiwdI3eu1OhACwBedwiv/2QCNJw1KoIedeTcLO
 zStlH8DIZ/DXgzqBxImQJnHMDPiOgpC0tt/qCFrKDZpfmmP7ns/1JU6Hod9z5FT06y8/
 DO2xZo7SIuaRHj2gF4akDWAH/iLGI3bMO5wPBfSsXxEMNzf6fWZCen+LmFks6MViB4bw
 LHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CkARPZoCDTclIwjbGMz47VXumY7LlF+/foAEP0pamCk=;
 b=ZxR08D7bs/eS5At3VHYir7o62+L5bIgVty/4xPXSpPNIRMo4uHpz6QXGNPT4PnXjcZ
 LB1NcpdZo8nj7rTw3DNr8V7qtmtPlXGynsf5XnLvZ12yPR/ShKVwNEMaPvUOerAcl+uQ
 Ja/aJKsBp9d9AfChgFhSLTg4XVTO/XvbxagUNrNCIzf41LE95MzrJawK1EnL6qKdlclg
 H5u/1QpdgzKbBSySRHa0ZcYWC8p27GGiijLLTiEC6fs/RzwMSAoWzjFufEoeAH31R2Ad
 W5TDoYiLoR7p0fU4r3B+u0KOFZaoUC5a9aVst0yiJ5hyqF5s48TdPdudlszoY9ndirD+
 YLVg==
X-Gm-Message-State: AOAM530OBDgp5G9kUWaJ+Eatc4B34gkWbXqU6UDFSy2VIR8tRpdJlk5g
 cxAunOjpPNA5RXHvQrE9l06d7MBm4RQ+s/EvKww8mA==
X-Google-Smtp-Source: ABdhPJxFXkhCdUH3w7O2oV0fxNX7BDyNhewitNK68nv8D6Zxvp0iB0pUWm9AtVaD6gtqQ09C1Sre0RJBN94PWC5lACU=
X-Received: by 2002:a25:8f82:0:b0:64b:4d9:46fe with SMTP id
 u2-20020a258f82000000b0064b04d946femr5370032ybl.479.1652456694665; Fri, 13
 May 2022 08:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-69-richard.henderson@linaro.org>
In-Reply-To: <20220503194843.1379101-69-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2022 16:44:43 +0100
Message-ID: <CAFEAcA_=xurx4hppNZKqe6s72vyFShiMKP__iE_4Ff9noXSGXg@mail.gmail.com>
Subject: Re: [PATCH v2 68/74] hw/rx: Handle a kernel file that is ELF
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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

On Tue, 3 May 2022 at 21:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Attempt to load the kernel with load_elf.  If this fails with
> ELF_LOAD_NOT_ELF, continue to treat the kernel as a raw image.
>
> This will be handy for running semihosting programs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I know nothing of the specifics of the rx target, but I'm
always a bit dubious about adding more behaviour to the
-kernel option, which is (a) already a morass of undocumented
target specific behaviours (b) nominally supposed to be
"load a Linux kernel", not "load any random thing".
Can you do what you need with the generic-loader device instead?
That has the benefit of both being documented and also doing
the same thing on all target architectures.


thanks
-- PMM

