Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B5C34EC45
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 17:26:19 +0200 (CEST)
Received: from localhost ([::1]:36674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRGG1-0001wv-SA
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 11:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRGEf-00011w-Dm
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:24:53 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRGEc-0000Ie-AD
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:24:53 -0400
Received: by mail-pj1-x1035.google.com with SMTP id gb6so7952941pjb.0
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xgscloui0CZk3c2Aw1kquKBKgkDCMibySf/kEwg5rd0=;
 b=Y63WWlUyg0wyR2AGdIuD6MIaJcNujpDQwCUcz6lfnEr8IYY7TSX3243KRkKJpUcTG8
 H2lJLRvNESbz+FcW255pWByRKyXJ+DW5EdC37cEjHoW5X2Wh/PDfg/+ZGUuXEO4ln77B
 j7ZVlwSMEvLXRtSocaaWtyG1phIuSvyq/GAMWGwRj/u6aw9oYTrhT0Oo5kL8nlCKTmiF
 CdWWxSFkVp5Amwr9Jd43Yusyc28aHcRbriRZXufXyoUl+yBr7kjYFU3mU0qVIg+wsw8A
 84Ok5y0hlkkPVl2oWP5dP2EniTUHKMdVhJ3XwiA7yajSYSyvVzvEBtZ5Zdej1OY2KyQd
 4twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xgscloui0CZk3c2Aw1kquKBKgkDCMibySf/kEwg5rd0=;
 b=XmXz2w/o86jekClm00p0v4h/MlH3bvzVP0tvZRAT92kteordjlv1SmXeumToP26Tbe
 lOsXfG+SSlsxEwY9gs1w/rBCe9fobnhXV/bZI0NvELtFgwHHiQdJW/AMJ1uBukPMY6kx
 hS8CPmfOg+h4CgOSYFDa5FHW2xCPdFtFiNzjIbdk1+CA+m5FS2V2RnjFySLWfEPHZgBR
 ZoRevwPkr0HgOMFmFawusuNd4cWb+z+aEbU32xtLclnbLHsbw0fg7zC/BE9oZvSvdUXh
 YuHePLcjSpvePIfI9WaoFX9gE6cPv9s7VNBYlYRO9dhoKBiBrgggLmm0aDieGM6J6Rvp
 +9pw==
X-Gm-Message-State: AOAM531a/tXBaMTM6b9Cx5A6X/ba7rxTEgYlgFVT742N5CCEUGsuo/PZ
 k0eOul3oZdRfcItrgvYa+IKESg==
X-Google-Smtp-Source: ABdhPJyq7oz6XhjAPf6zrsaN/RC091TLCvIAsXMV23pX9jf/KJDkvT/q1KC8pzPRAHEoXGHpJhzIHQ==
X-Received: by 2002:a17:90b:1a89:: with SMTP id
 ng9mr4875575pjb.36.1617117887672; 
 Tue, 30 Mar 2021 08:24:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id gm9sm3028130pjb.13.2021.03.30.08.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 08:24:47 -0700 (PDT)
Subject: Re: [PATCH v1 2/6] tests/docker: don't set DOCKER_REGISTRY on
 non-x86_64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210329110303.15235-1-alex.bennee@linaro.org>
 <20210329110303.15235-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d148dcbb-094a-526d-b006-54b04883d2c7@linaro.org>
Date: Tue, 30 Mar 2021 08:24:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329110303.15235-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/21 5:02 AM, Alex Bennée wrote:
> Currently our gitlab registry is x86_64 only so attempting to pull an
> image from it on something else will end in tears.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


