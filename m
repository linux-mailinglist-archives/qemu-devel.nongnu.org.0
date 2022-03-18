Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ED24DDB6C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:17:33 +0100 (CET)
Received: from localhost ([::1]:40606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDQ4-0005SE-8K
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:17:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVDGF-0008IL-IA
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 10:07:23 -0400
Received: from [2607:f8b0:4864:20::62d] (port=37782
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVDGD-0001Gv-TD
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 10:07:23 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n2so7036871plf.4
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 07:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0q1HcjYUqnmyItc5DrqiMrG7Yl1LzJEhHDG1dkuS69Y=;
 b=RlHIJLDFeG4TkmZesMDCshKfOUZF+9NhD6xPMrH8gZmP9B6KErriPsctYstMztOMRW
 yxwulMzzpWhc1+WbRmj3dqnU7kGCPfzO1SC8BSlOvWBgcMjNwVQq3rB6hk0pkUvI/h/e
 TDzI1T6ZKb7pcmBz0a0kr3WxPsndnXPzb8Q/SRtR6m6kIi+qHV8n6EsWIPnQ43joz5z2
 WYIAWbmNJyLQrysS+OpQyhq0qB+rFsetX9J7hHE1FKsGGuJX/05EQzI48P9MZdQgjMfw
 7Kn/kvyFMKOBUA8NN9VPkRxqrSWAdeAdtW2qB1nlNEqez/gx90QsANhXffkc0wGG9eUr
 hKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0q1HcjYUqnmyItc5DrqiMrG7Yl1LzJEhHDG1dkuS69Y=;
 b=Rx0qJZh9FcXB29dRyIPCDnDX3lbopLwUSKKwvWE1be7Of4AJ8YJFnwjc58T9Tb5Rfj
 Zj61+WGn25y6+WcV7yMNyhcX081FXlw7Or3I2/5CYfJrXAvtnWQnnNISOlNy1Ix9xar3
 bZWIzVRXMPryvszzC+DUIae9dphI4cRr0rro+N+dw3vru1b5/afshfVCnFRZ+1e5KFeY
 d0In/I9WtwehFES80S1ynv0nZNa0BUyta3dG8NOzCCQ2mEE4Ac+Na+wURcW1riJi3xEQ
 p3aCXFY0rIcjcwcBIASFdUF1wFLf6k5kk8EvOxI0OSbrQdR7BGrhWbN2x5U7LDMnaR9c
 fagQ==
X-Gm-Message-State: AOAM530Yq3nb7U9MRNAviLJV5dosUfrFjziEiKIZgSjifv+yxwarOfuy
 29rjRI8aoytfIbwIV+kxq08=
X-Google-Smtp-Source: ABdhPJyFumqFEDeamSKRGeSLnoDdZwsKMkNEbaj/svyQoFspLX0+QU4iHJZ76uhYoIPSem5LDv3alw==
X-Received: by 2002:a17:902:a3ca:b0:14f:d48e:aff3 with SMTP id
 q10-20020a170902a3ca00b0014fd48eaff3mr10148558plb.167.1647612440411; 
 Fri, 18 Mar 2022 07:07:20 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a056a000acb00b004f35ee129bbsm10654221pfl.140.2022.03.18.07.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 07:07:20 -0700 (PDT)
Message-ID: <f418548e-c24c-1bc3-4e16-d7a775298a18@gmail.com>
Date: Fri, 18 Mar 2022 15:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v3 17/36] pflash_cfi01/tdx: Introduce ram_mode of
 pflash for TDVF
Content-Language: en-US
To: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-18-xiaoyao.li@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220317135913.2166202-18-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 Connor Kuehl <ckuehl@redhat.com>, seanjc@google.com, qemu-devel@nongnu.org,
 erdemaktas@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 17/3/22 14:58, Xiaoyao Li wrote:
> TDX VM needs to boot with Trust Domain Virtual Firmware (TDVF). Unlike
> that OVMF is mapped as rom device, TDVF needs to be mapped as private
> memory. This is because TDX architecture doesn't provide read-only
> capability for VMM, and it doesn't support instruction emulation due
> to guest memory and registers are not accessible for VMM.
> 
> On the other hand, OVMF can work as TDVF, which is usually configured
> as pflash device in QEMU. To keep the same usage (QEMU parameter),
> introduce ram_mode to pflash for TDVF. When it's creating a TDX VM,
> ram_mode will be enabled automatically that map the firmware as RAM.
> 
> Note, this implies two things:
>   1. TDVF (OVMF) is not read-only (write-protected).
> 
>   2. It doesn't support non-volatile UEFI variables as what pflash
>      supports that the change to non-volatile UEFI variables won't get
>      synced back to backend vars.fd file.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>   hw/block/pflash_cfi01.c | 25 ++++++++++++++++++-------
>   hw/i386/pc_sysfw.c      | 14 +++++++++++---
>   2 files changed, 29 insertions(+), 10 deletions(-)

If you don't need a pflash device, don't use it: simply map your nvram
region as ram in your machine. No need to clutter the pflash model like
that.

NAcked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


