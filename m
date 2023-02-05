Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D7368AF5E
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:41:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOcQq-00024l-3t; Sun, 05 Feb 2023 05:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcQo-00024W-Ee
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:39:34 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcQm-00023u-Td
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:39:34 -0500
Received: by mail-ej1-x630.google.com with SMTP id k4so26754097eje.1
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 02:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S9qkOZINAfZJukqiZc9lKnBtejaQENUn62P/05phKmQ=;
 b=qIZOijs5+4uAx08FtN5FxnXZFFsync1+ccXrpwXiC8jyXdH7eoBrG8ocDVc9RRV2vR
 Jltbp+/l+96t477pVtEmtAiQmG3AAb18AHiyuaqPi19mOEnFh2+mWa1k9N/7AMC7/5lU
 GDYIEOp34JQLYSCpANKllsDNwN2dILt0Kz80imjvcS42Dxe/CjBJZk8TaEWOTxTFcqKX
 mNVtIU1xHjpG22f/auMLQvWi3x8sgsJCsR7YJ51yIR767vlIdfQIFcQ23Ct9EqitEHiM
 7Euvv6WXLW8tFBDIlfR0sb1xxI64graB1UDGlLrGC3BwFMJBqdFyQH1+xCY3B8qDX+52
 jRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S9qkOZINAfZJukqiZc9lKnBtejaQENUn62P/05phKmQ=;
 b=sM2DM65hk+4tsmFMhw6m5Ra9EkMziToflbFzGFcHpxhJ6/7J4Nvfn2SxDGMVuOpP9w
 hjgLnEbrqKVjnadiUgeBZIuWS41zXUTZd5+YQ0qClbYG2XIyrbtPVRD25aoqNnybJmR9
 vPojO1WdTgdyut27QfwmMOxF14F52TTWE3uPpUw27KQ20BPXCmYEjioDQl0qIi6l+0a3
 LIdI2OO7GRiLlBgkJK4UmZUjY/eJ/1eK/y4XxqkbK44EId2ReMWWUkbd9b7a4hgBpGPA
 2idABuUBlIlifX4MkDySReMkzyoN3K94TLiEGUE4qwgeC9XFMyDnA/D88oY0I8Fl6YCJ
 C+xA==
X-Gm-Message-State: AO0yUKUZbjSGC3Up1/TTSWXrVPVpD6H3BCPDouxiwqciyzXG5tbHnc7g
 TJmPekeb3CdHLjou4ZgQyIWV7g==
X-Google-Smtp-Source: AK7set8CZQ4xKP48128HzenZWpNU050z7qEtE5GOExje0SvpT51i8wMKc2jHFsS6bEm6i9NcUewX/g==
X-Received: by 2002:a17:906:cc99:b0:879:d438:4d1c with SMTP id
 oq25-20020a170906cc9900b00879d4384d1cmr16408848ejb.21.1675593571399; 
 Sun, 05 Feb 2023 02:39:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a1709064c9100b00878003adeeesm3914490eju.23.2023.02.05.02.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 02:39:30 -0800 (PST)
Message-ID: <1abcd582-877d-6f54-1075-48eaa5de8539@linaro.org>
Date: Sun, 5 Feb 2023 11:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/10] Retire Fork-Based Fuzzing
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230205042951.3570008-1-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230205042951.3570008-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/2/23 05:29, Alexander Bulekov wrote:

>   * Some device do not completely reset their state. This can lead to
>     non-reproducible crashes. However, in my local tests, most crashes
>     were reproducible. OSS-Fuzz shouldn't send us reports unless it can
>     consistently reproduce a crash.

These devices are buggy, hard/cold reset should be reproducible.

>   * In theory, the corpus-format should not change, so the existing
>     corpus-inputs on OSS-Fuzz will transfer to the new reset()-able
>     fuzzers.


