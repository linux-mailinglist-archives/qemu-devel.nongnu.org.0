Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B094DCC02
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:04:59 +0100 (CET)
Received: from localhost ([::1]:38122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtYY-0002IJ-Gv
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:04:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUtVl-0000Cn-3B
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:02:05 -0400
Received: from [2607:f8b0:4864:20::635] (port=42498
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUtVj-0001Tu-54
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:02:04 -0400
Received: by mail-pl1-x635.google.com with SMTP id p17so4949276plo.9
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 10:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x8SbDX8vup8YkAsDd7GA/elOdBUDF/45K8HAVKjP5/g=;
 b=m8H7BIrkeXK23iO/hQX8+pIdfyyR1DM4gXH73gNwRdU2e8wcKc5FLqnU+1uAK+lMwt
 g7Uprp1qMSCNbT3r+Pvq42iIF3f0gaTtcsZUZXncXrWILc/GD/ZlgaZAlJ/IL6M/yd0D
 ec6rKpa5pO/3c2ocYFvHPI36Roe8/lxmU5itkNnYuMq7n7UXMtUFXD32QZrmRg8f5dQ3
 UIiAz2HS45/0Z3znJBLq1StQjABqIC8saK+spDpCqixflAv56c4EVG/byNnj1Qa+diOf
 svSYxsREZTPZ0Z3G5iDOAQmVXM37NizwybhZ5VET7QB5S3ZaCyYI7ATg3EgApYE0VezA
 VXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x8SbDX8vup8YkAsDd7GA/elOdBUDF/45K8HAVKjP5/g=;
 b=ng8AmxN24XI71lvweZftkXF5lo2dsQ95FtpBznvqEWPQ2ICXpe/TOdZHPtqm/cVMvK
 fqm4sD2Np3zWbwfnKR8pQbUeA0audDglW4x84cGF2/J3b73r1ROQHJo4llkv2qp8lEZm
 fmnFKnamm5pQVClvLI9IjbqI7ZcW0CltrPdvBa5b0brGZbUQjQHMwWQsfqF5QBmkXpRW
 To7euiewpfRXM8mo1UrFz4VOY9rNBi0Y6U5Ks+ufka85Rt+JIX8Xj5YW7Ut+YcQx1Hi3
 XuT53fqubRSStoNZE+8CwC1VgoiAVUskp3Zw+Fq99vgbDsEqOYBJa9QC3eTZ5eAPs1Af
 4wHg==
X-Gm-Message-State: AOAM532FWTJcovaaQ6KrLkW115qW0wCJ5eqI1Rf+GZDq4EJrJZHYpr2N
 udfiv+LRuRvexMHkTtXOjhQpXw==
X-Google-Smtp-Source: ABdhPJyGz/LtB186nfCnAaAsOIL0hdmAGvEufIYBaHxkvPG8jfBeJami1lAkyWlXFZHB8w3lAVJ7dA==
X-Received: by 2002:a17:902:e9c2:b0:153:c185:c7b1 with SMTP id
 2-20020a170902e9c200b00153c185c7b1mr5786944plk.92.1647536521296; 
 Thu, 17 Mar 2022 10:02:01 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a639302000000b003808dc4e133sm5954961pge.81.2022.03.17.10.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 10:02:00 -0700 (PDT)
Message-ID: <28938ce0-28ab-8365-ffe7-8ddda5e860e9@linaro.org>
Date: Thu, 17 Mar 2022 10:01:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.1 v6 25/51] target/nios2: Clean up handling of
 tlbmisc in do_exception
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-26-richard.henderson@linaro.org>
 <CAFEAcA8+tJfXEKKyJg63VuEKu_CmegRSzcSnOhCkdcL47UmOHA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8+tJfXEKKyJg63VuEKu_CmegRSzcSnOhCkdcL47UmOHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/22 08:41, Peter Maydell wrote:
> On page 3-21 of
> https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/hb/nios2/n2cpu_nii5v1_01.pdf
> the description of the WE flag says
> "Hardware sets the WE flag to one on a TLB permission violation
> exception, and on a TLB miss exception when status.EH = 0."
> 
> This is the second of those two cases, isn't it ?

Good eyes.  I had been looking over the exception processing section.


r~

