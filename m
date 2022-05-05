Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67E51C5E0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:14:02 +0200 (CEST)
Received: from localhost ([::1]:34782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmf3A-0007GV-Oy
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmeov-00080S-NE; Thu, 05 May 2022 12:59:18 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:41524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmeot-0007UE-1t; Thu, 05 May 2022 12:59:17 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 y14-20020a9d460e000000b00605ee347da1so3308363ote.8; 
 Thu, 05 May 2022 09:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=f1kVqLvCxT7JZWCh4VuMbHZRZXru82k/oj2rUKF8TYE=;
 b=Wdxlu/d9BnZvQ2tyuNRlm8AFRACNS5xO13uy2KMaILgZoEb33f5+wr4+dNC8i8rWYd
 1MoDWbWtIO4a2VJ3cTaqqHvuy5jHhqErDKExtP+1UWwE1lsHOFqNc3Ae7yi9lfS0MQgw
 qdoNis9pcs8LBKF0YXQGvwVMYZlz//Nl+BFLE5T2mB2F6CFu5B5b2RjyIC1KeerxvzU7
 7Eb6MLhwfUaha/INYJMRSLQ4hdMfc1Vi6kqg1Qlm2MjgOH41p7n8gPhmLrLPAKQVbWEM
 UMHsfnEaPDgsRoJC37a/9CPvYDp8u2JI98nid65ZSG00M6DdeMKZEitvzsBPPowiw3QO
 b1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f1kVqLvCxT7JZWCh4VuMbHZRZXru82k/oj2rUKF8TYE=;
 b=SAA/Yct29TPgVMtQVRiEGfka6nug2NFb1aHYunVOuEvQbYli3DIr3uQbocu4ZhmEV9
 9CipDQ9c0+t9XHC4wMqhR2EZljj9/QP6EFYxUXnYnhy3WjsxZMo3TwOlsWMZvFk5TEWn
 NdavNl8OW75iozztw/OpF/5vSuLOX2vpDjyc/ayxJl4Wu/fl/fhhddAQdscSlttR/m92
 AxuXalz0dm6T6f3AO/wIFhxNO1NJRYvnTY2JYfVQSJPLgaWcTC9MhfTFnurN7cNnpxdb
 FBLpeAcu821SpUMOMwIK5k7e8X/Fvat/WcKpdt5Q78xC563L/kO3c2LsVf0YXv8I+VAd
 Xcqw==
X-Gm-Message-State: AOAM533kKvd2twlDyAoUxEEFDDEZHUvZNN+kZkjPjpulpzdO1giMJMQc
 7yxxLpkrTm1bXtJRpBTeNTU=
X-Google-Smtp-Source: ABdhPJxIQEw8AEYl1jekcyJQh+L9pzGyMPfmw4irvTmX4QgwW3CxEEmHU9d3Us7Rmq26snHjeNuYcQ==
X-Received: by 2002:a9d:37cb:0:b0:5cc:7a51:c984 with SMTP id
 x69-20020a9d37cb000000b005cc7a51c984mr9566928otb.98.1651769946127; 
 Thu, 05 May 2022 09:59:06 -0700 (PDT)
Received: from [192.168.10.102] (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 l10-20020a9d4c0a000000b006060322124fsm765486otf.31.2022.05.05.09.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 09:59:05 -0700 (PDT)
Message-ID: <24f9b99d-0835-7cac-11d8-b5fbaeaffefb@gmail.com>
Date: Thu, 5 May 2022 13:59:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 07/11] hw/ppc/e500: Remove unused BINARY_DEVICE_TREE_FILE
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "open list:e500" <qemu-ppc@nongnu.org>
References: <20220505161805.11116-1-shentey@gmail.com>
 <20220505161805.11116-8-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220505161805.11116-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
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



On 5/5/22 13:18, Bernhard Beschow wrote:
> Commit 28290f37e20cda27574f15be9e9499493e3d0fe8 'PPC: E500: Generate
> device tree on reset' improved device tree generation and made
> BINARY_DEVICE_TREE_FILE obsolete.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/e500.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 2bc3dce1fb..7f7f5b3452 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -47,7 +47,6 @@
>   #include "hw/irq.h"
>   
>   #define EPAPR_MAGIC                (0x45504150)
> -#define BINARY_DEVICE_TREE_FILE    "mpc8544ds.dtb"
>   #define DTC_LOAD_PAD               0x1800000
>   #define DTC_PAD_MASK               0xFFFFF
>   #define DTB_MAX_SIZE               (8 * MiB)

