Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179D54EEAB4
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:48:38 +0200 (CEST)
Received: from localhost ([::1]:57794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDtU-0005xI-SR
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:48:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naDdk-00068s-5c
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:32:20 -0400
Received: from [2607:f8b0:4864:20::1132] (port=32933
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naDdi-0000bN-AS
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:32:19 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2e68c95e0f9so26925287b3.0
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 02:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IsUpKboYlC709IcaNNCAjxBvqN+MRTBabmItLNsSlpM=;
 b=kB5/JH3pNyTT7mmHB9m/kd4n1QVAO+IVbxdyipQoRJNZxHChQDu9DVCgHHXltsyLri
 2fNPsw845kKLv28GOoSsyI8CCoHUlCnG0bDEUYpHJzRs9wFnaoWXzzNqYyh2vMkA1/rt
 J5RBAEap+sw+cSFg/kqQU6W52/2/EnDlnGg98zNWHc2YDGaGDOqpFKlO8j1fRbF9jmFU
 6PoTIPeBfL7tvhGAPw0eJm9Pha9QZEdDH8/tnBsy3/XjgtU+b5oQ7twePlp1zLTNZaaH
 zlt9TBNcIgzoNKlHUT+UvhZwRqgGerAD1930D+eXkhYm1QvRO3goSSqITFBeItYgxQbB
 gf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IsUpKboYlC709IcaNNCAjxBvqN+MRTBabmItLNsSlpM=;
 b=OP+mYisI/bqrk6YaoBqVbfhieMxUjzRAHfZD7Xk7XySnakGXCb0ir5ZKze653D7ums
 znARku6LLBuMqJs0At92ndbqUwQB1upvXffhvz6bbf/f+ppzjtKNv2foE4mf3q36KqeF
 rrZwP2gjh4VaAhamR8zMNROY7N/GGpnvCwBVe8a3Ck25iGcObdhRpNHV/0kfCgxw4oB7
 achYSiHHWESBQijAnoUI0FCPzGLUq8jQMjvszOZIx1Cg2jAsN7zy02ka7tntiRZrWRBd
 afALG7KxMIdhqAp0LOPeYZC5MdpMQKb5akr0Hl38BK7TdbHcMaeuV1i0ZBhczbmddSOW
 N5Jg==
X-Gm-Message-State: AOAM532/vxQ+sMwEB5aPTauLkFE+bdM+oMDD9V5ljya+Lt2nP+1Odbum
 onk8N3byXOOXAc4pSb16uQNwtqZAElTrHrHBeOqoHQ==
X-Google-Smtp-Source: ABdhPJwjlkQ25hEIr6r7gv1yQCEo3mJgOio4ecrmgdcZb5H/QjZZES+FUlC9s7o32jBV967ffMSVkBJMxl108duKGQw=
X-Received: by 2002:a81:ac15:0:b0:2e6:d7e3:c4ba with SMTP id
 k21-20020a81ac15000000b002e6d7e3c4bamr9317450ywh.10.1648805537012; Fri, 01
 Apr 2022 02:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
 <20220324181557.203805-3-zongyuan.li@smartx.com>
In-Reply-To: <20220324181557.203805-3-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 10:32:06 +0100
Message-ID: <CAFEAcA_uKXwBe4U9QxzseEBde0PWuxOWZAM2ppep6WAUcLty9Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] hw/arm/stellaris: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Cc: "open list:Stellaris" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Mar 2022 at 18:16, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/arm/stellaris.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

