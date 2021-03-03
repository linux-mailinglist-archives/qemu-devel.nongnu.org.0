Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B60A32BF32
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 00:29:08 +0100 (CET)
Received: from localhost ([::1]:57118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHavS-0003z6-Jl
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 18:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHauX-0003Mx-IP
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 18:28:09 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:50280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHauU-0006tq-V7
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 18:28:09 -0500
Received: by mail-pj1-x1030.google.com with SMTP id b15so5204976pjb.0
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 15:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uVQsEAmObcnjtmp/elOxHKbY995sbL0GGGA19ieph48=;
 b=OQO2zApKrUXufENG9E9GIgMy+3LbsE8QcZ007TPRH0ksvCRdrO3uxi4G9OITbeC4v+
 eDOte9XoBkvdvvpYJ8B86nW2cSL9JiBNQBMpCa2Wb6QP6B2ZvJSIh6JAfOapN9lIgfkm
 eFBqs/thWQcUg2943eN+OgfWYwdqfJy0moPHWTkQUCCKvsskWzlguOLSdziBuHpp7Mo4
 LmQ4ys1/lc+8NjaslkWame9maxqJKYwPLeoBNao3AIg4QuQbVe5Dj97HVGcslQNQ0Vi9
 hDD55UMfC4Xy2vxoPJ0jblXnPMAg5uuyLYITLpDHpiVrjXRzf9OssewSx1qJUpyFco9l
 bL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uVQsEAmObcnjtmp/elOxHKbY995sbL0GGGA19ieph48=;
 b=XuoZ8MDEuf8hpAK/VkMXdRfY6YJ8bbgoey01M08yRP9SHtBA5DwzTsEM3efG5o2FwX
 qVmlL/Nc2U+v/kj8fFLF/MK/tqLWmBr1sZ1uv2aNkMa/yDwBtUKvScDIyZE8roZmawFj
 xHMunxRqkHAq3FwdI6R1CFZVUAdWzm9pIAOFfm7WUD1YVeVwGwfwAbdKcsL+ypNzyMcx
 SYJxXz2dSO+Oe1z5MQ570Xt/i6Djb/coQ7wtdJc0635X/gBaYXSfAIhhexSJAJr8c8H0
 iGyUSUNcfUje4YKie6oLzXQ3DDe/caA47EY0chDocXysm2GXjfqCE0BtyGQG5R7AsxZ4
 N/7Q==
X-Gm-Message-State: AOAM532bQ2QXa5liaUmVUssMdJZrhQgSyWcpEVAL6j1gW4R8OPPQdcCG
 /dMtIe2z4nRwlSe2qzjEz3YMvA==
X-Google-Smtp-Source: ABdhPJwoHJpUHm5Ov8uJbtv5BtY/rg8FhpNgAdAMkdlhPB2UDD1e8Ot9kBejxkh3lm9kFXK4Ma2aCw==
X-Received: by 2002:a17:90a:df8a:: with SMTP id
 p10mr1532223pjv.4.1614814085328; 
 Wed, 03 Mar 2021 15:28:05 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id t4sm7514039pjs.12.2021.03.03.15.28.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 15:28:04 -0800 (PST)
Subject: Re: [PATCH v4 26/28] cpu: Remove watchpoint stubs for user emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-27-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6add5036-318c-e97f-6e7a-90da64a4996a@linaro.org>
Date: Wed, 3 Mar 2021 15:28:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303214708.1727801-27-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 1:47 PM, Philippe Mathieu-Daudé wrote:
> Since we remove all access to the watchpoint methods from user-mode
> code, we can now remove them, as they are not used anymore.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/cpu.h | 34 +---------------------------------
>   1 file changed, 1 insertion(+), 33 deletions(-)

I do not think this is a good tradeoff, removing one central ifdef and 
substituting lots of others, scattered throughout target/.


r~

