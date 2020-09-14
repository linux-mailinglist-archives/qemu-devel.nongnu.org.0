Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B87268222
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 02:27:51 +0200 (CEST)
Received: from localhost ([::1]:39034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHcLV-0002yN-L8
	for lists+qemu-devel@lfdr.de; Sun, 13 Sep 2020 20:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kHcKo-0002YD-2o
 for qemu-devel@nongnu.org; Sun, 13 Sep 2020 20:27:06 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kHcKm-0006ie-FS
 for qemu-devel@nongnu.org; Sun, 13 Sep 2020 20:27:05 -0400
Received: by mail-pg1-x534.google.com with SMTP id f2so8094773pgd.3
 for <qemu-devel@nongnu.org>; Sun, 13 Sep 2020 17:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=CxeB6HvEjy0w4/icU1FUAi5mSedjADaiRIb3xQpqcGc=;
 b=mCf/n6Z1RoRkUh6BNLIqbde2U4oQI9a/vW2YXpHpexbfk9cttPc6WNVFSCzMUxVZB/
 nFELVJ7Y00vmwP3eVyH/+SyAQT9mhOpqXpppvsNfTOcXX3GEogF/QRaTB6ZxrQhaTgH0
 HVpo4mpgHJxFVtVqEmi8eG9rpONalZOwIPygBsXNp4lwawWPISnowW07XwTA8bf1Ix1U
 ZC2P0R9wWtsI9wV12omMRp8N9VINx76b/q+4MGNB8RYfIhgmaI+EspriHPQN0JQhyN0K
 ptsYEYOjQ+yYtbZ2bWCD/QABYiIXGy+1YxYYfb8UNYqHryyV/2GTr8IEeVi+2mlfgtqZ
 FS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CxeB6HvEjy0w4/icU1FUAi5mSedjADaiRIb3xQpqcGc=;
 b=YMf5EgO274HmnlywcSs4DPmlY5agtLQUzbhRbVA0tn7FZeisXUN9mBwY4EJiRTCZVz
 FqoNmUJZpjJlJfBoboWvJysZTBTCq/iNLdCmVWz4GqFN1pQvqEzT43UAOV9ycdJMxaZb
 JrATkFHG6zJgvK3BNx5ByTSFTPcEp6R6A3Gvg3iUMgNClEBGKpd3ExvbSwONDdUKgk/v
 K3nG7yGNEF04JHi9I05oP8/1i7qGxENG/8ia233MqcTzRYe3EVCE9kpjexB/O2U3uEwy
 l8+A+hDa0hcumdRnumfzJGA9QhDIRXHz4nr3M0fAhvxj4m6+fN0RJo25cqRxNv8n+vRa
 auEA==
X-Gm-Message-State: AOAM533c0OFg/ufF+gwq0jvxmMWEOlvgyGB58blH93WWDW0Tbpdwv6n4
 rfF9EsOvCg2zc3MoRe3mJ+VMVVWAVfSEHg==
X-Google-Smtp-Source: ABdhPJzX+pKBBK+2XMmfU7fJztA9eSn9OH9vtOkzKUtnCsUd2YYpWGJljXMCTNWl7FvOqM0Vo7qXPg==
X-Received: by 2002:aa7:870f:: with SMTP id b15mr11209745pfo.113.1600043222369; 
 Sun, 13 Sep 2020 17:27:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id l13sm7126875pgq.33.2020.09.13.17.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2020 17:27:01 -0700 (PDT)
Subject: Re: qemu disassembler status
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>
References: <CAFEAcA8yfPdJLmek=+1VOWY4DQGP0yhmbtTiARw+qMuENKet+w@mail.gmail.com>
 <bb48e978-71e3-8ea8-44da-36c7d540ec1b@linaro.org>
 <952fa7ef-a4b8-3945-dfe7-803cbdc35834@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6abfac94-c1d4-62a3-b420-057362d6ab07@linaro.org>
Date: Sun, 13 Sep 2020 17:26:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <952fa7ef-a4b8-3945-dfe7-803cbdc35834@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/20 12:03 AM, Thomas Huth wrote:
> Is capstone good enough already to replace libvixl?

Yes as far as the version that we currently have imported, but no if we were to
update vixl.  In particular, capstone has no support for SVE or other v8.2+
additions.

> And what about the other old disassemblers that we have in disasm/ ?
> Could some of them be replaced by capstone, too?

We could definitely lose the old x86 disassembler.  Which has no support for
AVX, which we use in TCG.  Possibly some of the others too, but not many.

> Or shall we try to pursue the idea of adding a GPLv3 helper program that
> could link against recent versions of libopcode?

It might be worthwhile, yes.

> And what about new disassembler files like the Loongson 2F disassembler
> that has been proposed two months ago? Shall we enforce that people try
> to add such stuff to capstone first?

I don't know what the level of difficulty is there.

I certainly do not thing a complete new standalone disassembler is worthwhile.
 Exactly what to suggest instead is a problem though.


r~


