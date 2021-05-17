Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EF1382915
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:58:35 +0200 (CEST)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lia1C-0007Dg-2R
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1liZyC-0005CJ-UZ
 for qemu-devel@nongnu.org; Mon, 17 May 2021 05:55:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1liZy9-0003xB-Gy
 for qemu-devel@nongnu.org; Mon, 17 May 2021 05:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621245324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0IwZPh7scRjTRZCuWMSlO+/RIyMLD5+O2pqZYLdEKzc=;
 b=afI4Gy2Gt33kLnQaYsStYZAzBNM1F+SrhYrhMlkjuHFF8zzXn61SOT1G2kZyFyyTRUSzoU
 7ChtoLSof5OjpabwIDco4vkPCfu907JD4sT9oFjqhPtA8w84+dxFJ6ieNCwXVqMu8/sYMw
 oMSiO2EsTgAgyIuFRWu386i4HUvxLR8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-65VH6ZS4P1OaddtRGsTrjA-1; Mon, 17 May 2021 05:55:21 -0400
X-MC-Unique: 65VH6ZS4P1OaddtRGsTrjA-1
Received: by mail-ed1-f69.google.com with SMTP id
 cy15-20020a0564021c8fb029038d26976787so2178444edb.0
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 02:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0IwZPh7scRjTRZCuWMSlO+/RIyMLD5+O2pqZYLdEKzc=;
 b=uFnPvLo2TwDhFR71DKshmKjmm7MvWX6fp1i4Xdbeh39Ae8Epwc/WtKqNUAJDAfYpJ9
 RPshzNneWIWmOPbxcaz5Guw7UuU4rmw3NnA8Bk/uCmIZIhHCFOllUsfczewXBp5kmj+X
 knNpXTEVtMrjDy3yZ9QqF2Qp+BKIVhYzltZSHp/dgmF6cQ7lfN6p6eXAHsrQhyrfcMUY
 cUsCNMhB8BTL0z6wkXmzouxiQEm0GDkymverwUFqgcSLK3z9GVnNGqELvdy9qNBTeBJM
 efCErFl3xbxggYMcGpXL2r052/RFQVzsfSJGdyqtGL9/R7sUFwlaWbI3Yb9KLV9dIulQ
 OntQ==
X-Gm-Message-State: AOAM530IBtdpE6Wa5rEmt2ffO7Y6jvlBgtkCR1BYsTYKAQfHtNbAPVF7
 ZLZShvNp/ysvSxFyIO1mXsp7TKzbv7n2t1rNM6P1xJ0sKEeGdo4v1KqvSN7I0iYDr+QTP1lg+1F
 uQ0rUhVEJSE4XdlM=
X-Received: by 2002:aa7:db44:: with SMTP id n4mr26432554edt.374.1621245320142; 
 Mon, 17 May 2021 02:55:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbdcVDGO2D1W9x/Gus1TIViUe2rHyDJamNbuWcQz9bhfRRMlDF802N/dX93AZiUjBxT55bmA==
X-Received: by 2002:aa7:db44:: with SMTP id n4mr26432537edt.374.1621245319976; 
 Mon, 17 May 2021 02:55:19 -0700 (PDT)
Received: from thuth.remote.csb (pd9e838d9.dip0.t-ipconnect.de.
 [217.232.56.217])
 by smtp.gmail.com with ESMTPSA id n25sm10600936edb.26.2021.05.17.02.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 02:55:19 -0700 (PDT)
Subject: Re: [PATCH v2] disas/libvixl: Protect C system header for C++ compiler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210516171023.510778-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c2a204ce-50b7-536a-d48a-810a7442b679@redhat.com>
Date: Mon, 17 May 2021 11:55:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210516171023.510778-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/05/2021 19.10, Philippe Mathieu-Daudé wrote:
> When selecting an ARM target on Debian unstable, we get:
> 
>    Compiling C++ object libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
>    FAILED: libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
>    c++ -Ilibcommon.fa.p -I. -I.. [...] -o libcommon.fa.p/disas_libvixl_vixl_utils.cc.o -c ../disas/libvixl/vixl/utils.cc
>    In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
>                     from ../disas/libvixl/vixl/utils.cc:27:
>    /usr/include/string.h:36:43: error: missing binary operator before token "("
>       36 | #if defined __cplusplus && (__GNUC_PREREQ (4, 4) \
>          |                                           ^
>    /usr/include/string.h:53:62: error: missing binary operator before token "("
>       53 | #if defined __USE_MISC || defined __USE_XOPEN || __GLIBC_USE (ISOC2X)
>          |                                                              ^
>    /usr/include/string.h:165:21: error: missing binary operator before token "("
>      165 |      || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X))
>          |                     ^
>    /usr/include/string.h:174:43: error: missing binary operator before token "("
>      174 | #if defined __USE_XOPEN2K8 || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X)
>          |                                           ^
>    /usr/include/string.h:492:19: error: missing binary operator before token "("
>      492 | #if __GNUC_PREREQ (3,4)
>          |                   ^
> 
> Relevant information from the host:
> 
>    $ lsb_release -d
>    Description:    Debian GNU/Linux 11 (bullseye)
>    $ gcc --version
>    gcc (Debian 10.2.1-6) 10.2.1 20210110
>    $ dpkg -S /usr/include/string.h
>    libc6-dev: /usr/include/string.h
>    $ apt-cache show libc6-dev
>    Package: libc6-dev
>    Version: 2.31-11
> 
> Partially cherry-pick vixl commit 78973f258039f6e96 [*]:
> 
>    Refactor VIXL to use `extern` block when including C header
>    that do not have a C++ counterpart.
> 
> which is similar to commit 875df03b221 ('osdep: protect qemu/osdep.h
> with extern "C"').
> 
> [*] https://git.linaro.org/arm/vixl.git/commit/?id=78973f258039f6e96
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1914870
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   disas/libvixl/vixl/code-buffer.h |  2 +-
>   disas/libvixl/vixl/globals.h     | 16 +++++++++-------
>   disas/libvixl/vixl/invalset.h    |  2 +-
>   disas/libvixl/vixl/platform.h    |  2 ++
>   disas/libvixl/vixl/utils.h       |  2 +-
>   disas/libvixl/vixl/utils.cc      |  2 +-
>   6 files changed, 15 insertions(+), 11 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


