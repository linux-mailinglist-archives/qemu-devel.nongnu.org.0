Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15081F55C4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 15:28:48 +0200 (CEST)
Received: from localhost ([::1]:34714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj0me-0001D1-2B
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 09:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jj0bR-0000ZH-1l; Wed, 10 Jun 2020 09:17:14 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:53471)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jj0bA-0005Pu-EN; Wed, 10 Jun 2020 09:17:12 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MK3FW-1jVBD31luA-00LW1x; Wed, 10 Jun 2020 15:16:51 +0200
Subject: Re: [PATCH] hw/vfio/pci-quirks: Fix broken legacy IGD passthrough
To: Thomas Huth <thuth@redhat.com>
References: <20200610035102.20192-1-thuth@redhat.com>
 <706060db-46c4-2dee-d746-eba24e6b137d@redhat.com>
 <a8195883-fb78-0cc1-5e15-e100dcb807de@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c5be50d5-5158-ddcc-8de0-bc6c3cfce12a@vivier.eu>
Date: Wed, 10 Jun 2020 15:16:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a8195883-fb78-0cc1-5e15-e100dcb807de@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VBeeO+7Iq4bytTeZQxfuqhx7AtOwGydLvC/LfklugoNYYT36yRu
 blHQMtmhORBqNAmrMu+Ua+7aSAuuyParyfDch8cAzwbCpvdp/3dakGkniPbaLQSmG9ByyHO
 3RnqiZ/eP/me8A8IyF/W0gyBbTYmI0pLYPg0WMFSxJ7eygvIvAcMuhpG4bW3n5VWPxXvs0C
 Ftsc6hGcOYkEHzl36wtog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6zfHMcmCcdA=:eQ7nXlYR4RY+yKvHwkcWzw
 Zg6L6g0TAJrNKQFOiM0tR3lkbZp52i8l+6GjVavVQlzGskSm2tHESblzuKxVefs66fOsQ9JBN
 bsLGOly2AdD+n2PBrhBDCgM4l1rIg1x2PznLHeVqOJxBHEF7vpbg3fdGRJNlxYlQ0U1CIf88u
 uykmrbPeZMvRt0ii1iGz5lNWRKHMY1aN55/EqeWKE8nJ/374gWlelebrlwSLRQ9BOt0708VRy
 waiPU2VezNulmGXo4T2DWYYCbJ4fkbUZaB31fXPP6OUFGlSPdoubR/D9QXkjLCMOubRI6Sq1r
 px9DHjUO3brjWCX+KC/8XxlONPKK/H0RFgKW8le+KIkSWkPhZiQIlqXlZ4xUReFr1YBwO32LJ
 yNaWi6TrxkIWZLz8KsgA07n2zL0a+526LV0JdUBrclDPZonhKTmRIT2MRniF5q+Uk6IuGx1+h
 LgwRdgM5hTSheJgCbn99gtiGHR4igmqCaq3+v4k0flHjRLU0JAg12QpyjOYG7ABXBz5ZwIojU
 Sc878ys+EhwUEe/cElizWN8YdKlCDulC5T/xdWJjFtevof7ZfCL34KePyFThizTU9FrLtbxdx
 2uOUF5waw8MCAPkdLIlAK9DuNmJqnyte+rc3UlND5iyh/f94kGGvP/WLXtKJGV+kFkbBObVXY
 E+1ym2HzNofDUNqWOxg5lwXw3qzYSyX7j4l0YZDclNAE/afbiFfvgdA87IfDELi4qFz32gjBY
 KSYgoQzeuwVCNvL99/N2WRIAA2mitYe6Uopg34/Q3f3OJ7gdXcmxBaiz6mWh5BTb9xkvexjPw
 tuogfrVSUZflHIX8gRKl9eQ1rzfM9f/ZUiNG3nlQvHPKgv+YFQ=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 09:10:20
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/06/2020 à 09:50, Thomas Huth a écrit :
> On 10/06/2020 09.31, Philippe Mathieu-Daudé wrote:
>> On 6/10/20 5:51 AM, Thomas Huth wrote:
>>> The #ifdef CONFIG_VFIO_IGD in pci-quirks.c is not working since the
>>> required header config-devices.h is not included, so that the legacy
>>> IGD passthrough is currently broken. Let's include the right header
>>> to fix this issue.
>>>
>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1882784
>>> Fixes: 29d62771c81d8fd244a67c14a1d968c268d3fb19
>>>        ("hw/vfio: Move the IGD quirk code to a separate file")
>>
>> What about shorter tag?
>>
>> Fixes: 29d62771c81 ("vfio: Move the IGD quirk code to a separate file")
> 
> I always forget whether to use the short or the long version for
> "Fixes:" ... this can hopefully be fixed (if necessary) when the patch
> gets picked up.

you can add in your ~/.gitconfig

[alias]
        showfix = log -1 --format=fixes
[pretty]
        fixes = Fixes: %h (\"%s\")%nCc: %ae

and then:

$ git showfix 29d62771c81d8fd244a67c14a1d968c268d3fb19
Fixes: 29d62771c81d ("hw/vfio: Move the IGD quirk code to a separate file")

Thanks,
Laurent

