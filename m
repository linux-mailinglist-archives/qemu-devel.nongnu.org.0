Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0897C697F1A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:06:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJM9-0002Wj-7n; Wed, 15 Feb 2023 10:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSJM7-0002VZ-BT
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:05:59 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSJM5-0005d7-Ey
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:05:59 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so1759667wmb.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 07:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qVTOyPALKBWB7r2m2+zf7jhjSPuZE2k6bI4To5dSwGA=;
 b=PlGKQxfxaNOIbfJR7fcsjyZkore+ju1wTMK5OaGCryzUkVYzUQPN3TFm2QpAdhbhxH
 siJG7A7WXNpC4ZJk3aQ4JeC5bOXhWIrx6dRUsaZJwxyH57z/wi8RMoc8UjqQ/oDucNYt
 7pkSuKz9lfD+YsgMlWYSf6LSbyjk1R8c7BsgVz7cuLc9cvSrRNLoqeUa67iZ2e5TvS3H
 TPxSbnciP67JvzXSflsuY8NebJiAuG0QE0z1LZKmzUOeioxw3Xz9d3Evfsc0wtFOPYwE
 oqb5ccGM2jWiAVfvVHVOizx+e/XRoQYBO8uuf0LZBKmwFPuqGjCRnXQki4ALZ1AGOjK7
 dsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qVTOyPALKBWB7r2m2+zf7jhjSPuZE2k6bI4To5dSwGA=;
 b=xzu42YYQlquKSKN6ysfLOkaIeeL7EOOz/UGtM2EYa3M2Ar0agwAGe+mpqisKhuAEDk
 Guhvbo++F9Lyw9v7A1JMjCOqnbKJXL3Rd64aQERyLIYwLHZABS58M5lExPRRxlHIaPqw
 oN+nWD48IqLFWD658VUTngHR5xl2yeCQ2pQgInM1b/xBj7CCLfx27qThePaHF2LboM1V
 ZlAWNdPGPEZpX0bl3QKXlGqqQLUzHlr6AX6fC9NwyzaVzuzNvt17pBdBJd4G+LzbWX64
 nqKsfv1O3RWKba4ERAfLfNX/WMByxqB4RwgPODHw5wi/rEO/YyURmIkAtcFicCqI8Zfk
 kmUA==
X-Gm-Message-State: AO0yUKWhLpHn9g7vKbzD79rPQ4XJ0OABczlZ2r8eCfxoboueeve4hwEu
 gq0ADDDlGA57E/fO4ERfvstk0A==
X-Google-Smtp-Source: AK7set/ThxA68NktCP2O1FHHrT8fJFIBj85QgDuITcNXWGFZc2wullBvx7Skor4EFkrU7n1uiz3IyA==
X-Received: by 2002:a05:600c:4d93:b0:3df:e549:bd00 with SMTP id
 v19-20020a05600c4d9300b003dfe549bd00mr2507195wmp.1.1676473555871; 
 Wed, 15 Feb 2023 07:05:55 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c510300b003e2059c7978sm2075370wms.36.2023.02.15.07.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 07:05:55 -0800 (PST)
Message-ID: <a16ece12-fb6b-bae9-3e1d-69957aeef429@linaro.org>
Date: Wed, 15 Feb 2023 16:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 0/7] include/hw/pci include/hw/cxl: Clean up includes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, jonathan.cameron@huawei.com
References: <20221222100330.380143-1-armbru@redhat.com>
 <B98EF322-5449-4942-8718-D3504B863B96@gmail.com>
 <87edsremti.fsf@pond.sub.org> <20221222142149-mutt-send-email-mst@kernel.org>
 <87k02i7kr8.fsf@pond.sub.org> <20221224063930-mutt-send-email-mst@kernel.org>
 <871qmr9hx9.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <871qmr9hx9.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 15/2/23 14:28, Markus Armbruster wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
>> On Fri, Dec 23, 2022 at 06:27:07AM +0100, Markus Armbruster wrote:
>>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>>
>>>> On Thu, Dec 22, 2022 at 11:48:25AM +0100, Markus Armbruster wrote:
>>>>> Bernhard Beschow <shentey@gmail.com> writes:
>>>>>
>>>>>> Am 22. Dezember 2022 10:03:23 UTC schrieb Markus Armbruster <armbru@redhat.com>:
>>>>>>> Back in 2016, we discussed[1] rules for headers, and these were
>>>>>>> generally liked:
>>>>>>>
>>>>>>> 1. Have a carefully curated header that's included everywhere first.  We
>>>>>>>    got that already thanks to Peter: osdep.h.
>>>>>>>
>>>>>>> 2. Headers should normally include everything they need beyond osdep.h.
>>>>>>>    If exceptions are needed for some reason, they must be documented in
>>>>>>>    the header.  If all that's needed from a header is typedefs, put
>>>>>>>    those into qemu/typedefs.h instead of including the header.
>>>>>>>
>>>>>>> 3. Cyclic inclusion is forbidden.
>>>>>>
>>>>>> Sounds like these -- useful and sane -- rules belong in QEMU's coding style. What about putting them there for easy reference?
>>>>>
>>>>> Makes sense.  I'll see what I can do.  Thanks!
> 
> Commit f07ceffdf50.
> 
>>>> It would be even better if there was e.g. a make target
>>>> pulling in each header and making sure it's self consistent and
>>>> no circularity. We could run it e.g. in CI.
>>>
>>> Yes, that would be nice, but the problem I've been unable to crack is
>>> deciding whether a header is supposed to compile target-independently or
>>> not.  In my manual testing, I use trial and error: if it fails to
>>> compile target-independently, compile for all targets.  This is s-l-o-w.
> 
> To spice things up, we also have headers that provide additional
> contents in target-dependent context.  These need to be tested in both
> contexts.

Do we need to figure a way to get rid of this problem
in order to build a single qemu-system binary?

>> Yes and it's annoying for developers too.
>> Do we want to come up with a scheme for target-dependent files?
>> Name them target-X or put in a target/ directory?
> 
> I'd be in favour.  Sadly, I'm not able to push such an effort myself.
> 
>> We could also write checkpatch rules to disallow
>> including target specific headers in target independent files then.
> 
> Fortunately, that's pretty unlikely to compile :)
> 
>>> The other problem, of course, is coding it up in Meson.  I haven't even
>>> tried.


