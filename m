Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E603AF518
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 20:29:47 +0200 (CEST)
Received: from localhost ([::1]:44382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvOg6-00072U-CP
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 14:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvOeL-0005IS-K2
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:27:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvOeJ-0006Lr-O4
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:27:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624300074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LY1H4R+7+Gi9VAD4poBR24axxaaMriq9n0b0jk2dROw=;
 b=d0u5FkRUy849gCzk0nuwHXVGsFzQX0UedCkG7fGXS43QlHpJcY+hbdhbVaRhmT4Cef7ImI
 28lYAj/++0ELUp6eJFYqLJJ3xm58ekp6Ai04Ge02Ldbh5MqALSwTlNnC+jQyLbYX+dJvZe
 N1axJ4Cz3Lf0VrkBxOBF9WtAcRi3g/0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-XWwqYBSSN9SBROAOpeVmqA-1; Mon, 21 Jun 2021 14:27:53 -0400
X-MC-Unique: XWwqYBSSN9SBROAOpeVmqA-1
Received: by mail-wm1-f72.google.com with SMTP id
 g14-20020a05600c4eceb02901b609849650so30346wmq.6
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 11:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LY1H4R+7+Gi9VAD4poBR24axxaaMriq9n0b0jk2dROw=;
 b=HFK97L7Axj7RmgUlLoRy96De8DZOqJeDu4UmDt3+e/tOrgbDtfMacHOtCLM5Wxa+9x
 RnV3TJBs4gLfxi5sh9lI8zal3m3fWJl9KyjrOzOCLuyXlTTda115Jj4/qOGmySTNBGwi
 MxMU/gyIbu3bWKECs7tPDclqAXnUtj0HxncCG/Vje+rdqB3s2xEDErehCfq3uhFfkE3g
 5+VHvDlFjFnX3dyPKb1H5WerOjdKwUs6cLT7CH5aGkZoO9bIUI6/v32GvmPN6KlbTM8O
 YeH0mus0V1S/PCSC4dEr4H00S4g9AcYHAtaCfkbQIQ89rNFJ4BzcH18lRaU9EmL7qPnZ
 nOQg==
X-Gm-Message-State: AOAM532Xt5yOiSMkBHkMjRst8TjbB9tvdzPX8kkpJ4BFfu9Sk8XV64pm
 qWD2ywLMEEl0zM25K5s1c+EavZ5TIDuPhfrXKOZyIcUuiXjMndC2z2rb7pCbd+NtiirkZLfXL++
 aLLMzedPwYGxpA2A=
X-Received: by 2002:a5d:410f:: with SMTP id l15mr30124835wrp.82.1624300072227; 
 Mon, 21 Jun 2021 11:27:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHmc/YIYjfOWtiAqoAKO7dm6IwMbA7vgEcoY2mu+l3thEh4+Nji3RhvnmKZChfYZXMgUZX+g==
X-Received: by 2002:a5d:410f:: with SMTP id l15mr30124819wrp.82.1624300072081; 
 Mon, 21 Jun 2021 11:27:52 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n10sm18997044wre.95.2021.06.21.11.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 11:27:51 -0700 (PDT)
Subject: Re: [PATCH 07/15] softmmu/memory: Simplify access_with_adjusted_size
 interface
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210619172626.875885-1-richard.henderson@linaro.org>
 <20210619172626.875885-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <618d5ef0-7f80-ca86-6a92-c2308344ba14@redhat.com>
Date: Mon, 21 Jun 2021 20:27:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210619172626.875885-8-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 7:26 PM, Richard Henderson wrote:
> Create a typedef for the access_fn callback.  Remove the
> access_size_{min,max} and access_fn arguments, and instead
> derive these from the MemoryRegion argument.  Add a write
> boolean argument.  Mark the function inline.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  softmmu/memory.c | 67 +++++++++++++++++++-----------------------------
>  1 file changed, 26 insertions(+), 41 deletions(-)

Nice simplification :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


