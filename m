Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8F0324F12
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:24:41 +0100 (CET)
Received: from localhost ([::1]:46998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEl6-0007yz-3F
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFEiv-0006dj-B4
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 06:22:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFEip-00015P-C4
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 06:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614252138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/dlqa+xoNuUHLUURmFPhGYBztxBN4kRGz83QGCZ+ByU=;
 b=aCaIHrMNAuyTRfDEi0QKGzUIoBOPgeHfUHFG5P3mhck7UBdNjb7YhrLwy/u+M0LFVYKy00
 K57ybSuDyUu8M7dWnIlPX3JWVefPmMVQI92k/fO8ZFL7Bq5U2JRIr1+9pnJagfP0z0Yxbm
 /MOM/uKeIXE0qfalMRO032ruxgv6VD0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-_stcfITtMmq9yQkAewqmIw-1; Thu, 25 Feb 2021 06:22:16 -0500
X-MC-Unique: _stcfITtMmq9yQkAewqmIw-1
Received: by mail-wm1-f72.google.com with SMTP id 13so647628wmk.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 03:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/dlqa+xoNuUHLUURmFPhGYBztxBN4kRGz83QGCZ+ByU=;
 b=JQ6ymNsJR54afBGn3He6B31KyanE90vOn+QIW2crZ2c9ywCexqZUYclsYFa/yEaNen
 adNL/GFf0FTvK98mEGMSt1Cx+z0qWIQCAuZjsQ1F8QCzKRlLQd7rzVXjSU88/b83TOj7
 LqLuVB9v1NQBoTnpXhA+86db+jec7BkPutCXOz+uxiqAw9Sy59VmUW8XZwkvuF+MCJE9
 GHWK5GmTkBeVQPkON3R0YNdeTko/6ZWdUN4ot46cY9uG5NH1IFpZJ4tmf/jvDXGOj+yR
 mx/0ZBpBT2Aqf2cyGi7s8mENyM5yKLfksNI6smmjhSy1K3JVu/RvD3p3QpCsLSRT9Dmm
 EOPA==
X-Gm-Message-State: AOAM532mXDqS0lN8DwDO5yMvelZCICEWGN3DCLztHZJaouMXL8/R2ORl
 IFbRiUnt2JyR15kOPUBpRdDamsFa3YwVUKFpCkkTQdINKe78J8twA8lUB5yCXuanGcyeKaNtgrD
 0rLzTSMf9CRAYoAZLKqpWJoeGA0h0nTz87tSiQa8qnRBcJQVVYBfQAgfpFL05OElO
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr3015786wrp.194.1614252134487; 
 Thu, 25 Feb 2021 03:22:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3GcwrSvE3xb+2ICCEIOtNXrbObN0AdRaYs+DgYQD0+WEDm6jTWqpTGJXawnVWaaV/cGG5gw==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr3015753wrp.194.1614252134245; 
 Thu, 25 Feb 2021 03:22:14 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k15sm9829234wrn.0.2021.02.25.03.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 03:22:13 -0800 (PST)
Subject: Re: [PATCH v23 06/17] meson: add target_user_arch
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210225104941.15688-1-cfontana@suse.de>
 <20210225104941.15688-7-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c36f4d37-91a0-c0aa-0954-ed2be76d7134@redhat.com>
Date: Thu, 25 Feb 2021 12:22:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225104941.15688-7-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 11:49 AM, Claudio Fontana wrote:
> the lack of target_user_arch makes it hard to fully leverage the
> build system in order to separate user code from sysemu code.
> 
> Provide it, so that we can avoid the proliferation of #ifdef
> in target code.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 
> [claudio: added changes for new target hexagon]

Maybe elsewhere this is useful, but not on this patch IMO.

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  meson.build                   | 5 +++++
>  target/alpha/meson.build      | 3 +++
>  target/arm/meson.build        | 2 ++
>  target/cris/meson.build       | 3 +++
>  target/hexagon/meson.build    | 3 +++
>  target/hppa/meson.build       | 3 +++
>  target/i386/meson.build       | 2 ++
>  target/m68k/meson.build       | 3 +++
>  target/microblaze/meson.build | 3 +++
>  target/mips/meson.build       | 3 +++
>  target/nios2/meson.build      | 3 +++
>  target/openrisc/meson.build   | 3 +++
>  target/ppc/meson.build        | 3 +++
>  target/riscv/meson.build      | 3 +++
>  target/s390x/meson.build      | 3 +++
>  target/sh4/meson.build        | 3 +++
>  target/sparc/meson.build      | 3 +++
>  target/tilegx/meson.build     | 3 +++
>  target/tricore/meson.build    | 3 +++
>  target/xtensa/meson.build     | 3 +++
>  20 files changed, 60 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


