Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E641962F5
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 02:51:27 +0100 (CET)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jI0dC-0003UT-7K
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 21:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jI0cH-00033j-88
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 21:50:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jI0cF-0005zo-Km
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 21:50:28 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:32964)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jI0cF-0005zE-5x
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 21:50:27 -0400
Received: by mail-pf1-x443.google.com with SMTP id j1so5428351pfe.0
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 18:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gWmKuzIO0eGQZxONM3xGtiq+pSDoMpdstKtxTg8KvNQ=;
 b=sbAUoe24D0ptfOvRF7BXhCIyU6JtFTOQNfh25UwqMOC5EKVPEzJ8W4LUsqiCsAMSAK
 2d+KmP8+tyeNfADXylnu6Nm0UmJIsfAaj0RayThoMw7GHa7BKmW3WbUOMC89sYH70/no
 rtSKgkSvP7EiLsFMKFlQ7kEmsp9O0HVjqPAZR5NvHP9M0JnKt8l9WbI3ZQP7SxZb8/q5
 fgKv66YvpualGqaFY4x7myqLpfiGpjmCCPX2ZvaLxwFN53nD+eMS/IQAhdcT1DFaBR4f
 ebp3MCWe3qiDNl0oMhmyxIJEGCfIGkBnsIe8+rr9bNAWSjW9y3fnKfcH9nQGvX2ksw2D
 XzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gWmKuzIO0eGQZxONM3xGtiq+pSDoMpdstKtxTg8KvNQ=;
 b=EYF1p4Qdn8WDHWraEm2qBM620Ukf7dWgBBUTiIoz2SRxCEpu1clmAuHOEDJmTOOTjo
 9GGjeOqXeUEMcr0JfHoDUQQbdsjyuoXYoZ4cqLCd67VDUq8/7WhvdcSm/c85OUUTsCcQ
 NWXU/hXGZ369sTQS1P6UyPPa7XiD5j+N5WZy5Ea/48JXhS4u4WNpAbvcFxQtiv4Pql8t
 owTuGu6J6rYL+X5gqPNzRggMeJ+ptd2Wkq5nQX56r7oQM3/i80Go2XD4fZovv91CGzlQ
 M3hbkXYyPukVyhi/PRCyyCBwZKISwQOmwKtEPFWyPZTrJPB0nP5xEJsncVtO3M+hXfzC
 89Yg==
X-Gm-Message-State: ANhLgQ0CbmmoB5dDE8yA8YAHOx1yCaIZN5fyP/yLdQhRkmcdf48T8gF4
 W1SqspHKm+D4UQ3iEu1Fwb2pog==
X-Google-Smtp-Source: ADFU+vsRKpUW0aCEnujIwWi6GEvOiPQj4P+CRCJPrfOplH5AbQNFm38rWof9Hg1t51KQLR5y+b7nSA==
X-Received: by 2002:aa7:9433:: with SMTP id y19mr2122999pfo.233.1585360224833; 
 Fri, 27 Mar 2020 18:50:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id e14sm5047849pfn.196.2020.03.27.18.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 18:50:24 -0700 (PDT)
Subject: Re: [PATCH v6 29/61] target/riscv: vector narrowing fixed-point clip
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-30-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ca352a9-4fab-7b17-13ae-9074926685d9@linaro.org>
Date: Fri, 27 Mar 2020 18:50:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-30-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: guoren@linux.alibaba.com, wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  13 +++
>  target/riscv/insn32.decode              |   6 ++
>  target/riscv/insn_trans/trans_rvv.inc.c |   8 ++
>  target/riscv/vector_helper.c            | 137 ++++++++++++++++++++++++
>  4 files changed, 164 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

