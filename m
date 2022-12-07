Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324126455FC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 10:03:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2qKk-0007mW-7Y; Wed, 07 Dec 2022 04:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2qKU-0007jF-Tq
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 04:03:03 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2qKP-0007Ow-Tz
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 04:03:02 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 ay8-20020a05600c1e0800b003d0808d2826so2129032wmb.1
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 01:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h/oyaeRK1qJ0WgTWjIHtEjKpyPV1cMfqmIZfsoQWqIc=;
 b=JuUhF6MPfSamo/rErk9Dbz7J9mbkrbDRb63DoGxW2R+hbH0QIcCL8f9PM0gcMmLvz2
 yvi+VTHZLWYP0EKhzEou5FN+KGKMXAjD2tk0epou6Oq3kj3ld6c+KNc2P+QeVE5MRp1t
 DIdQ9OEHm6f1y762MHFgHHVIpx0EcsDbSEtyfRjyvjcfWX/FSi6jLz4DouCK8a+nucSG
 oPTkezgnYiOPhSlUZkf1uTha/wbAv61Z6nx4U6AR0PeGZzaTxVeriHkGKFnty7PT4TUZ
 IH7Os3Qulzg3euZuYmCvz93jPM26CI7NONDt8T155g2Wcpbbf+ue333Xn48Ao6kB8Q3T
 vA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h/oyaeRK1qJ0WgTWjIHtEjKpyPV1cMfqmIZfsoQWqIc=;
 b=lN5PPzjhg/DLnJqbweTe5XIFh/UPnYUkyERAxU5yJuYEFp0eqYBH3vObMGKEaOamjG
 pMWw8gmYjJ2aJ188NHsS2yuKUPMrIXXjZTh8ZT50rMYXvt+3Tyw38ZIBBzvsOCHX+UJc
 TYoxsPqi/z3H5CF2xiYjqZw7dC36S7uMUyJZvRYyoTMxblzC7hfup6MqSeQgFXclLiNc
 fgCTCLVsW9iYFRP2aUyx7Bg+yBsCE57Kijmhqx5ieSam/7c2pmHSyrX195pSioD38mcU
 cOhAq4JIRxigaenkHSYFerkydkFFAUFesMGSjzqsKnV5UedDCSn2/qNPG8RGI1qjQyho
 8OKg==
X-Gm-Message-State: ANoB5pmt/Y4IsjuACHY9wCzjk00C7m7OfpsUPaljDVZ4zLj7Z5+ELmsD
 KNSb8sDWJruD9NTgeXFoJIjeOg==
X-Google-Smtp-Source: AA0mqf417gpqmwkEJUiCn26A1AoyEy/ClQdXHEbK0RuErToiewgcWAeeuXICvbTXGoEgylm8oP/O3g==
X-Received: by 2002:a1c:2743:0:b0:3c6:e471:7400 with SMTP id
 n64-20020a1c2743000000b003c6e4717400mr52077358wmn.98.1670403775017; 
 Wed, 07 Dec 2022 01:02:55 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bd10-20020a05600c1f0a00b003d070e45574sm1075864wmb.11.2022.12.07.01.02.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 01:02:54 -0800 (PST)
Message-ID: <1184b1ab-c38a-b38b-b08c-637bc6b23bb5@linaro.org>
Date: Wed, 7 Dec 2022 10:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: How to best make include/hw/pci/pcie_sriov.h self-contained
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
References: <87bkofivbm.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87bkofivbm.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

On 7/12/22 07:25, Markus Armbruster wrote:
> pcie_sriov.h needs PCI_NUM_REGIONS from pci.h, but doesn't include it.
> pci.h must be included before pcie_sriov.h or else compile fails.
> 
> Adding #include "pci/pci.h" to pcie_sriov would be wrong, because it
> would close an inclusion loop: pci.h includes pcie.h (for
> PCIExpressDevice) includes pcie_sriov.h (for PCIESriovPF) includes pci.h
> (for PCI_NUM_REGIONS).
> 
> The obvious solution is to move PCI_NUM_REGIONS pci.h somewhere
> pcie_sriov.h can include without creating a loop.
> 
> We already have a few headers that don't include anything: pci_ids.h,
> pci_regs.h (includes include/standard-headers/linux/pci_regs.h, which
> doesn't count), pcie_regs.h.  Moving PCI_NUM_REGIONS to one of these
> would work, but it doesn't feel right.
> 
> We could create a new one, say pci_defs.h.  Just for PCI_NUM_REGIONS
> feels silly.  So, what else should move there?

Sounds good to me. Eventually name it pci_standard_defs.h?

We can move the first 100 lines of pci.h there, PCI_ROM_SLOT, 
PCI_NUM_REGIONS, PCI HEADER_TYPE, PCI_NUM_PINS, cap_present, and 
eventually PCIINTxRoute & PCIReqIDType.

> 
> Any other ideas?
> 
> In case you wonder why I bother you with this...
> 
> Back in 2016, we discussed[1] rules for headers, and these were
> generally liked:
> 
> 1. Have a carefully curated header that's included everywhere first.  We
>     got that already thanks to Peter: osdep.h.
> 
> 2. Headers should normally include everything they need beyond osdep.h.
>     If exceptions are needed for some reason, they must be documented in
>     the header.  If all that's needed from a header is typedefs, put
>     those into qemu/typedefs.h instead of including the header.
> 
> 3. Cyclic inclusion is forbidden.
> 
> I'm working on patches to get include/ closer to obeying 2.
> 
> [1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
>      https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html
> 
> 


