Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE76EA653
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 10:53:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppmVw-0006e2-9Z; Fri, 21 Apr 2023 04:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppmVu-0006do-5p; Fri, 21 Apr 2023 04:53:06 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppmVk-00044d-MA; Fri, 21 Apr 2023 04:52:59 -0400
Received: from mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:2cab:0:640:424b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 7313F60263;
 Fri, 21 Apr 2023 11:52:46 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8816::1:4] (unknown
 [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id jqaw7915VSw0-8sjQnloM; Fri, 21 Apr 2023 11:52:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682067165; bh=PtB7NU6xvgaS3HdZNg4DrHlYjc2CJ5B46X4usZ83jbc=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Ksw1ucmngR4rEvFZceaKdlDl0GgDY2MrEka9mB3Gww5w8oo9+BenaXkU3bRoXb4tR
 TQJMeJPkIWAZXACg++5cnZdf5UCA9X4xTTApfLR+GkkSvMHxLYFDZsZH7eTAuWQPE0
 wMEEQDNpVYIrOUHYBX3SkYitA6QksUAqS3H208jQ=
Authentication-Results: mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <7f576196-db7e-e359-1285-8cc474486312@yandex-team.ru>
Date: Fri, 21 Apr 2023 11:52:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/4] configure: add --disable-colo-filters option
Content-Language: en-US
To: "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "michael.roth@amd.com" <michael.roth@amd.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "Zhang, Hailiang" <zhanghailiang@xfusion.com>,
 "philmd@linaro.org" <philmd@linaro.org>, "thuth@redhat.com"
 <thuth@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "dave@treblig.org" <dave@treblig.org>, "hreitz@redhat.com"
 <hreitz@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-5-vsementsov@yandex-team.ru>
 <MWHPR11MB0031567319A3C4CE499F3CF99B639@MWHPR11MB0031.namprd11.prod.outlook.com>
 <3c5aa49f-ca2a-5c73-befc-81377cc331b0@yandex-team.ru>
 <MWHPR11MB00315E99ED447760E8DF6A1E9B609@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <MWHPR11MB00315E99ED447760E8DF6A1E9B609@MWHPR11MB0031.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21.04.23 05:22, Zhang, Chen wrote:
> 
> 
>> -----Original Message-----
>> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> Sent: Thursday, April 20, 2023 7:26 PM
>> To: Zhang, Chen <chen.zhang@intel.com>; qemu-devel@nongnu.org
>> Cc: qemu-block@nongnu.org; michael.roth@amd.com; armbru@redhat.com;
>> eblake@redhat.com; jasowang@redhat.com; quintela@redhat.com; Zhang,
>> Hailiang <zhanghailiang@xfusion.com>; philmd@linaro.org;
>> thuth@redhat.com; berrange@redhat.com; marcandre.lureau@redhat.com;
>> pbonzini@redhat.com; dave@treblig.org; hreitz@redhat.com;
>> kwolf@redhat.com; lizhijian@fujitsu.com
>> Subject: Re: [PATCH v2 4/4] configure: add --disable-colo-filters option
>>
>> On 20.04.23 12:09, Zhang, Chen wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>>> Sent: Thursday, April 20, 2023 6:53 AM
>>>> To: qemu-devel@nongnu.org
>>>> Cc: qemu-block@nongnu.org; michael.roth@amd.com;
>> armbru@redhat.com;
>>>> eblake@redhat.com; jasowang@redhat.com; quintela@redhat.com;
>> Zhang,
>>>> Hailiang <zhanghailiang@xfusion.com>; philmd@linaro.org;
>>>> thuth@redhat.com; berrange@redhat.com;
>> marcandre.lureau@redhat.com;
>>>> pbonzini@redhat.com; dave@treblig.org; hreitz@redhat.com;
>>>> kwolf@redhat.com; Zhang, Chen <chen.zhang@intel.com>;
>>>> lizhijian@fujitsu.com; Vladimir Sementsov-Ogievskiy
>>>> <vsementsov@yandex- team.ru>
>>>> Subject: [PATCH v2 4/4] configure: add --disable-colo-filters option
>>>>
>>>> Add option to not build COLO Proxy subsystem if it is not needed.
>>>
>>> I think no need to add the --disable-colo-filter option.
>>> Net-filters just general infrastructure. Another example is COLO also
>>> use the -chardev socket to connect each filters. No need to add the --
>> disable-colo-chardev....
>>> Please drop this patch.
>>
>> I don't follow your reasoning. Of course, we don't need any option like this,
>> and can simply include to build all the components we don't use. So "no
>> need" is correct for any --disable-* option.
>> Still, I think, it's good, when you can exclude from build the subsystems that
>> you don't need / don't want to maintain or ship to your end users.
> 
> Yes, I agree with your idea.
> 
>>
>> In MAINTAINERS these two filters are in "COLO Proxy" susbsystem. Is it
>> correct? What's wrong with adding an option to not build this subsystem? I
>> can rename it to --disable-colo-proxy.
> 
> The history is COLO project contributed QEMU filter framework and filter-mirror/redirector...etc..
> And the "COLO Proxy" susbsystem covered the filters do not means it belong to COLO.
> So, It is unreasonable to tell users that you cannot use filter-mirror/rediretor for network debugging
> Or other purpose because you have not enabled COLO proxy.

But we don't say it to users, as these filters are enabled by default.

But I see your point. And looking at filter-mirror.c I see that there is no relations with colo. Can't say this about filter-rewriter.c

So, absolutely correct would be just have separate options

--disable-net-filter-mirror
--disable-net-filter-rewriter

and for any other filter we want to be "disable-able", like options for block drivers (I mean --disable-parallels, --disable-qcow1, --disable-qed, etc for files describing these drivers in block/)


> 
>>
>>> But for COLO network part, still something need to do:
>>> You can add --disable-colo-proxy not to build the net/colo-compare.c  if it is
>> not needed.
>>> This file just for COLO and not belong to network filters.
>>
>> net/colo-compare.c is used only only for COLO, which in turn used only with
>> CONFIG_REPLICATION enabled, see patch 3. So, no reason to add separate
>> option for it, it should be disabled with --disable-replication.
> 
> Yes, and as Lukas said, COLO is the only user for the filter-rewriter currently.

So, maybe simply move filter-rewriter.c under CONFIG_REPLICATION, if it's needed only for COLO?

> It is more appropriate to add filter-rewriter replace the filter-mirror here.
> I saw the patch 3, it is better to move it to this patch.

Hmm what do you mean? Both filter-rewriter and filter-mirror are now handled in this patch, so what to replace?

> 
> Thanks
> Chen
> 
>>
>> --
>> Best regards,
>> Vladimir
> 

-- 
Best regards,
Vladimir


