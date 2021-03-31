Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6B6350759
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 21:27:30 +0200 (CEST)
Received: from localhost ([::1]:46608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRgUy-0000Wv-RZ
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 15:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>)
 id 1lRgU2-0008Pe-KD; Wed, 31 Mar 2021 15:26:31 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:9327
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>)
 id 1lRgU0-0000EZ-DK; Wed, 31 Mar 2021 15:26:30 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4F9bvV1mrKz8PbN;
 Wed, 31 Mar 2021 15:28:22 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:from:to:cc:references:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=FuJEVLJ7H
 uvvvgEu5mkGbrF4fv8=; b=R+E2Vjd9sY5FXNVi6xg/308pe0SW9Mjh6R/pzLB1I
 xds9hYnsMDGaHi+6iIFoXC/cqHLgR+/K63vSJXxKuWYOSTP/7tLRcanUMT8ycmor
 yxc5fbN71D6dbCXwiVPp4B2p0Z5Vv965k5X0pT88MQopImduWS4TiBdRMzF9iE0P
 yk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:from:to:cc:references:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=E7s
 O3FleYI1Vs6cZr+3KlBnWAOUkvPXFbMZ/wLyYXG+NJQzYq5H/kgn5mHUMysXOYjZ
 cubUgbw24gChgTGc06rCOOHPgCXBipO85Ab/p3mSA9hwQb9KYVH/uXyslBMGzyq+
 GRKSStjqbmiyrWj1NKtu5deJ2v1JqMLeWzSp9T+k=
Received: from localhost
 (bras-base-toroon2719w-grc-39-142-114-123-227.dsl.bell.ca [142.114.123.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4F9bvV0NZ5z8PbK;
 Wed, 31 Mar 2021 15:28:22 -0400 (EDT)
Message-ID: <31adf621-ab77-3ac3-5995-501ac87426b3@comstyle.com>
Date: Wed, 31 Mar 2021 15:26:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH] migration: Remove time_t cast for OpenBSD
Content-Language: en-US
From: Brad Smith <brad@comstyle.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>, QEMU Trivial
 <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <YDNdAiOkEYOfmbhT@humpty.home.comstyle.com>
 <7eaad721-9d2a-83ed-00fc-80c8ee37e156@redhat.com>
 <26c9c34a-3872-c044-4b01-06d2eb4bfbb1@vivier.eu> <YEphaTV6uzhDEY7R@work-vm>
 <YEpj8MsBzqfRDTWo@redhat.com>
 <70bda12d-17fc-5e41-b723-e1409017a599@comstyle.com>
In-Reply-To: <70bda12d-17fc-5e41-b723-e1409017a599@comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 3/13/2021 6:33 PM, Brad Smith wrote:
> On 3/11/2021 1:39 PM, Daniel P. Berrang=C3=A9 wrote:
>> On Thu, Mar 11, 2021 at 06:28:57PM +0000, Dr. David Alan Gilbert wrote=
:
>>> * Laurent Vivier (laurent@vivier.eu) wrote:
>>>> Le 08/03/2021 =C3=A0 12:46, Thomas Huth a =C3=A9crit=C2=A0:
>>>>> On 22/02/2021 08.28, Brad Smith wrote:
>>>>>> OpenBSD has supported 64-bit time_t across all archs since 5.5=20
>>>>>> released in 2014.
>>>>>>
>>>>>> Remove a time_t cast that is no longer necessary.
>>>>>>
>>>>>>
>>>>>> Signed-off-by: Brad Smith <brad@comstyle.com>
>>>>>>
>>>>>> diff --git a/migration/savevm.c b/migration/savevm.c
>>>>>> index 52e2d72e4b..9557f85ba9 100644
>>>>>> --- a/migration/savevm.c
>>>>>> +++ b/migration/savevm.c
>>>>>> @@ -2849,8 +2849,7 @@ bool save_snapshot(const char *name, bool=20
>>>>>> overwrite, const char *vmstate,
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (name) {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstrcpy(sn-=
>name, sizeof(sn->name), name);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* cast below needed f=
or OpenBSD where tv_sec is=20
>>>>>> still 'long' */
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 localtime_r((const tim=
e_t *)&tv.tv_sec, &tm);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 localtime_r(&tv.tv_sec=
, &tm);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strftime(sn=
->name, sizeof(sn->name),=20
>>>>>> "vm-%Y%m%d%H%M%S", &tm);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> but the qemu_timeval from "include/sysemu/os-win32.h" still uses a=20
>>>> long: is this file compiled for
>>>> win32?
>>> Yep this fails for me when built with x86_64-w64-mingw32- (it's fine
>>> with i686-w64-mingw32- )
>> We could just switch the code to use GDateTime from GLib and thus
>> avoid portability issues. I think this should be equivalent:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_autoptr(GDateTime) now =3D g_date_tim=
e_new_now_local();
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_autofree char *nowstr =3D g_date_time=
_format(now,=20
>> "vm-%Y%m%d%H%M%s");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strncpy(sn->name, sizeof(sn->name), now=
str);
>
> Which way do you guys want to go? Something like above, remove the=20
> comment
> or some variation on the comment but not mentioning OpenBSD since it=20
> is no
> longer relevant?


Anyone?


