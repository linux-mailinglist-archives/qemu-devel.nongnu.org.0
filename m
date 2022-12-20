Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B9D652822
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 21:59:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7jft-0002We-3G; Tue, 20 Dec 2022 15:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p7jfl-0002Tg-KE
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 15:57:14 -0500
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p7jfj-0002Pm-LL
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 15:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671569817; bh=OV5uVTTvRjPDaZL65LpGwz8xUCWSjJZtMF2ofOqUy2o=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=t5v8rjP8JE9SL0Cp3Weqdb8l3ajDFuFr8lzG3KJdJ0xKpuI5Y7ZoNiy1b9h8sYyn8
 fzC6MLGbiUx+vEV0Wmza1hXndnIJliEuyx4iE/5JAYcMLRxN4KdxaplvdmHbVGH+f8
 cGCGsDjjD24cOc8ModdMPJu8ngvyCG14aLyPl6qQ/5n2PnXFZkn4jrcwqb6gOKiycF
 5qwO4D4LW96GZ5XWFnHTz27C0oPvQxqVRHibT5Ni9ZlzzLNq61BO7ItVNhZ6yAcLNs
 2ro2N7pBX+u30tA+0VsQot9WaPhk2rKteutgEDco4b5/l4IfucN5Hw1Cw1iuTtxz1A
 NPAxY7Epj0GvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.174.3]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5UN-1p49J02gJ5-00FD7X; Tue, 20
 Dec 2022 21:56:57 +0100
Message-ID: <233346fa-a06f-f0a8-e842-bf386316ccbc@gmx.de>
Date: Tue, 20 Dec 2022 21:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] meson: Clean up some dependencies regarding qemu-system
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org
References: <Y5zB+5t5K0AEj6Rn@p100>
 <31003f9a-5392-67ee-9ef2-01794c09510c@redhat.com>
 <75b841f6-1eab-9d5f-2ad7-89440931ac18@gmx.de>
 <CAFEAcA8q8aqWvd7dwuH79yzq6Kyg-EVo9YzsWJ_mav4bLLH7eQ@mail.gmail.com>
 <02766634-1ec0-436d-d641-c0c61997138e@linaro.org>
 <CAFEAcA-_ncQwXjkV7=ZMwQOjOonQhqJhOfQ8B7xAcVM=phhzyg@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAFEAcA-_ncQwXjkV7=ZMwQOjOonQhqJhOfQ8B7xAcVM=phhzyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vXFRgZQ/4qm/bJgSGQ1XGLjYM0teH7R9Ab0d6tGtOAwRt+erFrD
 iJi2k31s1W9LG7UtenDcGk5VNBJ9NPjD5oxRM3YUrxzJv7bjqtt4G8GCFr43SiHQ5xEuwTG
 7nwbEG4GDnLC9IoURqe2w3R560iAAHK6HdckkF/5zefqX+al/Qr812EmQKomL/lQSjrMG0d
 qG0uR7tMoJwTSNsXSnakg==
