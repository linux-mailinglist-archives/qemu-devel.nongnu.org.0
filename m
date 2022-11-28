Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C401C63A2CA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:22:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZO3-000893-FL; Mon, 28 Nov 2022 03:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozZO0-00088o-Us
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:21:08 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozZNw-0002mq-ES
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:21:08 -0500
Received: by mail-wm1-x32c.google.com with SMTP id t1so7863498wmi.4
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 00:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/v7Z67WSRvaerqHDnXxq+Nyj0+SV9QMYZxSRmwmVJUI=;
 b=wZRB09gb8Cw0pTwCx8skGqGd8xtfy3mvc0Hir9s60ajPAeVHmCQOsbuVxgKrb5nuJa
 k1DogcSwlFkxpWutSygmIBJNgTgkWxHDYNU7OtobOaxMFAlXAE/Oz8DQuJfEeA/+c4Rd
 ptRNVroe8NPwAKuIXe7qlku4J0N9tMm70BDMyKTULCBT3u9AE7vtKtPapw5Ddsg9FuJ3
 WKLU7W9pO3+qoEstLCH8LFhMbuFw+nz0bXaVdb8jqfmPMs9r1ONncNTVpHagEm2F+iJ7
 hQcBqK+ZJrsQbE/CpplnvwlLuy0UTWzVQsIY7dnPxUVHvw6tiY8w/5T7QURln6w7/hSj
 cnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/v7Z67WSRvaerqHDnXxq+Nyj0+SV9QMYZxSRmwmVJUI=;
 b=7ZbY1oMzZWv+DXPSGXXz2m3R0kWHI7JHCsA3JxHJVsS4t3HX9bxzpFknFMqXTeiaOM
 d0eu/zSCsbjHpjZcHrMMw8Fm+yq1JumGdq0FgcVBrObUh1jy8vZ1ftsuUUGzQSQndYIU
 mhnJDY3X0rr+dU6KIyqQPr/N0p/Ewi/fEDX92YIIO9KAxswfI9nBj2elG4KlzUjd8ZWv
 hFO8K4qu2er9Q56urGhACSO9OJLVjQDIcAvH6fjNHD6HxmzDTJuolm5SpIYATQWLUzlN
 7ESgex/bOJ/AuI4WLQ7/i8GLZdw3wsA3TBoeSVZNF+LWTeRouH8IWiSDZkEPrbFebiSB
 eE3A==
X-Gm-Message-State: ANoB5plZNx/zVrcn24I3Jr4Xi9U7RiuPhRsshazLtfs8mwMaiXI2Q3gH
 m2o3egGXt3SChtkXlU1iMFEvJA==
X-Google-Smtp-Source: AA0mqf4tp80ggJYqlmxOy0yYSdtmFMrinsHv/NEWjUVjAByQS/8S8coSi45mPBSXjlSX/46SxkyZdw==
X-Received: by 2002:a1c:f606:0:b0:3b4:bf6d:f9ba with SMTP id
 w6-20020a1cf606000000b003b4bf6df9bamr36017149wmc.133.1669623662769; 
 Mon, 28 Nov 2022 00:21:02 -0800 (PST)
Received: from [192.168.1.175] (49.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.49]) by smtp.gmail.com with ESMTPSA id
 b6-20020a05600010c600b0024217e7aaa7sm1983421wrx.50.2022.11.28.00.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 00:21:02 -0800 (PST)
Message-ID: <a904a8e1-8f99-4d12-1ddc-ad8b7bcbf07c@linaro.org>
Date: Mon, 28 Nov 2022 09:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 09/12] pci: Move HMP command from hw/pci/pcie_aer.c to
 pci-hmp-cmds.c
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, dgilbert@redhat.com
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-10-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221128080202.2570543-10-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 28/11/22 09:01, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/pci/pci-internal.h   |   4 ++
>   include/monitor/hmp.h   |   1 +
>   include/sysemu/sysemu.h |   3 --
>   hw/pci/pci-hmp-cmds.c   | 105 ++++++++++++++++++++++++++++++++++++
>   hw/pci/pci-stub.c       |   1 -
>   hw/pci/pcie_aer.c       | 115 ++--------------------------------------
>   6 files changed, 114 insertions(+), 115 deletions(-)

I suppose hmp_info_usb() is next :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


