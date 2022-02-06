Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE60C4AAD29
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 01:25:00 +0100 (CET)
Received: from localhost ([::1]:47066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGVMR-00082B-Pc
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 19:24:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVJ2-0005u6-T9
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:21:30 -0500
Received: from [2607:f8b0:4864:20::530] (port=46000
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVJ0-0001js-BA
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:21:28 -0500
Received: by mail-pg1-x530.google.com with SMTP id z131so8310983pgz.12
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 16:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NqVLplNbiTlun5EwuHD2ACjQ6SIKknGML0vr9Q1JIvg=;
 b=b8Iie8iTcNbh2IKQ+2bHSsKhtYggbQ1zk+9OqEJRkR2G98B2utnwT1ZODnu87w5KsT
 5lRpUPuUwIBuNBAFDQterWAfY8vJG1D5HHMTcRMTwB+TY7zHhOhOqtpeNcVF8mUhIFxI
 vStJdkdz7q7SlLz7QhP8Vu89F/q4tHcxvam5MxoB8dV/ERi6f4JM1GYY+alu2BvDPnjc
 /xPFVh0v1wKPU2eJO/WEOiIgf1Tpb0kywJQb7k6mt6+hi2Ghw85IxNcik1ScdLEkbAH8
 ISi3MXYG9hHGZwU+mQG6fl3QWKnXpua0tut6B7nI/jnbKcbALb8cSut9YolJIJScezIR
 endg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NqVLplNbiTlun5EwuHD2ACjQ6SIKknGML0vr9Q1JIvg=;
 b=ooaIQ1X8d73c5whXQmo9Dhlt1/gXIWpiaUm+Jgr8WiOGMpG+5KU/5s1rGUjJZ8YhiE
 ainD0nEU5OqKpiNLCn2HhWC5QP6GNWY3+U9CNTHRgVfserg1tGjC2KznPHEcwDMIPu1z
 wCBxRNE6mlrBVtmgm5SC1lpEs4TIs9mR+aLzJko9Gx/nmA/c+Ne3pY2mY9i0Zy26eSOm
 kMeB2qZAxT3XouT1s+1uIxHoQs2WWE7kKWE+DAZ9pxJ94OxyaUuU1IIQDPKGLXPGPN4R
 li6L2saZHfbhmyuSnW1DU1Gzk+wK44TR6fVyv8n7rpcGTRfGQ4sxEB33PjNPOklJwPTt
 FYww==
X-Gm-Message-State: AOAM5313z+s8XxNdWXOT+RHqTB2te2K7yjygt+JzZBbejrA50bQxG4uD
 ojC3A/78CdkdInLdE0oyPkvE7w==
X-Google-Smtp-Source: ABdhPJy2qhK+3r4KlfPWx8W6PR7jq5PfxtgIy16vALOBHUrlnk0tOAv4oA7ZD24620/3MP4EJMLKXQ==
X-Received: by 2002:a63:f006:: with SMTP id k6mr4520906pgh.173.1644106885059; 
 Sat, 05 Feb 2022 16:21:25 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id d21sm7573578pfv.141.2022.02.05.16.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 16:21:24 -0800 (PST)
Message-ID: <3a01dfd0-ae4f-f78a-b471-dee91b115bb4@linaro.org>
Date: Sun, 6 Feb 2022 11:21:19 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/6] target/arm: Fix '-cpu max' for HVF
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
 <20220204165506.2846058-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220204165506.2846058-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/22 03:55, Peter Maydell wrote:
> Currently when using hvf we mishandle '-cpu max': we fall through to
> the TCG version of its initfn, which then sets a lot of feature bits
> that the real host CPU doesn't have. The hvf accelerator code then
> exposes these bogus ID register values to the guest because it
> doesn't check that the host really has the features.
> 
> Make '-cpu host' be like '-cpu max' for hvf, as we do with kvm.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu64.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

