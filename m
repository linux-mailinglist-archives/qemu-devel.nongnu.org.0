Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42E7534051
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 17:25:22 +0200 (CEST)
Received: from localhost ([::1]:44786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntst0-0008QK-0Q
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 11:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntspz-0006PR-AH
 for qemu-devel@nongnu.org; Wed, 25 May 2022 11:22:15 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntspx-0005Ix-CI
 for qemu-devel@nongnu.org; Wed, 25 May 2022 11:22:14 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so5413772pjq.2
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 08:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NlWgbpUSuLPWQ0uB1U+GycGcFp9H5loi1W+WGC9Kmnk=;
 b=bnOkAyIHbt4guHPdsbvaUNVZAgr8mGOUYYxKATMNsnlts1h/MrDJGki/E18noolsLZ
 MLWsgc2Hdum3OoXe8hT6u1FmogZnzsgf9OTXwLKOd8Jb7IAPQZTyNPyyrP4bWZ/4AZkA
 y/I59cMEUVIa40nZp8wzUpK7gPBPlbqlqsYdxqg6MfaoZb+N/Dx0DbsmoC/oy72FX4Ds
 CIvMyLNdGRd0rKKPEehBAenHyQvJ18m9fVV+v2pu8oQcsYro6nT81AmIALH0XNtujOt/
 Ds8+nN23NqvFhrQcMZRJSyYfQ/i48WNwuRLm/3aYLiy8xKQGq2PY4986fjn3ivcUofYb
 yGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NlWgbpUSuLPWQ0uB1U+GycGcFp9H5loi1W+WGC9Kmnk=;
 b=sOQhZPV4FU6H+BWuNHbggnZVTVSBa5b6wkv/jqBnoMPVKxzI+5fe/0vTmHfWSCMG2q
 teedOvyg3Vrr6tt0juRnsm5ixLpDoMuu6zmlX7qGsZimr83yWeUE7ZiYTyh+FqJIjBQi
 cqNh3fnRIpM9td4tyfTq5Cd+iMVBko/4UbzawADt5hqzipgG6fbBCXkE1f0aG3p5s1uI
 n0OtTMABJ7T4QldMB6P4nC3y8a/SUFzTVZrUnOXzGWaTXzrRTVVI2Yzh78hjqFI//RCm
 yPQrX83ZCYhPVErclTdjTNIfuAOMxgw2ZrerJDzNdC/azVrh9xsfrC/F7OQYqBM1Wk+Y
 RM6A==
X-Gm-Message-State: AOAM530Ss9OL39LzrnK7AqQsL43GH3ezXumAzDN/G3ecDNtpWoJJL1K+
 GXBMpi8NsmERDPdRuvoLed0fVw==
X-Google-Smtp-Source: ABdhPJwn4xwxKoLXKtygB2XVhTr6Ez1c5nzlaT1r0P5KgvEVjTJpi20fMAkUZzwVmhDs3CCedTA5Bg==
X-Received: by 2002:a17:90a:e7cd:b0:1e0:33c1:59dd with SMTP id
 kb13-20020a17090ae7cd00b001e033c159ddmr10997081pjb.44.1653492130816; 
 Wed, 25 May 2022 08:22:10 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a170902ea4500b0015f300ed0b7sm9414624plg.76.2022.05.25.08.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 08:22:10 -0700 (PDT)
Message-ID: <a430eb4a-20db-8c04-e9ce-0d3e1d4c3c46@linaro.org>
Date: Wed, 25 May 2022 08:22:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v9 08/12] target/hexagon: import flex/bison to docker files
Content-Language: en-US
To: anjo@rev.ng, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com,
 mlambert@quicinc.com, babush@rev.ng, nizzo@rev.ng, qemu-devel@nongnu.org
References: <20220422174059.4304-9-anjo@rev.ng> <87h75f6xyd.fsf@linaro.org>
 <952b8af1-486c-1e69-3ab2-42da0edb9fda@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <952b8af1-486c-1e69-3ab2-42da0edb9fda@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/22 05:29, Anton Johansson wrote:
> For clarity's sake, here are the exact steps taken to produce this patch:
> 
>      1. Update QEMU's libvirt-ci to the commit
> 
> https://gitlab.com/libvirt/libvirt-ci/-/commit/43927ff508e8ecb1ac225dabbc95b37c890db917
> 
>         which adds flex/bison, and a native glib2 (required since idef-parser
>         is a build-time tool.)

This must be split out -- submodule updates should be a patch by themselves.  Otherwise it 
can look like unintentional rebase breakage (which, sadly, happens more often than 
legitimate submodule updates).

>      2. Copy in new `tests/lcitool/projects/qemu.yml` from `libvirt-ci`
> 
>      3. run `tests/lcitool/refresh` to generate new docker/cirrus files

And, yes, having one patch that's simply auto-generated is helpful.


r~


