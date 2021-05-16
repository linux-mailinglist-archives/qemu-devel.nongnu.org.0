Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3A1381EF8
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:03:23 +0200 (CEST)
Received: from localhost ([::1]:42532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGQU-0007cT-E9
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1liGAH-0004OR-6O
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1liGAC-0006FL-PJ
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621169191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6dnULhzW3x1NnrI274GbrwnObrbS6i6vLXv4asgW4A=;
 b=RHf8NwViBgOALMoPTqpR7qiI3Ib8nnUd6SSSkEPhRVLHMFL2PJYPIevoQIHRkKvkTqP4f+
 CEXuCMxtMvvcsiW2U1mToAYt+MQQqduAXWTlACCgVJVgdvVTKDS8qnwEGv/Kmg/l/SJyCH
 libIbugVMaoCbZD7h38TZ8FiH7P7fxQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-57fx_B6VM5eNe9HJCAnhtA-1; Sun, 16 May 2021 08:46:27 -0400
X-MC-Unique: 57fx_B6VM5eNe9HJCAnhtA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso2349381wrf.11
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g6dnULhzW3x1NnrI274GbrwnObrbS6i6vLXv4asgW4A=;
 b=S03BkmY1uLeFlFAhgf8T1yIYPvv7xUB25dZQqXpggtuDDsfL+M0Ee02D5XYyOXb6kv
 Y5Xa5edlv1E3WPP06fBKns4Ir2HM0kSeiFWKSYs1S8/WhcmGAIQO4ZtfITwBci+prEVY
 lmboFu/W9vWlpR64q5/Nl+5l895xDc/y0KqRNkP7qroE1Mdvc+Zye9S4/Di2IX/oRCsL
 /Krpx2G46Qd8A3uAOLOE97y/vBRr5uqE4Kuv/pileBMg0/elOa0N7Y2D6G98jY3y+7Xn
 TRM1sPL0p++mgbHgdG+1S58ofHU7sUUSGz+Vj9br2robaXRIxsjCErRh/TqjGSX90w+y
 q2og==
X-Gm-Message-State: AOAM53183ZK9hMZ28Yc9pgrHLmTObmRR8+kMQkcKoyrlzOZ0CSAB5ywp
 ZVB1rxGNm4Z68EWtvCVfPmVh1n9W8b2nPU78CH2Jj4Yl2e/yJqwi2c9GPtrEnnieTTTo2kcm9DG
 2RJkl7hiI6BmQ+YU=
X-Received: by 2002:a1c:b003:: with SMTP id z3mr18920424wme.7.1621169186689;
 Sun, 16 May 2021 05:46:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+3oB/oQg6TShI7lac4arOunC/W7rQQU05snes62kTdsPVJhsKTaC5WGryEcbrCbZCfe1wzA==
X-Received: by 2002:a1c:b003:: with SMTP id z3mr18920408wme.7.1621169186496;
 Sun, 16 May 2021 05:46:26 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83459.dip0.t-ipconnect.de.
 [217.232.52.89])
 by smtp.gmail.com with ESMTPSA id c22sm10972429wmb.10.2021.05.16.05.46.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 05:46:25 -0700 (PDT)
Subject: Re: [PATCH] disas/libvixl: Protect C system header for C++ compiler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210515183531.372925-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6e79e8b4-32fd-da09-239a-0ebd085612f5@redhat.com>
Date: Sun, 16 May 2021 14:46:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210515183531.372925-1-f4bug@amsat.org>
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/05/2021 20.35, Philippe Mathieu-Daudé wrote:
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
> Similarly to commit 875df03b221 ('osdep: protect qemu/osdep.h with
> extern "C"'), guard the <string.h> system header with 'extern "C"'.
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
> Buglink: https://bugs.launchpad.net/qemu/+bug/1914870
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC because I've no idea about C++, but this fixes the build for me.
> 
> Quick reproducer:
> 
>    $ ../configure --disable-tools --target-list=aarch64-linux-user
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>   disas/libvixl/vixl/utils.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/disas/libvixl/vixl/utils.h b/disas/libvixl/vixl/utils.h
> index 5ab134e240a..fc28d7456c1 100644
> --- a/disas/libvixl/vixl/utils.h
> +++ b/disas/libvixl/vixl/utils.h
> @@ -27,8 +27,10 @@
>   #ifndef VIXL_UTILS_H
>   #define VIXL_UTILS_H
>   
> -#include <string.h>
>   #include <cmath>
> +extern "C" {
> +#include <string.h>
> +}

Could you please try to backport the upstream patch instead:

https://git.linaro.org/arm/vixl.git/commit/?id=78973f258039f6e96

See the changes to utils-vixl.h:

diff --git a/src/utils-vixl.h b/src/utils-vixl.h
index 06c7551e..b27310db 100644
--- a/src/utils-vixl.h
+++ b/src/utils-vixl.h
@@ -27,9 +27,8 @@
  #ifndef VIXL_UTILS_H
  #define VIXL_UTILS_H

-#include <string.h>
-
  #include <cmath>
+#include <cstring>
  #include <vector>

  #include "compiler-intrinsics-vixl.h"

  Thomas


