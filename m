Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A588E5627C0
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 02:32:25 +0200 (CEST)
Received: from localhost ([::1]:48916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o74a8-00009W-6u
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 20:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o74Uo-0006NT-T6
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 20:26:55 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:43857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o74Um-0006wO-D7
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 20:26:53 -0400
Received: by mail-oi1-x236.google.com with SMTP id q11so1468917oih.10
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 17:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=l7lMU3XG3WfGR1BHEIRQBYJMkODYuegC5f5jX5osH9Y=;
 b=xqKjjIWmH49kC0bg0ChysBc4e9amlViPOnQgGMbKf7tbn4JuvDGpDaiKsckD42yBf9
 nSHYAm8CFGicpa5HaobOA1KTo7gZuG+GFqsJZCrt29FrepeFXZMpl2Ufr7pFWxN51vjJ
 P01iYS9XjaLBKlyEDOz6m+LA4cVRdx/ULB1kBu3/O7YyUeh2qmerVDEouwFc5xpkGUN/
 pRAEHKdqnEDC+Vz1VK1QWkYsAqjaTypBWr0u2TaO4chm+ttcaoGVWVNs0cFeJM+Iiaih
 ffoHr6zJwHGevO2tC18S4k7Kqi4yrW0MzSLBYYKmBE5hxteK6bjHsp0x0sAcCDYKiHHW
 vqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l7lMU3XG3WfGR1BHEIRQBYJMkODYuegC5f5jX5osH9Y=;
 b=p74HcM5qGuF0W82gb5Dho8ZV56vj0a5MaJBKkxleWbADmUXfAVO1o/wjCe/zC6zHfw
 KlfnkjKnkzeeCO9354AZQgKCNwGhqlHHkVFW+am5BTs+DmZx6xpVhRIHuN4OQuOhonc2
 hpCu1NQCli22n1ajchkb72pf+1cLDpsxOx/oaJOM9Ikr01aBcRNTtXndFh46f0wdEgfM
 v4FGuD7B/p+AbNhBPOJamLnID/ckRCs8+g7yOeWZaXctwF8iJTGwx7We42N76HCRpA68
 j9l2i0y1LEf9vMv7NW0i3Gqa132yYykdGWtIIkfZ3AhCSE6wBD6DRseCF8TqSLNq8ORs
 n9ew==
X-Gm-Message-State: AJIora+IiJRZ7nw7+G6qb0lpk3QFAFfExLpy5iGJhlVGeCny98syRXPV
 VYts3oK8EY3aG6eTZpnF5MeZ5w==
X-Google-Smtp-Source: AGRyM1uzpBAOj5TcAzQb5LbHWCgcAR/IM9EK0hsavx+/e4zS6seu+1RTo/Urz7zh1l8j+guUB2JRJg==
X-Received: by 2002:a05:6808:f12:b0:335:bf75:409e with SMTP id
 m18-20020a0568080f1200b00335bf75409emr3944410oiw.105.1656635209513; 
 Thu, 30 Jun 2022 17:26:49 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80e8:1685:38ec:3484:7cff:725b?
 ([2605:ef80:80e8:1685:38ec:3484:7cff:725b])
 by smtp.gmail.com with ESMTPSA id
 o31-20020a056870911f00b000f5e33aaa66sm13771498oae.0.2022.06.30.17.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 17:26:48 -0700 (PDT)
Message-ID: <ddfe5685-83c3-a402-46c8-0c759cf008cf@linaro.org>
Date: Fri, 1 Jul 2022 05:56:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/14] (Mostly) build system changes for 2022-06-24
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <20220624082730.246924-1-pbonzini@redhat.com>
 <9d4d83cc-d4e5-6b8e-2ed9-00cefb534082@linaro.org>
 <CABgObfa+RqJigqdzq1CJjVyCOh2GUT9CH4YJfDxobXPDi87n5Q@mail.gmail.com>
 <CAFEAcA_g3shtZ-AzzYh=Cie4X-0p5=ngx=SMQ1JUHSXPZNs=WA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_g3shtZ-AzzYh=Cie4X-0p5=ngx=SMQ1JUHSXPZNs=WA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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

On 6/30/22 23:02, Peter Maydell wrote:
> On Thu, 30 Jun 2022 at 18:14, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>>
>>
>> Il ven 24 giu 2022, 17:57 Richard Henderson <richard.henderson@linaro.org> ha scritto:
>>>
>>> But then the i386 cross-compiler isn't used:
>>
>>
>> Yeah, that was intentional. In theory a softmmu target is freestanding and does not need anything beyond the compiler install, so configure defaults to the native compiler, which is biarch. That however assumes that the compiler install includes the libgcc for both architectures.
>>
>> Does that mean that Ubuntu installs GCC without a 32-bit libgcc.a?
> 
> I think they package it in a separate package, eg lib32gcc-9-dev
> (adjust package name to suit gcc version).

It's there, as Peter says, but it's not installed with the build-essential meta-package, 
and the crossbuild-essential-i386 package installs a different libgcc.


r~

