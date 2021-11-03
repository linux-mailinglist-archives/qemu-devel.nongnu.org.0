Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0912D443AFE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 02:24:27 +0100 (CET)
Received: from localhost ([::1]:54934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi50s-00009k-3P
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 21:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi4ya-0006RG-Kh
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 21:22:05 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:36754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi4yW-0006GB-SQ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 21:22:02 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id d6so1043491qvb.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 18:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JAWppTkoQAS3TnK+pkLi4EMhKMujxI1J7TFlTqo1MLo=;
 b=ycpxWTsRwV0RBh7vBOEOrc3TTjnLO+25RIVr4rG+7X7M6eGt32su5z3dC91ikBZpEl
 /3Xdv4fHsH+ql4nRXCwduyVyHOWpCRuB+8LseahzzslhRD4Lrd3SdfWjN0Wh0OHNWtQZ
 wM9xTxlRsTOkOE7vcV6JJ7hJ/8IZbblDxw/P9Nj4NW1+O9IGHHPJsDXCWHNKvFw3XfcZ
 CQPXE11G+L/c05C9wJEIGuo5w9xPx0+pyrI+3aSTj8opnLi6zWIt1LSMmy8j8NOw+8oV
 LxKbM2Sl47aFSvEaE38MVxhjX7ufkAy2+ikGFFVQVNHYYXN+WAqdkKGlvndaq0j35ABE
 l9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JAWppTkoQAS3TnK+pkLi4EMhKMujxI1J7TFlTqo1MLo=;
 b=sJnEmY5m1cuRuzpR8M724ixwuFJuwx8ZbplGitxbK1FjIwpS2uGxzGMIPCWOCFPJhf
 J8c8Qk60msedx3Mg8L+XU9u2F6yMO4T6Hgp2d3LWqYVfckt2BW9Zw4IPr7JIYQJXmkQu
 agiYsRphaD1u3KQp2SJqmyTZiAQBKz37E+zI3VKJuUGrytxrfy4p0/VBORiIgx1EnVNh
 COiBFgxIaPCn/ao4cyk/KeyFvn6/aN2vGyEmCpznxUCyPCwFsVo9IDIv11wvh8q2IExf
 i6rVDUS4+NIWf7zVGM45T7Z+++AE6DJbS00g6+S6/9aPDJeE6H/S3Gg1R9qRcYPN537H
 UZRQ==
X-Gm-Message-State: AOAM533HGIBTGFLcAuQJoTwSFP/VYmrDiSoaJ+s25IeEBbMIYPJDzH4g
 nTt1+KIE6e/OkS0z4fHLYXO9sA==
X-Google-Smtp-Source: ABdhPJyJYBK5LJi7FoUPByXLBe4nm79/VfqLuOg7gTVzpPjFwL5NFVoT0P2kdt6vDzsMNksOJDVc0A==
X-Received: by 2002:ad4:5ce8:: with SMTP id iv8mr33478755qvb.21.1635902515089; 
 Tue, 02 Nov 2021 18:21:55 -0700 (PDT)
Received: from ?IPv6:2607:fb90:f800:bf42:4407:203:e794:8e1f?
 ([2607:fb90:f800:bf42:4407:203:e794:8e1f])
 by smtp.gmail.com with ESMTPSA id k16sm457536qkj.70.2021.11.02.18.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 18:21:54 -0700 (PDT)
Subject: Re: [RFC 3/6] target/riscv: rvk: add flag support for
 Zk/Zkn/Zknd/Zknd/Zkne/Zknh/Zks/Zksed/Zksh/Zkr
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
 <20211102031128.17296-4-liweiwei@iscas.ac.cn>
 <85f8f249-a54c-0ad6-a3bf-7bc4f072251b@linaro.org>
 <83e80e8f-485a-84b9-10e6-bac7d54850e1@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <70a3f6e6-26cd-103b-df44-ed86c2e8f10a@linaro.org>
Date: Tue, 2 Nov 2021 21:21:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <83e80e8f-485a-84b9-10e6-bac7d54850e1@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 9:06 PM, liweiwei wrote:
> 
> 在 2021/11/3 上午1:56, Richard Henderson 写道:
>> On 11/1/21 11:11 PM, liweiwei wrote:
>>> +        if (cpu->cfg.ext_zk) {
>>> +            cpu->cfg.ext_zbkb = true;
>>> +            cpu->cfg.ext_zbkc = true;
>>> +            cpu->cfg.ext_zbkx = true;
>>> +            cpu->cfg.ext_zknd = true;
>>> +            cpu->cfg.ext_zkne = true;
>>> +            cpu->cfg.ext_zknh = true;
>>> +            cpu->cfg.ext_zkr = true;
>>> +        }
>>
>> Section 2.12 lists instead the larger Zkn, Zks, Zkt extensions.
>> I think it's better to follow that.
>>
> OK. I'll replace this with setting ext_zkn, ext_zks, ext_zkt true. By the way, Zkt only 
> includes partial RVI/M/C instructions. Is it neccessary to distinguish them?

I don't know if Zkt needs to be called out; it probably depends on whether it is exposed 
to the guest via some MISA csr extension.


r~


