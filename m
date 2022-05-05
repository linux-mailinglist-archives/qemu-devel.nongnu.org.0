Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D992051BD51
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:35:32 +0200 (CEST)
Received: from localhost ([::1]:41594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYpX-0004hB-OB
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1nmXZD-0000lR-On
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:14:35 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:58924
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1nmXZB-0003ur-OP
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:14:35 -0400
Received: from [134.155.36.188] (dhcp188.bib.uni-mannheim.de [134.155.36.188])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id D799EDA10DF;
 Thu,  5 May 2022 11:14:31 +0200 (CEST)
Message-ID: <b82a3147-7673-ab8b-890b-e4bfd37133fd@weilnetz.de>
Date: Thu, 5 May 2022 11:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] docs/about: Update the support statement for Windows
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>
References: <20220505074841.406185-1-thuth@redhat.com>
 <CAFEAcA81qUOC-nZMfN57_+j-bLrfqwyqjQjbUw8UK6ekZmx-hg@mail.gmail.com>
In-Reply-To: <CAFEAcA81qUOC-nZMfN57_+j-bLrfqwyqjQjbUw8UK6ekZmx-hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SCC_BODY_URI_ONLY=0.833, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>


Am 05.05.22 um 10:27 schrieb Peter Maydell:
> Ccing Stefan Weil, since we're talking about clarifying what
> our supported Windows host set is...
>
> On Thu, 5 May 2022 at 08:54, Thomas Huth <thuth@redhat.com> wrote:
>> Our support statement for Windows currently talks about "Vista / Server
>> 2008" - which is related to the API of Windows, and this is not easy
>> to understand for the non-technical users. It might also not be quite
>> true anymore, since we only compile-test QEMU with recent toolchains.
>>
>> Thus I'm suggesting to change the support statement here to something
>> similar that we use on Linux: Only support the very latest major release,
>> with support for the previous major release being dropped after two years
>> of overlap.
>>
>> And since we're nowadays also compile-testing QEMU with MSYS2 on Windows
>> itself, I think we could also mention this build environment here.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/880
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/build-platforms.rst | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
>> index e9163ba556..a0ebc1acb4 100644
>> --- a/docs/about/build-platforms.rst
>> +++ b/docs/about/build-platforms.rst
>> @@ -86,11 +86,12 @@ similar versions.
>>   Windows
>>   -------
>>
>> -The project supports building with current versions of the MinGW toolchain,
>> -hosted on Linux (Debian/Fedora).
>> +The project aims to support the most recent major version of Windows. Support
>> +for the previous major version will be dropped 2 years after the new major
>> +version is released.
>>
>> -The version of the Windows API that's currently targeted is Vista / Server
>> -2008.
>> +The project supports building QEMU with current versions of the MinGW
>> +toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on Windows.
>>
>>   .. _Homebrew: https://brew.sh/
>>   .. _MacPorts: https://www.macports.org/
>> --
>> 2.27.0
> -- PMM

