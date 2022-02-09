Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177B34AFF7D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 22:53:01 +0100 (CET)
Received: from localhost ([::1]:40114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHutX-0003A6-Po
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 16:52:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHurt-0001kq-07
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:51:18 -0500
Received: from [2607:f8b0:4864:20::102e] (port=33963
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHurq-0007Ra-TA
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:51:16 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 ki18-20020a17090ae91200b001b8be87e9abso383383pjb.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8LrQgZaSU0PQJWAz4QLNFLpgibn0MavP/0Vbg0GqZ80=;
 b=RJDwDKQjyAA6F8Mb0esDYdUUmFqTpimV9iINvJKgCycf5kmzQpMGX0H87gS9Uqa1NL
 bvbPtqD0n1FkVoPqVPmkZ1z7JdV7jA+ZOiCoRmVYip69RtzUcBB8jM3H9fOl6lUtrUev
 gTeYsVv0BUrWnwc2UYjOXgvuyRNf21xxkQFsXhC8wHHr8PVQolsfyG9xnVnOhj5PT0s0
 2C5S/VgGoUYBq8Gdjg9M0GZJTtvsh19XeYky50N64s3chE+3IPUjbijrGJ32c0SOYbZB
 mIOwwR4mLZVWq6jRH9XTi02ov8xaXnV8EbzKWjnU16EtFEYnJzM3fdtWWwgEr6w9eHHy
 4pTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8LrQgZaSU0PQJWAz4QLNFLpgibn0MavP/0Vbg0GqZ80=;
 b=cZx6yJt96ubZji6CcmQnPHl4DBtB/wSPgA7EasjtsbNyN2sWJX03pUCwRLCGovy8zD
 ray2YVrrUDuJOimQEwl61oTkVE6MwsJL17679b3ZSl+b5Jq0lWJHcTmUlhNRlSYJfAtE
 LDcstoeSVKZLI+mdlM5pucao0wWEZoGDW/ahI0mrSUvVTmZHN+5+9iYqlwda6fl5shSG
 4FwFm7esCXPOsHwwGA8pauyNp49awOfdaaXPcQ7VF0mKiFj4X6S8KygUAkkjDeSg1Hux
 D2wFYnUNmgxmJYe5244xbxnfQJyPdL1hWEbtdr2yCTAt8x4NdkKY9zxMkuLmJLkjHHuK
 lSQQ==
X-Gm-Message-State: AOAM530ZYcmycuXm4GT/n+NgWi5TYW6RwLLnbheNeSTBW7gYW1V3fCG3
 VSF5gfoVSoVwcSL18U+eENo=
X-Google-Smtp-Source: ABdhPJyAIbhELnX627iR5d16OY9Iq4r5JJoSzzKd7fqlzsSFwojEQCTQD8bnFfxi4ubEZwGsNOC/Gg==
X-Received: by 2002:a17:90b:2281:: with SMTP id
 kx1mr5733217pjb.37.1644443464096; 
 Wed, 09 Feb 2022 13:51:04 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id g22sm4401407pfk.219.2022.02.09.13.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 13:51:03 -0800 (PST)
Message-ID: <a02b92b3-1714-147e-d5a4-a2ab41e6fffc@amsat.org>
Date: Wed, 9 Feb 2022 22:50:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 13/13] exec: Move translation declarations to
 'translate-all.h'
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-14-f4bug@amsat.org>
 <fb446c38-a992-0c4a-dd26-10aa8140833f@linaro.org>
In-Reply-To: <fb446c38-a992-0c4a-dd26-10aa8140833f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 9/2/22 00:00, Richard Henderson wrote:
> On 2/9/22 02:22, Philippe Mathieu-Daudé wrote:
>> Translation declarations are only useful to TCG accelerator.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Ug.
> 
> So, like, what's you vision of exec-all.h vs translate-all.h? Certainly 
> there's not much in translate-all.h at the moment. Taking a case at 
> random, what has gdbstub.c got to do with "translation" as opposed to 
> "execution"?
> 
> I would expect some documetation updates to the top of these headers.  I 
> don't see why everything has to move all at once, especially since 
> translate-all.h already includes exec-all.h.
> 
> I can see that exec-all.h is currently a garbage bag, but I strongly 
> suspect that you're moving too much here.

I ended with an almost empty exec-all.h; IOW indeed translate-all.h and
exec-all.h are the same mixed bag. What I'm pursuing is extract APIs
such migration and ramblock stuff, but there are so many inter
dependencies that it is hard to sort the patchset (or split it in
series on the same topic but no more than 20 patches).

