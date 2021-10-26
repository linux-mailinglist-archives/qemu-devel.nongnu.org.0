Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B500643BBD6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:48:26 +0200 (CEST)
Received: from localhost ([::1]:44590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTMv-00046d-JC
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfTK2-0002ZD-5p
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:45:26 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfTJv-0002U6-Mx
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:45:25 -0400
Received: by mail-pf1-x436.google.com with SMTP id o133so595272pfg.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NAULZMsfq3PXbvRDTP/rMPQPJGNGRVxJw75uKfWmEwA=;
 b=hZbWaofGW5waR9mJgTeCWHw2kDcv5EfOlHlQcozekZ4r59jsvgaii48tXNvmi7H2xb
 lCe4bVZtNVh50/etRhFzfluP0bvmB7FcfSKZ3gAtfv1RzgItpUzSpz4MUxNlir3/1x7j
 oR1wLWIlrKKGXbD/AMKIJrOnbnBKiKxt+n6BObL4iw7bKOxhnzEFcmI/KOTKxjmsI/rn
 KmlmGZ7l/tUxG8ReCOvfgOzaB7InMzjj2n5T1+mXG2Nk2f9+hXh+ZtI0rHlOatK8miMd
 YgsZxMjmckjolr86slhSL/Ee15fM84xXc6T5HiTExMgOa0V39tab9AdcLAjOJUoSfW0Y
 6UJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NAULZMsfq3PXbvRDTP/rMPQPJGNGRVxJw75uKfWmEwA=;
 b=jhSKiQpUV2vapouLnECAQSiEZ4CB1aOQZmYNnA3ElaWqiumxmKSGrQ+tf7OjRo/4cz
 w1uu5mla1mQeOGikvr9GBWNBS5EnWKfPbeuZ4+0vRDQ5NbqU625yBmdI87uRNVwDJ7Kv
 KGKAi+TMhnIHTFtnXHJ5r1H3MCzFj2ZcqVn9I12nvHbTocSZzkTdC1lgxtHdEOoWUA8d
 JQ/whThdgXThOGcNCtirNcqwTiRE8f2Uj8Rx2tD6oqWxDtQLzQc9G9LCyQ6lRtI6EUbk
 iVpTK/ZZxlM5NGeQjL3Q8repr/Bxtlak+QWCLpg/pDajD3mS+kq3KoUv2C2TY9JAYTfg
 mIZw==
X-Gm-Message-State: AOAM531b2BGCclSco+uvMmeNImnfe5lutJu34rPFVoSm+gRI4Iz/ThS6
 Q6LjeE6F54L4CoJ1PnUl8219xg==
X-Google-Smtp-Source: ABdhPJwsc5Az7sOJMak21u0wWudgd3zMqq3R6tjzCCy3/rx4vVRXVpcqADFvySsof6blT7hoP19y/g==
X-Received: by 2002:a05:6a00:1742:b0:47c:28d:ee2c with SMTP id
 j2-20020a056a00174200b0047c028dee2cmr10986985pfc.55.1635281117899; 
 Tue, 26 Oct 2021 13:45:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p9sm22981060pfn.7.2021.10.26.13.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:45:17 -0700 (PDT)
Subject: Re: [PATCH] tests/tcg: remove debug polluting make output
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026173914.79377-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c643207a-4f84-5883-5439-2c127f04fc06@linaro.org>
Date: Tue, 26 Oct 2021 13:45:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026173914.79377-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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

On 10/26/21 10:39 AM, Alex Bennée wrote:
> Fixes: 5343a837cd ("tests/tcg: move some multiarch files and make conditional")
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/Makefile.target | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

