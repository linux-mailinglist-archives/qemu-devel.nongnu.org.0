Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D58A477601
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 16:32:47 +0100 (CET)
Received: from localhost ([::1]:51096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxskQ-0003Zz-6V
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 10:32:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxsiW-0002IP-13
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 10:30:48 -0500
Received: from [2a00:1450:4864:20::42f] (port=42503
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxsiU-0008PU-JD
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 10:30:47 -0500
Received: by mail-wr1-x42f.google.com with SMTP id c4so44871954wrd.9
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 07:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G8lWIIbNGhdwqME30vcuVKDH9w/KQSdcSwU1rsVdvMY=;
 b=cxT2z+LgA8edwJR+8Zbrhx1MkDRmo5Pnn2lCsOKAqvyM5mdzDa8XYHhAQeBt+sEpco
 M5wb68RSA9mDnXB7K4TtE8cxD37yudLhdCI9ggOH1fcdmZ3FnrxD67NIluPrItTS2vU+
 vdtoJAGNjmCAsC2QtOJC9fwGj4unW05EMpqSXMKl2S1RPleaDXZy7kmpl1K21sam517Z
 oJ7V9iDQDGo/SBvP49TiOoK0WXsRJHYby3IMfTzWWX3YXCcUyFStcXAGwZV0bT51RIhd
 9FpGAbkBhH8Pqwj14uauUcF53EGeSdpHbZ4zQcb3R9jSPszfOdUHxWT342ntVyqr+0xK
 jLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G8lWIIbNGhdwqME30vcuVKDH9w/KQSdcSwU1rsVdvMY=;
 b=OHoR4L23904v9YHEM1J3LQk+I1w8WYg9ZmIk+ittc+xNYZ31htLChiz5v3WAL/Uv4+
 jtAShvkyBRFyJNFvWDv+IV5WLHyud20xiGM7KJxoFv79FLOzYcz6PurLnRSgVHgXvtGX
 hTIs8FkXOW1jVlyCgbQVjhTmq5Yl07Ljno6FI4BWhMc3mPr701Nne1PwAu1Ufp0UW6Jk
 QQA/EvAuqwB4TQb85Ro8mtjDBUlXUhCIRe7jEOQF3bEbuz1lpTd+jNgwHAhyT4FBn//n
 WLObhiANd3aaq4D3dbZ70S1kohBnNW7M8JI1R+m7r1qu2VW1djfEXHXOtiLKw7XBiDjz
 6oMg==
X-Gm-Message-State: AOAM532fXcHLX3GGM/r3Shfu1XKRL4s7v+yBQPYVnu5tTWmitZTHD5i9
 Y/favwbRHl3ecntGBFbe4T4=
X-Google-Smtp-Source: ABdhPJw8CYhYX7r4t+F2PAvKjLQR0X39FkAtZS8nd47z00ayhJlPVvdf3bnUDMkBFMFccmmPD1MeOg==
X-Received: by 2002:a5d:6146:: with SMTP id y6mr9335350wrt.693.1639668645004; 
 Thu, 16 Dec 2021 07:30:45 -0800 (PST)
Received: from [10.32.176.104] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
 by smtp.googlemail.com with ESMTPSA id j13sm2471741wms.13.2021.12.16.07.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 07:30:44 -0800 (PST)
Message-ID: <7711e8ef-a890-3732-9a7c-cb9326325319@redhat.com>
Date: Thu, 16 Dec 2021 16:30:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 07/10] configure: unify x86_64 and x32
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-8-pbonzini@redhat.com>
 <92c807dc-8608-5afe-d4c4-04876beea4d7@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <92c807dc-8608-5afe-d4c4-04876beea4d7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 12/16/21 10:10, Philippe Mathieu-Daudé wrote:
> On 12/16/21 09:51, Paolo Bonzini wrote:
>> The only difference between the two, as far as either configure or
>> Meson are concerned, is in the multilib flags passed to the compiler.
>>
>> For QEMU, this fixes the handling of TYPE_OLDDEVT in
>> include/exec/user/thunk.h and enables testing of dirty ring buffer,
>> because both are using HOST_X86_64.
>>
>> For tests/tcg, this means that on a hypothetical x32 host the
>> cross compiler will not be used to build the tests.
> 
> Why not add the cross compiler definitions to tests/tcg?
> 
> +: ${cross_cc_x32="$cross_cc_x86_64"}
> +: ${cross_cc_cflags_x32="-mx32"}

tests/tcg does not support building x32 tests right now, does it?  What 
I meant is that, if you're on an x32 host, tests/tcg will now build i386 
and x86-64 tests with the native compiler.

Paolo

