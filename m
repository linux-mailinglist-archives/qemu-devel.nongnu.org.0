Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E295C25A0D9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 23:38:41 +0200 (CEST)
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDDzF-0000w8-1E
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 17:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDDxn-0008Tb-GB
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 17:37:11 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:45481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDDxl-0004Lq-TW
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 17:37:11 -0400
Received: by mail-il1-x142.google.com with SMTP id q6so2995271ild.12
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 14:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cptZ0YzANFAb1kaGI98qabUFUJUcmP4Fc/Rh83vl0lY=;
 b=Q+nqRvSMx8tFB+VgtsQe5w0nD5cJ/l/Itf4iE8eFWtjmsj1vjvmZj6ZLQXHaujzlj4
 8GWwqJAKqcTMoJ9qzWcrVPqJFsvRhszzqrkymDbcClV829nrOEHGk3MaoA8t5M1193H4
 05byVI1Q5h8Dw1fGGJu8WgE0SSWkt6ICTFFwH2Tb/GDrdY31bda25fcwV08FIXngM94K
 xJRhQVpwc1AgGtBsoSQYKRytMmEJKchtvaksp5GEP2tEYbRRkIuuyEO1BLd8LyxaIU+0
 Gk4HRBobXFsSKoeM00gYipHm++X5ju3mz/dO5FrG8Ii/9Yo8NgR4nDrXaerD7Gk5WPWW
 LeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cptZ0YzANFAb1kaGI98qabUFUJUcmP4Fc/Rh83vl0lY=;
 b=h9ziNehiz3ijh+Bs7OMveNjD4jjt0xYssAoIEUSpFy70Nvh4JEPuKmR7OkJp8vUcDt
 bTpAVfDJ1ctqKc9xrojC+T/zn0oEiRodbPka5edmSImlspvkIlX295a24zHwQUBNdftJ
 mHzHsAxe6r/JBB5Bsi63xAgSWvN2DtF3PZGdiqxH9A2UMpGv06cqarNks49ncWhC2x9b
 5Rgk38nvLD1iRrKFa2buZv2sOahb9aMd1iclyIqZIhjrkV5imAnKYWejk1lX3/iy71xk
 5bv2WX6h0zOtx1zGWXddf6WM9s2/5uEAPtzKzkAWaubeE3AvHsNBID1je0Oakd5Wq+0E
 sZWA==
X-Gm-Message-State: AOAM5328gxZdB6qNMXZUxNZkTFc2L/JId1USBBH6WFs3cXr3Rf2N5gry
 bH8fpFpL1x16QKtYvqagX+CVOw==
X-Google-Smtp-Source: ABdhPJxxCzC+GmkABPVppj/mLDmnwkNsJFz0jI8j1PcJT+a5kUpp29EfkU2si2Bay9P3Zxzpch/JbA==
X-Received: by 2002:a92:dac1:: with SMTP id o1mr1002982ilq.86.1598996228896;
 Tue, 01 Sep 2020 14:37:08 -0700 (PDT)
Received: from ?IPv6:2607:fb90:27d2:4b79:8545:2b44:3b48:7db9?
 ([2607:fb90:27d2:4b79:8545:2b44:3b48:7db9])
 by smtp.gmail.com with ESMTPSA id s143sm1204279ilc.14.2020.09.01.14.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 14:37:08 -0700 (PDT)
Subject: Re: [PATCH 3/7] hw/hppa: Store boot device in fw_cfg section
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20200901183452.24967-1-deller@gmx.de>
 <20200901183452.24967-4-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f23c6e8-bacd-5cd1-772a-8857bd8a1649@linaro.org>
Date: Tue, 1 Sep 2020 14:37:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901183452.24967-4-deller@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.13,
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
Cc: Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/20 11:34 AM, Helge Deller wrote:
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  hw/hppa/machine.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


