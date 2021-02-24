Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EF5323612
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 04:35:02 +0100 (CET)
Received: from localhost ([::1]:57744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEkx3-0007Xy-Cy
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 22:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEkw8-00078z-Mo
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 22:34:04 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEkw7-0001Co-5R
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 22:34:04 -0500
Received: by mail-pj1-x1034.google.com with SMTP id e9so427552pjj.0
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 19:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CfPYLjKldV7XBNSPil+mmWu/NvYh/tPBWE/6Mz6bk0g=;
 b=D82hDhcFm2iwamu14rIGBkub+hGLqia08JgzVYhi1oVkwbvFnw3AU3uv93WuG7Fp56
 fViRJ9YJ6JWEMw8JfeE/lU1sBlwYqCADZj8MPGAJzIdfKXNsDtKgorh72HaMq25frhwl
 w3mm6o8bMSO7kYeDUyiEE69CfuFJa1ej1Ox6ex1euBd4rwHfLh1Te+xKgtco2WDnxEpR
 jiOhkII+00Xn/ZcHug8M13qzDkh5+UKPamlNGZuWUQawvqf2A9LqfmmanpEOXTGSLqPT
 URMn3XQxgyfeP81+b89UYSNNlYX1pEZkgZ178FTiiCBUYxz30cIZ1/oZPuDpT4bkH+tQ
 YNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CfPYLjKldV7XBNSPil+mmWu/NvYh/tPBWE/6Mz6bk0g=;
 b=AwCCecYM5u5tMsz8xjOa+F8/IFoOCnsfy7beOTCg0E4h5dnET/VsCiYhRPUzqOilBU
 /48y0m7cEJfl2C47C/n0CeDkBri3B76S+R0Gfqk1LdRr2M/Ihy3B0AsIuDv3BgfcmiGD
 fe81uqg4lZuVyDcq0ln9dAIS6prnGb5rIfDZrsHVxjh+2A8T3RvhtNmDNvwMDNuWnlHS
 BKjsRdzR973bn3lBKvOcxYktI80qBQzug+ySpYPMUnkkAV+pm5oPy+6gmBUfxasiWAT2
 7VtUgzzVI6zOV0daoPSdww+YdSAq6skefRiyXeuPWUoXT8pS2310V5TijsXC/RIiF3TL
 OVlw==
X-Gm-Message-State: AOAM531f6G8GMB3dfYZtpoEwlwsfm9G+a7kqIhtw6C4DfnKhCze+onoh
 DGcaf7R+4pcmkkYB9o6CGPk4dw==
X-Google-Smtp-Source: ABdhPJyDcRB5fg//8RQ7QajbQbZ/JDSdgKhgtcS10TTLJPBJkmDtjGrd88FoICR1UJ6H2JfkJIdcyg==
X-Received: by 2002:a17:90b:1283:: with SMTP id
 fw3mr2113587pjb.91.1614137641501; 
 Tue, 23 Feb 2021 19:34:01 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id c78sm609703pfc.212.2021.02.23.19.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 19:34:01 -0800 (PST)
Subject: Re: [PATCH v2 0/6] testing/next (meson check-tcg, fedora bump, docs)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210222101455.12640-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <99459885-53b7-e666-9757-d80e37080eac@linaro.org>
Date: Tue, 23 Feb 2021 19:33:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222101455.12640-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 2:14 AM, Alex Bennée wrote:
> Alex Bennée (5):
>   meson.build: expose TCG cross compiler information in summary
>   tests/acceptance: allow a "graceful" failing for virtio-gpu test
>   docs/devel: expand on use of containers to build tests
>   docs/devel: update the container based tests
>   docs/devel: add forward reference to check-tcg
> 
> Philippe Mathieu-Daudé (1):
>   docker: Bump Fedora images to release 33

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

