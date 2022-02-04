Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0648F4A9D4D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:02:44 +0100 (CET)
Received: from localhost ([::1]:38292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG1ys-0007c7-Vs
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:02:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nG1tS-0004hd-Ck
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:57:06 -0500
Received: from [2a00:1450:4864:20::431] (port=35771
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nG1tQ-0003YS-33
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:57:05 -0500
Received: by mail-wr1-x431.google.com with SMTP id j25so11792383wrb.2
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 08:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EVymqSPivxmAMfPUXqQhw1sbu8T1XDjcw017EdmKZOE=;
 b=HqGfcywKORqpBZrwnHJafZ+iE+ugQd4mEWuUyjP5alom40XA7xQbDTZjQvz0rU/Qyo
 vkCyQPT8bktkjnZeTjoDcGdPdBsytxjIhR8nc9UcF6rqF49OYPStWrmyb5DGDKnpqBqX
 3zKu0TPbRiTTiS68JcGbOhz4FAeP3U0ydHPylCL151HoCG8RC//xrpMQVvMQEIsaKR8V
 vXCXRK7TEaC8Ud9Na8mrSHmtA9KSAzY/pX0Mf/k31IHsls88hbMBtXSQstJmulAMmLa8
 VnqePWF3WcGxyhGyCfL0mdcziTChHxHrkxFZvE3/nH8izCQcnrG28howpLNuiP8M8HZb
 dVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EVymqSPivxmAMfPUXqQhw1sbu8T1XDjcw017EdmKZOE=;
 b=OFn4bMmnAUKTa3nwnv/TyyYAcxJfDxuZ3Dfqjymf6fb0G8VwoOhbUC/RF/luimIUd5
 SS89xOC0hE6FovVTcbDmHk6VlodulAqsCGtq7uPvjZTICKvoSHapHYDSxLvJEMAc1YJX
 YyRjpt8liaMxH7QgwkOWjYzg5pwZcUXrqPScxbYcrV6aX8ZuxUJAlBIBYA7+B5qoMo9Z
 Gm2S1qeySgYhfMUmkYGDbvagvqUs1ChKIqA/du6yOt2u1ew0ccnCTK+KSSekEW7MAuZi
 4K+YKtwhcmH9UWbGkKL3IfXbupIDHz8wshXYCOjL/rVeVpF7tM7OGPfnQdZlfbOnEYob
 R8oQ==
X-Gm-Message-State: AOAM5316kvnmEktlbmW1OBE8jxpcrZ8GmW0TR2709LQpAtVQAM/ojhyl
 9YU+fHpYpQlC5Y7ohtVkHf0=
X-Google-Smtp-Source: ABdhPJwGhEKDSZ3/sb5erqS1Q/zfdzWguBIiPFRV4YhFOM5cwNkNCvAe0lA5jabBNT5/lsCGd+xWNA==
X-Received: by 2002:a5d:5052:: with SMTP id h18mr3334161wrt.350.1643993822838; 
 Fri, 04 Feb 2022 08:57:02 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id x7sm2286856wrt.77.2022.02.04.08.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 08:57:02 -0800 (PST)
Message-ID: <56bc2e77-690a-b3b9-9073-8eed775a8142@redhat.com>
Date: Fri, 4 Feb 2022 17:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] qom: Remove user-creatable objects from user emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220204152924.6253-1-f4bug@amsat.org>
 <20220204152924.6253-4-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220204152924.6253-4-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 16:29, Philippe Mathieu-Daudé via wrote:
> user-mode don't use user-creatable objects. Restrict it to
> sysemu / tools.
> 
> Add a stub to avoid a link failure with the global callback:
> 
>    /usr/bin/ld: libqom.fa(qom_object.c.o): in function `object_initialize_child_with_propsv':
>    ../qom/object.c:578: undefined reference to `user_creatable_complete'
>    /usr/bin/ld: libqom.fa(qom_object.c.o): in function `object_new_with_propv':
>    ../qom/object.c:801: undefined reference to `user_creatable_complete'
>    collect2: error: ld returned 1 exit status

Please instead move these two functions to qom/object_interfaces.c.

Paolo

