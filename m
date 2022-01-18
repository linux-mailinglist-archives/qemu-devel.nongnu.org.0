Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92E5492271
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 10:18:58 +0100 (CET)
Received: from localhost ([::1]:46710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9kdl-0007SH-SQ
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 04:18:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9kbv-0005KJ-EX
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:17:03 -0500
Received: from [2a00:1450:4864:20::32b] (port=42597
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9kbs-0005C8-G5
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:17:01 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so5653207wmb.1
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 01:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AF18zrlHVOl/Lq7g6Y8Agbf4jlv0VSifk21mQnJ7a/s=;
 b=foa6TzyV2PsE0DVnK9pja0Ty9OYpke1BeysQCz38YPW8WNRJDXDS6GejhQjs1Gg6ev
 tbPuRdz95W3r6GYpferW7GTiL/EWcByXCAcEwfcGAYa2Prr4G8PoKpatPpN/X0MngAw1
 uf+BkoqwlLecqIpo78tmncsQwf6Y2WVr5JG0hHqmuK31kFMp33sUEkwY2DfpYqobxIxZ
 ETqLtu4YgruPmitHnqiS27+v2vSD317u0yg0fZeKGe5gjHYCR+fqcxrSvq7ADTzMZqP+
 KjhLGMiZGiZ4KKIO+9c+ULbVli3hjYQAq7MdITfCaLcS8zkz1k5yvvXArrD/D5nT9/e+
 7fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AF18zrlHVOl/Lq7g6Y8Agbf4jlv0VSifk21mQnJ7a/s=;
 b=vy7qVZcvajTjbKLYT8HTz2cPiU+bOO25b72zeh1p7nFvF7kg0YkQHBFWZvx/cYhLLb
 gHHaZrMUVb4ZVBVzWTHapKWxp2v4RMuPcBJIrMECfieuP2mhM1g5jR+f7bKeIyG/Uj+1
 8lNCD+wjXUlZgqvm3DVfM6pZFTocWn17Ou6lA59CMu2OUvt8HdYYxv/QdR1aWtptGw7R
 UKzBmFVMNYR0i6D7oJvXWfNLLalRpKH/sKvlc88F7qVuC5ZOz6bQCvnxDsqDHilkkz/r
 VA7ns4PHYy+vRytnaUOucVo6aiq6iE3S8pz4pvW1XNHHq63ZE3Q55UnbSN/y5V1uGT+k
 9cMQ==
X-Gm-Message-State: AOAM531yYUzaPDQu1S86/4gVXN/Xme2kWoJQYREiKmMpISDGeI/v7xuK
 NPr6ZIjj5Q81KYUNae8bA66lf0nVzU0=
X-Google-Smtp-Source: ABdhPJwV4mG3BrJgpY3iDVtagiw5x/zMcBAMPrm3SAv5+MO33PBDfig159yK+bu4OdXfG+8oc1sZ7A==
X-Received: by 2002:a5d:494f:: with SMTP id r15mr21905134wrs.388.1642497418742; 
 Tue, 18 Jan 2022 01:16:58 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id m65sm1733756wmm.15.2022.01.18.01.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:16:58 -0800 (PST)
Message-ID: <9bd47d0e-3917-9541-5dd9-347497002bff@amsat.org>
Date: Tue, 18 Jan 2022 10:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 0/3] memory: memory_region_is_mapped() cleanups
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211102164317.45658-1-david@redhat.com>
In-Reply-To: <20211102164317.45658-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 11/2/21 17:43, David Hildenbrand wrote:
> Playing with memory_region_is_mapped(), I realized that memory regions
> mapped via an alias behave a little bit "differently", as they don't have
> their ->container set.
> * memory_region_is_mapped() will never succeed for memory regions mapped
>   via an alias
> * memory_region_to_address_space(), memory_region_find(),
>   memory_region_find_rcu(), memory_region_present() won't work, which seems
>   okay, because we don't expect such memory regions getting passed to these
>   functions.
> * memory_region_to_absolute_addr() will result in a wrong address. As
>   the result is only used for tracing, that is tolerable.
> 
> Let's cleanup/fix the code and documentation of memory_region_is_mapped()
> and change one user that really should be checking something else.

> David Hildenbrand (3):
>   machine: Use host_memory_backend_is_mapped() in
>     machine_consume_memdev()
>   memory: Make memory_region_is_mapped() succeed when mapped via an
>     alias
>   memory: Update description of memory_region_is_mapped()

Thanks, queued via memory-api.

