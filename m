Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C41349F018
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 01:54:14 +0100 (CET)
Received: from localhost ([::1]:49846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFWn-0000Ps-Dw
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 19:54:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDFHL-0005bK-5T
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:38:16 -0500
Received: from [2607:f8b0:4864:20::102c] (port=50728
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDFHG-00036c-Kc
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:38:12 -0500
Received: by mail-pj1-x102c.google.com with SMTP id o11so4973443pjf.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iigMDqzjvNRWz4SrfIsrZard4qAXnjPC+/s9pjhnQPg=;
 b=f6DF5DeyA8BoqbdVQoLRF0vVbzBhM3h9x+SL1r4mmrbi6QqoVfzUz1Q/OEByipzVP1
 rDNsR5TmEeddGtiVgPzOF9Nz+VndFAQHrISE9ZHT3e4QNLvUZ6jx58g71ZafFVd2Tsr2
 oxnHil41a/lLEbz8MfnakOZQklk6rieqEx9ijbONJjTWWnEd7SxuWPMT4bP9QJt/8voL
 HCw+8kMqu2A2NtPReS33a3txAASwAwgeM27DMXUjPLznidmid02novBUKFPhJ17RmXqY
 JtpyG7mPuWlf8hn/p8GnOx/1HWpyKbN2/oooA5x7rKLZZZts+znvlMX1FBD0Not5imin
 ydiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iigMDqzjvNRWz4SrfIsrZard4qAXnjPC+/s9pjhnQPg=;
 b=ynk8d31Jrnxt8WXuXU0MIkpuujq0mTj599VRsCB7coE0vCk6HfsgDVIUB/pk1zwaB5
 yWt49X2FAGDVno+grYWINy3F3pfOyT4Ay0Z8lHtbRXyAdNhh8+evdVVmEKvQQ/mFCQs9
 uP9hnr6AVQfESUJurBdXanuqIl12z7C1TXfIqnAEfDTW/i8HiOyRmZ+/w/3HeQiMAi4t
 vMfORjltXhJeyOOREmayZ2TBEzAaVZKY3Oh48GHlD1kccMttB96dNzEcLVFjxyVGTnKP
 TI71p5j9FJ/DU6p9ZuZkD3Ew30oEI8kOT9r62jf4rzHnNzfm/lnMTUr6L4Y3S7owgNqw
 UPfw==
X-Gm-Message-State: AOAM533TmZCN+Ckr3Ugl4KaDVUUz5eXTLIdRrdaSyaYNCqQOtVVuIwFg
 AN2EVoVzLcRsLE2NWUbvwP5R3w==
X-Google-Smtp-Source: ABdhPJyR0dFwgALXCqOF/5DFJ8vlWUxD9YQkzmQzdd0MmD7TVp7IsuJiIp6tOvvQjYBovz4JLXA3nw==
X-Received: by 2002:a17:902:f685:: with SMTP id
 l5mr6113552plg.153.1643330288646; 
 Thu, 27 Jan 2022 16:38:08 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id q140sm20962516pgq.7.2022.01.27.16.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 16:38:08 -0800 (PST)
Message-ID: <cc43605c-d855-9f31-def1-a37fcec5912f@linaro.org>
Date: Fri, 28 Jan 2022 11:38:01 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 01/10] stubs: Restrict fw_cfg to system emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220111184309.28637-1-f4bug@amsat.org>
 <20220111184309.28637-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220111184309.28637-2-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/22 05:43, Philippe Mathieu-Daudé wrote:
> fw_cfg_arch_key_name() stub is only required for sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   stubs/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

