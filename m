Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DC732310B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:53:04 +0100 (CET)
Received: from localhost ([::1]:38480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcnv-0003VK-BF
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEcmq-0002aG-H1
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:51:56 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEcmo-00022k-R2
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:51:56 -0500
Received: by mail-pg1-x52b.google.com with SMTP id o10so660731pgg.4
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HKpRgJD3+6xMy6XFIxS/hbHyzDdgg6kp9wo4k/kxP6k=;
 b=AwYNzZQgMTo7R0d4iiixd12eWz6vyMYYd1sngSCObdhqkhD1xs9iJHpldbLkEvLp8y
 cEDe9fcYTuS0IoZd+5jBKos4SQswUgS7JgcURRvv9j2JTfBwpxI3+toR+9WcssowHOJw
 tcTC9NDCyVekmc1WYufZEhUvgeKtjlAx9jQIq7EBjbK8HZ8l0NNHfxnDorHKAD4/4Fnh
 Vqfd0+RT8boTZScsDlI8Nam+dkzJbQ/Gc3iLKiD3JiONDcjouMkGZwNPmHU42x3nWYm6
 kuO4yd7xFrIvdrPaGzhSxodasvSU0T4hD3BHwH1IWxTn4HR1QGQkExaLE2NGMhfzt4Jx
 yXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HKpRgJD3+6xMy6XFIxS/hbHyzDdgg6kp9wo4k/kxP6k=;
 b=VjASaNxLnn84OFF6yxhh5FMhwhdT+rb+ueXFhmnOUIVQ4uLQ3YcvTC+R27gcFG01GJ
 TOxiPJvGECZCaj5m64Rgufu7vB8LLG5C+IqjUS4M28q+t7MXV4mNz9bCTGg+HesDfKWi
 b+Ww2t0hMJBoQepIHfawMcI0wbsvpZfsj2zw7EDcsu6dCbnhoopJpgyoOllKOzcpMfQ0
 we/BxV7sLiLkiB8rwOSCqeQy7aHR0fjVj2pZP3z5hFQobVCiM9/YA4K1SQfPyR5XU+8I
 REsSbUshX+T6x7W17JW9MVMB86VjnrQolrnSnp8Uy5/on2Og/pWpbZEmLfYBcsBkhzTW
 QcqQ==
X-Gm-Message-State: AOAM533uBfBjjB9cap/rTKurrFmvx2neH2tdvw9Ug+CJPrXRjn7nYpcS
 Zz5vYtlWZUBCJIA0dwJ/aqmW3g==
X-Google-Smtp-Source: ABdhPJzylGgwVCxnT8uqQ6W/WDDDIWND8ilXBn563O9wBSbQr3ttu8DoVZSoAQxlzpcpdO5FT0ab6g==
X-Received: by 2002:a62:6d45:0:b029:1ed:55f6:ff53 with SMTP id
 i66-20020a626d450000b02901ed55f6ff53mr19128780pfc.24.1614106313232; 
 Tue, 23 Feb 2021 10:51:53 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id u31sm22921569pgl.9.2021.02.23.10.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:51:52 -0800 (PST)
Subject: Re: softmmu vs sysemu [Was: Re: [RFC v1 06/38] target/arm: split off
 cpu-softmmu.c]
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-7-cfontana@suse.de> <87blcc57rj.fsf@linaro.org>
 <e7f21ff9-b2c6-668e-c973-d2949b81327e@suse.de>
 <2765ff1d-8b77-c2c8-c48a-dc2f582d80ff@redhat.com>
 <477a7799-cb25-afa7-c280-09d839a2b180@suse.de>
 <a6682a0f-5993-ed12-98d7-0c8f59385bbd@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a47d627-fda8-54c7-dbf8-2ebfc9000137@linaro.org>
Date: Tue, 23 Feb 2021 10:51:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a6682a0f-5993-ed12-98d7-0c8f59385bbd@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 10:18 AM, Claudio Fontana wrote:
> I am all for "just getting it done", but here the i386 and the arm series become a mixture of things that I am not comfortable with,
> I'd prefer a dedicated series..

You're thinking too deeply about the problem that I'm reporting to you about
this patch set.

I just want the file naming done correctly, while you're renaming.  That is
something you are actively changing in this patch set, so we should get it right.

You don't have to worry about ifdef CONFIG_SOFTMMU vs ifndef CONFIG_USER_ONLY
within the code itself.


r~

