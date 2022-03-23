Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573BF4E5818
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:07:20 +0100 (CET)
Received: from localhost ([::1]:36700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5OB-0004NS-6a
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:07:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX5Mr-0002qD-AS
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:05:57 -0400
Received: from [2607:f8b0:4864:20::632] (port=39859
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX5Mp-0006VR-Re
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:05:57 -0400
Received: by mail-pl1-x632.google.com with SMTP id g3so2284824plo.6
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UZ6ajBIFKAUSiRy/qehKX4mSV4ShrE5/9XUUJRU6nAk=;
 b=kmQPWiOSsacpgLxKeMLtar5UfD1ZydwfFBiXVpFMZbxAQW8srByqlVx9PHpyyOilgF
 X8506SzvhpcGwbGaaUCGrJWU2t3GlPC0OkApybAwL0SUujOiMsa87bcFUql9QvHiSQDU
 DlShDl+KDCKSnxfEsTBnOfOquewk/kObrisY71HF2Hr0qdm9U+fr00M3SNsqFqLZ3BWd
 +a8XnBkdpnhn6NRFn8ocXf/WqCYCptNayGr2ITQZZYqg/OBmI9EHzyfyc6RtoxHXCAqO
 V923NzhfIOTLIHUKw9J5GlQCKfWyT9Ezm9XtR9JZRe6FxBl3GjZFcdkZ4jWM2+yhspDY
 9rWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UZ6ajBIFKAUSiRy/qehKX4mSV4ShrE5/9XUUJRU6nAk=;
 b=REmgA237n7FRL55IF+CWVOP+1tUQdykOphVvht2GJ2CkW4SZwn4gDn0NYxiBfZpFZv
 4FTuGcXEb2l16mjT3M0ybE4K3aaRr32KOfYN0FP6JNjiKuDLZi7ZjZtKN/CNRLtDYMhX
 ZharoGB/iCdDdCP9gc0urdLBV1xtrYyJiLJ8iqxVIk/OY5gyxUAfEWb2Ja2DfL2kizkZ
 ML7ZJvP+P3SPlYCZvSmMd0ZpsPju+UcZWIFRGqlQWMOikuDE9tcr//CXJlmMUWOdyNRc
 JT6WZC0h7NzdpXxjlP9HpTzIoTkhKni2b4jm285mbzbZ/yluARt5cUDzSpwd4dqHFbe2
 Ic5w==
X-Gm-Message-State: AOAM53048+sstSgHSWQVfp4x8aMiMuC9z6P4jaOxVIjeYtPPO1lK7kMi
 89ibfYbi4DTJ76bDT+YVvWM=
X-Google-Smtp-Source: ABdhPJxOtgHp2W3zNoO3+f9ART1vFT1jXArwwJrMZ2LGfnvkRCPEHOEXvX9swlCscgzVCuTvoGIb1g==
X-Received: by 2002:a17:90b:17c3:b0:1c6:b0ff:abf with SMTP id
 me3-20020a17090b17c300b001c6b0ff0abfmr1090033pjb.24.1648058754444; 
 Wed, 23 Mar 2022 11:05:54 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 124-20020a621682000000b004f6a2e59a4dsm537109pfw.121.2022.03.23.11.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 11:05:54 -0700 (PDT)
Message-ID: <08b4756e-e27f-f8a1-8c9a-b0097c51bf3d@gmail.com>
Date: Wed, 23 Mar 2022 19:05:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/1] MAINTAINERS: Update maintainers for Guest x86 HAXM
 CPUs
Content-Language: en-US
To: "Wang, Wenchao" <wenchao.wang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <DM6PR11MB40905967203E4917E78C773487119@DM6PR11MB4090.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <DM6PR11MB40905967203E4917E78C773487119@DM6PR11MB4090.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, "Yuan, Hang" <hang.yuan@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Wenchao,

On 16/3/22 01:47, Wang, Wenchao wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> 
> index f2e9ce1da2..36f877cf74 100644
> 
> --- a/MAINTAINERS
> 
> +++ b/MAINTAINERS
> 
> @@ -492,7 +492,6 @@ Guest CPU Cores (HAXM)
> 
> ---------------------
> 
> X86 HAXM CPUs
> 
> M: Wenchao Wang <wenchao.wang@intel.com>
> 
> -M: Colin Xu <colin.xu@intel.com>
> 
> L: haxm-team@intel.com
> 
> W: https://github.com/intel/haxm/issues
> 
> S: Maintained
> 
> -- 
> 
> 2.17.1
> 
> Best Regards,
> 
> Wenchao
> 

Your patch is missing your Signed-off-by tag:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-emails-must-include-a-signed-off-by-line

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

