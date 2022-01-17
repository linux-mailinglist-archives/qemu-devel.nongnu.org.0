Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD09E490AFF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:01:42 +0100 (CET)
Received: from localhost ([::1]:42514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9TVq-00064f-JO
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:01:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9TRy-0003PV-Qx
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:57:38 -0500
Received: from [2a00:1450:4864:20::32f] (port=52912
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9TRw-0001dG-PV
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:57:38 -0500
Received: by mail-wm1-x32f.google.com with SMTP id v123so20977013wme.2
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 06:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GflN4ICGotzo/jo92w5gdACGB0OBcJikmngRPfMTDy0=;
 b=Rx+HGW5gqS/jrn+P4NROJ5o9H+3wthpw7OVwiUJK8oLz+/AyA4coyEUSB7+y21pHKj
 qXwH9FhnJrG9jqoJx5+cr9T1J/soeQJvdOjftVcHDpzZZeUHTGnyON1UAYtW0QqJ4ACK
 34GQv+/XtTeLS1lhmcovozGhSDtYSYljxkMqLdKfYJFZ866XhRKIGXUD2tvOTTWfk18u
 gli/9Di4A3yVmcVtbD8nuAZkK68xaYgpJfSbPM/3CT6EDCNcN9tOxTMPE4nLBlIYRZIm
 F0hhV8iE/JJnxZsRoXjzBL+C2BlHYgzt/avWgqD8WT/ISTGA3O1Lm8h5l3R79p4gF/rv
 P1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GflN4ICGotzo/jo92w5gdACGB0OBcJikmngRPfMTDy0=;
 b=GaSnAzWQwY2lkS1gCRHt5o6qi6CVNmJSHz70+w1HEu89GgFgbRHDhjCY5WpsWR6oJX
 9Cazl66FeMtnooI18VaOSgmq7fnh2j5k9C7Quegucjn9PmGMBsTiHv636aqaSqU/H3YY
 kvBQJOwltE0g2LvTaNlv0m6NEj+Wrjbt2pLj/wCFQKxqM9JU3x4UQF6qq3f7R3YHAtG8
 LSFudPVlvlL6/FonEtodpZPVdvIPiPEQa6sRWZmi6mpjrxHncG4eosBd//+rmd0w+xnw
 V0oXS5ljG9/YmrHc+h5z0PDz0uKk8237hj5xny4znZn2JX6Qyqiv3Bv09yEDBKHYQhJP
 2HbA==
X-Gm-Message-State: AOAM533L7NHkgOW2FSiJrv1n4px3sIJJqnZVki9bGCDjegZBPACmCSEK
 V7rCJhL1BFFGamgA3X+6JfQ=
X-Google-Smtp-Source: ABdhPJwQuWbZjdlWDGC4mG4u+UBVAUL4r/v1u7KJV7E7GCAU9I2UxdaqMu8AgFXzniSq6lIavhJg1A==
X-Received: by 2002:a5d:6d87:: with SMTP id l7mr11033514wrs.24.1642431455509; 
 Mon, 17 Jan 2022 06:57:35 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id u12sm9229749wrm.106.2022.01.17.06.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 06:57:35 -0800 (PST)
Message-ID: <56e77eba-a76c-208e-8e97-1c83e30080c8@amsat.org>
Date: Mon, 17 Jan 2022 15:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] hw/i386/x86: Attach CPUs to machine
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220116235331.103977-1-f4bug@amsat.org>
 <20220116235331.103977-2-f4bug@amsat.org> <YeVzvkcTLIJEvgLi@redhat.com>
In-Reply-To: <YeVzvkcTLIJEvgLi@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/17/22 14:48, Daniel P. Berrangé wrote:
> On Mon, Jan 17, 2022 at 12:53:30AM +0100, Philippe Mathieu-Daudé via wrote:
>> Avoid having CPUs objects dangling as unattached QOM ones,
>> directly attach them to the machine.
> 
> Lets be more explicit here
> 
> [quote]
>   Previously CPUs were exposed in the QOM tree at a path
> 
>     /machine/unattached/device[nn]
> 
>   where the 'nn' of the first CPU is usually zero, but can
>   vary depending on what devices were already created.
> 
>   With this change the CPUs are now at
> 
>     /machine/cpu[nn]
> 
>   where the 'nn' of the first CPU is always zero
> [/quote]

OK, thanks for the help here!

