Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101FF3DBEE2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 21:18:11 +0200 (CEST)
Received: from localhost ([::1]:52502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Y1K-0004Hb-4s
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 15:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XzB-00039x-9V
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:16:02 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Xz8-0000Yz-Rd
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:15:56 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso22235576pjq.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 12:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JV8yz0eqDwaW8rrQiT3s5iXTmjrE6YlqX5p/ZNQap8s=;
 b=fO+6tt2DjCz4WAuPnG1ZyLwQIqsH/55NTr2U/Z5HzQA5xtpVmDUlNC76uiFKyqg0tX
 f10N5R4hApL1PqYchULteJdi+cO0EgEMXTzwlzIUWi6DL/3S+94MDrWNUGJMVJKaTpLq
 Mk4zc3Y1Ie5iWfQxJMHYQvj23BwUqpuH3AmgN6BYnMdvGFraWT/Z05ED/B8M7XOFcf9M
 1Xp7PXsORDeXEiF7GQcCVlGi1gTahSFU1YZPSWGVzejBHvq8YhJC3oXVaikG9OsECFYA
 AqGybZCLupft92J4ViyDpjuXtbcap9pj/gBXvWNUeOV+yuNAk+g5v7RyhvofnbRVpIxn
 hBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JV8yz0eqDwaW8rrQiT3s5iXTmjrE6YlqX5p/ZNQap8s=;
 b=OKJTd6ssv8XXGsRFVZEyRh1gaOkakwlo+nRsqG9WGf3yQuiTkrr7qivHpbSOJWNnn/
 aItrmaS40zf7Oc/LQAn0yCGHHWSmSK9H7aDJY41ZxoUd22wStwflEvkM8+N6SIukcT+X
 W6KdSA6QMRGJX5+vVg9VaVtc12ytl+6w7KxBwzJ2HeQbTuNotMIFH8z0wH83oLdeMCF/
 qkfGVlkku50AeBhe36jgEvXZ71S+8r9lDMtoyZBs8bwmRTi8gTI5JFdfdpMykHsi/HIA
 ovyVYLCRNOWi1DctbCpzeDPdgm3hVPb5SmPo8q234ry1c9ZyU53ZfWsbBwLa7fgYTBlk
 OpCA==
X-Gm-Message-State: AOAM530PPG4fNz8lr4ZWoVdjsgMXhgDTTjkhKxzveg/OmGHnmQKfI829
 1xRtRZB5WQAwA7oPQFKH2W7idOD5XsAcBw==
X-Google-Smtp-Source: ABdhPJzTFx6ulT2EymMGky1GQEUfn1Ctj7wH0guxFsTyQy37AOo3GCUFlzauXOmQTPGhjKFr1W3Kww==
X-Received: by 2002:aa7:88d4:0:b029:329:be20:a5c with SMTP id
 k20-20020aa788d40000b0290329be200a5cmr4104492pff.61.1627672553423; 
 Fri, 30 Jul 2021 12:15:53 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id b128sm3370288pfb.144.2021.07.30.12.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:15:53 -0700 (PDT)
Subject: Re: [PATCH for-6.2 21/53] target/arm: Implement MVE integer min/max
 across vector
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5705e9ea-249e-1949-fd93-77fe4e5cf95f@linaro.org>
Date: Fri, 30 Jul 2021 09:15:50 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/29/21 1:14 AM, Peter Maydell wrote:
> Implement the MVE integer min/max across vector insns
> VMAXV, VMINV, VMAXAV and VMINAV, which find the maximum
> from the vector elements and a general purpose register,
> and store the maximum back into the general purpose
> register.
> 
> These insns overlap with VRMLALDAVH (they use what would
> be RdaHi=0b110).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Changes v1->v2: Drop the harmless but unnecessary
> "take abs value of 'n'" part of do_maxa() and do_mina()
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

