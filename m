Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650A767EF95
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 21:32:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLVNd-0005GK-E1; Fri, 27 Jan 2023 15:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pLVNb-0005Ev-45
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 15:31:23 -0500
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pLVNZ-0003HW-Eq
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 15:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1674851479; bh=x2otNyvCA5GroMZC1afIjkerWVmIDVAjcb2xEotPVqI=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=O8cQMEP+Vu2PKwR5uwXhW5dkyFm9qWw0T3v13Eki3334wdg4vKyoAUJ7xEIkQfzbS
 8DIjdlsyqhjpQ0Q2zP9Da6heXgPSFDB5eY2MYJntUC6JxQAG1TPGotyQkk51rzbPyt
 CP6Eypd8i456Fq+iGaRViS/tLfxS/HOKCX6Is0S2BP/28a6+TzJgZUfsatQ6pyv7DI
 7leaEoG3eddtSRkfILAG1ZfP3e9aQOoDwiQnxMXJXfttj+RKIS9LYxtg8LUyijtfYC
 1KqNrkzMCtBW2so7p2VghpnPOQvwA5kJELqpPezUX6/HiaMq460ktrl6Fo3jPuGgLU
 ot8li79pfUW5Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.191.252]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mi2Jn-1oiIsA1UPJ-00e85M; Fri, 27
 Jan 2023 21:31:19 +0100
Message-ID: <e4e23de9-fff1-549e-da46-f029892326da@gmx.de>
Date: Fri, 27 Jan 2023 21:31:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: Improve strace output of pread64() and
 pwrite64()
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20230115090415.6936-1-deller@gmx.de>
 <61da915f-7914-4c6e-edc6-6226250b5dbf@vivier.eu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <61da915f-7914-4c6e-edc6-6226250b5dbf@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8kcf0cn5opm5hON2rIhvPPHA1mqeDq9+yu77yaFsA4Es4WdCknF
 Ec0DkF5TaNMmTo8A4AuqjL5XvIjATndxQppv0wuDxD29QWfHVP5qDO3fAL8Dqh/MYxMpi9b
 8XJ3re2Dr3EOIlkmOCpdUseXxh92wVMi8BVJMich4rr7yKoaeTpCbrvMf99ZEgq1y+1VjH5
 6IHQZILbTD9KNP/8s3K+Q==
UI-OutboundReport: notjunk:1;M01:P0:4AloT66op2I=;s41shOzc/Er6zNb+Mj7Jk2wfZ1H
 uQAKuHy+LF+WUjcWLVkVTsgWxkyOQXuGH44ChgFGRmtUMEdG3EYAn5vB2Inj21v6+yWY3e4iq
 BSgLkTsdZ9XlYSpPC+Jge1njiNyBjtTqSUgmA1osAqQWnwJHPy4rV17T05SNrVpq0GLw3iI9x
 S9tNkhqkdGdxD/GDmglbIaQslAo8fEWr/+aq5W4k8tWr0Fh+pXyFdePGg2FfeUVjylf9hfnco
 r5XRqKnqyMK1HuHHoLkepkmOMJZhTlDmTHErKx8ePlsznS75t/W7JCxRUtPJ7h+wGAGjjVATM
 0ofK6W6S/v6FPq4IY7KXAXO7BsbxWKmjepiV280+7EpVuRdrZBzYlLmRjVFwNuksuT/FoKGaI
 94uhk+EOhZpJS1NprA2lslaPRuQzpSEck462oTtD/DHZWu9hPjwCzjhyip6GRS+xECtkkMIvQ
 qEBSbB5zW5EN0vDI4jcBHiFiH7AirYHn2kzrHJWdBJhNWETIGPkqlyfgYtoClsbnqxaYUeuNr
 secc5OBtT1Tz9slLWvT6bKnx5NveyKo0RVVVkH4mbhd0TWcEDqmVwSyxrwAtFeyAPoGsHpOXf
 1kBJujX+9YWa7JdnYnxybDy9neTftUapvlcL44XsJUMKkFPvqjKYTeionTqMuIhccQtD9HDDI
 iCkNZWJvqertahnUS55qHfR1+/RwtA4RcSEt0vtxY5+SXfgsb4aXflJbzIc94t9CT3Dj7t6er
 QdK2QQxHOfjllnPnvKr8k4e1xHdyIEN+Xeo6CEshk8vPWefjfDULDmOCnr+jCN/WdFYwy0C+W
 9r0UAwLowoc7kGr8yiqmsnr1ZnR7mxq8vbHBPVUbQ/1D2d1E06BxqgYm1tAm/xx4/FLBj6o23
 4xanMLPx5uO5QWezijU8+1Cq6ke5FzaPEfnbVMaDmZwUMRcMmLV1/kACNZvFAPwcOydOyZwid
 GlfXNseaokTrDIMXOIFqIPTq/ZA=
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/26/23 16:12, Laurent Vivier wrote:
> Le 15/01/2023 =C3=A0 10:04, Helge Deller a =C3=A9crit=C2=A0:
>> Make the strace look nicer for those two syscalls.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>> =C2=A0 linux-user/strace.list | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-user/strace.list b/linux-user/strace.list
>> index 909298099e..41bb6bbfbc 100644
>> --- a/linux-user/strace.list
>> +++ b/linux-user/strace.list
>> @@ -1061,7 +1061,7 @@
>> =C2=A0 { TARGET_NR_prctl, "prctl" , NULL, NULL, NULL },
>> =C2=A0 #endif
>> =C2=A0 #ifdef TARGET_NR_pread64
>> -{ TARGET_NR_pread64, "pread64" , NULL, NULL, NULL },
>> +{ TARGET_NR_pread64, "pread64" , "%s(%d,%p,%d,%u,%u)", NULL, NULL },
>> =C2=A0 #endif
>> =C2=A0 #ifdef TARGET_NR_preadv
>> =C2=A0 { TARGET_NR_preadv, "preadv" , NULL, NULL, NULL },
>> @@ -1092,7 +1092,7 @@
>> =C2=A0 { TARGET_NR_putpmsg, "putpmsg" , NULL, NULL, NULL },
>> =C2=A0 #endif
>> =C2=A0 #ifdef TARGET_NR_pwrite64
>> -{ TARGET_NR_pwrite64, "pwrite64" , NULL, NULL, NULL },
>> +{ TARGET_NR_pwrite64, "pwrite64" , "%s(%d,%p,%d,%u,%u)", NULL, NULL },
>> =C2=A0 #endif
>> =C2=A0 #ifdef TARGET_NR_pwritev
>> =C2=A0 { TARGET_NR_pwritev, "pwritev" , NULL, NULL, NULL },
>> --
>
> You need to use regpairs_aligned() and target_offset64() to correctly di=
splay the offset.

Good catch!
I'll send an fixed patch.

Thanks!
Helge

