Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3680033871F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 09:15:38 +0100 (CET)
Received: from localhost ([::1]:45124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKcxN-0004L1-9I
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 03:15:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKcvf-0002wp-Re
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:13:51 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:50425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKcvd-0003mf-O6
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:13:51 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M89P3-1lODYX08GJ-005K0E; Fri, 12 Mar 2021 09:13:38 +0100
Subject: Re: [PULL 5/9] char: add goldfish-tty
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210311210934.1935587-1-laurent@vivier.eu>
 <20210311210934.1935587-6-laurent@vivier.eu>
 <CAFEAcA8jAYc06s8N4hsYYDN2=PSB4SxQwvoBeAea7_4Yj1XptQ@mail.gmail.com>
 <e52c7b57-8aa8-42b8-1002-dc52a80658ed@vivier.eu>
 <302a7840-b7f5-2abf-68ab-2b44aeb44402@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0091e723-3c96-a6d6-2a12-312e842736ed@vivier.eu>
Date: Fri, 12 Mar 2021 09:13:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <302a7840-b7f5-2abf-68ab-2b44aeb44402@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QLNpVzPjK5Op9Yflt6GSmOQstH+vYizSWZtMMlrVIStE/QXNvgl
 ZcO1sJG4eO1Ge0ezV/uJTNllH07IxQcee3jV0JRL0uAR6olpNTpHy39MtOms1y/H5pO7hH2
 Ol1ZrJlvzuSxVDG+DUBgvHgFiunthxzaA2z10HFkxkh2wo1jclxe2mITxcbkVtv4ZqyeK3L
 MA4Exzvm5MmI+1G/D/9ew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oq7DNh7iK3c=:mjPXCz4+d8zGTwbUTed51D
 aiRYo0b4Smh92yabqGwvHDl7HGJ8xFZ1I7WgdwDRJbnupy2l4FeQZG6Jb53lJifCsUhIbhEqP
 /n/p3O8fFzyL3kzqisEkCehr7PWBa2eXxVZBftdgc5D1zDhekqZOKTxLqe5neC9/tuRDfK5M/
 50Mq3aTY/6SDwS/vRP6r8JzH6PL74NKhRLpkcs77MfEnB32kXUXabPLB9lVhsPylbbp3gkpCN
 yJlM2yXerMRXKQ+ZNUwhf3zV9/UnDJAQKhFhac9+KbNFYGKhl0TPNNrVinAgWQN+ql5byPyC8
 NT/TgExOtLK9Wpm+9rhyHhxntCVeEZSSa3z6fSDkWYwJqxFhzN33M2nMWQMmTFOtpUs3f+EWf
 Lh6fYGtjw1ohGMgLOSmDQF0IWsr4wDv9gjoIcpSFe/UZXGSd7LGKSJHvPTDcj4eWLA3+T1vEP
 e0xSRoudTQ==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/03/2021 à 23:34, Philippe Mathieu-Daudé a écrit :
> On 3/11/21 11:04 PM, Laurent Vivier wrote:
>> Le 11/03/2021 à 22:57, Peter Maydell a écrit :
>>> On Thu, 11 Mar 2021 at 21:22, Laurent Vivier <laurent@vivier.eu> wrote:
>>>>
>>>> Implement the goldfish tty device as defined in
>>>>
>>>> https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFISH-VIRTUAL-HARDWARE.TXT
>>>>
>>>> and based on the kernel driver code:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/goldfish.c
>>>>
>>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> Message-Id: <20210309195941.763896-2-laurent@vivier.eu>
>>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>>
>>> I didn't notice this earlier, but this looks odd:
>>>
>>>> +static uint64_t goldfish_tty_read(void *opaque, hwaddr addr,
>>>> +                                  unsigned size)
>>>> +{
>>>> +    GoldfishTTYState *s = opaque;
>>>> +    uint64_t value = 0;
>>>> +
>>>> +    switch (addr) {
>>>> +    case REG_BYTES_READY:
>>>> +        value = fifo8_num_used(&s->rx_fifo);
>>>> +        break;
>>>> +    case REG_VERSION:
>>>> +        value = 0;
>>>
>>> You report as a version 0 Goldfish TTY device.
>>> This is the old kind that used guest virtual addresses,
>>> unlike the more sensible version 1 ("ranchu") kind that uses
>>> physical addresses.
>>>
>>> You can see this in the kernel driver code:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/goldfish.c
>>> where it looks at qtty->version.
> 
> 
>>>
>>>> +    case CMD_WRITE_BUFFER:
>>>> +        len = s->data_len;
>>>> +        ptr = s->data_ptr;
>>>> +        while (len) {
>>>> +            to_copy = MIN(GOLFISH_TTY_BUFFER_SIZE, len);
>>>> +
>>>> +            address_space_rw(&address_space_memory, ptr,
>>>> +                             MEMTXATTRS_UNSPECIFIED, data_out, to_copy, 0);
>>>> +            qemu_chr_fe_write_all(&s->chr, data_out, to_copy);
>>>> +
>>>> +            len -= to_copy;
>>>> +            ptr += to_copy;
>>>> +        }
>>>> +        break;
>>>> +    case CMD_READ_BUFFER:
>>>> +        len = s->data_len;
>>>> +        ptr = s->data_ptr;
>>>> +        while (len && !fifo8_is_empty(&s->rx_fifo)) {
>>>> +            buf = (uint8_t *)fifo8_pop_buf(&s->rx_fifo, len, &to_copy);
>>>> +            address_space_rw(&address_space_memory, ptr,
>>>> +                            MEMTXATTRS_UNSPECIFIED, buf, to_copy, 1);
>>>> +
>>>> +            len -= to_copy;
>>>> +            ptr += to_copy;
>>>> +        }
>>>
>>> ...but here you're treating the data pointer value from the
>>> guest like a physical address. I'm not sure how this works.
>>>
>>> (This is one of the areas where you need to be really cautious about
>>> using the goldfish devices -- "device model gets virtual addresses from
>>> guest OS" is a really bad design.)
>>
>> Thank you Peter.
>>
>> I will resend the pull request without the virt m68k machine part.
> 
> Laurent, if the issue Peter reported is only for the goldfish-tty,
> you might consider merging the m68k-virt with only virtio-serial
> console for 6.0...
> 

It's a good idea, I will test if the machine is usable without it, and I will send a PR before the
softfreeze.

Thanks,
Laurent

