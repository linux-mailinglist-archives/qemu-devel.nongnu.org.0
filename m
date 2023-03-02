Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DCD6A8B84
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:09:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXr5r-0001Oq-Tq; Thu, 02 Mar 2023 17:08:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXr5n-0001Oe-7w
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:08:03 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXr5k-0002ax-Pm
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:08:02 -0500
Received: by mail-wr1-x432.google.com with SMTP id q16so556872wrw.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677794878;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZK+UEBQ2lF5D2tpIcjSM50wLk0IHyAejs4TzwnTVW5k=;
 b=U82HnNmnIlR8fsbUOzoyUOrcyk+UF0aCzllzpum/8sOkxYueGYisYF+f0M4+iCitPt
 lA8X8eIusLZIDxCoW2ITywyqVxF102PaWtOcX2ngEQtr3sbtWCAs/RK470AZYh4aObfW
 xTXSkcztl32ehSaQNeKck4QZslyEpWK/jOZXrrrb+S8Xs10olWuagHCYfiescykm5jIO
 /WGN2la8HKlJaJoSDvW+oIU8JDxhFsyJ+csnc2HLPgMUfUqrAqihbd1YnsYSyzLNPQlZ
 BG0M2UJM5hmPHw3pzydrf6s4Yo5XBR9Cq0TJauUFlBH79CJTfmytfyhWZXbHZ0hXHhdh
 gSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677794878;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZK+UEBQ2lF5D2tpIcjSM50wLk0IHyAejs4TzwnTVW5k=;
 b=bFnspZahzz5WRRJuJGnZBBqG0KsHg2QYB4Xbg2HKPkA2PHAPiR5Rnjo30z+9yM74mq
 rd6Bz9GDW/PKguNU692wTMKXKO7H/GgI0MezX4Goh7dr3Y3mT8YJO1iFS1iV2xoKMI+z
 9PHXbwXu0lirpG6u0NewdfRqcoYzRAOyCqdbDeTetzlkbaYfyGdFPZa3T+5RaqXEypzt
 kAJ4QS+lackNJ3p2LAw49wfBaCBuZpObUFzXLkLtBvAAU44xCaPK1B9/HRQsN7KBKD9O
 EC8SiAWhUjjGrp7hQbEgy3JkjXvfC5pBRkSLVOxMTpjLeiX22ORNQVwRiOqFHweO4kOI
 F73g==
X-Gm-Message-State: AO0yUKV5F0YJ75+AxQSyTwkSFnBDG+mRfRtWbbD5bKExlNrTMucn+7AS
 jNgYP2atqsjwaCHQMCFQFHRwfg==
X-Google-Smtp-Source: AK7set/zRREzUl4g52CStSVhdiUVcMgbt0PP1P8PqAH2s47EeF75hS+bGX8bzaTEyaGL4tkTSSuiOQ==
X-Received: by 2002:a5d:468e:0:b0:2c7:1b42:1cec with SMTP id
 u14-20020a5d468e000000b002c71b421cecmr8344921wrq.23.1677794878584; 
 Thu, 02 Mar 2023 14:07:58 -0800 (PST)
Received: from [192.168.27.175] (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 k8-20020a5d66c8000000b002c573a6216fsm448290wrw.37.2023.03.02.14.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 14:07:57 -0800 (PST)
Message-ID: <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
Date: Thu, 2 Mar 2023 23:07:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Helge Deller <deller@gmx.de>
References: <20230302163106.465559-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 2/3/23 17:31, Thomas Huth wrote:
> We're struggling quite badly with our CI minutes on the shared
> gitlab runners, so we urgently need to think of ways to cut down
> our supported build and target environments. qemu-system-i386 and
> qemu-system-arm are not really required anymore, since nobody uses
> KVM on the corresponding systems for production anymore, and the
> -x86_64 and -arch64 variants are a proper superset of those binaries.
> So it's time to deprecate them and the corresponding 32-bit host
> environments now.
> 
> This is a follow-up patch series from the previous discussion here:
> 
>   https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
> 
> where people still mentioned that there is still interest in certain
> support for 32-bit host hardware. But as far as I could see, there is
> no real need for 32-bit x86 host support and for system emulation on
> 32-bit arm hosts anymore, so it should be fine if we drop these host
> environments soon (these are also the two architectures that contribute
> the most to the long test times in our CI, so we would benefit a lot by
> dropping those).

It is not clear from your cover that the deprecation only concern system
emulation on these hosts, not user emulation.

I wonder about tools. Apparently they depend on sysemu now. I was
building a 'configure --enable-tools --disable-system' but now it
is empty.