UI-OutboundReport: notjunk:1;M01:P0:Z2afRDcIBBE=;Fehnk8ptSrn1X/OgmAp2xZd4PZA
 SvEws2b42pXAEE3uocPskiOwItnGW1KtnEL/tXZHEEj6+jJyqUTHtoMM5BFUo4gWE+fLjAdYZ
 RbLbGEncjH3on6ptfpHLkwvvJqpYhdItjSw62czjV2H3QX/gBoyfQSk15pxyOYsSSUFPwNO/P
 TkEmURJf/c3PcgT+NjVTL5kt5nuPHY8G2hy4EnQmH8EWr7+QPmcZAZ9tPVv+/uBsMow06PnNw
 eYaws1HUy3sW4Suo1hjCmcFfpWLqpMuT35yeKjr/uvFsu0IYaz12mj+q2imlpJMm16J7M7aFV
 u7gBlp9jnUzYytT/0IhWopPMXI9vtC0aLqYVX2H3ur5ucKjU8BSd3UPzPQ7O0OG8pV8UiH2qS
 HF57tHYuVvl1IbJxQYP2nwYIX59nRp4ucNtpwfvnPq9QC7mq5FDJLD88Iw/xmZm1QlUAguJ6b
 JA1UTBi9Rs5hMhFlHyBRuekRtPg9IH6VPaoLao71zxDIhGoNadg+d2tv3Oq1ishG/dalJcGZg
 XZVfCOEqDhZgQZlRcepy1vnWY234m6GOpqS72nqXtfbCF6jp/v5EiEmT1YjaemUY59Iy4OZ3k
 A7riww2ksDG1rDcWf6q7yt9/V63ixfwR9u5xem/gtKy7SLodR8zrnJeQLJDgbpPwsD2zQ+Gcs
 3qPaliwV07+ckRsWzvTSCX4kWLYuvuDCMZtiH9IV0VYqFq2zGFYqysm6xz4tSy68CShhtg78V
 KTAuuwaMWgDdNVaEXnV9+b9qnwRg42em0o283ZvQ1Pq918evQseX2QTfOyq32on/uGJMHC2h2
 jFvZj54+ULgaNL8wCmNZThnOgPFIJsBwqKODoFvynbTiodlBMjYMMQE6bCmC3h+z9N5Gd0dc8
 xM3j0fYobzq4YZBI66+xeHf+YA7DYX6D1Z1Fah37LyMTMjpXH/hvh2BhFLvcuaHs91wHXqg6P
 u9HKzfT5ZWQOUOScokG6ALjNY/I=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.161, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/19/22 12:52, Peter Maydell wrote:
> On Mon, 19 Dec 2022 at 11:40, Philippe Mathieu-Daud=C3=A9 <philmd@linaro=
.org> wrote:
>>
>> On 19/12/22 12:31, Peter Maydell wrote:
>>> On Mon, 19 Dec 2022 at 11:22, Helge Deller <deller@gmx.de> wrote:
>>>>
>>>> Hi Paolo,
>>>>
>>>> On 12/17/22 14:28, Paolo Bonzini wrote:
>>>>> These are wrong.  qemu-bridge-helper, virtiofsd, qemu-storage-daemon
>>>>> and qemu-keymap *are* tools; if they fail to build due to any
>>>>> dependencies, or due to other compilation issues, you need to add
>>>>> tests to meson.build and check for the cause of the issues.
>>>>
>>>> No doubt, those are *tools*.
>>>> But aren't those only required when you run system- and/or user-emula=
tion?
>>>>
>>>> Looking at the packaging of qemu in debian:
>>>>
>>>> qemu-system-common debian package consists of thse *tools*:
>>>>      qemu-bridge-helper, vhost-user-gpu, virtfs-proxy-helper, virtiof=
sd
>>>>
>>>> qemu-utils debian package consists of the *utilities*:
>>>>      qemu-img, qemu-io, qemu-nbd
>>>>
>>>> IMHO this categorization makes sense.
>>>
>>> Possibly, but it's not the categorization we use upstream,
>>> which splits our binaries into three groups:
>>>    * system-emulation binaries (qemu-system-arm, etc)
>>
>> Subcategory:
>>
>>          * helpers (required to use system-emulation binaries),
>>            apparently provided by 'qemu-system-common' on Debian
>>            -- except virtiofsd which is not a helper --
>
> No, I don't think this is a subcategory. We provide
>   --enable-system
>   --enable-user
>   --enable-tools
> but there is no
>   --enable-helper
> and qemu-bridge-helper, etc are built via --enable-tools.
>
>>> (I think the guest-agent may be a fourth group.)
>>> ...
> No, it looks like we build it via --enable-guest-agent,
> and --enable-tools is not checked.

Given that info, would it then make sense to keep as is:
    --enable-system
    --enable-user
    --enable-tools -> qemu-bridge-helper, vhost-user-gpu, virtfs-proxy-hel=
per, virtiofsd
    --enable-guest-agent -> guest agents  (option is there already, but no=
t used)
and additonally add:
    --enable-utils  -> qemu-img, qemu-io, qemu-nbd

This would leave the helpers in --enable-tools.

Helge

