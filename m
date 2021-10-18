Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2F14328BD
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 23:03:49 +0200 (CEST)
Received: from localhost ([::1]:51248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcZnP-00007P-4z
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 17:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcZkA-0007Jl-Ne
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 17:00:27 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcZk5-0001gS-5Y
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 17:00:25 -0400
Received: by mail-pg1-x52d.google.com with SMTP id t7so2930789pgl.9
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 14:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/7I7u0W/RkqGPmsRFQtNVJREKm5LSyk29PxQaRC3dGk=;
 b=P1YxUIF0KHY715Ezof5ccIs6AKk8YcX/Khhl6V2/XdjxDh5oxBXYn4ERWSYrHCjvpQ
 U7Lb/3UzgXL3kUlRkwJFnvxPo9BGiS7zDLc30PUJom7NYk+Muo0DB6o70FBcvKAgIZOs
 pZGzGR4gnwgbVs45/uMNJEs6mVEybPsNZrKfKuq7mT9LBhv8qVRFBGzByOmhZ8hwbtoD
 3oarj/4Orgn38cdJUK3DtkSYnLPVRcbJlk4X1Fb914fSUkW/UfSSZr4MPyGW/Br+wgLU
 k+nM1Ml/7I4b9rYbN/eYB4FMeUnSi12CTzWhRkGsaW0eLqtZS6PaEM9TnG8NAwXa7jQP
 KehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/7I7u0W/RkqGPmsRFQtNVJREKm5LSyk29PxQaRC3dGk=;
 b=6xNmsntn+UWr++jgS2hJJmuIKk4pr4khIeVPSqtzmWyIjE7jVJm4zqvhIYzPrFiH2f
 IJopE71gCLyqb+YQUFWgKD20KbUNbTnZvvkl4hl5Osp9ygiejdSy/FmbCaE//QNGnndc
 4hnDRJjMHorw/2ptIplG88PqZUT0rUXaLgiX0FR7oximWZkdRne/A/r3CBz7cpP+VMwH
 XXzVbMwrvsPEGHmO8CWu9ABHqdsLck40/4jr1m8ngkSbE2/JXk5xbC/t7Fr4LIJ5Ga1X
 QNieYLHAmL7rieAVdSTVrLoQnoc5aQGrOW/HefWpZ4Zj/WPCDOwIixNyWitsbHUaj1hO
 Kb/w==
X-Gm-Message-State: AOAM532CdQ8h0aBV2u6OJWSVR/ZC+XnDx92X1c/sMwHJ5j7f5LJdNBdX
 btsVbQK1d/McOaI16BkZJfLfkA==
X-Google-Smtp-Source: ABdhPJxoKVlbtRZ3vrNZCPyby/qaudRh9GtLEGAK3oRPYfnDR/V3n5hCpjEaNObWekU+NBU4VmqvBA==
X-Received: by 2002:a63:4344:: with SMTP id q65mr25954312pga.450.1634590816418; 
 Mon, 18 Oct 2021 14:00:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z6sm342545pjr.17.2021.10.18.14.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 14:00:15 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] bios-tables-test: Generate reference table for
 virt/DBG2
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 mst@redhat.com, imammedo@redhat.com, philmd@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, ardb@kernel.org, drjones@redhat.com
References: <20211007072922.655330-1-eric.auger@redhat.com>
 <20211007072922.655330-4-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b7b27eb2-e524-4b10-e5aa-d200f13a2166@linaro.org>
Date: Mon, 18 Oct 2021 14:00:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007072922.655330-4-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/21 12:29 AM, Eric Auger wrote:
> diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..86e6314f7b0235ef8ed3e0221e09f996c41f5e98 100644
> GIT binary patch
> literal 87
> zcmZ>9ayJTR0D|*Q{>~o33QiFL&I&-l2owUbL9`AKgJ=eA21Zr}H4uw|p@A7lh%qQJ
> TFmQk+Il-a=3=Gcxz6J~c3~mVl
> 
> literal 0
> HcmV?d00001
> 

Something went wrong here:

Applying: bios-tables-test: Generate reference table for virt/DBG2
error: corrupt binary patch at line 75: --

Can you please re-send?


r~

