Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171F04894C4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:11:11 +0100 (CET)
Received: from localhost ([::1]:46464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qhp-0006GA-OE
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:11:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6qeG-00027F-O4; Mon, 10 Jan 2022 04:07:28 -0500
Received: from [2a00:1450:4864:20::433] (port=34494
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6qeF-0001MJ-1y; Mon, 10 Jan 2022 04:07:28 -0500
Received: by mail-wr1-x433.google.com with SMTP id h10so15228240wrb.1;
 Mon, 10 Jan 2022 01:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OZwdoF8j15NjnUUfOsg2RZJTi/xxWgJ0e3oy+vZDoHs=;
 b=m5EOuOe2W+CjKxFK0B0hinOdRp1CYg3Dgs24BoRHspoeS7/PK93Uqlgf6Oce4bZx4G
 Fql9lwHP6j90Mwu8kMr//fEyDsfdp09YcjFlqzTdO1X1PvbIIDXxwRO1flbP0HRPdX0Z
 MKqInoXcBrXry0CiLBHwDUqsX2j9q50IZH+2holzHTxKhAbIDS1iL0KSAnpMDu4G/R1A
 1g4qJoQYUsB2BdeUnXdCg3QcwVvmEHQHwOBuTP4pj2ngRbstyiwdMak99mh8qOO62ndT
 Jf9HINdhAUKpg236jUIfl/K+8RUeVIZSbKCajzmrV6ahY7LAnp6EN6mUJlNnv4vulUkZ
 xEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OZwdoF8j15NjnUUfOsg2RZJTi/xxWgJ0e3oy+vZDoHs=;
 b=Ml+MBoicuKlB1VgpMcAwT7oade4YN6SlcYBlEahCxpDgZJatkQ2nnpRaIGpzuPIBZa
 1ql1Rql30hJu9AMxZj3uBartCnI1a91PWmsfnX8xmoAweVj9WpRg1pjoYaLsf3BhTE6P
 PETRkXLYCmiEMgSlk8wXmzU8Qy9+5X9Zg/o//6amajoE+/p711Xx9F7gJJVvn2C4Vo9x
 vPXQzm2crg/Caw3rladYNkl6crjHUv+War5t0tujgQ1P6+QDaILrhLlqzt1Rwcr6wHAd
 VjnQdrhyQoa4raR3ncTxPflsdQLVdM1ptI/7nSHuCEaGwYCQ+dLFjmdXIxbHJ06Z6oO1
 TvAw==
X-Gm-Message-State: AOAM532IuZ9j9zYIJXKE9plDSOnRzvlnxef8M3d1Y36/bAZcad1Zo5bM
 vwlch1SRr09D0aRVRYvIv5I=
X-Google-Smtp-Source: ABdhPJxH5yOIc/wswOwnryiZa1jJuFVq0p3AoP4sOsO977S2Dl9faW68jba3SLgxb+H7o4OW4VsuSw==
X-Received: by 2002:a05:6000:1c1c:: with SMTP id
 ba28mr24695519wrb.37.1641805645498; 
 Mon, 10 Jan 2022 01:07:25 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id k33sm6192535wms.21.2022.01.10.01.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:07:25 -0800 (PST)
Message-ID: <637a0a5e-888f-6ac8-1307-aedef1c91b5a@amsat.org>
Date: Mon, 10 Jan 2022 10:07:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 9/9] hw/dma: Let dma_buf_read() / dma_buf_write()
 propagate MemTxResult
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-10-f4bug@amsat.org>
 <a3d4079d-90fd-5ec9-05b9-6b0a79ba4640@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <a3d4079d-90fd-5ec9-05b9-6b0a79ba4640@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 09:51, David Hildenbrand wrote:
> On 04.01.22 09:54, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Since the previous commit, dma_buf_rw() returns a MemTxResult
>> type. Do not discard it, return it to the caller.
>>
>> Since both dma_buf_read/dma_buf_write functions were previously
>> returning the QEMUSGList size not consumed, add an extra argument
>> where the unconsummed size can be stored.
>>
>> Update the few callers.
> 
> I feel like this patch doesn't fit into the context of this series.
> Especially as the cover letter mentiones "Finally we replace misuses
> with dma_addr_t typedef."
> 
> Am I missing something?

OK, I will simply repost it once this series gets merged.

