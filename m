Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E686FDCD9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 13:37:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwi7G-0000VF-G8; Wed, 10 May 2023 07:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pwi7F-0000UY-2V
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:36:17 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pwi7C-0006KC-BU
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:36:16 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 458EC5F3F7;
 Wed, 10 May 2023 14:36:05 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:2::1:11] (unknown [2a02:6b8:b081:2::1:11])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (smtpcorp/Yandex) with ESMTPSA id 3aTRNR1MeOs0-ofZn6ref; 
 Wed, 10 May 2023 14:36:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683718564; bh=GthnhyQcili3hiMiiIj2c7yGrvQkDEiVK/JoVGWPOuI=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=bf7N4yz1/DGMIcp/nnTx2RIwwzKmDfumGQwt/32gB5D1z65YeSXVd+Yp/Ml1eRT8l
 +CS7gLBdDWYNQyhCSngMzuXPniF6Bsf0sWdaWP8Ge7ofFVKNhnBo3nGzvPkosUac/B
 7LLFXsu/etjYh/PkqD4kXNwbVDXdLI0ezp6r06R0=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <20efd1c7-5f63-73db-6564-5e6f1adf99ae@yandex-team.ru>
Date: Wed, 10 May 2023 14:36:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 04/10] configure: add --disable-colo-proxy option
Content-Language: en-US
To: quintela@redhat.com, "Zhang, Chen" <chen.zhang@intel.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "lukasstraub2@web.de" <lukasstraub2@web.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Jason Wang <jasowang@redhat.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-5-vsementsov@yandex-team.ru>
 <MWHPR11MB0031A6901E847CA3ED49E9AF9B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <87mt2dbb3k.fsf@secure.mitica>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <87mt2dbb3k.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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

On 09.05.23 21:42, Juan Quintela wrote:
> "Zhang, Chen" <chen.zhang@intel.com> wrote:
>>> -----Original Message-----
>>> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>> Sent: Saturday, April 29, 2023 3:49 AM
>>> To: qemu-devel@nongnu.org
>>> Cc: lukasstraub2@web.de; quintela@redhat.com; Zhang, Chen
>>> <chen.zhang@intel.com>; vsementsov@yandex-team.ru; Paolo Bonzini
>>> <pbonzini@redhat.com>; Marc-André Lureau
>>> <marcandre.lureau@redhat.com>; Daniel P. Berrangé
>>> <berrange@redhat.com>; Thomas Huth <thuth@redhat.com>; Philippe
>>> Mathieu-Daudé <philmd@linaro.org>; Jason Wang <jasowang@redhat.com>
>>> Subject: [PATCH v4 04/10] configure: add --disable-colo-proxy option
>>>
>>> Add option to not build filter-mirror, filter-rewriter and colo-compare when
>>> they are not needed.
>>
>> Typo: This patch still build the filter-mirror/filter-redirector in filter-mirror.c.
>> Please remove the "filter-mirror" here.
>> Other code look good to me.
> 
> Vladimir, I was doing this myself, with the bit attached.
> 
> But then I noticed that one needs to also disable
> tests/qtest/test-filter-mirror and test-filter-rewriter.

Hmm, but we decided not touch filter-mirror in this patch, only filter-rewriter.

And there is no tests/qtest/test-filter-rewriter test.

> 
> Can you resend with that fixed?  Or I am missing something more
> fundamental.
> 
> Thanks, Juan.
> 
>>> --- a/net/meson.build
>>> +++ b/net/meson.build
>>> @@ -1,13 +1,10 @@
>>>   softmmu_ss.add(files(
>>>     'announce.c',
>>>     'checksum.c',
>>> -  'colo-compare.c',
>>> -  'colo.c',
>>>     'dump.c',
>>>     'eth.c',
>>>     'filter-buffer.c',
>>>     'filter-mirror.c',
>>> -  'filter-rewriter.c',
>>>     'filter.c',
>>>     'hub.c',
>>>     'net-hmp-cmds.c',
>>> @@ -19,6 +16,16 @@ softmmu_ss.add(files(
>>>     'util.c',
>>>   ))
>>>
>>> +if get_option('replication').allowed() or \
>>> +    get_option('colo_proxy').allowed()
>>> +  softmmu_ss.add(files('colo-compare.c'))
>>> +  softmmu_ss.add(files('colo.c'))
>>> +endif
>>> +
>>> +if get_option('colo_proxy').allowed()
>>> +  softmmu_ss.add(files('filter-rewriter.c'))
>>> +endif
>>> +
>>>   softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
> 
> This is the change needed, right?

No, we decided to keep filter-mirror as is.

> 
> diff --git a/net/meson.build b/net/meson.build
> index 6f4ecde57f..e623bb9acb 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -4,7 +4,6 @@ softmmu_ss.add(files(
>     'dump.c',
>     'eth.c',
>     'filter-buffer.c',
> -  'filter-mirror.c',
>     'filter.c',
>     'hub.c',
>     'net-hmp-cmds.c',
> @@ -23,7 +22,7 @@ if get_option('replication').allowed() or \
>   endif
>   
>   if get_option('colo_proxy').allowed()
> -  softmmu_ss.add(files('filter-rewriter.c'))
> +  softmmu_ss.add(files('filter-rewriter.c', 'filter-mirror.c'))
>   endif
> 

-- 
Best regards,
Vladimir


