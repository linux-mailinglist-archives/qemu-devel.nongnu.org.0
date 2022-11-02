Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0384616B7C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 19:04:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqI53-00020c-9c; Wed, 02 Nov 2022 14:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqI51-00020A-2J; Wed, 02 Nov 2022 14:03:11 -0400
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqI4z-0007MG-En; Wed, 02 Nov 2022 14:03:10 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M734j-1oxiKP3ptP-008ebB; Wed, 02 Nov 2022 19:03:03 +0100
Message-ID: <65cd8dbb-e4d5-6559-d4c4-ae8d73b28a6e@vivier.eu>
Date: Wed, 2 Nov 2022 19:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] Fix some typos in documentation and comments
Content-Language: fr
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20221030105944.311940-1-sw@weilnetz.de>
 <ba75c126-68ae-5f63-d9c3-b1b4182df5b7@redhat.com>
 <45c8a3f8-bad0-e6fd-8aef-e3eba9eabc82@weilnetz.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <45c8a3f8-bad0-e6fd-8aef-e3eba9eabc82@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:R0Eptc6SaEursyxcHDQnmFTr5PPpbjeqiTU8qSf2TuOxMp/N8+a
 zNs9W6zOAVG0qHBjFBTEnRO8RwnPGJ/dwd40c3qAfaZeF1vTgTXc18d/KBOCuYLlikR7xXv
 0Ra6QKmZc+bYGybeByAdR4TsQjv4o4RdoihTNMYVBSIqSuB9fHepgCkPKPqWCC28y1z5bUx
 wEalzsNc8L8QZoDHPsXIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ic123BAxE90=:e5hBIQUfzcQJXszOxIN1hT
 o0UZowMO/X8xAOSVYER/ZyM8bOrF2mEjMJxLMnec8cpsjmTyX6JuvHogMDe/Y2LLD3B3AyHFB
 J5dwpQzZVrBuSXsFHPNQcOWaH9n6JYkFZ/rt+WeS4057+6Oh/68ALlMFiiyuERykfUoUVjmFy
 5t6jAFgDwiEpYne4c803Ac6bW6iIe/wZpwrGGqPv5N94WBoQcC2twjyf6X0cG3o675j8Z/bk1
 XKp/nRbvJRE9H8nBjY5c+EzzkDrCOZ+z1OTaMcFxBIRjRWrTzo1UtzpT0Lffg5I8Tby5T3jVa
 035SEhcXrNT4btuq858uwl4r/GWEgkIVVKx7DS+VztkuMKfELuK2+bz7j4aLLnydVdnLfWqb6
 JnphjG7pZGfOK2qt95uvesPwbPx5yuvfbstwnMPoIm0GqciGPRVCNM7Ji36zWN8Uk+8BGzwVY
 4VEr+9YTexYTth2feuctOeapIvr4Yekm/6TYp0wv3eFDj/F+9L36IVj/L5XtjkNN+42cuHmle
 RMZ9yVPK2/OmwYu6+sJNEzIAjx1EbwTBncTsK3yv7L5B2BVqBkJYKZzsXFxutexTMVbIBc8wE
 zIh9l4qkNMkl7r/xMlqLca+lq1G3g6iQPU0x262NaaLleME1JdPVHoZCIEwz2dBkHa1G455no
 DXPIKcrSUDmcFhv8PE+T98sYOtkXNTuEX3GWEEQ7tbdGzY0fRg0SsvOhF1teC+bR0SEl/QhSK
 dXwWX7Wv9Qnc2G899fEZUhqOQ2EyUlsRNGPg84j+FhYovhQvwRs5Uia4/miG1Bu067L8IX6jL
 vz9Oa1v
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 31/10/2022 à 14:22, Stefan Weil via a écrit :
> Am 31.10.22 um 08:35 schrieb Thomas Huth:
> 
>> On 30/10/2022 11.59, Stefan Weil wrote:
>>> Most of them were found and fixed using codespell.
>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>>
>>> v2: Fixes from Peter Maydell's comments
>>>
>>> My focus was fixing typos which are relevant for the generated documentation.
>>>
>>> codespell finds many more typos in source code, and adding it to the continuous
>>> integration checks looks more and more like a good idea.
>>
>> ... at least for the docs/ folder, this might indeed be a good idea.
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 
> See also "Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>" for the first version of this patch.
> 
> Maybe the pull request can be made by qemu-trivial?
> 
> Thanks,
> 
> Stefan
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


