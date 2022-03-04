Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A794CD813
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:39:32 +0100 (CET)
Received: from localhost ([::1]:54792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQA1j-0008Ff-7E
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:39:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9GK-0006Ev-V9; Fri, 04 Mar 2022 09:50:32 -0500
Received: from [2a00:1450:4864:20::433] (port=38715
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9GJ-0003eR-E2; Fri, 04 Mar 2022 09:50:32 -0500
Received: by mail-wr1-x433.google.com with SMTP id t11so13061745wrm.5;
 Fri, 04 Mar 2022 06:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4C9+bvDYajkMwsEy4saF4L9ZVOmSCxS3vWoqKGK21gA=;
 b=iHDvuYb4XsF2663wkJJi+Zo1Bgj29/FukH1AFrgzCSbLmb06L8hLIggdP69ZovWU8E
 XNqf5Cpn6LGOkkERnkKf5IZnolHEPEqEzLPexUK5fEKS+pk8UcHTAKUlkvXa14t3bTsL
 ZFP+EmkfVsatu/6RG2nboSefLzwcmAlVcmf2dVQzTI/BpElNzrX5q5DXsR+VCrDchH4W
 LcRmGmwPX23F4FWTNMUu/Ur+B45t8U5TxqMMEdB39ZUUekJdcFmmBaYp/2SG8T56RpWX
 pIgJW08i/FpL8z/4D+75b+hbi2I61CK/ItLqd+hY1TvyROSWFmsYih/xDtZw9z3BVtyg
 D+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4C9+bvDYajkMwsEy4saF4L9ZVOmSCxS3vWoqKGK21gA=;
 b=EbS45xOFjTqFC/nE0on/CuehtBB2iRgt/tA+leO8TqCNt+HhxnvVTaeJAO0xY9Asp4
 vwHMxyyDUh3IYDQPd56mmri51988bqZzUWWFF8wCLjWJa7pmQGpQ61kMssX/yaC2+E6M
 Fn/fP2UQVef5VMAikjC+9EYtBvUvSO34KvAZ9mWhes8n6x9h/nqiiidYuu4z2Olk+fEA
 lE4Byvqc5N8udVyAN3HCHIMCpGXGf7PAJ1UOuxApK6dWAft0JxG96KXBGaEMiLU7AcXY
 1HWua3WM2JAGDzpDFDctymtErfuj6m19a2wToENlpd8UIdANgcbPrrS9tzFkRMhgN9Jn
 Btdw==
X-Gm-Message-State: AOAM531cVIQHywz8O7exX5obwqe0G2XHsFfvADyr2RIFqywzRLz4YAha
 r7AjNAduHEx8lHxOh2uGMFoxXwF0VbA=
X-Google-Smtp-Source: ABdhPJwQw3mKXJSGVJ4NAXKrv5CsitYeZ0uMUCDrE+PhXdFjhAiaQeluBRjMiM1WfgI3QCB9Tx7rWQ==
X-Received: by 2002:a5d:6852:0:b0:1f0:98e7:a963 with SMTP id
 o18-20020a5d6852000000b001f098e7a963mr2032145wrw.646.1646405429896; 
 Fri, 04 Mar 2022 06:50:29 -0800 (PST)
Received: from [192.168.88.252] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c1d1000b003816edb5711sm12412030wms.26.2022.03.04.06.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 06:50:29 -0800 (PST)
Message-ID: <9da17110-1f7e-4df4-bb29-ce0d0781bace@gmail.com>
Date: Fri, 4 Mar 2022 15:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 3/9] util: Unify implementations of qemu_memalign()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220304112126.2261039-1-peter.maydell@linaro.org>
 <20220304112126.2261039-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220304112126.2261039-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/3/22 12:21, Peter Maydell wrote:
> We implement qemu_memalign() in both oslib-posix.c and oslib-win32.c,
> but the two versions are essentially the same: they call
> qemu_try_memalign(), and abort() after printing an error message if
> it fails.  The only difference is that the win32 version prints the
> GetLastError() value whereas the POSIX version prints
> strerror(errno).  However, this is a bug in the win32 version: in
> commit dfbd0b873a85021 in 2020 we changed the implementation of
> qemu_try_memalign() from using VirtualAlloc() (which sets the
> GetLastError() value) to using _aligned_malloc() (which sets errno),
> but didn't update the error message to match.
> 
> Replace the two separate functions with a single version in a
> new memalign.c file, which drops the unnecessary extra qemu_oom_check()
> function and instead prints a more useful message including the
> requested size and alignment as well as the errno string.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 20220226180723.1706285-4-peter.maydell@linaro.org
> ---
>   util/memalign.c    | 39 +++++++++++++++++++++++++++++++++++++++
>   util/oslib-posix.c | 14 --------------
>   util/oslib-win32.c | 14 --------------
>   util/meson.build   |  1 +
>   4 files changed, 40 insertions(+), 28 deletions(-)
>   create mode 100644 util/memalign.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

