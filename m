Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A066BC6A0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:12:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pchkw-00028y-Gj; Thu, 16 Mar 2023 03:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pchfq-0003qV-VV
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:05:28 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pchfo-000675-Ka
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:05:18 -0400
Received: by mail-wm1-x32f.google.com with SMTP id m35so492703wms.4
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 00:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678950311;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DJr0AKZfo6D8KKt5N56cKtNSh8oDsqkHRdpz55dfKMg=;
 b=ttzsdJTVO0UsMWcnUrs1E0jL/kvJWNMAQA56eZG3KtUSAgBlpdHbeWPNJfHIpSjbSG
 PmNFHH+HZkP8MGXFi0Vks6kj7XEAf0QJrElrgHL1YHucEZKUyEgq0F8IYBfcAHnxOI7B
 J/vSxNht2nVZ9i2lQxq7lamKUagwuF8k0DwmHMyHlSIDscjbcYujCE6Afa0c53GbeaM/
 dRJ9Rh4rcwgzHfH1QgMJT++a0Lgi4p/rqzq6s4wJtPBNn32NZYWaeJuY/vCfixNQ+gVp
 lkIepUBCM5b6Ef1n7LCniiTFLxI0j1VaJwayLHFdqLFwCdD//ol9DgLLjR6PeZor7EUp
 v/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678950311;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DJr0AKZfo6D8KKt5N56cKtNSh8oDsqkHRdpz55dfKMg=;
 b=Bm91eR7qYgEcm/g9fwgPgMPGXriT7RzW0nyUkmeuTYOl+gDTkyGqQklchXtOEfsD8X
 VXZ3ZddHpeo+cPGuL4lbFLuDYalj9DiGrPuTXeEKGzQdNQBJMyrXYlXmLEY9JlYpGWPx
 Pe2jQ92mjdHMGOEN3XbFggXqm/SDVmfmzTzQez6SWNL2N3nXKyJuumUJCdAhYNBjA3sb
 ldY9/P8+Lb/Xg/N1+QD6IB0EJeqljb5DrK2KGNBagybJV6EXdJtEtbjnXOQPXG6Je40+
 zRCXbr+rqNnrjYdjWKgld9dRt99A719LL7Q7OrXxsmpAuaOBrOcED1kqxgZv95do7oKT
 LguA==
X-Gm-Message-State: AO0yUKUUklEq6PgFAn/CgJTEkCD4CyxlsK0FkcXUl0LLKomdcHPLLC1V
 hLd2OhTxokF8K2bdoTqTmVFotw==
X-Google-Smtp-Source: AK7set+tGKbnI0jAt7tIpySqV6YCuOq4n+1TssQBy9ea2TV+m5YV8d+is7jbTK43CPH6cXg08J+Mew==
X-Received: by 2002:a05:600c:1912:b0:3ed:2217:4636 with SMTP id
 j18-20020a05600c191200b003ed22174636mr12993016wmq.19.1678950311613; 
 Thu, 16 Mar 2023 00:05:11 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c4fc900b003ea57808179sm4453414wmq.38.2023.03.16.00.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 00:05:10 -0700 (PDT)
Message-ID: <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
Date: Thu, 16 Mar 2023 08:05:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: dropping 32-bit host support
Content-Language: en-US
To: Andrew Randrianasulu <randrianasulu@gmail.com>, qemu-discuss@nongnu.org
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>
In-Reply-To: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Andrew,

On 16/3/23 01:57, Andrew Randrianasulu wrote:
> Looking at https://wiki.qemu.org/ChangeLog/8.0 
> <https://wiki.qemu.org/ChangeLog/8.0>
> 
> ===
> System emulation on 32-bit x86 and ARM hosts has been deprecated. The 
> QEMU project no longer considers 32-bit x86 and ARM support for system 
> emulation to be an effective use of its limited resources, and thus 
> intends to discontinue.
> 
>   ==
> 
> well, I guess arguing from memory-consuption point on 32 bit x86 hosts 
> (like my machine where I run 32 bit userspace on 64 bit kernel) is not 

If you use a 64-bit kernel, then your host is 64-bit :)

host: hardware where you run QEMU
guest: what is run within QEMU

Running 32-bit *guest* on your 64-bit *host* is still supported.

We don't plan to support running 32-bit WinXP x86 (guest) on 32-bit
Raspberry Pi 2 (host) for example.

> going anywhere, but what about 32bit userspace on Android tablets, 
> either via Limbo emulator or qemu itself in Termux?

*System* emulation [on 32-bit hosts] is deprecated. User emulation
(such linux-user) is not. For example, you can still run 64-bit x86_64
Linux binaries on a 32-bit ARM Raspberry Pi.

> At least I hope it will be not *actively* (intentionally) broken, just 
> ...unsupported (so users who know how to run git revert still will get 
> their build for some more time).

Unsupported code almost always unintentionally end bit-rotting...

I hope this is clearer.

Regards,

Phil.

