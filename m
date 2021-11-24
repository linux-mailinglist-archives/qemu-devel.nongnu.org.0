Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DDE45B78C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:33:28 +0100 (CET)
Received: from localhost ([::1]:51248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpoeZ-0001sz-Kz
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:33:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpoYl-0005uD-FA
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:27:23 -0500
Received: from [2a00:1450:4864:20::434] (port=37721
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpoYj-0006J5-ES
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:27:23 -0500
Received: by mail-wr1-x434.google.com with SMTP id b12so3001344wrh.4
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vYecEut8V/hMyFR1xvCsqX5oeOPzSa62aJgOqPVJriI=;
 b=PTxdRqM8l4qUybk29H1sMlCju7JJ1v65x2/auwBAzMFmvRv/rT51y+AX1V8KLb0sFQ
 IlPCrD/2SuwafMAKGmhcoKhikzEitWxvBa+Sd+98GXLCyDyJD56InhTr7cOzuktj8GFx
 MKjw71snN1qMEJCWnzeJV82mC7hMrZ3UiGL7Lv+RXV+fNj8vBG5pZyJ7BCFRCLoc8C3m
 nU1oNP/EM5PSK1qFT06emrrxdsa4ddWpZ4OaiW3K32/pcr8jzusQfku3u3ceol8WsEww
 yh6unEkVCKE8LJcRHSnxgLWALnfpVG3tczzkXQ4hw5aicVWMfha+Oy60SO5qL/LX/4yH
 oaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vYecEut8V/hMyFR1xvCsqX5oeOPzSa62aJgOqPVJriI=;
 b=lnnOHieH4Y45h0nMnpYqcVTpbFK0xc6bvB09fT41gry16/ARjTxFtwWnn7ydiaaF/4
 5shFKCTh4X4lh7qPTKTZMsvPuzJ9QCUF1C9RlrHjdgxUs7341vpS3m9pcYyTS9sM8e0r
 lxAHTIn5wVyTLm3OSgJ2YjiSGjl20t1qvoWIs/n3n51eU3omVRkUxzOuJ+C0/tjRmsrV
 a1XHxOKQbmYSYFuIRZhkr+C4vHHVsejvB+BJYIxK5PsTPQ+vTGgFf9UnX9HtYuaxK+y2
 2v2FdL49EM/WL0tPHfPDLA3haLSB6wjvrTgbmnt48r+bOnis8+nVJsfLlJwxbNL5n70w
 rPsw==
X-Gm-Message-State: AOAM532c8gLv30FkT32CRuPkQVjNCOZGiIj/MKMJHY2uOcNuIz7qDanT
 ChG7UFUz3oQweCi3kAN5P1yuVg==
X-Google-Smtp-Source: ABdhPJwXyUApF6llCgnOLJh5EVWcwuUceJgND+oRinjowQMHlU9PCMYyzAu2tFwE5y4ngSjamDsHPA==
X-Received: by 2002:a5d:48cf:: with SMTP id p15mr16722284wrs.277.1637746039645; 
 Wed, 24 Nov 2021 01:27:19 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id f7sm4941811wmg.6.2021.11.24.01.27.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 01:27:19 -0800 (PST)
Subject: Re: [PATCH 35/35] test/tcg/ppc64le: Add float reference files
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20211119160502.17432-1-richard.henderson@linaro.org>
 <20211119160502.17432-36-richard.henderson@linaro.org>
 <41eda524-8e61-88e6-71ff-757fae97bc9b@kaod.org>
 <0e4d4227-4a67-7a6e-4f45-6416faebbc93@linaro.org>
 <45a736de-efe4-1638-65c7-28764c93248a@linaro.org>
 <673145cf-f64c-2520-3ed5-dae2a16704e7@kaod.org>
 <333b8968-bdfd-bd79-51d7-edaba09e5e92@linaro.org>
 <85b4d164-548c-a411-0dbc-d06b842a8baf@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7e4853b3-5b1d-c868-971f-10777efb1d32@linaro.org>
Date: Wed, 24 Nov 2021 10:27:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <85b4d164-548c-a411-0dbc-d06b842a8baf@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 10:17 AM, Cédric Le Goater wrote:
> I do now. That was not an easy task. All seem fine with a x86/RH9
> but I am having issues building the images on power9/ubuntu21.10.
> 
> centos8 fails with :
>    #6 41.69 Error: Unable to find a match: libpmem-devel spice-server-devel
> 
> and some others with :
> 
>    #5 3.433  builddeps:qemu : Depends: gcc-s390x-linux-gnu but it is not installable
>    #5 3.433                   Depends: gcc-alpha-linux-gnu but it is not installable
>    #5 3.256 E: Unable to locate package gcc-hppa-linux-gnu
> 
> Is that expected ?

Yes, most docker images are x86_64 only.  Alex knows more about trying to sort this out 
for aarch64, but mostly the cross-build packages are simply not available for other hosts.

> Also I am seeing this issue on RH9 when running gdb tests :
> 
>    TEST    basic gdbstub support
> warning: Remote gdbserver does not support determining executable automatically.
> RHEL <=6.8 and <=7.2 versions of gdbserver do not support such automatic executable 
> detection.
> The following versions of gdbserver support it:
> - Upstream version of gdbserver (unsupported) 7.10 or later
> - Red Hat Developer Toolset (DTS) version of gdbserver from DTS 4.0 or later (only on x86_64)
> - RHEL-7.3 versions of gdbserver (on any architecture)
> 
> I will dig that one. May be it's from the gdb of RH.

I've never seen this one.


r~

