Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD6E338E6E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:13:06 +0100 (CET)
Received: from localhost ([::1]:53274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKhbF-0007N7-Fe
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKhWd-0005UW-HE
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:08:19 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKhWX-0001jj-PP
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:08:19 -0500
Received: by mail-ed1-x531.google.com with SMTP id dm8so7863751edb.2
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HBDptPRf5Tyqn/W51fcQEOYmR37WvJv4AFCzQl8VGyI=;
 b=FUeO3MBnbtg00RKOsOWnyS+soI1J7dasiE6Xsy8mYw1FLZYCjejlnXxf9f9miliczk
 lbSImbS6uTsOsr7P4X4apeoXOInzpYT86b/YUH4IN8swymg4Te0NCHbkEfktiYJmwdZ3
 IivpHcH1A0BI4rP/f2oW7G4gdeUR1G8CXomjBT1xDz8ih2vHFoolh0UDTS2tf2uBpEcg
 C0wGz2eYhBjgvXOg1w7ShVvtTJQgem5jSDuqK6LRSLVPFOs0AaDd4OiVhS6K1lwcdzRp
 VI6JZ8nF8zrAJpZ66m5wJ9tuHwoRr3ghUTwEJm0baCqj8NRQf/Dxje86atnrgsJEguXR
 um0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HBDptPRf5Tyqn/W51fcQEOYmR37WvJv4AFCzQl8VGyI=;
 b=i9LOWQ0JbvD/4ILUZK1iF28aP9tWibLoTbs0MT70vXnESRVAX4+hB4UQM1M6P2uztx
 skoxf5y7xPC1JSHl5syHfVOuR6fjYuKoWFw2ePVcvbnLTXpHKxflDhaWsH+7fqduuBCg
 KoMY8eMTon20N8ephZYBKETskVGqv3tPJJE2xldmQ/ItEVfTFjz8qdGDbgJjP5PRnKtP
 f2blUbfZTNX/WhrvDYLjgW4vNRJGYP9osmiWzpDvzIYp3V6pknDjYyPhNlKY4ll4+zaK
 nVVwyGpSu5k4YdpUH4Itl5HLuCHXW+QuBpY8zfvgpuyg0im89fl8J5Oqo0+MAhHehe7Q
 PiOg==
X-Gm-Message-State: AOAM53399K2rxhvLod+XNoivYKq6EZ9zs/NwZxc8OcNrPWbav5wkzUDU
 fJa913pDuX1R1TxSyiRiHK+UeF+39T/q7DZUjz0FOQ==
X-Google-Smtp-Source: ABdhPJzRW9fVQ8nyq+r/67rnW9qYIBgO4xDSomWb9myLqPOwRJI3iNOEBWQ+ogXd3IKqWh8xDxtSBD8SkaSJwMKQHOs=
X-Received: by 2002:aa7:d686:: with SMTP id d6mr14370580edr.146.1615554491796; 
 Fri, 12 Mar 2021 05:08:11 -0800 (PST)
MIME-Version: 1.0
References: <20210309114512.536489-1-its@irrelevant.dk>
 <20210309114512.536489-20-its@irrelevant.dk>
In-Reply-To: <20210309114512.536489-20-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 13:07:53 +0000
Message-ID: <CAFEAcA_1ro7DRp0BJdv5Lt0ehRH9Vwy9oCvwn0kOprmB8h6vAw@mail.gmail.com>
Subject: Re: [PULL v2 19/38] hw/block/nvme: align zoned.zasl with mdts
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 11:45, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> ZASL (Zone Append Size Limit) is defined exactly like MDTS (Maximum Data
> Transfer Size), that is, it is a value in units of the minimum memory
> page size (CAP.MPSMIN) and is reported as a power of two.
>
> The 'mdts' nvme device parameter is specified as in the spec, but the
> 'zoned.append_size_limit' parameter is specified in bytes. This is
> suboptimal for a number of reasons:
>
>   1. It is just plain confusing wrt. the definition of mdts.
>   2. There is a lot of complexity involved in validating the value; it
>      must be a power of two, it should be larger than 4k, if it is zero
>      we set it internally to mdts, but still report it as zero.
>   3. While "hw/block/nvme: improve invalid zasl value reporting"
>      slightly improved the handling of the parameter, the validation is
>      still wrong; it does not depend on CC.MPS, it depends on
>      CAP.MPSMIN. And we are not even checking that it is actually less
>      than or equal to MDTS, which is kinda the *one* condition it must
>      satisfy.
>
> Fix this by defining zasl exactly like mdts and checking the one thing
> that it must satisfy (that it is less than or equal to mdts). Also,
> change the default value from 128KiB to 0 (aka, whatever mdts is).

> @@ -2144,10 +2142,9 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
>                  goto invalid;
>              }
>
> -            if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
> -                trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
> -                status = NVME_INVALID_FIELD;
> -                goto invalid;
> +            if (n->params.zasl && data_size > n->page_size << n->params.zasl) {
> +                trace_pci_nvme_err_zasl(data_size);
> +                return NVME_INVALID_FIELD | NVME_DNR;
>              }
>
>              slba = zone->w_ptr;

Hi; Coverity points out a possible overflow here (CID 1450756):
n->page_size is a uint32_t, and n->params.zasl is a uint8_t, so
the "n->page_size << n->params.zasl" will be done as 32-bit arithmetic;
but it is then compared against a uint64_t data_size.

Is this an overflow that can never happen (ie a false positive), or
should the RHS of the comparison be done as 64-bit arithmetic by
adding a cast ?

thanks
-- PMM

