Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4518D6AC0BA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:24:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAoV-0003fW-HO; Mon, 06 Mar 2023 08:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZAoT-0003dD-IY
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:23:37 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZAoS-0005ut-2b
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:23:37 -0500
Received: by mail-pf1-x434.google.com with SMTP id c4so5780910pfl.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678109014;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8lLOSoWrSxn7Tlrc9Dr5C9AkR0zQvJ1OQYp4d+j0s3w=;
 b=fyPpQ1wwNEsk7+nfjKlKTGPySG6uoPfw1DNiaCFHuv9FKkczPmUisU95P3P6crx/3o
 cxz8q+0aEEBb3NqibR5kbuSgB2tK5FIcpovdJloGx+DmY4/fkuPxio1ZJdxFIlnP4uSU
 Q8nLLiLfHzk7HBuK5bISJwLTIg9CA6WSBnruLUR/loKGtDQgMBEn6yMd0mV8ufjEdpJD
 LtMAtvBZPpalKMrV4Ngg2bqhONAuALPIgIzsAvHDR3j3QS+/zjYkKGEMBZIWgJlEzaLD
 EGf3LLkMOgEmErS75GuLsf8rmJXWUajiBARR90eAugiWjHzbXqPk4qj2doYZeuJJlzlp
 kJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109014;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8lLOSoWrSxn7Tlrc9Dr5C9AkR0zQvJ1OQYp4d+j0s3w=;
 b=0UN10ef6pkPwWCBekwH5Km6sBWhuaNX75vyoZVM/1vNbVjmb+XwZw3mMjcHXQLKd3d
 vhhLHwMaZDlowDkPuLJMMQFHcCHYw2OxRFcoOJ4GkwlLV5VMDcXV86eRewhEi1MfG55E
 gXbbB9BfkS3Fq4NDlD1QRFgk2OszD83bdYqQ9pCZobpqg6W2phFzplgPyIt/l4FC/nP1
 OjyQF/0mje41pRRjBiOO46oYLUVwvfi+ULfc1el1rceOFf7XfL7JFD3gOxoy7FDljdJu
 yV3kQV5n+2yKwBAbPJnuiDDvZ3neg7s9xc6oOSJIg198A9WYopamOJZJp3miHZ5O2oL4
 JOCQ==
X-Gm-Message-State: AO0yUKXp7WzJ057t08+C9XSTB6wrcRyUoFTVyJZDdqLVpiKKE88wPEbO
 6V9l475QJPP82Mo6o8VWmNlMTE6sTwDav57zN3fOsA==
X-Google-Smtp-Source: AK7set9nOxnoAZSFBEXPXiQ3XNthsvm1RLExUSFkYh0a+EtS9N/8WbBd62wxYrB82FWqCCXGoUlZcvI8tF8SJRc4c1Y=
X-Received: by 2002:a05:6a00:8cd:b0:593:e110:9582 with SMTP id
 s13-20020a056a0008cd00b00593e1109582mr4762157pfu.2.1678109014492; Mon, 06 Mar
 2023 05:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20230220081252.25348-1-qianfanguijin@163.com>
In-Reply-To: <20230220081252.25348-1-qianfanguijin@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 13:23:23 +0000
Message-ID: <CAFEAcA_VzChyJ=E_QG0PUd==9YfEwmthO7MfYoXpp7=XfgqZ5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw: allwinner-i2c: Make the trace message more
 readable
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 20 Feb 2023 at 08:13, <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> Next is an example when read/write trace enabled:
>
> allwinner_i2c_write write  XADDR(0x04): 0x00
> allwinner_i2c_write write   CNTR(0x0c): 0x50 M_STP BUS_EN
> allwinner_i2c_write write   CNTR(0x0c): 0xe4 A_ACK M_STA BUS_EN INT_EN
> allwinner_i2c_read  read    CNTR(0x0c): 0xcc A_ACK INT_FLAG BUS_EN INT_EN
> allwinner_i2c_read  read    STAT(0x10): 0x08 STAT_M_STA_TX

This seems like overkill to me. We don't do it for
any other devices. If we did want to do it we should
do it by providing a generic mechanism somewhere that
it's easy for devices to use, not by implementing a lot
of string operations inside the code for this one device.

thanks
-- PMM

