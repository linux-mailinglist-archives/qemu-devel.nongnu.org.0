Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C6369C83
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 00:25:25 +0200 (CEST)
Received: from localhost ([::1]:56014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4En-0007Fw-0Q
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 18:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la4DL-00068Q-PI
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:23:55 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la4DK-0003lG-Bf
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:23:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 f195-20020a1c1fcc0000b029012eb88126d7so1950761wmf.3
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 15:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fa218y4XN6r//zamaPR7EsBdGXenE0uk3Iu1kU7y3ws=;
 b=BEDPn3XZy6OVMgHidZ9DhjwKliJukbTBmgea5d9OjQlajkqNnuxTF+yxKFO0Pv2Sde
 LJt66+LX65CSk0hXP7kgmO5IsjLdFh2zAEOGrgPHK3QMJmVJt3eG4bR6n3XHRdOstpAl
 vPkdn86sijR1qRAU2ThbKCMoG0JWPCZ/baughpGrR6xeg6zynf12VYqw8eI6ClssBd3G
 l+n6+/t7M59C3sI6U66mY7cz9N+9lDAfO3dNMbLK4QqN0W1SRh8D30OomrTc8KDhz53S
 qG+v+cxiH4odqXPNIa4eJQzSmBWQVic41NhNrLMxrMMTO2pKo4bTw+cA1sX0mUXqXVMD
 TzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fa218y4XN6r//zamaPR7EsBdGXenE0uk3Iu1kU7y3ws=;
 b=fOBGyCpMjoBkluvXFpvLDRb7vR5DKFp7x/tXlwwRxXJQnLoIqjR1aYaEbRkdnt3Ghi
 NgUv00d0Cb7QNy0eqedgmHzjt8Dks7v+Zat6sCGe94cV3SknWVXEX4jwKP9YfnUPVLeM
 zsuX5ZNHlQ1g42MNfoe1CizY2lE2ow0kI+ZKDDVzZjc3r2K5IdM6j2eA+4vR21ZYhX+r
 aqgSOHz9HpgU84/q6Hackd9VyAHn4B52gPxhuLzqD/CzJg+RuFQ4rNBJATu7YWUYbw61
 A4CHrr/T43CD6XNAZISUsCPetqZH1PL7TdC29UsxQHXm6fjt9tTooO88KYci4Xt9IX1N
 482Q==
X-Gm-Message-State: AOAM5304IK0P1uobpJ8bBoUKjJbrLg/3R2zv4XR+fkpFrNvo3q2U2Dkt
 aQ6FaxlwIFHdImNbDAQi+ho=
X-Google-Smtp-Source: ABdhPJxKsTj/MzyCQEJvs4lfjD7iCcj78p6IZnWzLdFSbUuoZigT6KY9jXv+A2kC03h0CxHyuBbYxg==
X-Received: by 2002:a7b:cc10:: with SMTP id f16mr6246227wmh.131.1619216633136; 
 Fri, 23 Apr 2021 15:23:53 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g12sm10720871wru.47.2021.04.23.15.23.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 15:23:52 -0700 (PDT)
Subject: Re: [PATCH v1 07/25] tests/tcg: Use Hexagon Docker image
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ac3dddbf-4efb-063f-fe1f-617ed979d69f@amsat.org>
Date: Sat, 24 Apr 2021 00:23:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210419145435.14083-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: fam@euphon.net, Alessandro Di Federico <ale@rev.ng>, berrange@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 4:54 PM, Alex Bennée wrote:
> From: Alessandro Di Federico <ale@rev.ng>
> 
> [PMD: Split from 'Add Hexagon Docker image' patch]
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210228222314.304787-5-f4bug@amsat.org>
> Message-Id: <20210305092328.31792-6-alex.bennee@linaro.org>
> ---
>  tests/tcg/configure.sh | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

