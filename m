Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC32348013
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:11:24 +0100 (CET)
Received: from localhost ([::1]:52078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP7yV-0003uO-8G
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP7tq-0002tK-Q5
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:06:38 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33]:40886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP7tn-0005vL-QO
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:06:34 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 j20-20020a4ad6d40000b02901b66fe8acd6so6042993oot.7
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lb7k6LzexhoCgkdHGhRsZoBIoDDEJFBlRt+JVg5p+K0=;
 b=b6mpcas2dDs+vgkJeIquEiNlDZ+vMPHJELOdmIjPKGX9FL5drxAj7fKhp9YydMaYL9
 343AvXDucwwrAgRvjjY6Q/y60eoZxACVcrUl65mr/gdS292IzbNgthKCOZAHYKp9wKsg
 tLBHYOw1MBJkXShZxzMv8Aiq+SWmpkE895EY/T3Mhi34LQtpu7zN4caHiKb9Tr1NThI3
 tn5qxBSLm8srRPeM0743z10yqamqNYq+MsZ8TVP9Lmt2tc2ZNqBxGSgY/1N+rUFFBH9I
 aU9pyINICtAB42xVHe11TVum3C4Sj1GANzt0zHUyYG3tpHXWndRmdR/JKZSQmbu4Z/oW
 Uzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lb7k6LzexhoCgkdHGhRsZoBIoDDEJFBlRt+JVg5p+K0=;
 b=FwAP3Vj5MCLfWEmHwNEVTJUNzS8TdvFsBf5k/mxVB34WDXwMdbnIVzYV7sGHhB4bN/
 6UE3punLWTdfDR5xbGwk0bMj0EtDfdwi503Z/IPxhOUiu4VmYYeitQuU0tyXrXtKDJEm
 5HHWmiTDJDavXrNo+BbHLjzP2p8Ki6dFeqIsE4LVMUCa162a0SxdM8dpPuIp6Z8pkmwZ
 Jl1PcR0UZ5gQPvpZSWioJ6Nqa2og+vkElCJXC5pb2aVABQ6OvFORXeHZ4sQO8XQfulaM
 vaDQgOu5UCzVqNuwF3JYrCpGSjNwPKeTKF6A3LwHO7Z8nKW1VqxUpNyMm4u2AoSGNg/Q
 cfnQ==
X-Gm-Message-State: AOAM531L2LuShw1s8RAfno5EPxmBg42znOc0Dgm52xyvojAqCp5Wop59
 mO+jt73AZgybbzT4lNbVMtDo4w==
X-Google-Smtp-Source: ABdhPJwbH7Ksd9PvzrMiL+rN11c1jY/bxRir7DLoNW9KH8r0MHoj/2bc/dVymU/F/aEAe5jKTc/unA==
X-Received: by 2002:a4a:b787:: with SMTP id a7mr3836909oop.18.1616609188781;
 Wed, 24 Mar 2021 11:06:28 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 8sm689980otx.1.2021.03.24.11.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:06:28 -0700 (PDT)
Subject: Re: [RFC v11 04/55] target/arm: tcg: add sysemu and user subdirs
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323151749.21299-5-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6986c748-4cf1-6f61-5d21-3e5d2d2513d7@linaro.org>
Date: Wed, 24 Mar 2021 12:06:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323151749.21299-5-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc33.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:16 AM, Claudio Fontana wrote:
> +++ b/target/arm/tcg/sysemu/meson.build
> @@ -0,0 +1,3 @@
> +
> +arm_softmmu_ss.add(when: ['CONFIG_TCG','CONFIG_SOFTMMU'], if_true: files(
> +))

Blank lines at the start of each new file?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

