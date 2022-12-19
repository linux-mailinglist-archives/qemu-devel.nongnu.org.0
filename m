Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6A9650B3F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:14:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F1U-0005ls-97; Mon, 19 Dec 2022 07:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p7F1Q-0005jG-D2
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:13:32 -0500
Received: from mout.gmx.net ([212.227.15.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p7F1O-0005Be-Bq
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:13:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671451999; bh=2u5UZiq6FfRMdxeceqpM8jHu4pNPQph+RqKFEpZjKew=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=sf1q+cg9yonxwdmHaphJC/5AuIb7Q+rpXaWRSxYtL59j4lNEOc9kD6vSkSqUbY6B8
 sx032SwmiY9lfTLH7tGcn59qD3KoDz9w9xytFptZH1OfZv+4u1o1+iyN/jeLvbjA9m
 YuxTnrXFCzts84XxUzS4GgZupW0iUETaM0M6SJ8qKtnhMwU+d16fhQ1iSmcecFjCwe
 lXHPfdSPItjdYjyxlZqCtS0T7WnZfaWvdwM+QsbNnOaEF+bZDYdeb3WZIo4broZ5dK
 COcZB3aZCc/U26lxnCH3XIMtY8b4JTORdGPUUNU1h1wdcvTpC9SncAZEwzyOJx9+kq
 aSsXz40gSYriw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.151.196]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUosN-1pGHQV3ztp-00Qhz7; Mon, 19
 Dec 2022 13:13:19 +0100
Message-ID: <b9fb28b0-5719-5c9d-3ec2-9cfcfd571cdd@gmx.de>
Date: Mon, 19 Dec 2022 13:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] meson: Clean up some dependencies regarding qemu-system
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>
References: <Y5zB+5t5K0AEj6Rn@p100>
 <f74b3d7b-9f57-59c0-1208-18b23e1e7ce4@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <f74b3d7b-9f57-59c0-1208-18b23e1e7ce4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5ru2Enr5CWWvuy3fbI2IM11m6n4hkhEXsH852nVKFr2YtT+Xeka
 ofiowuvBeSjNq+NXTRpBYJTVId/2i7SE/pdk/VvSdqgqP6UJxdbuOQlLffdRu/g8/eVA+BR
 Ur7inFZZSDuUTdLMRl+4UTdeFdD7A3vf2pq4ka/tf/0iKS7bGfXWj51dVXn7nzmUPKRTpo5
 pX4woknmcx2in/JHKRAIQ==
UI-OutboundReport: notjunk:1;M01:P0:fHTQu2la2ZA=;+n4g43SZjqawiUN67KnuTmvsRiD
 vQbOTddCPMPYkQYNxDPmGQseRp+U2TTiM1kjhbuordDBBAET2uhGA/XgYVF0Q7tSJpmK2DsR0
 nNQL7t2efo2SbdTfSY9XapAjxHihkrPBp/QDwywEvNOTim1FPe0Ar2ETknYsOG/PjVmFJ4udZ
 2asHVYjF3+tviPdRbg2bMFrNQKJAVEAM5FN8nWLiKjWH1UbhHDE+x1j9Ms6UFWowxPBQ9KXax
 /x9T1f9ksYLnl+2xPu2q3xyJkxqJwQl3I1yCS0xAhWcySjFqyZEjJZhZIRlzvv00z4zSrzLfP
 5JDlNEbPnn2ISiPZ7so57S4Vvs3YHrYVqpWg0eRnaX1l+3GCb0Qu0tMoASB7DL+Fjlj2ZvtHt
 BHfY3/uhK/yaWi/W1lrVYsi9Ez6sDi2oLZ2mDBj3Nr3smE9UUVjYtf6OUMZtP3fIYdFUMN9d+
 Ob2+Dg/9PWr1pfBdG/xTRe4rmTq2P6LoFcmkVnxBGSDaDn14dEbqkzxiO8RMU5bvLckGGrV0F
 rbTvQu6WRrWCOsJ2atPuBMoTJkv3ERbBT6mt3DmPFyGW9BQ2VsgYAFOi6+S7F2f2yMH/OZsQn
 8PEv8woXehdMYaVJYwmIH8g6EIn1ciZUH+igctZ1e23DHR9pTpskGEtQJ1B0KEIp7rk36UU3Z
 0DckuzJoShfQqVqS72A6OgOv7vPC0Z5dF1TC48dJsJ/+R4bkAWj6+ehCZwXX0ILZ9+KRavSf2
 gRFvtTJo3thKdyXp1kgQdSft8NA2OoB89oM20YofIaIIUrwNBKAfenvRK+2RGNzStWgbBrNtI
 cR4iffJqM3rguz+xPXLXbOisinDzXHWpD7j68HEF++9War6kQKg7Rf248cNKTncOue/t9FEvt
 gBC+8JNgP3ykiWWTi2x0pKgq4PVdHa8y0STEVGWlbZEvgeTkyUZSEhTLDuh5hHgqdRQNKj5hS
 gS451Q==
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/19/22 12:35, Philippe Mathieu-Daud=C3=A9 wrote:
> On 16/12/22 20:07, Helge Deller wrote:
>> Reduce amount of compiled code and installed binaries if just the qemu
>> utilities such as qemu-img, qemu-io and qemu-nbd have to be built.=C2=
=A0 This
>> helps to make those tools easier available on hosts where qemu-system o=
r
>> qemu-user isn't supported.
>>
>> Reason for this patch is that qemu fail to build on debian for some
>> seconday non-release architectures (e.g. hppa, sh4, ia64), as can be
>> seen here:
>> https://buildd.debian.org/status/package.php?p=3Dqemu&suite=3Dsid
>> This patch helps to clean up the build so that these tools
>> can be provided on those platforms in future.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>
>
>> index fbdb442fdf..4a499db441 100644
>> --- a/qapi/meson.build
>> +++ b/qapi/meson.build
>> @@ -51,12 +51,12 @@ qapi_all_modules =3D [
>> =C2=A0=C2=A0=C2=A0 'transaction',
>> =C2=A0=C2=A0=C2=A0 'virtio',
>> =C2=A0=C2=A0=C2=A0 'yank',
>> +=C2=A0 'qdev',
>> =C2=A0 ]
>> =C2=A0 if have_system
>> =C2=A0=C2=A0=C2=A0 qapi_all_modules +=3D [
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'acpi',
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'audio',
>> -=C2=A0=C2=A0=C2=A0 'qdev',
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'pci',
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'rdma',
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'rocker',
>
> Why do you want qdev out of sysemu?

I just moved it some lines below sysemu.

Helge

