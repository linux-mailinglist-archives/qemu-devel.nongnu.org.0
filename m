Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DFB35569D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:28:23 +0200 (CEST)
Received: from localhost ([::1]:40556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTmgn-0003rY-Uc
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTmfm-0002s8-FT
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:27:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTmfi-0002CV-AR
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617719233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WK/+Q636j9NbcjKaUJ90ilbbbJkCMwCKcdTntGnBjDU=;
 b=EDJcuCL+8T9ztnKCEF6FLEfl6OA053nsYxw/lf1Myx04umfAABertBZbbTkUv1rDdozaiY
 NYluq7M2YNBCIf3g50uRZP4Ee7Xv0wJKK+cmlqAzNv0jI5vD39md+JJ8a4iGo36bmbkyCx
 /5Qa8Y2jOXoVTDj3DHOHhshRb9e017o=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-En0XvupUO_-TVeM-4cwUsA-1; Tue, 06 Apr 2021 10:27:10 -0400
X-MC-Unique: En0XvupUO_-TVeM-4cwUsA-1
Received: by mail-ej1-f70.google.com with SMTP id a22so5509267ejx.10
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 07:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WK/+Q636j9NbcjKaUJ90ilbbbJkCMwCKcdTntGnBjDU=;
 b=iMpseYxGdM4KzdoVQgV5XAqTC3WB4FAIHSJx+StsUqdvVuWP10RZzM/iDyYnE8AwPA
 sBRURLGLWOT4E9nx0lepfwzG+mZGeSomJSFfiqcmJNQxljsuxrO0MY9O1/q/Znh7RwPz
 pKrd+uJLGCKFouZBtAnrH/zALR2ddaXH2hcqV0iOAMOLWBplRou6EXsdA7rT1JY4MWqS
 oN4hLniPzMhNXQp5nDq94WMlypvKht1DOfZC1bip4/Kf61bgQZJ/810f6joYpohNMEi0
 VW4JhcPeEZfQPlw6YmplYTxrmNirz4YQKA9m/Kv8JAcrrr2LtmheiKeByO2o7ypk63qT
 yS+w==
X-Gm-Message-State: AOAM530hsLQX05wbage/3GUJVWcb15eSq7Wvug8ZEmB2Ks9qSHx2t8wF
 VZ8NEKTY0HEm/yhXNw0Z6KOc2IUknJiD4lWtBKwkKtpaddXihdS3FfG1Wf77kUwUgyttG5+Mbxh
 lgGpsy+Ro9OboU4I=
X-Received: by 2002:a17:906:1f89:: with SMTP id
 t9mr5727142ejr.144.1617719229107; 
 Tue, 06 Apr 2021 07:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1KmlGhBb8gxPTr5JvaWzdM/WDrrSe1REYlo9tM/odf6In/q8uqL5lTJZtEntgRWjhKykvvw==
X-Received: by 2002:a17:906:1f89:: with SMTP id
 t9mr5727120ejr.144.1617719228860; 
 Tue, 06 Apr 2021 07:27:08 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id t15sm14132064edw.84.2021.04.06.07.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 07:27:08 -0700 (PDT)
Subject: Re: [PATCH-for-6.0 1/2] disas/arm-a64.cc: Fix build error
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 Eric Blake <eblake@redhat.com>
References: <20210320041854.68668-1-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <06a9d6c3-b0e6-9aac-0d97-979ef319d353@redhat.com>
Date: Tue, 6 Apr 2021 16:27:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210320041854.68668-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org, Kamil Rytarowski <kamil@netbsd.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Still worth 6.0 IMO.

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

+Kamil & Eric for:

https://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg03321.html
https://www.mail-archive.com/qemu-devel@nongnu.org/msg450478.html

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


