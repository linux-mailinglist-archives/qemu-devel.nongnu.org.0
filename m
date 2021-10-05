Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21CE4230C8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 21:29:26 +0200 (CEST)
Received: from localhost ([::1]:36344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXq7x-0001Yz-MP
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 15:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXq60-000088-Mq; Tue, 05 Oct 2021 15:27:24 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXq5z-0003bM-69; Tue, 05 Oct 2021 15:27:24 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u18so939297wrg.5;
 Tue, 05 Oct 2021 12:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gjGbZQFATwhF+BES3nhgMC8T008nZ3OInRqvg+24qlo=;
 b=UrohL+upv4vlrkwkvaFauYBW9yeI+t5LBdA74nxK6EUFBjQFfxSjZESHmsOL9VLdQQ
 m9syZF7vkkjdVm/nDeF/BYFoXmCpb1sMrewykOtb/hEFj29x4/Kg2VMLREKcpAHYTn1C
 74avyLnpMeYxn0pNnZD6ffe71lVglJSgko83XgSyKjJAD4Ycl3ysLSiNEOvqh6JIMZh/
 FZhEHGg+lieSd4QLk3BGoHv3u/H2U2F2NQXLaiaqdIf+Bk4iYz0di7QqP8GemttuUgi5
 KcMMNOVowG5GuyXgbmmPs6JVTYqcPZg8JClLX58HPyuXDSYm2+v1nlMlrscpSL7VcPMP
 9ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gjGbZQFATwhF+BES3nhgMC8T008nZ3OInRqvg+24qlo=;
 b=dLtERjkAPOiJ4NiCKSUMIQk/ZAZ2Zgh4Mx50HhwRqwe1HFxxcKX2vU59EcRDc+l0WZ
 E71uUyRkSNHwRpCaiDaleIrZR6cTYPVENVyIJVJQ1g0qA/UOYAaro5stdJGiBku/tDNw
 R6QOVAbEUu98Mj9afb6m425N6jB2JLQ1iidtguTIxC22ci3JgGijM62isLFLA7kGxFkb
 jAnYLHmO9pEkMsXQ8Gcy1CTlDsqH1q2EO29L0hYhfG8vcKXilZHLkxLCt7ofAIxAA2by
 LDfX6nnVwVUCtfUjJPaW0sfVOfeJcxodL4oZeJYDc0o9UMdn2B3BXKo99iJehmuvyBlZ
 nqBw==
X-Gm-Message-State: AOAM531QwisSDShiMib8RGedWLuyH9+c9R73MixVZuwDqETGpYvFYhwv
 aiHFo9BABWkcZW7z6oEwXSg=
X-Google-Smtp-Source: ABdhPJxGvGzHYlon9ExqeHoSmKdWMwW1h9D3Y2v58vJK0sc8Pe5g8O3IcFEmry7YN9RlXZA+NbsL0A==
X-Received: by 2002:a1c:4484:: with SMTP id r126mr5381571wma.150.1633462041536; 
 Tue, 05 Oct 2021 12:27:21 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id p18sm7312497wrt.96.2021.10.05.12.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:27:20 -0700 (PDT)
Message-ID: <79bc4067-1ed0-0b06-e847-2875c75ffb9f@amsat.org>
Date: Tue, 5 Oct 2021 21:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] target/i386: Include 'hw/i386/apic.h' locally
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210929163124.2523413-1-f4bug@amsat.org>
 <20211005105745-mutt-send-email-mst@kernel.org>
 <fb4d7f19-8bb5-781d-4a41-9641625a2019@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <fb4d7f19-8bb5-781d-4a41-9641625a2019@vivier.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/21 18:45, Laurent Vivier wrote:
> Le 05/10/2021 à 16:57, Michael S. Tsirkin a écrit :
>> On Wed, Sep 29, 2021 at 06:31:24PM +0200, Philippe Mathieu-Daudé wrote:
>>> Instead of including a sysemu-specific header in "cpu.h"
>>> (which is shared with user-mode emulations), include it
>>> locally when required.
>>>
>>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>
>> which tree? trivial I guess?
> 
> Yes, but for me the patch was not correct because there is no need to update target/i386/cpu-dump.c
> But perhaps I misunderstood the answer from Philippe?

You understood correctly, this series requires a respin.

