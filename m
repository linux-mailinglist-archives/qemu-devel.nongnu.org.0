Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FB56404DB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:40:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p13RE-00048s-DW; Fri, 02 Dec 2022 05:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p13RB-000472-UM
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:38:34 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p13R9-0006s6-TM
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:38:33 -0500
Received: by mail-wr1-x436.google.com with SMTP id y16so7183199wrm.2
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 02:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RY4sGq6ms1+IlvCLmkZ3BI4/p6p+Ce/MbN+cfQweZ90=;
 b=pS7z7pezHrvyn5/JviuMr0kL2oOS52dkR+Wrc7O5IcpqzPyPUZ2MyuDNHDkTE1xMyh
 U9rS6SXngowOBNAzwyiOVfb0b0r6ZVAVCv74c4Bq9jH6JUlo2hB0t4FCfWlUZFrrvFZT
 NkEP/anpN433kaXL1xyZFdXDHJkFzjg53GGumb+otB1QDYZyElWDUap0eBzbhlVeIxEq
 1Wj539iyBkBRTaocfqYX9g3UJTbz1eOyco+2/lFxyUPLZzEuLwE0DFbxnaPjiiRNKKZ2
 bU0KG9fbwldlHieMr2TzRqiD1dODRuryW04UoaC56HuGGGkSyyLC8saWcBOjrKsqzMu7
 ddUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RY4sGq6ms1+IlvCLmkZ3BI4/p6p+Ce/MbN+cfQweZ90=;
 b=8EGfGJfMsbfDpQYe2nhHuaJCqYob0cvfC/4YZuMkpPHlo49s3B0NWSCHQzVC3+t7Nq
 GKA0EoSfLK8IejwhpmB1kwVq/mcLsLR1jXoRezBLD0hE4CbwHIBY85eS1B7IaJ+fJg5e
 R0ScWQSkg9bDFG8qe7ssFXtf37zF9vN5Kc5imYCjM8LAzj01lNpUEZKdfjTZSCFR6J5b
 K7V1EwRYKO6vP8vNqBAjJuaerIPN/2FOqHgSB2X8J6ESdIjz8+EPnHn/I9dVrajAGBh1
 Gb5Gqw8k/THbW68/EyfYymqxZfFxiIAlzJFZ1GREJlJeY75Cf1HTa0cspkXOFTU7PRbV
 2hww==
X-Gm-Message-State: ANoB5plMCB31Mh2g+IW4J+XIeDLkrQZCTQbtdOTAhog+v6hnEGwoKL0F
 aJzU43LYFaO49xfIMjajF5fwYw==
X-Google-Smtp-Source: AA0mqf7eWXPIAFKiqlfqPTpidg+6qjtk2JWxrrXDDZf2ZR7bVc3fGCL1p2h2E5ovVnhsiqZXZ1QPOw==
X-Received: by 2002:adf:fb4c:0:b0:236:5270:735e with SMTP id
 c12-20020adffb4c000000b002365270735emr32213783wrs.659.1669977509372; 
 Fri, 02 Dec 2022 02:38:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c315100b003cfd64b6be1sm16259832wmo.27.2022.12.02.02.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 02:38:28 -0800 (PST)
Message-ID: <4b143736-d5a4-ac75-3671-9566a00707af@linaro.org>
Date: Fri, 2 Dec 2022 11:38:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [QEMU][PATCH v2 05/11] include/hw/xen/xen_common: return error
 from xen_create_ioreq_server
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: stefano.stabellini@amd.com, alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-6-vikram.garhwal@amd.com>
 <a45c902a-043d-5256-7961-40c8aabd89b4@linaro.org>
In-Reply-To: <a45c902a-043d-5256-7961-40c8aabd89b4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/12/22 08:19, Philippe Mathieu-Daudé wrote:
> Hi Stefano and Vikram,
> 
> On 2/12/22 03:59, Vikram Garhwal wrote:
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> This is done to prepare for enabling xenpv support for ARM architecture.
>> On ARM it is possible to have a functioning xenpv machine with only the
>> PV backends and no IOREQ server. If the IOREQ server creation fails,
>> continue to the PV backends initialization.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   include/hw/xen/xen_common.h | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
>> index 77ce17d8a4..6510ac15e0 100644
>> --- a/include/hw/xen/xen_common.h
>> +++ b/include/hw/xen/xen_common.h
>> @@ -467,9 +467,10 @@ static inline void xen_unmap_pcidev(domid_t dom,
>>   {
>>   }
>> -static inline void xen_create_ioreq_server(domid_t dom,
>> -                                           ioservid_t *ioservid)
> 
> How long are we supposed to maintain this code? Per [*]:
> 
>    In general XenProject.org supports stable branches for 18 months full
>    support plus 18 months security fixes. When a new X.Y.0 release is
>    made there is usually one more release on the to-be-retired stable
>    branch to mop up any loose patches sitting in the repository at which
>    point the branch is retired.
> 
> 4.17 was just released. 4.5 was 7 years ago. IIUC EOL'ed 4 years ago.
> 
> [*] 
> https://wiki.xenproject.org/wiki/Xen_Project_Maintenance_Releases#Stable_Maintenance_Branches

+Paolo for commit 14efd8d3b5 ("meson, configure: move Xen detection to 
meson"):

     xen_libs = {
       '4.11.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 
'xenforeignmemory', 'xengnttab', 'xenevtchn', 'xentoolcore' ],
       '4.10.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 
'xenforeignmemory', 'xengnttab', 'xenevtchn', 'xentoolcore' ],
       '4.9.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 
'xenforeignmemory', 'xengnttab', 'xenevtchn' ],
       '4.8.0': [ 'xenstore', 'xenctrl', 'xenforeignmemory', 
'xengnttab', 'xenevtchn' ],
       '4.7.1': [ 'xenstore', 'xenctrl', 'xenforeignmemory', 
'xengnttab', 'xenevtchn' ],
       '4.6.0': [ 'xenstore', 'xenctrl' ],
       '4.5.0': [ 'xenstore', 'xenctrl' ],
       '4.2.0': [ 'xenstore', 'xenctrl' ],
     }

According to repology for the 'xen' package:

    FreeBSD (ports):    4.16
    Debian 11:          4.14.5
    Fedora 35:          4.16.2
    Ubuntu 20.04:       4.11.3
    OpenSUSE Leap 15.3: 4.14.1
    RHEL 8:             ?


