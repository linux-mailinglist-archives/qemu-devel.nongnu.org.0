Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E015446464
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 14:44:50 +0100 (CET)
Received: from localhost ([::1]:58304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mizWT-0004jB-BJ
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 09:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1mizNd-0001HR-1J
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:35:41 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:39566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1mizNZ-00041z-Hp
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:35:40 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 c26-20020a9d615a000000b0055bf6efab46so4831104otk.6
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 06:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2IwfNa/a6/UL5nRTIBeHB/zXygWLK0fdNTUwqG1u4sg=;
 b=JhJkMWU6FmPRqcl1E7KroiCE74D0tIy5jXsYS4AbEivb/7UGAhzbIoTkurjnlnllsG
 xIBut4h0ssM/RiB5vMQ0jY7BVAbVIZ3w4CiYHUPTm2MGuVcNx0Mvjp3uguoeEYXp1tS+
 cm8+WeTxZwLc98VjnqAgHrAliobTlkXQeTN5ufd4Fbiw2IbTVbbA9BKQxHaAeoL3kALx
 AUGNeKp6nYIj7NN8YyhmiWPGuAFbIngOp93JvYIVB+2Ko65OaZqPL5K9a1idCZQAhqTk
 //pwjrLSBnn5ejVV7hpJqeg7qtYe0ld8H3Cxc5xj7GhDn4q0bOaMbCd4OYDJz8fFuhUc
 sBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2IwfNa/a6/UL5nRTIBeHB/zXygWLK0fdNTUwqG1u4sg=;
 b=WbIg06R+rJjzc4ToHCR7JtxvNbcuUmtNZrQWucIh4LWaTFLLB8jAK9gOdImtXLXCF5
 NdWdayOjJZN2gvtJa5wChFHHJ7oA2+wVnhr78QPYpVU6Vebg0BmNbA2RKyMOdJkkScdh
 tVNb1bCrubuDBAjWwq2lKrEK23XyQObi16r+F+8pz6e+fx2TjbPaz3M7XYxc26bYtaOn
 PkXZpk3QHE+W9XyIgP8ZjCvEj5VRBQ+6eCS9aYqeOrl2qmkCBAnp2PeAXltk15UxxxSo
 iIoRgbmr0qBEdRNqB6LrPs2hyerJNfs+MNqGGWm7BckHoUouJnQLFrywCym0aslYn8KV
 618A==
X-Gm-Message-State: AOAM530fyq1zFhTiKWAR827kDai/ASi8iOB5UCqJRPtK1Etwj8E51WVS
 WhY/WOqjP1uZorw+wxB+8FlnsJ7YUMc04A==
X-Google-Smtp-Source: ABdhPJzQQsmgkAGmyAVEEKilRwYNEtmt3bzcLTEDzAiz93ylP0nHEnu/rlrHJqbkT+KweaxfPlbFXA==
X-Received: by 2002:a9d:3634:: with SMTP id w49mr37118160otb.84.1636119331203; 
 Fri, 05 Nov 2021 06:35:31 -0700 (PDT)
Received: from ?IPv6:2804:7f0:4841:487c:5509:2e45:5dfe:a087?
 ([2804:7f0:4841:487c:5509:2e45:5dfe:a087])
 by smtp.gmail.com with ESMTPSA id h3sm2425269oih.23.2021.11.05.06.35.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 06:35:30 -0700 (PDT)
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
From: Luis Machado <luis.machado@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de> <874kjdugip.fsf@linaro.org>
 <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de> <871regvs0w.fsf@linaro.org>
 <CAFEAcA9FKA9k3ePEVALXnRcfd4ygybMrmpD=ZjV1A==at+w9Uw@mail.gmail.com>
 <3c1521e5-5182-18f3-b5bf-9340745ec92f@linaro.org>
 <e7c11bc8-e7ba-8192-e4ba-887c38f27b15@linaro.org>
Message-ID: <1b2ee804-6360-c77f-45f2-8fe39e39f9d9@linaro.org>
Date: Fri, 5 Nov 2021 10:35:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e7c11bc8-e7ba-8192-e4ba-887c38f27b15@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=luis.machado@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 6:03 PM, Luis Machado wrote:
> On 10/4/21 3:44 PM, Luis Machado wrote:
>> Hi,
>>
>> On 9/21/21 10:55 AM, Peter Maydell wrote:
>>> On Tue, 19 Jan 2021 at 15:57, Alex Bennée <alex.bennee@linaro.org> 
>>> wrote:
>>>>
>>>>
>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>
>>>>> On 1/19/21 3:50 PM, Alex Bennée wrote:
>>>>>>
>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>> qemu-system-aarch64: -gdb 
>>>>>>> unix:path=/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server: 
>>>>>>> info: QEMU waiting for connection on: 
>>>>>>> disconnected:unix:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
>>>>>>> warning: while parsing target description (at line 47): Vector 
>>>>>>> "svevhf" references undefined type "ieee_half"
>>>>>>> warning: Could not load XML target description; ignoring
>>>>>>> qemu-system-aarch64: QEMU: Terminated via GDBstub
>>>>>>>
>>>>>>> Seems to indicate it is "ieee_half" -related?
>>>
>>>> So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1
>>>> and there is no probing possible during the gdbstub connection. I guess
>>>> I can either go back to stubbing it out (which would break gdb's SVE
>>>> understanding) or up our minimum GDB version check for running tests.
>>>> That would mean less people test GDB (or at least until the distros
>>>> catch up) but considering it was zero people not too long ago maybe
>>>> that's acceptable?
>>>
>>> I just ran into this trying to connect qemu-aarch64 to the
>>> Ubuntu gdb-multiarch. I don't care about SVE at all in this
>>> case, but the 'max' CPU includes SVE by default, so we report
>>> it to gdb even if the guest program being run doesn't use SVE at all.
>>> This effectively means that usecases that used to work no longer do :-(
>>>
>>> Luis: do we really have to report to gdb all the possible
>>> data types that might be in SVE vector registers? Won't
>>> gdb autogenerate pseudoregisters the way it does with
>>> Neon d0..d31 ?
>>>
>>> thanks
>>> -- PMM
>>>
>>
>> I'll check what can be done here.
> 
> Apologies. I got sidetracked with a few other things. I'm getting back 
> to this one.
> 
> I'm guessing the less painful solution would be for QEMU to report a 
> more compact XML description for SVE, supported by the oldest GDB we 
> would like to validate things on, and leave it to GDB (newer releases) 
> to add whatever pseudo-registers it deems appropriate.

Is it only the ieee_half type that is causing issues here? Or are there 
other types?

