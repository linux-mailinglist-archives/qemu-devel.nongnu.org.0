Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291CB6F7E98
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 10:21:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puqgr-0000iX-DU; Fri, 05 May 2023 04:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puqgp-0000iO-DB
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:21:19 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puqgm-0008Kn-Gp
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:21:19 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:3f18:0:640:6450:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 2E5D35FF1D;
 Fri,  5 May 2023 11:21:08 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b438::1:20] (unknown
 [2a02:6b8:b081:b438::1:20])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 7LL7lF0OqmI0-JxSY34RP; Fri, 05 May 2023 11:21:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683274867; bh=eCimwoA7YO48HdmfgeqPM5F/RBjwOUrFmF50peI9OJA=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=zLP+t+Ui/Sm59FpWj4L8UgnPLTNKD3Vtjej4wDySVbPu4XVue9zuGD83bhkw33o1v
 HwxJmNHZu0tkZxuVoesYnXrVMwAVECX8ztk3PxUX/K+cNS3zMCLZJWcYfn1xB+XCSj
 YXnBYcOrttMPbjU0mPTaLS6fMlQAaPWBxprqj2XQ=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <e975fb61-3ecd-c1c1-2bf1-0572225076c4@yandex-team.ru>
Date: Fri, 5 May 2023 11:21:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 00/10] COLO: improve build options
Content-Language: en-US
To: "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "lukasstraub2@web.de" <lukasstraub2@web.de>,
 "quintela@redhat.com" <quintela@redhat.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <MWHPR11MB0031058F5CA0B21EAE6443EE9B729@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <MWHPR11MB0031058F5CA0B21EAE6443EE9B729@MWHPR11MB0031.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 05.05.23 10:56, Zhang, Chen wrote:
> 
>> -----Original Message-----
>> From: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
>> Sent: Saturday, April 29, 2023 3:49 AM
>> To:qemu-devel@nongnu.org
>> Cc:lukasstraub2@web.de;quintela@redhat.com; Zhang, Chen
>> <chen.zhang@intel.com>;vsementsov@yandex-team.ru
>> Subject: [PATCH v4 00/10] COLO: improve build options
>>
>> v4:
>> 01: add r-b by Lukas
>> 02: new
>> 03: - keep x-colo capability enum value unconditional
>>      - drop ifdefs in options.c and keep capability check instead
>>      - update stubs
>>      - add missed a-b by Dr. David
>> 04: keep filter-mirror untouched, add r-b by Juan
>>
>> others: new. Some further improvements of COLO module API. May be
>> merged separately.
>>
>> Hi all!
>>
>> COLO substem seems to be useless when CONFIG_REPLICATION is unset, as
>> we simply don't allow to set x-colo capability in this case. So, let's not compile
>> in unreachable code and interface we cannot use when
>> CONFIG_REPLICATION is unset.
>>
>> Also, provide personal configure option for COLO Proxy subsystem.
> This series looks good to me.
> Please add the new configure option related comments to docs/COLO-FT.txt, block-replication.txt, colo-proxy.txt.


Thanks! Will do.

-- 
Best regards,
Vladimir


