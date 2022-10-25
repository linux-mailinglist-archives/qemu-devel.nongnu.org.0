Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33E460C1F1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 04:52:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onA36-0004qo-1x; Mon, 24 Oct 2022 22:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1onA34-0004os-Le
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:52:14 -0400
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1onA2l-0001jj-Mb
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666666310;
 bh=GAnmH62xjfCYS+PLHnLO6lVYAZW/LCcciY2xgG4RMOs=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=KJy81ai/dD1H/SJTUquUNE8+jHFcYQYs0n2Q/zSe1nZa+OiswxU4BBBa6CKfhgmjW
 gOjrnOzrwxIhaWIz187cmOpjFBnj5vt4FMMjrTi/i/XsYUypJRKp/lwsGk+J5EdJsz
 AaOo3LJUDbwZvvw5eFSFZ4DQJsFHznKUdYVaPylc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.136.30]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxDou-1p2dbC0v3w-00xecd; Tue, 25
 Oct 2022 04:51:50 +0200
Message-ID: <f7136170-74ea-fe88-4053-4c38be1541fe@gmx.de>
Date: Tue, 25 Oct 2022 04:51:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3] linux-user: Add guest memory layout to exception dump
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <Y1bzAWbw07WBKPxw@p100>
 <8c348149-6edf-c6f7-f539-d40a4479c46c@linaro.org>
 <07dbe94d-c215-2be3-1769-4f2a8290573e@gmx.de>
 <e3d81adf-d47f-98ad-9f41-f55c1f73e9c8@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <e3d81adf-d47f-98ad-9f41-f55c1f73e9c8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EOLXbtq92kR3u/dovPrZcBqZklJpsnE9nCmkOatDKzZVz5seOCm
 S55b4qLdZSG8GewxNxgfBnnfx98lcrNwIzft9V0SJ9+ND7bqbm/w4IcusT3TRv68aJnSY09
 oTuTcJ6FmQ7jkUlNduOSKYko1dDx+UOwJXYtvtPNi5Uo9aa16JNUYSWAFpJoK4p+vpq58kJ
 5OkAux94DH5rzdgK5rKHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wSbFVXGseTI=:5trbFAObgVn5jxIeN2twGe
 pylkzMMkLt71l73J4tIf+qtlXsqLg1mRk0eY3E6dNlDSf0PpwHBuk8Bv87xl+z8mrK0PHZ7ap
 X+GQteA83EQOvCTdZb4bkLnAvql5XWjjW5o9w4S0uZRauas38s5xRvw2kLh6nCRInRNnK6gJr
 bGQGjEA0SSEWWjmBqKhN+/RKbbwBl7A1d7+F+GRpoxq1dN+w8CYTvqWhfty5kcEloot9HDnH8
 RSbLLB5h7XLIlx4t10zNTBmwhcR7DHqoECEl/NuWCfU6ZuZNO/GsjYOsd+UblTrvSh57u61/V
 kPu9CYxv4jP74SPeMKldde2lBabvHtXA8c4N77DzGkB+pndbJwIY6XXR2WpwbsxdHyQZwlhjB
 Pqj8P3D1P+kDfE/uEHhLYitwVhqhWliY+dmGDkdNTUnFGkvJAwTDfRVxiwIz2nN+e0WM/sPYY
 8oDsmu1T2H5mtQIpy/xFXuFQ1OatxXsXtKnjDOjevcZs9jc+ZX1SYTVA5q8tH1zJWyIPZ1qe5
 xjeCdO1lpVPM7QuynZqIJgxZQ3affuQsHP0GytT8wIkl+wk2caMebs07PgBY4n8D5oXBGOH69
 1laNoXsLmRpeH84z2pQGEU52IZWTl6mgFx6XNbqkc1ObjQZI7Fuvllwt6LBQVe7j2T+pXu+H9
 zxZuMw7QqecvQfCn48eX1/IiKGYvoLcfk/fbJ7gKOE+3+4UcHl2BE2Hw1/9sapkkKislazZxK
 zFHmwCtbdt960gFRin1dm7yA5xjtHjCRkmkOAXPDB68JgzX/E5p3TGK43nZ3olVRGBQdzEnz9
 vTa5c98VAfZ7NzNPQU5pH1iDOnc8hwPqeY+zC3obrjQlK1DE8rq9Vmv/oYaJhAiOfkW5+K4zH
 O56XJ2tuJENQOiCmFaQW0qIgs8J/8blz6JhSNfcRyNuq317vY9b/XYS67UOVj7ePj1XWsgMgZ
 WzfbO37qsl1rX/t14C4l191WD28mP9IeT6cNYPumcCMIl339iqQ8y8GRTZIdtl3p10T0zsyph
 gXJdSzHcIOQsv08URN2m+nWm5f80iSwiFzmvCKF8Q+GkQq0eQKrhmPbKXVUmYusxri3X7V8u4
 S2QZM4CZ46QWrglNXQDKJUFGbKB9Of5upAX/9Ws8nwNilw7ACNaKcV15ruqnHY53rG2vXNZjV
 qZ4oBwrtd7Jx9no4Mi4Bujk2WxuxkmHI7otuuMqULvLEiGFJ6g/lazFoITJzSM3vak/8jpLIW
 cDJeTSg2gf+uavogwsqAlMO9RRdoX4XDUnklkWvAlltF369fMwg+V3VwJeWauKkbhQTcwOEWj
 vBbVNTf3P9ax/lSe94OAL/NytzVQlIH22q/r3PJPrb7K1m3g6/tt0s1QXxREA0KIzdIxA2GIf
 GqVPc2j3xGj5UO3S8N7wyTBwtZKE6hCZLOG/rbKcN3zquIwu5JVbz4Zh+qwu/+1rYj5KKVW4O
 /7gSthI69EOf4HQLSg8jMVA27cq7PaEKuYIG9n5fREHlnTBjpMt6CDqVYqcFMvLZMY2sfeQEH
 FMhi49elKk5LIK1V47J/rnf9kRBt9zNxgiff2/G8aZeaY
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/25/22 04:25, Richard Henderson wrote:
> On 10/25/22 11:57, Helge Deller wrote:
>> On 10/25/22 00:35, Richard Henderson wrote:
>>> On 10/25/22 06:18, Helge Deller wrote:
>>>> When the emulation stops with a hard exception it's very useful for
>>>> debugging purposes to dump the current guest memory layout (for an
>>>> example see /proc/self/maps) beside the CPU registers.
>>>>
>>>> The open_self_maps() function provides such a memory dump, but since
>>>> it's located in the syscall.c file, various changes (add #includes, m=
ake
>>>> this function externally visible, ...) are needed to be able to call =
it
>>>> from the existing EXCP_DUMP() macro.
>>>
>>> /proc/self/maps has all of the qemu mappings in it as well.
>>
>> I'm not quite sure on how to understand your comments above.
>> Just comments or NAK to the patch?
>
> A question.
>
> Did you really wanted the host mappings included?

No.
I wanted just the guest mappings.

> If so, fine.
> If not, pointing out there's a better function to use.

I'm not sure if it's the better choice.
It depends on the targetted audience of such output.

This is linux-user, so if someone runs a program he would expect
output of crash dumps like as he would see them on a native machine.
Showing "external host emulation mappings" seems strange.

I'm running a debian hppa buildd server with linux-user.
I've seen many guest crashes like SEGVs, out-of-memory (in guest),
glibc's ABORT() calls [which e.g. triggers a CPU exception] or other
things. In all those cases the guest mapping was relevant, not
the host mapping.

Helge

