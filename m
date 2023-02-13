Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D836946DB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:23:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYnF-0005Re-PF; Mon, 13 Feb 2023 08:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYnE-0005RV-Gj
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:22:52 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYnD-00067v-1c
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:22:52 -0500
Received: by mail-wm1-x32b.google.com with SMTP id o36so8712146wms.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 05:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1A+hzqjPxT+4DOD2Clor2Rf22BWpVRoVTeuMJdjJdSQ=;
 b=P93g+XZ0EyepZoMKeFFCK3l4vONYXE1cVkoRZ65cZfQHijuLJPscPkcdhVNcjm01gv
 682+zigPBptiRh72tzDHiPFcWcBArHoCzjLZxG6aRvwnpqK9HKIb/MtOBwrQ3XJ0NLdj
 DPlNKmBgP+nLm9CanzlcQ6Fqglqc3jVLbw5haM+McBvZTUZfObBMYyAB3jsbihyw4Cp6
 66N+mb6LU992wHEWYa63RGakRjvYUsJyJV3Hc7QFtdE0D6LmDdAzBIbulhDDHGqFBp2j
 qAN3qUGB3hur7nxU/lowVJ1C+/CO4IngEZ9SjDtIY0liIAnL9iRn94SCRAvR0l7CCtiM
 qVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1A+hzqjPxT+4DOD2Clor2Rf22BWpVRoVTeuMJdjJdSQ=;
 b=uDZM7mV2MNU4gmF/SbeVDZcad3IzWppOHlvChDfTAtaaSqT1Ybp/2BYGrbRbciWjT7
 L4f8jeCqf+3QhG9RQb33t/6Nrgt2ky8LTLf91EwgLdshAIDG1gd+s0h2/w7hUCDx65pL
 ib4IohMCKBCQtqCF/7KRhr/JS4u3ViqEZeuvQJkumOCYGdlNNQZrEg2H+F+L8Jt9cE+n
 d0J767slliNJzsF8SGRYKrUbyocBRmlnyRV+iufFYt2odi9Eg7cMjVDclBIsJuEdS+E2
 B7v1iH32z6WNnMTb6sz+huniQ+19aK56mbD2Y6u5fVw/Ss1WCzGTl1vTmRHIQFZKnObE
 brJw==
X-Gm-Message-State: AO0yUKVED6fux1GaGdStxAGqZMuW98Spx4iTvUEreQKOeMC6NYKqf04K
 n0uidR+hunoL560hXfKLIfBPCw==
X-Google-Smtp-Source: AK7set+lw16bmHDlrGJK5QC0pramrfLc58qEd6hbSwKftWZql+/dJgUk9ksCb8Y4zotNM7S3dRzSIg==
X-Received: by 2002:a05:600c:1713:b0:3da:fb3c:c1ab with SMTP id
 c19-20020a05600c171300b003dafb3cc1abmr18854203wmn.0.1676294569364; 
 Mon, 13 Feb 2023 05:22:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b39-20020a05600c4aa700b003dc433bb5e1sm13821197wmp.9.2023.02.13.05.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 05:22:49 -0800 (PST)
Message-ID: <bbb7d4dc-ff47-d363-ad6b-ffd4f8d4f9bb@linaro.org>
Date: Mon, 13 Feb 2023 14:22:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [RFC 30/52] i386: Drop nr_dies and nr_modules CPUX86State
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-31-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213095035.158240-31-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/2/23 10:50, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Since CPUState has the complete topology information, there's no need
> to keep i386 architecture specific topology.
> 
> This avoids the fragmentation of topological information.
> 
> Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/i386/x86.c         | 4 ----
>   target/i386/cpu.c     | 7 +++----
>   target/i386/cpu.h     | 8 --------
>   target/i386/kvm/kvm.c | 2 +-
>   4 files changed, 4 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


