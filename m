Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065D3344579
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:21:00 +0100 (CET)
Received: from localhost ([::1]:50114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKUN-00066t-3p
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOKSU-0005NR-SE; Mon, 22 Mar 2021 09:19:04 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOKSS-0004Rl-R7; Mon, 22 Mar 2021 09:19:02 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k8so16697739wrc.3;
 Mon, 22 Mar 2021 06:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Jd6LlYso9CpV5yXyhGuwTiL+80VQyaNjfm+a1TXPoA=;
 b=MMvDMVdcTNG+7UezLxTM9XPPwbHX0inYbAHLp0BCcI3beakx88rrC3RYuxHEEkfTlv
 0BuCAipgIgg6VI+ptytu1eaBxWRw8VyAPGSX/uK54IBv+ycgQ60lcbomGC3Le2Jb0kze
 ppHubKasfWXm5U1okyvzk3ZszKYCwsX/QSxWNuj5C3EM6CJBQfYESCZX3nQUkd7HsNl6
 NFjztCpWnnEwqIkEkkwLvuUwAvcfrJZwsMKb35os7+mszbe/oku2vxscLAlD0bub/9mf
 CD7JueCsd5kAcS14Jy4WZDOcuIdQUKFZbrvhHDQWK1zRQH77TtDF4bHDTrZC7jqlcXio
 kI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Jd6LlYso9CpV5yXyhGuwTiL+80VQyaNjfm+a1TXPoA=;
 b=KHHDNisylOtIzRBFiZORQHDr8V6ErxSqbMv3KDCarkk34uGmwqM5+++F6VJ1jsQKl5
 C+WQkenQaI5VDC8RdQy5obRx2S24XqmEKMtdSBOWr4r4IWQZiUaCW0ikO62phDcuERka
 FSGUPb6rYozs1jp2fiyQddwDs8hfRdx/Itt6+GGFtWRStfdOYD7TtsZ03ykQ0PvXhHcz
 4mmr3RT64z8uTgP0pd8BZ14aC2Ec3/EvyCGajtRZhQwht1T/u14qpWV5l2QJmXntXVge
 Tsi4MI6gcNZOamueegqOF5etURhZ+Dh283/G8JKLS/JIzKRwkA6DXuh8NGZ6QRzycYoe
 zWiQ==
X-Gm-Message-State: AOAM5333G1UhSM86Db2XuyZoy0RyxecZ4LW4tRYY5xP9O+7HZbea4/jG
 3sUmZ3w8N0k22qCAkHBJXXQ=
X-Google-Smtp-Source: ABdhPJy8tG1svwDQA9/6ECGt8a00IODUieCUJHVULLEXH4tiIOQJ57oajtBVJJ3zz1mV0Z/tQeR/Ig==
X-Received: by 2002:a5d:5083:: with SMTP id a3mr11990889wrt.38.1616419138786; 
 Mon, 22 Mar 2021 06:18:58 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u23sm17058910wmn.26.2021.03.22.06.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 06:18:58 -0700 (PDT)
Subject: Re: [PATCH 1/2] disas/arm-a64.cc: Fix build error
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
References: <20210320041854.68668-1-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <94f75c91-bd1a-2840-a469-91b5b4327ebb@amsat.org>
Date: Mon, 22 Mar 2021 14:18:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210320041854.68668-1-gshan@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Christian for
https://www.mail-archive.com/qemu-devel@nongnu.org/msg785090.html

On 3/20/21 5:18 AM, Gavin Shan wrote:
> This fixes the following build error with gcc v11.0.0:
> 
>   # gcc --version
>   gcc (GCC) 11.0.0 20210210 (Red Hat 11.0.0-0)
> 
>   [969/2604] Compiling C++ object libcommon.fa.p/disas_arm-a64.cc.o
>   FAILED: libcommon.fa.p/disas_arm-a64.cc.o
>     :
>   In file included from /usr/include/glib-2.0/glib/gmacros.h:241,
>                    from /usr/lib64/glib-2.0/include/glibconfig.h:9,
>                    from /usr/include/glib-2.0/glib/gtypes.h:32,
>                    from /usr/include/glib-2.0/glib/galloca.h:32,
>                    from /usr/include/glib-2.0/glib.h:30,
>                    from /home/gavin/sandbox/qemu.main/include/glib-compat.h:32,
>                    from /home/gavin/sandbox/qemu.main/include/qemu/osdep.h:126,
>                    from ../disas/arm-a64.cc:21:
>   /usr/include/c++/11/type_traits:56:3: error: template with C linkage
>      56 |   template<typename _Tp, _Tp __v>
>         |   ^~~~~~~~
>   ../disas/arm-a64.cc:20:1: note: ‘extern "C"’ linkage started here
>      20 | extern "C" {
>         | ^~~~~~~~~~
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  disas/arm-a64.cc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/disas/arm-a64.cc b/disas/arm-a64.cc
> index 9fa779e175..8545c04038 100644
> --- a/disas/arm-a64.cc
> +++ b/disas/arm-a64.cc
> @@ -17,13 +17,13 @@
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include "vixl/a64/disasm-a64.h"
> +
>  extern "C" {
>  #include "qemu/osdep.h"
>  #include "disas/dis-asm.h"
>  }
>  
> -#include "vixl/a64/disasm-a64.h"
> -
>  using namespace vixl;
>  
>  static Decoder *vixl_decoder = NULL;
> 


