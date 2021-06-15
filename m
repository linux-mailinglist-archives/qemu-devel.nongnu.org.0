Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17F13A756C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 05:52:07 +0200 (CEST)
Received: from localhost ([::1]:38220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt07S-0005rx-72
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 23:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lt06f-0005CP-TA
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:51:17 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lt06e-0001Mb-06
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:51:17 -0400
Received: by mail-pj1-x102c.google.com with SMTP id k5so10992488pjj.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 20:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GbgwRSpqJh3ztrke/k2zS/I+NoyuV1BVtjdgoKkt7Lo=;
 b=Uhkyv5+Fgpw44bX9K0Dx+SieU8k+LxceOo0NwpvG3gOerFCcp1zOtCLq5NmCtO4Ejj
 QS9vD0FzP1Yo/dsMP91wK4wH2CyxXJfEeAP67aK3QBi8Huv/V+0GopSO3H6V6sDfBY4k
 pru7+Y/LbExQYXnHjxBsDd0iinKJbDujw7ccBBx4/GXNX5Iyem0ecKeUgwvb1WKm3Mcb
 mDZITQsfTGqlarA+zKRNfb3dupKOJZd7JIuWlh5yJx5ZjjmMuQ5GlIKxTJ7eyS7KIaQU
 bRGPS25HamWNVU7kCsNgUorDBigxuSl34NXMSYJpET2r5lykWSBYD4UlFwNXtGw0UmG7
 U7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GbgwRSpqJh3ztrke/k2zS/I+NoyuV1BVtjdgoKkt7Lo=;
 b=WMA+FXvLCWereF6/5cgBBEyI8CPjsBQjLolQaEawCRHyIOKIc8XkKpdKSotfoIJSaM
 Z2XAf8Xmw2I78YGrk5W+jlKAtr2mQDBZco2Pe39+71kKQIV92Jrhpu40a7UhT9l1BMt0
 wQEiuQ3dV7RI+AfKp1/VfCqj9XYwMbBvIhlCMNOYICpZwpL83eMg2ZEyF7uvGMVrqXBd
 F+CzHb+tSuCe+g9aCLnpBUa8FKba1SG1UzIcCMYMBjq+ztrevehocsP+Siep2i8eJBGT
 QxcLh1ctSJZdLFfoc1c34j7T3H0as7EJsknjsdn+dMKyG+UBY052MWmDV4H5danH02y8
 POOg==
X-Gm-Message-State: AOAM531uNH93VwnptcPoHy/QVc1lMcN+mQshHN1XMIk/oi/Z007/QC2p
 tXdctoLjZ5zyDrkEqI65GkvwmVVUf27bYA==
X-Google-Smtp-Source: ABdhPJxU3VbxP6DKDqxnlADdr7Dma86fwzvT4tseQC4/aam5RiRpJ35xC1HtTGXL4mDhwBr1N3Jc7Q==
X-Received: by 2002:a17:902:8309:b029:115:c2f3:2aed with SMTP id
 bd9-20020a1709028309b0290115c2f32aedmr2408634plb.57.1623729074239; 
 Mon, 14 Jun 2021 20:51:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 gl13sm826372pjb.5.2021.06.14.20.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 20:51:13 -0700 (PDT)
Subject: Re: [PATCH v2 0/1] PALcode fixes for guest OS console initialization
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210613210934.21143-1-thorpej@me.com>
 <0431974F-C568-4617-962E-7EA66E048595@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <24a2eecf-89f7-f0cd-1bff-bc5a0c8a6cf1@linaro.org>
Date: Mon, 14 Jun 2021 20:51:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0431974F-C568-4617-962E-7EA66E048595@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 5:29 PM, Jason Thorpe wrote:
> 
> 
>> On Jun 13, 2021, at 2:09 PM, Jason Thorpe <thorpej@me.com> wrote:
>>
>> but there is still some research going on about how
>> real DEC SRM initializes a particular field in various circumstances;
>> this is my best guess based on available documentation and observed
>> behavior of real machines, and is sufficient for the BSD operating systems.
> 
> FWIW, I have since confirmed my hypothesis about how genuine DEC SRM fills in the "type" and "term_type" fields on 2 different generations of PCI-based Alpha systems (i.e. it matches the patch submitted here).

Excellent, thanks.  Queued.


r~


