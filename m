Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3317E33800C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 23:05:50 +0100 (CET)
Received: from localhost ([::1]:35612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKTRF-0000Xf-7b
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 17:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKTPp-0007vw-JN
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 17:04:21 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:55817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKTPm-0005Vg-Jv
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 17:04:21 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MnZwp-1m3kGG2Uc9-00jZPU; Thu, 11 Mar 2021 23:04:05 +0100
Subject: Re: [PULL 5/9] char: add goldfish-tty
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210311210934.1935587-1-laurent@vivier.eu>
 <20210311210934.1935587-6-laurent@vivier.eu>
 <CAFEAcA8jAYc06s8N4hsYYDN2=PSB4SxQwvoBeAea7_4Yj1XptQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e52c7b57-8aa8-42b8-1002-dc52a80658ed@vivier.eu>
Date: Thu, 11 Mar 2021 23:04:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8jAYc06s8N4hsYYDN2=PSB4SxQwvoBeAea7_4Yj1XptQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:M74GkbZ/yECEGrBsB2/SV5RpEK3e5pBeXODJvUefk6ANQCv65K4
 ASV5x9cD1T7L5S7oPC2pwbckJSLeJFMZAMcLf2cYSQmRvmu/7iCWmaAKcbMaX0jnnM4xqpy
 TFUu8VTDlwHCy6IXwEwzPZv26CEpH+UB3BufChLCnFSyIXMYOFB8Iy2LphRkmbvKfhp7vVm
 hQW0KPpMtBsRZrxamYPNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oEP/wG9Zrn0=:Vg73dVsN1dGgWN1cvukfFb
 0s/GzvHadYZKkXoZm3ak1oVZ3pkeBoJrS2ZqF44Vchs3Eg3ORV4P7OO7i9Ee6v1kMPePb01O2
 AXp42zVdKthDbEuEhfxNii+oXv7m7sMeb/zBfIMVdehxlYysuVfC8rev/0EUJo0X68FECEM3Z
 xJFYkDh9enb66v926uDbkXvTzTf3MuDCLOPW1Myf5cHAhsvU/cou1u5dCkfQZCjil4QF8JXgX
 suRkoccMjJZ41OXY/W8nzn4OjM+VcOwOBGksfAZpm2WrZVfHFFf5bkLpii66OQfmvVcsGherf
 WRwmdqBG9hf0fDfnglRJCbcg1JgybAaHJJaS8cLQu8eeRE90Ol0DmxBc1NpOyMzHoIFhP1X68
 GrhKTS8NB4kETYRz9eRoELuLHRj55T01nc7ttK3XxSKoDgz+25zHe73P5d3KK0JboEuIAUoOb
 wkzD5eZA4w==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/03/2021 à 22:57, Peter Maydell a écrit :
> On Thu, 11 Mar 2021 at 21:22, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Implement the goldfish tty device as defined in
>>
>> https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFISH-VIRTUAL-HARDWARE.TXT
>>
>> and based on the kernel driver code:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/goldfish.c
>>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Message-Id: <20210309195941.763896-2-laurent@vivier.eu>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> 
> I didn't notice this earlier, but this looks odd:
> 
>> +static uint64_t goldfish_tty_read(void *opaque, hwaddr addr,
>> +                                  unsigned size)
>> +{
>> +    GoldfishTTYState *s = opaque;
>> +    uint64_t value = 0;
>> +
>> +    switch (addr) {
>> +    case REG_BYTES_READY:
>> +        value = fifo8_num_used(&s->rx_fifo);
>> +        break;
>> +    case REG_VERSION:
>> +        value = 0;
> 
> You report as a version 0 Goldfish TTY device.
> This is the old kind that used guest virtual addresses,
> unlike the more sensible version 1 ("ranchu") kind that uses
> physical addresses.
> 
> You can see this in the kernel driver code:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/goldfish.c
> where it looks at qtty->version.
> 
>> +    case CMD_WRITE_BUFFER:
>> +        len = s->data_len;
>> +        ptr = s->data_ptr;
>> +        while (len) {
>> +            to_copy = MIN(GOLFISH_TTY_BUFFER_SIZE, len);
>> +
>> +            address_space_rw(&address_space_memory, ptr,
>> +                             MEMTXATTRS_UNSPECIFIED, data_out, to_copy, 0);
>> +            qemu_chr_fe_write_all(&s->chr, data_out, to_copy);
>> +
>> +            len -= to_copy;
>> +            ptr += to_copy;
>> +        }
>> +        break;
>> +    case CMD_READ_BUFFER:
>> +        len = s->data_len;
>> +        ptr = s->data_ptr;
>> +        while (len && !fifo8_is_empty(&s->rx_fifo)) {
>> +            buf = (uint8_t *)fifo8_pop_buf(&s->rx_fifo, len, &to_copy);
>> +            address_space_rw(&address_space_memory, ptr,
>> +                            MEMTXATTRS_UNSPECIFIED, buf, to_copy, 1);
>> +
>> +            len -= to_copy;
>> +            ptr += to_copy;
>> +        }
> 
> ...but here you're treating the data pointer value from the
> guest like a physical address. I'm not sure how this works.
> 
> (This is one of the areas where you need to be really cautious about
> using the goldfish devices -- "device model gets virtual addresses from
> guest OS" is a really bad design.)

Thank you Peter.

I will resend the pull request without the virt m68k machine part.

Laurent


