Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07586A9544
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:32:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2hY-0002gf-LE; Fri, 03 Mar 2023 05:31:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2hS-0002f8-4g
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:31:44 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2hQ-0005bU-EC
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:31:41 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so3586944wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677839498;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MPI4xlqEP/5MOO+cl3JVzO/xy243T1q3M74xQyfYNvc=;
 b=hej85yf7NpWubitkWhegn17+uWCx/K0nCBQcEcwyqhlS8nJ7KFz8M+/jhFjU4IU8EZ
 88JWHDCFfVrqZckPjcvtAlzRhh4QDUSi8sVig3r7ZQhONC0vfRDkbxTZ/4Pcp+R42azv
 MteIguVWvEw7+b3tyXJ0bVh1ozcjWzmj9vsZWDKKJlxZDoBtLF13hYK/ndrzUtwcisAX
 vs/8JTM/Ab1Z7voC68gwUTK2vbWuHmewTxPqfR/QLcgETpbdMIavcen+D9txfaH3vNWa
 xoQmYrAWNiV8qX+bszRYPx7liUkf0E/ATy62qXegVdVyHNXzkFgPWp902ElglYqvyZIf
 YnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677839499;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MPI4xlqEP/5MOO+cl3JVzO/xy243T1q3M74xQyfYNvc=;
 b=Qs0LnzE+8E9l85XY7SD8HvUH60FBhhKFXPquuH75nxB5Lt6rGAGg/I9zvx6a1rUEBO
 oFR3ygxj+Ovd0K9x8w4ac0lHAwngdtGwgJiQuXzzGc2dGDz+C9+sRH1ZSuXqg6JZI+Ru
 ZWqEtkhv9SoJRd372nHdKDvt0XLBHsuQulaLmaBFjU7Bdtwa3kV6f5stC3nmvKaZIycj
 yDHIwA1MZn49fNZhgaXNFRJKWjbfUcBhbmc5zjFb1Ok6UbUrcRvGdHt9o3iC+GH/pIMj
 3TabSz4M1eSKT/2HEW3ZLrf/gA2SCXkioshdf+2kBkKIT5SbelCsQ2ZAOhfA1NLsx25x
 hEeg==
X-Gm-Message-State: AO0yUKXbw46SrJS4rHHIMW6oSZVvP5S7YVc4SHYV1BdV8j7adrNR05ng
 rhBStYxtAg73lTIsUcXi7cND2ps7Hr7nKK31
X-Google-Smtp-Source: AK7set9B/QRsLCcVg9WPsfihKPEe47Nd0YMcNB2aGBADm7UhICTD+bsz1gGdV7BaSdi5l4MuAWHsgQ==
X-Received: by 2002:a05:600c:470b:b0:3eb:29fe:fe19 with SMTP id
 v11-20020a05600c470b00b003eb29fefe19mr1200938wmo.34.1677839498737; 
 Fri, 03 Mar 2023 02:31:38 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003eb192787bfsm1981615wme.25.2023.03.03.02.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 02:31:38 -0800 (PST)
Message-ID: <76a219f8-8c5b-71f2-78ba-a5670e02f35b@linaro.org>
Date: Fri, 3 Mar 2023 11:31:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2] vfio: Fix vfio_get_dev_region() trace event
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>
References: <20230303074330.2609377-1-clg@kaod.org>
 <93a2b734-d3b1-27e8-32f4-d46342dc6b00@linaro.org>
 <f4f9fe64-0e79-08e7-7833-fd5c897424a8@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f4f9fe64-0e79-08e7-7833-fd5c897424a8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/3/23 10:45, Cédric Le Goater wrote:
> On 3/3/23 10:34, Philippe Mathieu-Daudé wrote:
>> On 3/3/23 08:43, Cédric Le Goater wrote:
>>> From: Cédric Le Goater <clg@redhat.com>
>>>
>>> Simply revert 'x8' to fix the typo and remove the ending '8'
>>>
>>> Fixes: e61a424f05 ("vfio: Create device specific region info helper")
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1526
>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>> ---
>>>   hw/vfio/trace-events | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>>> index 669d9fe07c..28e82541a2 100644
>>> --- a/hw/vfio/trace-events
>>> +++ b/hw/vfio/trace-events
>>> @@ -117,7 +117,7 @@ vfio_region_mmaps_set_enabled(const char *name, 
>>> bool enabled) "Region %s mmaps e
>>>   vfio_region_unmap(const char *name, unsigned long offset, unsigned 
>>> long end) "Region %s unmap [0x%lx - 0x%lx]"
>>>   vfio_region_sparse_mmap_header(const char *name, int index, int 
>>> nr_areas) "Device %s region %d: %d sparse mmap entries"
>>>   vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned 
>>> long end) "sparse entry %d [0x%lx - 0x%lx]"
>>> -vfio_get_dev_region(const char *name, int index, uint32_t type, 
>>> uint32_t subtype) "%s index %d, %08x/%0x8"
>>> +vfio_get_dev_region(const char *name, int index, uint32_t type, 
>>> uint32_t subtype) "%s index %d, %08x/%08x"
>>
>> 8 digits might be over-engineered, but at least is future-proof :)
> 
> well, yes, but it also depends on other possible outputs from the OS or,
> more important, from gdb when dumping memory. It it better if they match.
> 
> Since it is an hex number, may be I should add a '0x' prefix also ? That's
> a lot of versions for a 2 bytes patch ! :)

Per the coding style if you don't want to use the 0x prefix for
readability, add a "(in hex)" hint:
https://qemu-project.gitlab.io/qemu/devel/style.html#trace-events-style

