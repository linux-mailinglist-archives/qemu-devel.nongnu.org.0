Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39065322EC8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:33:13 +0100 (CET)
Received: from localhost ([::1]:57828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaca-0006Gv-8h
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEaZs-0004mn-Le
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:30:25 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:45100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEaZp-0006ww-EM
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:30:24 -0500
Received: by mail-pf1-x42b.google.com with SMTP id j12so9089723pfj.12
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UdTRO6OBBERyLLYygQpp3UjR5pAJPNGPSoawy8meqIQ=;
 b=nlpNGnXgYbl6kxLlSn6598kG3xK53LHNtHJQ2RB1lkwHPFmU4pVxiD+xTopFZaABpg
 ZQ2qZS65VjUVwjsJ2HRHZBsBCEbBn0ge4iq4opYkOBvHPsJFk79R+9EIsqIFfy0h6Gc3
 xV0sj5j9CNKsajqjiXQau8FipeYE+7lEIYLRXqWRfcDsGO8JBUaGsYylZ7az/XzUzkxw
 q04oRl2mxY/6Tb2v2RY7iacCaGNesJP+DSNXGjifyZWdn9H71spAdb/2q0QJdcdYDBf5
 F9iXhepljklvpmVBXPF9DR1YDwQzUeRjiDWS1dxc16MB68cDEBoshR7yXy5p+MUy9FiF
 HP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UdTRO6OBBERyLLYygQpp3UjR5pAJPNGPSoawy8meqIQ=;
 b=WCjCwOx8YFkn8B2qTTX7oB38vXiprpHLpbh1U+uY0HdH13UOvk8U2m659j+b8hz8+p
 nSq1FhLFQr+7xzotHDU+EGx+Yrr4YJ8l89Wl3wEsZRrnmpLJZLsHdnA/nSIO6EB8od8P
 +QD6DiVMgZbPlfsX/laW7mhhcYqgZGE/LJ0enEt/kVB5fgVjlV8QmibB8m43xHrx+vmT
 nKYxaHZlq5JVmKQlMpcy3aNWLHQRjkUJpLre56479ik036hSJfcJ45q42z8r9JrR4A4r
 3DmhLnRq4NBOtp7V7hxtOma0aaI+Iw7A4+Z8AKDY8ukT2vOr8xIsSd1Hhw+MifdWLBjs
 LjFA==
X-Gm-Message-State: AOAM5309kgMtfAqQ77fgffA1xIm9mrZsqR90WOrtYixsgvQbFmDP+GOU
 Q6WtsP3s/9BlLxpOqeRZHNjXvQ==
X-Google-Smtp-Source: ABdhPJzgWDhP6tFEvjFkCN2oQSI02afkfiYgBigtIMQDf7D0wA0xxDQV4noJZtzWNBRbcaxQM7FhNg==
X-Received: by 2002:a05:6a00:1385:b029:1be:ac19:3a9d with SMTP id
 t5-20020a056a001385b02901beac193a9dmr2923883pfg.65.1614097817775; 
 Tue, 23 Feb 2021 08:30:17 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id y123sm16995379pfb.122.2021.02.23.08.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 08:30:17 -0800 (PST)
Subject: Re: [RFC v1 24/38] target/arm: move aa64_va_parameter_tbi,tbid,tcma
 and arm_rebuild_hflags
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-25-cfontana@suse.de>
 <d7bca535-d6eb-780b-7248-d6810652c76d@linaro.org>
 <cc67b97a-1456-c232-3bfd-91902973ce5e@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <47f7efff-a2c8-18a7-ab88-8a6b86ff7ef1@linaro.org>
Date: Tue, 23 Feb 2021 08:30:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cc67b97a-1456-c232-3bfd-91902973ce5e@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Alex Bennee <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 2:07 AM, Claudio Fontana wrote:
> is the code elimination for "if (0)" a guarantee, ie, we won't encounter
> compiler or compiler-options differences, for the compilers we support?
Yes, it's a guarantee.

> Is there some way to force the compilers to not even look at what is in the
> if (0) block?

No, it must be syntactically correct, and it must not reference variables that
have not been declared.  But that's a feature -- making sure that nothing has
syntax errors in is a major improvement over ifdefs.

> That should work also with --enable-debug?

Yes.

> This way we could avoid a lot of boilerplate/stubs...

Eh, maybe, maybe not.  Stubs may still be required, depending on how complex
the condition is -- more than if (0).


r~



