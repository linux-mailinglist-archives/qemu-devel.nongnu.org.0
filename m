Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B357438FBFA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 09:49:15 +0200 (CEST)
Received: from localhost ([::1]:46158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llRoQ-0004jN-9k
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 03:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llRmi-0003oU-Np; Tue, 25 May 2021 03:47:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llRmd-000898-Bp; Tue, 25 May 2021 03:47:24 -0400
Received: by mail-wr1-x430.google.com with SMTP id q5so31050725wrs.4;
 Tue, 25 May 2021 00:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KFZGObe6U4YVN1cj7L5ys20QSQQSVjqGPMnTSKKvkxQ=;
 b=phz8F1XwzDJjNH+4GHDAgOmZDzhOW0GX0X803eu7usWwXDz0ZF9ki+IFm/Nj5hAZt7
 4MlJG6CxlcwuYqG9j3rlqQkiCSwEZTILtTHIyPFEO5y5bloEgTUlwKJQDetT+BktFA8h
 vdwcnimaTpjBP3l8lGk6USPMWDrJPDlVl0hCFHpV+aiSQGcBZCHmwnuA8vuu8CNhn9+D
 ZItTSQhAEW8tropFV+XSWKcu/XZam/MsPpac7Fa1Lsc9t7IYaSk/2g5Wqm9F+oxMQF5Y
 pacZf+Dm/U9E1sLLx5ztrm0/ZwasRnh787Jt3Pq8zL2FGEPGNPEhawr0WYh2fNumRogZ
 Ku1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KFZGObe6U4YVN1cj7L5ys20QSQQSVjqGPMnTSKKvkxQ=;
 b=GeQ4ROnpOPoXpFERTXAM2xnImn9kzAkqWso6Q0LEmfFPJqZg7KNhq2eKcIRfve7Xdm
 64IhywZ71TLS4ErBW4jCrBrfv9Mq+2cMyelXhtPPeUr+snNGsanCym9jzXW75+JDi1Fo
 kUI6XCXSAYOLCdNUUPUyTDcfngI5DdG20jHoNcXYZEc945qCOQ/3Os45jzHIqt2NT23m
 PDlGjz+RE65UahCRP09aPJGZhgNbzrCSyCGzffOGy29vPAYEBQ9z4PP/+PS/j5mbhR9G
 hoXRpUuC9qEvHGX9kZxshYwxYCQz076DXJ4dWOnHlMxVzCqqZ7Gq7xqYRGbfH5iIwQpX
 Fg6g==
X-Gm-Message-State: AOAM53244G33kvNTfNWCn9yxOmmcPCNxB9U/+xfIuiuo2+iQv5RcztIn
 1c9xWaueygEzm9FIT6mwscM=
X-Google-Smtp-Source: ABdhPJxMPXdqfhgQL/h4qWP6uSYs3gtAKTnQWzMbNqYyOY3PAjqG2UOgmRQqAAEK8GtZW+cmTmaOPA==
X-Received: by 2002:a5d:4845:: with SMTP id n5mr25297561wrs.314.1621928841555; 
 Tue, 25 May 2021 00:47:21 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n10sm14757150wrw.37.2021.05.25.00.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 00:47:20 -0700 (PDT)
Subject: Re: [PATCH v2] disas/libvixl: Protect C system header for C++ compiler
To: qemu-devel@nongnu.org
References: <20210516171023.510778-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <51541937-e1af-6c8b-c434-80918c2a5d9d@amsat.org>
Date: Tue, 25 May 2021 09:47:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210516171023.510778-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter, since libvixl is mostly used by the Aarch64 target,
can you take this patch via your ARM tree? (Thomas reviewed
it).

On 5/16/21 7:10 PM, Philippe Mathieu-Daudé wrote:
> When selecting an ARM target on Debian unstable, we get:
> 
>   Compiling C++ object libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
>   FAILED: libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
>   c++ -Ilibcommon.fa.p -I. -I.. [...] -o libcommon.fa.p/disas_libvixl_vixl_utils.cc.o -c ../disas/libvixl/vixl/utils.cc
>   In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
>                    from ../disas/libvixl/vixl/utils.cc:27:
>   /usr/include/string.h:36:43: error: missing binary operator before token "("
>      36 | #if defined __cplusplus && (__GNUC_PREREQ (4, 4) \
>         |                                           ^
>   /usr/include/string.h:53:62: error: missing binary operator before token "("
>      53 | #if defined __USE_MISC || defined __USE_XOPEN || __GLIBC_USE (ISOC2X)
>         |                                                              ^
>   /usr/include/string.h:165:21: error: missing binary operator before token "("
>     165 |      || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X))
>         |                     ^
>   /usr/include/string.h:174:43: error: missing binary operator before token "("
>     174 | #if defined __USE_XOPEN2K8 || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X)
>         |                                           ^
>   /usr/include/string.h:492:19: error: missing binary operator before token "("
>     492 | #if __GNUC_PREREQ (3,4)
>         |                   ^
> 
> Relevant information from the host:
> 
>   $ lsb_release -d
>   Description:    Debian GNU/Linux 11 (bullseye)
>   $ gcc --version
>   gcc (Debian 10.2.1-6) 10.2.1 20210110
>   $ dpkg -S /usr/include/string.h
>   libc6-dev: /usr/include/string.h
>   $ apt-cache show libc6-dev
>   Package: libc6-dev
>   Version: 2.31-11
> 
> Partially cherry-pick vixl commit 78973f258039f6e96 [*]:
> 
>   Refactor VIXL to use `extern` block when including C header
>   that do not have a C++ counterpart.
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
>  disas/libvixl/vixl/code-buffer.h |  2 +-
>  disas/libvixl/vixl/globals.h     | 16 +++++++++-------
>  disas/libvixl/vixl/invalset.h    |  2 +-
>  disas/libvixl/vixl/platform.h    |  2 ++
>  disas/libvixl/vixl/utils.h       |  2 +-
>  disas/libvixl/vixl/utils.cc      |  2 +-
>  6 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/disas/libvixl/vixl/code-buffer.h b/disas/libvixl/vixl/code-buffer.h
> index f93ebb6b822..b95babbdee2 100644
> --- a/disas/libvixl/vixl/code-buffer.h
> +++ b/disas/libvixl/vixl/code-buffer.h
> @@ -27,7 +27,7 @@
>  #ifndef VIXL_CODE_BUFFER_H
>  #define VIXL_CODE_BUFFER_H
>  
> -#include <string.h>
> +#include <cstring>
>  #include "vixl/globals.h"
>  
>  namespace vixl {
> diff --git a/disas/libvixl/vixl/globals.h b/disas/libvixl/vixl/globals.h
> index 7099aa599fb..3a71942f1e5 100644
> --- a/disas/libvixl/vixl/globals.h
> +++ b/disas/libvixl/vixl/globals.h
> @@ -40,15 +40,17 @@
>  #define __STDC_FORMAT_MACROS
>  #endif
>  
> -#include <stdint.h>
> +extern "C" {
>  #include <inttypes.h>
> -
> -#include <assert.h>
> -#include <stdarg.h>
> -#include <stdio.h>
>  #include <stdint.h>
> -#include <stdlib.h>
> -#include <stddef.h>
> +}
> +
> +#include <cassert>
> +#include <cstdarg>
> +#include <cstddef>
> +#include <cstdio>
> +#include <cstdlib>
> +
>  #include "vixl/platform.h"
>  
>  
> diff --git a/disas/libvixl/vixl/invalset.h b/disas/libvixl/vixl/invalset.h
> index ffdc0237b47..2e0871f8c3f 100644
> --- a/disas/libvixl/vixl/invalset.h
> +++ b/disas/libvixl/vixl/invalset.h
> @@ -27,7 +27,7 @@
>  #ifndef VIXL_INVALSET_H_
>  #define VIXL_INVALSET_H_
>  
> -#include <string.h>
> +#include <cstring>
>  
>  #include <algorithm>
>  #include <vector>
> diff --git a/disas/libvixl/vixl/platform.h b/disas/libvixl/vixl/platform.h
> index ab588f07f54..26a74de81bb 100644
> --- a/disas/libvixl/vixl/platform.h
> +++ b/disas/libvixl/vixl/platform.h
> @@ -28,7 +28,9 @@
>  #define PLATFORM_H
>  
>  // Define platform specific functionalities.
> +extern "C" {
>  #include <signal.h>
> +}
>  
>  namespace vixl {
>  inline void HostBreakpoint() { raise(SIGINT); }
> diff --git a/disas/libvixl/vixl/utils.h b/disas/libvixl/vixl/utils.h
> index 5ab134e240a..ecb0f1014ab 100644
> --- a/disas/libvixl/vixl/utils.h
> +++ b/disas/libvixl/vixl/utils.h
> @@ -27,8 +27,8 @@
>  #ifndef VIXL_UTILS_H
>  #define VIXL_UTILS_H
>  
> -#include <string.h>
>  #include <cmath>
> +#include <cstring>
>  #include "vixl/globals.h"
>  #include "vixl/compiler-intrinsics.h"
>  
> diff --git a/disas/libvixl/vixl/utils.cc b/disas/libvixl/vixl/utils.cc
> index 3b8bd75fba1..69304d266d7 100644
> --- a/disas/libvixl/vixl/utils.cc
> +++ b/disas/libvixl/vixl/utils.cc
> @@ -25,7 +25,7 @@
>  // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>  
>  #include "vixl/utils.h"
> -#include <stdio.h>
> +#include <cstdio>
>  
>  namespace vixl {
>  
> 

