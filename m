Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058965A0123
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:12:05 +0200 (CEST)
Received: from localhost ([::1]:53928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQurD-0002EP-Qe
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oQuMJ-0002d4-QK; Wed, 24 Aug 2022 13:40:07 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:46073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oQuM8-0004nA-Kc; Wed, 24 Aug 2022 13:40:06 -0400
Received: by mail-ua1-x933.google.com with SMTP id j10so4657244uaq.12;
 Wed, 24 Aug 2022 10:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=OadnW/j27T6qvYhcFV65gqtNI5BkFThQo/5L+WqhJP0=;
 b=RGdO347PHqCIXel9R3H0fryi2XuDgW7MzCJgiBUK8vSI4bE70BFSWdBCpFI+NzzWcv
 868VD4Bgo90doqmtn7hDHM261Y8Pw1UV5D9SNPiMs2PbrxkyelOiIKLdS7rpTEiHnCh3
 R/1EZyG1nExuqk3I29SqMOtccrNcxYK/+E8IyeOFjRtjqB0K9ukQzaZUutF2AMK+uM/2
 3Z6dd5m2AQLlEmeQuj11LL4BmaF+UDyGRuPf5ng9Z32kAMkzy+e3UpgapUAO8jCity7y
 mNXLNTyboEBKMoD8deFsa894LqfoMINVEHuyISkPxVsaTRF1gbGqFVrrUxrRv4Mbd1bw
 25Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=OadnW/j27T6qvYhcFV65gqtNI5BkFThQo/5L+WqhJP0=;
 b=BcznFy3bjm7ML/t9JD6ckY44aLvHodtHLEPhHYxdOsfaK3YyZVVIBpfPiCQuGSMC7V
 eWu0LaE/L8z1jq67YJa7yeUOZTvT+7YDeLu6wpGblMWrlP8k15UmUbyE2yj+5gzx0FSV
 WBN3BjZgRK7qbwhhSP6n8UzleItar1I93AuU0HlUyvQkgDc8Irj6QDo599uuWJloUEoO
 gJiD3nxLjKk8x7OLY9T5tmoCbyuO8lF90Vsb5A16GcINjCBArLmA15L1CXYouFHHBgQL
 Brm9LKD0Z1l83rqKi/PM3paKzxV1K8dFEjArue3+9NhCVYym3/L+sQjwSOPXbNaV5nC1
 pgsw==
X-Gm-Message-State: ACgBeo0kVg7XUgJIj6ohXuGeVBBcp1HJ/nxt6FBE473PWGHXjiw4+XON
 YTa+/ad5e7nPpUqI78M2HG/jguxPuTU=
X-Google-Smtp-Source: AA6agR6NoRruBIFDrYwoe0ghkdhvRiU6vnIZ9pMvIgXs9I796phUlLh1PFqW7OJGWnma2/jI8UVxqA==
X-Received: by 2002:ab0:16c1:0:b0:391:89ab:ceb6 with SMTP id
 g1-20020ab016c1000000b0039189abceb6mr9237uaf.103.1661362792397; 
 Wed, 24 Aug 2022 10:39:52 -0700 (PDT)
Received: from [192.168.15.61] ([179.97.170.204])
 by smtp.gmail.com with ESMTPSA id
 s5-20020ac5cb45000000b0037772cb2458sm14229657vkl.25.2022.08.24.10.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 10:39:52 -0700 (PDT)
Message-ID: <1906ff57-21f9-d275-be78-957cd93b308b@gmail.com>
Date: Wed, 24 Aug 2022 14:39:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v2 0/2] ppc/pnv: fix root port QOM parenting
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com
References: <20220819094748.400578-1-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220819094748.400578-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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


Applied to gitlab.com/danielhb/qemu/tree/ppc-7.2. Thanks,


Daniel

On 8/19/22 06:47, Daniel Henrique Barboza wrote:
> Hi,
> 
> Second version removes pnv_phb_attach_root_port() in patch 2 as
> suggested by Cedric.
> 
> The patches are based on ppc-7.2:
> 
> https://gitlab.com/danielhb/qemu/-/tree/ppc-7.2
> 
> Changes from v1:
> - patch 2:
>    - removed pnv_phb_attach_root_port() as suggested by Cedric
> 
> v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02811.html
> 
> Daniel Henrique Barboza (2):
>    ppc/pnv: consolidate pnv_parent_*_fixup() helpers
>    ppc/pnv: fix QOM parenting of user creatable root ports
> 
>   hw/pci-host/pnv_phb.c | 88 +++++++++++++++++++++++--------------------
>   1 file changed, 47 insertions(+), 41 deletions(-)
> 

