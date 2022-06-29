Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11A655F36C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 04:36:58 +0200 (CEST)
Received: from localhost ([::1]:43124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6NZZ-0005ss-BP
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 22:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1728850ad=damien.lemoal@opensource.wdc.com>)
 id 1o6NVg-0003pS-HY
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 22:33:00 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:5866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1728850ad=damien.lemoal@opensource.wdc.com>)
 id 1o6NVb-0006vH-CQ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 22:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656469970; x=1688005970;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JROgqbXtSTBOwPL+h/hzHl9kd3mc5jN+2/tR4/lpsxI=;
 b=GtLGJSM3hB3dmrSFEV+ukzjH1Ti0TwfdN8FU3s7zXZAkcFuzcR5BjfSP
 m31g6yQD69aO+KyC5kzWg9TjPJKWPc2Iw6xAtTpH0deXNFHG7xFC6tgaG
 o3aUsav6CyXky9160XyzTPXYndpUD3v2/b/nKOH2NDtfeoraZp41NwSsj
 50M+k3Ba1BsMwwXyS7MgmJzPx8wO7lLDlWX7snv/rPTtfSJR6/5f2IoMC
 cK+7rRC9L2Qa1jIY1JDOoHHEaCNQyE9IkIbY8l23FGw1jWDWLCb0O5bFb
 Bjo672A64nZTiocci/D73V08pwitCU37RPBglBNsIrGoCjXpE7lHDN5WJ Q==;
X-IronPort-AV: E=Sophos;i="5.92,230,1650902400"; d="scan'208";a="209217562"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2022 10:32:48 +0800
IronPort-SDR: +1Ce0kNI0BQFXkX1dYRjLV3OlLGdRuQpAX6RhMUg7S0T6BFpHCh3GSRfaktaVN4Yc/UY6GivS+
 kHq2A/HCFUa1cukLyKP/fkhrO1QbeNUSqaIIwR4lMgLsJEBuW+Jv1vZOKqKN8AOug+J2RgiliG
 4CfqrGMFQ0QZhX8mKCx6gZSpZ+wTNThQkO/IP+46ukaTv9s0QuE1TzIBAoBcNtgTMU6JfCioU4
 VjdCx0yR6WyWRPjGu73dzDPYt2+1nBjkDa+q9FJpvvUnAvAVPnC5hjvp5l9vHJRCGylWwEQuUt
 TQwhktlLLTjBzngx5axLqhTC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2022 18:55:09 -0700
IronPort-SDR: BvLP5QX5GCobCdLXe5mXmF+BDsnu2cCBGSyKdy5iyXX4q0yREq+LCBGS9HwqlWmGp7xX9drUSc
 UZCfRXYBpzlFkavdGeTtou4pjuuRUQU5oVj7Z6bd3wY+48zujx8MkK4QkbqWctRfwGTAvvF/Ol
 0NNkGIoG9A70Sqmk0r1G9poyWu7ewQpTgKHtoI3oAxUOewdMgXAGBVXfcMwf03LTUbMZeRor06
 0P7Unm+ZhgtCWzjtkNsZmJc0ceLdYMZr7yKPkLXe+IgheLj4VGfgw713IiL5KVjHHtqO+Yv1lo
 OM0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2022 19:32:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LXlqh6dNtz1Rwnl
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 19:32:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1656469968; x=1659061969; bh=JROgqbXtSTBOwPL+h/hzHl9kd3mc5jN+2/t
 R4/lpsxI=; b=EvFI1Ss01xZ1quROxY9iEpXiF3QkNEP0+0PIm6TSvtblv+gHg9a
 8O0yRq7X5EySysWMtgbYknXgNrRpDIGWcGvAc+7n4f6/4my2ksE/g4Bpn+sTkD55
 eKteb3u7FAX3eVSNAHnzeYzrefbUzUK/or/pdqr+BAmwIOn5YpUASSz1uVn2/aq3
 wiTXSK2iDMvDs28cpY3yZb8/MrdaYMKdzFjxhY3FbNByQgOsmH6NIGhS42pJklzD
 6qt9XjFpLLEejgMMgA2TPfyMhCW3A/4J1JXcqKdNs1TH3dMCOzU2VepTncFlO5mj
 7ZxPm6AmK1ty6sI80FecvDbZO/PKi75SuZQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2dpzhAZ12VFe for <qemu-devel@nongnu.org>;
 Tue, 28 Jun 2022 19:32:48 -0700 (PDT)
Received: from [10.225.163.99] (unknown [10.225.163.99])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LXlqf4s31z1RtVk;
 Tue, 28 Jun 2022 19:32:46 -0700 (PDT)
Message-ID: <0b1f5e9a-dabe-b791-ac30-7e2ab4b55f56@opensource.wdc.com>
Date: Wed, 29 Jun 2022 11:32:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v3 1/5] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel
 <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Hanna Reitz <hreitz@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu block <qemu-block@nongnu.org>
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-2-faithilikerun@gmail.com>
 <Yrm7iNLdIJjOjQmR@stefanha-x1.localdomain>
 <CAAAx-8LcxzKYsq1isvqaWEtF1JdUBp0wL8axLCm_eLR79jS_Dw@mail.gmail.com>
 <c74ebf91-1af0-8e29-28e0-9b4ee4580ae8@opensource.wdc.com>
 <CAAAx-8+6q9zLGO2Xzi9JaNFgkpHn0-eQyB8GijGx53zbFtsDCQ@mail.gmail.com>
 <20a3234d-eb6b-ee21-95d5-5ce18aa6c822@opensource.wdc.com>
 <CAAAx-8LmvU9sJycZ7PghGKWWj+RMJs5C3hz2j0Ta45Ks69=6PA@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8LmvU9sJycZ7PghGKWWj+RMJs5C3hz2j0Ta45Ks69=6PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=1728850ad=damien.lemoal@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/22 10:50, Sam Li wrote:
>>>>>>> +    rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
>>>>>>> +    g_autofree struct blk_zone_report *rep = g_new(struct blk_zone_report, nrz);
>>>>>>
>>>>>> g_new() looks incorrect. There should be 1 struct blk_zone_report
>>>>>> followed by nrz struct blk_zone structs. Please use g_malloc(rep_size)
>>>>>> instead.
>>>>>
>>>>> Yes! However, it still has a memory leak error when using g_autofree
>>>>> && g_malloc.
>>>>
>>>> That may be because you are changing the value of the rep pointer while
>>>> parsing the report ?
>>>
>>> I am not sure it is the case. Can you show me some way to find the problem?
>>
>> Not sure. I never used this g_malloc()/g_autofree() before so not sure how
>> it works. It may be that g_autofree() work only with g_new() ?
>> Could you try separating the declaration and allocation ? e.g.
>>
>> Declare at the beginning of the function:
>> g_autofree struct blk_zone_report *rep = NULL;
>>
>> And then when needed do:
>>
>> rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
>> rep = g_malloc(rep_size);
> 
> Actually, the memory leak occurs in that way. When using zone_mgmt,
> memory leak still occurs. Asan gives the error information not much so
> I haven't tracked down the problem yet.

See this:

https://blog.fishsoup.net/2015/11/05/attributecleanup-mixed-declarations-and-code-and-goto/

Maybe you can find some hints.

-- 
Damien Le Moal
Western Digital Research

