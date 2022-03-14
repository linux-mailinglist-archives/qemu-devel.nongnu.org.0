Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904424D79EF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 05:38:39 +0100 (CET)
Received: from localhost ([::1]:39552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTcTe-00028v-5v
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 00:38:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcS8-0001P3-Da
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 00:37:04 -0400
Received: from [2607:f8b0:4864:20::1029] (port=39875
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcS6-0003Ys-SB
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 00:37:04 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so16243099pjb.4
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 21:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=akdfvc3k5kiiqxmM/pipkzCqgMuzCHkYe9OTBw1H5cI=;
 b=xobqw2rN54/mUrJfTgcsAkOalDNIwPK5ksUqzhLXZgqm2becnOJB/tFS9Z37YU7S4Z
 28uWdyA7a1gWalA+fxvZxqe3LY2WFoBL2VrP5podBoCTCISyktRJKcJlcPbl2WqQhf6B
 LxV5Gvp0URgzUxsh8StgIgSeGwJA9c7LzOTxg5+ZC74tqvucd0A679SlUCEFjnb3gwPw
 OmGjH3hI7BB93r6csqcDON+QRoOpVPj86H4PrJAAHDkPOamEp0seW+LL1sqHkk0A9K2U
 XdOHuju2GN/lKt/hIhhKkpinxoCD9kDBOVOL7IQLuk+CWtTZ04lAqmog3STrdRslidyi
 hfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=akdfvc3k5kiiqxmM/pipkzCqgMuzCHkYe9OTBw1H5cI=;
 b=Lh0td45ZUrEtBNdaugiSJn8duI4w/jHUJ+j8mheldC68g63ucjxTaYDrl6uUtYqItf
 umQd9Ak2QlJRK59Xb05HGWXuiDKL5IG5mOzY8w/WB1MChblHAraQ2K5xxCJKmvGhSdF7
 gza8zeRUSXDDA6xSmRxgbyimbeSQZwHM+a3fNM1JxgpRT/i52gji0aN69LpHsHUwCK37
 TiHHMUNicWQuiSHI9lhItIYHRrbPkYELBLDLRUpTZhIh2VWM7t4t5otAi3VtUveLukIB
 oOO95GBcP0D/RPISHbijGpInBmocUodJ6z37TnplxldV+OM6tDyJSFq8ljZuOx28gDfw
 4wXQ==
X-Gm-Message-State: AOAM530iAjrIqGcSzFWBwp33CtGpGsjNwdAkf2cGa9vd1uVJ74Rw8X7a
 Ck7eES0bJLBXpTRO9iK8yHDJzw==
X-Google-Smtp-Source: ABdhPJxvC9r0H56WAbK+rSRkOw8jBIIE0bQVmVUUly+Yr8ZvnTG9V5bbL26KhleinGAekDwEN7BDnw==
X-Received: by 2002:a17:903:2442:b0:151:e3e2:cbf9 with SMTP id
 l2-20020a170903244200b00151e3e2cbf9mr22407473pls.115.1647232618292; 
 Sun, 13 Mar 2022 21:36:58 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a63fe57000000b0036490068f12sm14544413pgj.90.2022.03.13.21.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 21:36:57 -0700 (PDT)
Message-ID: <e873b940-7af8-037a-ff30-1768626b8ec4@linaro.org>
Date: Sun, 13 Mar 2022 21:36:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Question about atomics
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
 <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
 <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
 <e60a4298-17f3-d3e7-bf94-bf2dbbe83141@redhat.com>
 <CANCZdfqDSNhQYnb1PWi-753cJ4FvO-JBFmTW_mAAdezOQSDF1g@mail.gmail.com>
 <CANCZdfp61n8M8Qc9szvfqYcHnqnUADpkPmL9QHW0uDKDffJ2NA@mail.gmail.com>
 <da134ea5-ffe9-d544-62b4-1914aad15ab5@linaro.org>
 <CANCZdfoC8ArxyvD3PpBWiYdqONR32oeqioqk42CeoMeKRgecZQ@mail.gmail.com>
 <45371f77-cae6-bf96-802d-6a3e70d5e334@linaro.org>
 <CANCZdfrMaDY=0u-HAB9GY69NUTHES30V_agvZhCw3Gnr6aOomw@mail.gmail.com>
 <d8e85004-de8d-fe7f-6bd3-a86ea5bb8e6a@linaro.org>
 <CANCZdfrTNdXx7xz9mcw5rXK0bbwh0mF2iLX1JGeAXWHv8zn4+Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfrTNdXx7xz9mcw5rXK0bbwh0mF2iLX1JGeAXWHv8zn4+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/22 21:09, Warner Losh wrote:
> Oh? Out of paranoia, how can I verify that this is the case when compiled on FreeBSD?
> Perhaps the atomic sequence FreeBSD uses differs a little from Linux and we don't trigger
> that code?

$ objdump -dr libqemu-arm-*-user.fa.p/accel_tcg_user-exec.c.o

0000000000001490 <helper_atomic_cmpxchgl_le>:
...
     14b7:       e8 04 ec ff ff          callq  c0 <atomic_mmu_lookup.constprop.0>
     14bc:       48 89 c2                mov    %rax,%rdx
     14bf:       44 89 e0                mov    %r12d,%eax
     14c2:       f0 44 0f b1 32          lock cmpxchg %r14d,(%rdx)


r~

