Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC445B1336
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 19:07:16 +0200 (CEST)
Received: from localhost ([::1]:37142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8SYt-0003lh-Sx
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 13:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38471)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i8SXa-0003IY-7n
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 13:05:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i8SXY-0005L5-W6
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 13:05:54 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:54239)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1i8SXY-0005Kn-Nd
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 13:05:52 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MWAay-1hamQZ3pBS-00Xea2; Thu, 12 Sep 2019 19:05:42 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20190908061543.25136-1-f4bug@amsat.org>
 <20190908061543.25136-5-f4bug@amsat.org>
 <046c1718-f938-b16f-5100-36406281f040@vivier.eu>
 <CAAdtpL4ykZAinOZWWUc6jU90DvEijEjaGrAJaRJ_3-bx3tn_zA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <58e2954e-cb0c-dfc2-7467-746a278e18a3@vivier.eu>
Date: Thu, 12 Sep 2019 19:05:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL4ykZAinOZWWUc6jU90DvEijEjaGrAJaRJ_3-bx3tn_zA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qUhr7lpRhPWyqNHgxy605VoNJw/wToSy0x3/AhNUuRr76EzzOKM
 LlbvLe31Voq6NlQYH7nBmdLQ/GdEZ32IIsdJsR8eGUSo4jljJF5FbR2Xl/S9R7Pw8W7s+Gv
 QFUMVhl1opcXxBzaPrsIr6yqbAdZUfEMLEUgRcDw6BMAmVT3yQNtFe/NbZsnoC8jHADQe/w
 qDqg1OdZz++Xl9obWpAnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FP6OjpEdQ5g=:ARmpMuxJ4e8WR4YkvopBsA
 QmADBzqvMO70xr+JxZphQE2fuMxK3810qJ9sKQCYbq2cQJit31VmEleODmxy0ar/ul1iHiI7R
 +Oc7UPqFARsSGmhsla3lYc1WvIOytlzMyKoJ3KuPdbBUOW/8CaFuTPKfWtLg0NoUvcccP18Yg
 6mf6pbv0MCcrtJgDEH0dsEw8c6vHin/+snkO1Xh0EKLeF3QbC6jO/t9zRqsB0VapqTRkG8Ivh
 5ybz/Bh74JQiDERNwfEO5+PNFI6TAXW/d6UxvIk0B+jx2SodkpXu5nxJWH5zlgGbD2UBFA986
 kamJLfOlAJI7+N2XJ6xP+u94o+DOFvtOQNdomxqDq6wHKZe6cn2tBpEZIzUJG+4heMKCNPAgC
 UrBClJS+cbjROxabIXSBF1D3DdbqcXrEudpf2T6s6BlwFT47ZK28EmY63hF5XKzoLoxOfSQrt
 jppNZKBoh6YTI0+BLpiXbHr1HjVQ/Hof03kr8lopiDQuXgJwMfyXgoIhgBT2U8vYjA7eXkKNu
 cKe/VuOzbRGV2/VF7E1wNeaRSV/CAGits9ydwiUuJdQ5Q29X1GzH69LlSBkv8Al+3LqNZ8e1b
 2iQjaY7YNV7xVaVktkGcRtjXxeEOQ0X0gzYuQlBeers1HM1/3NO9ZSV7XdZb/eV43iW2S1eh+
 dlWpmQLjOPFAp0GEUMQ5f9AgqRnc/8hFolY3T4KPBTTLJB4DvGwD3dj2Azq+icZpYbqdI/BED
 2wkxEXH4gktcQ9liFt7AtP62UejYBTR2YErXMSDAM4ZANi0s+CwG8GZ8oJ+OBXN3mSFQ/vkEF
 0jXnrp4GhkNqZR73VtVUPS/o4tOIcSQhQNg/0splKggXHZSy+dEz5OIzzIXHxanz58xPAPZx8
 sHXudpHbRYC1efsVgAzjA3ARbifMBa7I8pJNgoe+8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-devel] [PATCH v6 4/8] linux-user/syscall: Introduce
 target_sockaddr_nl
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
Cc: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/09/2019 à 21:34, Philippe Mathieu-Daudé a écrit :
> On Mon, Sep 9, 2019 at 4:23 PM Laurent Vivier <laurent@vivier.eu> wrote:
>> Le 08/09/2019 à 08:15, Philippe Mathieu-Daudé a écrit :
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Tested-By: Guido Günther <agx@sigxcpu.org>
>>> ---
>>>  linux-user/syscall.c      | 6 ++++--
>>>  linux-user/syscall_defs.h | 7 +++++++
>>>  2 files changed, 11 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>> index 8b41a03901..5128312db5 100644
>>> --- a/linux-user/syscall.c
>>> +++ b/linux-user/syscall.c
>>> @@ -1494,8 +1494,10 @@ static inline abi_long host_to_target_sockaddr(abi_ulong target_addr,
>>>          sizeof(target_saddr->sa_family)) {
>>>          target_saddr->sa_family = tswap16(addr->sa_family);
>>>      }
>>> -    if (addr->sa_family == AF_NETLINK && len >= sizeof(struct sockaddr_nl)) {
>>> -        struct sockaddr_nl *target_nl = (struct sockaddr_nl *)target_saddr;
>>> +    if (addr->sa_family == AF_NETLINK &&
>>> +        len >= sizeof(struct target_sockaddr_nl)) {
>>> +        struct target_sockaddr_nl *target_nl =
>>> +               (struct target_sockaddr_nl *)target_saddr;
>>>          target_nl->nl_pid = tswap32(target_nl->nl_pid);
>>>          target_nl->nl_groups = tswap32(target_nl->nl_groups);
>>>      } else if (addr->sa_family == AF_PACKET) {
>>> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
>>> index 0662270300..fcedd0d0fb 100644
>>> --- a/linux-user/syscall_defs.h
>>> +++ b/linux-user/syscall_defs.h
>>> @@ -153,6 +153,13 @@ struct target_sockaddr_un {
>>>      uint8_t sun_path[108];
>>>  };
>>>
>>> +struct target_sockaddr_nl {
>>> +    uint16_t nl_family;     /* AF_NETLINK */
>>> +    uint16_t __pad;
>>> +    uint32_t nl_pid;
>>> +    uint32_t nl_groups;
>>> +};
>>
>> You should use abi_ushort and abi_uint to keep alignments good (for
>> instance m68k aligns on 16bit whereas others on 32bit).
> 
> Are you sure? The other target_sockaddr don't use that...
> Is this because netlink is a host-only structure? (while other are
> serialized over some interface).

I think other target_sockaddr are wrong too. No one takes really care of
alignment, and most of the time structures are by construction well aligned.

Thanks,
Laurent


