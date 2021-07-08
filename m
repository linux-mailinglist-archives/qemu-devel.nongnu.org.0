Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542A33BF5B5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 08:39:42 +0200 (CEST)
Received: from localhost ([::1]:38228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1NhE-000750-QO
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 02:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1m1Ng5-0005fy-6S
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 02:38:29 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1m1Ng2-0002Ts-6a
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 02:38:28 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x16so1545787plg.3
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lOvRuxkXifEN+GWP7tq4VYOzBYGrD2K2h/kCkI2qwUg=;
 b=0dJUHm5O8FmcR1aCqgG1LtFXjNbW1RM5TkTzq37H4a4elv7zkjzeTOlyRGkX//eY81
 GWSm8+Utk1alVPHkrk0HohrlEYzTvs33BNQFJCNBrdsxgsWUbMFbXHRE4J8ZUhfJylOt
 7yyKCOp/Wy+K09wuDpLufW3SNcMvCbvg7tZbTNZJCO7KBuqmZHTgR5fYjLstfOByQW+2
 aY80eRjJmskhPT7tIu4f419B4hNbQwmjBVntCHJhaTtB5uQ8xZzvvmwJanpEOUa9V8vo
 +WLaDwVJcflSDZL0fXhwgaBH6bO7kM7PEkn8Zyex53Jx8/DhSguUEwH/HOALAVKu8jXa
 BKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lOvRuxkXifEN+GWP7tq4VYOzBYGrD2K2h/kCkI2qwUg=;
 b=SZTMWNJhD8rBgZxwIg2HSb4Xqf9vPxyGW/U+5Gqr7LNrtRBYYgv80oeuLELox/UOP9
 0YhsPWuVrfMjFUzUMPsXm0RbOqQKiYqxhgdrbbhINA623c3lcP/g/yfkO9PWi57LhdBo
 gdYcqrVJ/XtWGlQdtd2qQJKuztv29RK75HhRK4mNZTf26/SA46+jpCOrLVgKqubqu3de
 eFFvilDJy4xMd82S14m/s59kmeO8E56UNldD8utXqmD/QJnXY+g+ovLs6Ro/kJ67IeHR
 uk/Jw114+sEw7LbHL8fNqv5ExjNyy/WK3KU7sdssh8GnArp8b7sRwV8DN9GOAf17Y8TH
 hfNw==
X-Gm-Message-State: AOAM531D3j5dKkdZ5eHiq+ej+KxeyB30AIy82oRWpATvOd5Ct+0PyG8q
 Cdk6hgTNnLV1mofRQ9lsYVMfBQ==
X-Google-Smtp-Source: ABdhPJwM2IkI1dQIsepPpc7hkPkj9PppONQ+FcDSKUJrfwBXbwmfqymnkt9z+TBAsmaoZyL7WPo0Rw==
X-Received: by 2002:a17:90a:eac3:: with SMTP id
 ev3mr3295943pjb.161.1625726303321; 
 Wed, 07 Jul 2021 23:38:23 -0700 (PDT)
Received: from [192.168.10.23] (219-90-184-65.ip.adam.com.au. [219.90.184.65])
 by smtp.gmail.com with UTF8SMTPSA id
 n3sm1360503pfn.216.2021.07.07.23.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 23:38:22 -0700 (PDT)
Message-ID: <3d90be86-0a75-de06-0c54-9c246f5035e7@ozlabs.ru>
Date: Thu, 8 Jul 2021 16:38:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH qemu v22] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210625055155.2252896-1-aik@ozlabs.ru> <YOZlnOiCeeF4mwJO@yekko>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <YOZlnOiCeeF4mwJO@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=aik@ozlabs.ru; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/07/2021 12:40, David Gibson wrote:

> [snip]
>> +static uint32_t vof_getprop(const void *fdt, uint32_t nodeph, uint32_t pname,
>> +                            uint32_t valaddr, uint32_t vallen)
>> +{
>> +    char propname[OF_PROPNAME_LEN_MAX + 1];
>> +    uint32_t ret = 0;
>> +    int proplen = 0;
>> +    const void *prop;
>> +    char trval[64] = "";
>> +    int nodeoff = fdt_node_offset_by_phandle(fdt, nodeph);
>> +    bool write0;
>> +
>> +    if (nodeoff < 0) {
>> +        return -1;
> 
> Shouldn't many of these explicit -1s be PROM_ERR, since you defined it?

It is defined in the firmware only and I forgot why :)

pc-bios/vof/ci.c|72 col 16| return PROM_ERROR;
pc-bios/vof/vof.h|13 col 9| #define PROM_ERROR (-1u)

I'll just ditch it, does not seem helping with anything.


-- 
Alexey

