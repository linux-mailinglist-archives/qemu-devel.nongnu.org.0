Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6D03C1AC1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:57:45 +0200 (CEST)
Received: from localhost ([::1]:39632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1b5c-0005G9-CO
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1aeb-00078K-Ga
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:29:49 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1aeZ-00040z-M4
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:29:49 -0400
Received: by mail-pj1-x1036.google.com with SMTP id g24so4432008pji.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w+8EzyexDU1vBqeUIGIOdRdS4By9tbEM6dfih157N6s=;
 b=gw7/YJWjcO031iAXfQzsy7YBR3vbuhw1ThnjvPoa6BAXzssadRUTPkKK0LddnNKyOW
 MFdho3smaWptpBwEjXS0qNnpuzBcp4TIJ3OUN9Lf75GQS3ZOEZKUUMzWlmJpzXwLU82I
 ZBV2yYjyxU8U7YlODAd24s/0gSfEU9imtuyt1AwYt6uI5s8ZGYMc5lZ5Yrp5ASXXzR+2
 y619gGg0h8dQwaUiwny7I9haQVCWBNVfl67VIHfLV6bCqu70Ofv4ElGIo8qopf8N0+Dy
 L6yKjiRJy4iyNtUcugMjCEN5A+x9p8sTV+sJkKPjHfBzAWFro0ipFwgBoNHhp3OKmdvH
 z46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w+8EzyexDU1vBqeUIGIOdRdS4By9tbEM6dfih157N6s=;
 b=QvoFlT+teIC5HvZWZoJUlkr7wk65UkD+54caErXG55lIBJTH2fqzYqJsmjMjQJy7zA
 ni13ZJRAicJf/8XGHqrMw5xAsHd5mohpFjkB9k4fo49qs07kuAWyQWhVZ6z/ICXomJLd
 oP3/Hp++9x++roQvCgaJwC3oCIqU2Dtc3NZs2+NpDtDnF4VbiUEmpWnt2yY8BKgti1Wf
 /qwiCVZksK34gNTuf5Av5maIDVOKbTDphm1zoFsu2HR/zvrFo3npnDXecTs1KMcpBNrb
 f9QhJpJSISOBXTGhRhgKM9anexKLHJFkvo65R+iXgFxgUv5oMJ7S2Cr3uM2h3KUP7UwK
 6rMQ==
X-Gm-Message-State: AOAM5313ZzMhqRyiKJ6ibXHf9k5gW4pdJgHMjVeK5B+l1nBOLx3r340s
 4WBiyjF7fXzGD7nSTsLeAXgsRg==
X-Google-Smtp-Source: ABdhPJwZufc8amiauk1kQXC92+8+tO4Fi6K+9sHEM4h/ItA9CG10VcUPEXgVuXyzWJd8vf07ghHSbw==
X-Received: by 2002:a17:90b:fcb:: with SMTP id
 gd11mr33997252pjb.198.1625776186045; 
 Thu, 08 Jul 2021 13:29:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z21sm3334693pjq.8.2021.07.08.13.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 13:29:41 -0700 (PDT)
Subject: Re: [PATCH v2 26/39] tests/tcg: make test-mmap a little less
 aggressive
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210708190941.16980-1-alex.bennee@linaro.org>
 <20210708190941.16980-27-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <277c97f3-b2d8-639f-a251-099287e5a733@linaro.org>
Date: Thu, 8 Jul 2021 13:29:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708190941.16980-27-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 12:09 PM, Alex Bennée wrote:
> -	for (i = 0; i < 0x1fff; i++)
> +	for (i = 0; i < 0x1ff; i++)
>   	{
>   		size_t len;
>   
>   		len = pagesize + (pagesize * i & 7);

There's really no point in i >= 8.

We release all of the memory at the end of the loop; we'll probably get back the same 
pages on the 8'th iteration.


> -	for (i = 0; i < 0x2fff; i++)
> +	for (i = 0; i < 0x2ff; i++)

I'm not sure why this one is iterating more than twice?


r~

