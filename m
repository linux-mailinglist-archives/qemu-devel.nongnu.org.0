Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D13696565
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:52:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvih-0002N8-E9; Tue, 14 Feb 2023 08:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRviP-0002MC-NZ
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:51:26 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRviN-0003ZY-L4
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:51:25 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 1A8AF6028A;
 Tue, 14 Feb 2023 16:51:16 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b433::1:3c] (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 EpjE200Ra0U1-1TXKJMEJ; Tue, 14 Feb 2023 16:51:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676382675; bh=hPtYzxQsT7yw4DeGORjBv4Ib1FYBLYMWk47tA5fNjgg=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=SewKxWCFlno4a85IGS+Fs6o+yvof9lnKTFwKN1eW7Dd4cky0ZYgBLWS6UBLZZ6B7O
 XbTM/Jw6KfA9zJoFJEtYCAmGS79im2AC29bz4lZTB4/c7tDdd0b77/tnLsI5U9X4WA
 OJ3Wmppmm3WecJgqwyMYMLJoKBZX2BhSo0fD0sWw=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <915de384-35c2-403b-81e5-2406ab4fcafa@yandex-team.ru>
Date: Tue, 14 Feb 2023 16:51:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 14/16] qapi: deprecate "device" field of DEVICE_* events
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, eduardo@habkost.net,
 pbonzini@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 philmd@linaro.org, den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-15-vsementsov@yandex-team.ru>
 <Y+pFe4bRCqbJJbp0@redhat.com> <87bklwoce9.fsf@pond.sub.org>
 <Y+ts1vBvI+IEH//K@redhat.com> <87fsb8jw7r.fsf@pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <87fsb8jw7r.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 14.02.23 14:57, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Tue, Feb 14, 2023 at 09:54:22AM +0100, Markus Armbruster wrote:
>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>>
>>>> On Mon, Feb 13, 2023 at 05:01:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>>> The device field is redundant, because QOM path always include device
>>>>> ID when this ID exist.
>>>>
>>>> The flipside to that view is that applications configuring QEMU are
>>>> specifying the device ID for -device (CLI) / device_add (QMP) and
>>>> not the QOM path. IOW, the device ID is the more interesting field
>>>> than QOM path, so feels like the wrong one to be dropping.
>>>
>>> QOM path is a reliable way to identify a device.  Device ID isn't:
>>> devices need not have one.  Therefore, dropping the QOM path would be
>>> wrong.
>>>
>>>> Is there any real benefit to dropping this ?
>>>
>>> The device ID is a trap for the unwary: relying on it is fine until you
>>> run into a scenario where you have to deal with devices lacking IDs.
>>
>> When a mgmt app is configuring QEMU though, it does it exclusively
>> with device ID values. If I add a device "-device foo,id=dev0",
>> and then later hot-unplug it "device_del dev0", it is pretty
>> reasonable to then expect that the DEVICE_DELETED even will then
>> include the ID value the app has been using elsewhere.
> 
> The management application would be well advised to use QOM paths with
> device_del, because only that works even for devices created by default
> (which have no ID), and devices the user created behind the management
> application's back.
> 
>> If the mgmt app is using IDs everywhere when dealing with a device,
>> then trap effectively doesn't exist for their usage scenario.
> 

What if we go one step further and deprecate "id" in device_add / device_del as well?

So that user will have to use qom path also in device_add. We may return an error if user don't specify "machine/peripheral/" prefix.. Or allow to create device with any QOM path?

-- 
Best regards,
Vladimir


