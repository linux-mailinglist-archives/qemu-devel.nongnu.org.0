Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF424D05BF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:54:14 +0100 (CET)
Received: from localhost ([::1]:52854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRHYi-0006GK-TN
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:54:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRHXW-0005ak-Bf
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:52:58 -0500
Received: from [2607:f8b0:4864:20::1029] (port=46672
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRHXU-0001Nx-Os
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:52:57 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 15-20020a17090a098f00b001bef0376d5cso14954341pjo.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 09:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wruqPKPyHfPehyt6Bb6SHNaF70OONEKmbSAJxLK3Bb8=;
 b=wwAIiR4PGxA+Qwk1YfVMntHuvNpk4q1aiDXGeoyuYpnKMBvthr0kizc3Kk/vuR0hD+
 tViI3a1JySTIEcg1Fpg+o39qtGvmzERTcoV590yOj6nlZI7WY7ZTvMyHbxAnkg5dwsVw
 0LTKe0sf7nz/ulYEChJ3QgcnOouaGGo6xpWsZhQeyZzi7Nw6B4CHIzaXCokjgnrsFteq
 ieAjQQlPyMJ6q7fk1BXx/rMUoP7RZqL6UWLW+7aQEGD/fczd7XZYTnY6fkQLXA1+7eLq
 tpHtWSbexs2WZVG7UuonlDlZiD6AvU092J9TthppEmbPDjcrJ04rJONk6RYs1+9ehL9+
 tRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wruqPKPyHfPehyt6Bb6SHNaF70OONEKmbSAJxLK3Bb8=;
 b=luCGV+qkO1Ir7pQymxsOPe3et63QGHnRn71q0/KWHF5moHr8inrqE8bvaK3VnQpsn/
 knjiwKLoLuyYWaoEdXI3ilM3An3Bo6Zwnsyuc/y3QZI6a9F46Vpq9f+w2b8Dtw5qPoX6
 x56TBgxnUQ/oFjTDZCc2dWzuafBoER/OYb2HoTOoBWxTnRMD/1P2P0M2G1qzVdccr0+s
 CVCqtW2CdOiFJ1QvstZYQucfopEyi3fcwqrlCNkCin4Q6by/IsN5DgGKf4EM7AFRW9Gy
 cEvVYHo1sPzYrJqyEuO8mEFgICHSYzQLsNLgDdvLdlDgwHjqukDaBpslIVMh6uD8IDaq
 hzGA==
X-Gm-Message-State: AOAM532JL0Hb6cNkewgUbmrETYrEYHgQj8ZYT6fJtdFbT007cS2TWqlJ
 ZM+U560QjxlM39EbRGOItypiLQ==
X-Google-Smtp-Source: ABdhPJwc/3J4/mYk9ONUOBHuF0cEaTxV565ui2oLAGMNz/D6jsIovO914MNeoBGAplB9mdNACAEx2Q==
X-Received: by 2002:a17:903:1c5:b0:151:cd10:5a5 with SMTP id
 e5-20020a17090301c500b00151cd1005a5mr13702726plh.26.1646675575215; 
 Mon, 07 Mar 2022 09:52:55 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 np9-20020a17090b4c4900b001bf49b4ec43sm9233pjb.37.2022.03.07.09.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 09:52:54 -0800 (PST)
Message-ID: <c79c7d80-db9f-c2b2-b463-097ed6d75fa0@linaro.org>
Date: Mon, 7 Mar 2022 07:52:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] gitlab-ci: do not run tests with address sanitizer
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220307141928.571482-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220307141928.571482-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 04:19, Paolo Bonzini wrote:
> This is flaky and sometimes fails or hangs unexplicably.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

