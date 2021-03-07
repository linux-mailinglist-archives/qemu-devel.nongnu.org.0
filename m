Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB1E33045B
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 20:58:47 +0100 (CET)
Received: from localhost ([::1]:36012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIzY6-00062C-FS
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 14:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lIzX7-0005bg-DU
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 14:57:45 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:50093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lIzX5-0007Ts-AN
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 14:57:45 -0500
Received: from [192.168.100.1] ([82.252.159.174]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MRBac-1l4kTE2Bsa-00NBHj; Sun, 07 Mar 2021 20:57:28 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210307164828.87348-1-laurent@vivier.eu>
 <20210307164828.87348-2-laurent@vivier.eu>
 <6909cb99-6058-472e-bfa2-62172c448b1d@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v4 1/5] char: add goldfish-tty
Message-ID: <c823a8ae-4060-02c4-1bbd-688793c0b18f@vivier.eu>
Date: Sun, 7 Mar 2021 20:57:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6909cb99-6058-472e-bfa2-62172c448b1d@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VlK8y7eqOzfzTlyAL059d/fEOwIZrRFhIE5ukJUO6zoCwWVQsP6
 A2vTyPCbhVx28WCuid15RYQNelIrlIJ9QSeVUkW8M5DzZb+0umTNItN06FTqBudyMXrEtPj
 9CT7//C3/R8MmpNzytszOaa+S96UgnEh1sFqxHf5ALQUP+StIQozO7wNLLyXRqXqe/og/Gv
 pKYRkh2EbrFMcKUkvf3iw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+TczsVTEdRA=:d2vPj0u3/ZyxHkSCBTpWJD
 pUH015j0MOE5w7hi81SHXNkV5T7O5HE6CJ5f2qjpll5bEaTaUxq2CIzsE5/+qsFmjPJcaH3lJ
 t9wqwPxdQaehhCAE5mJbr0R2KZMrG1LVcFc56i/mhj2xn/H62QM3fhAghEBTJZk1WbwV+dHX3
 arApTDpVus/amT47J2OQyFTync3KGQLIDGa1XPQFbOYxVXwxbxxHQBAwP5mPqWjVD/66+V8A+
 RJgNeQtQFXGQan/3BtaX2YmYWOhqaKLXurppUrmAr3rnrTVOhgH1p8s9XPsUG1ardSJinYyR3
 5G55Ez1NaPdyWb0UaBwWmaKMAKQzr+SvZc/ZkS4BizQz6hCGOAbZxEq6a7hGZiVwtOU+3ngMw
 IYO8DNnP1u1gbeqk3VT5pE4ROf64cjciuhgNgr+ywqZcIz0UGXAKm4q+eoAxxjg4XqipqQ+z2
 vzeVjN5Oxw==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/03/2021 à 20:24, Philippe Mathieu-Daudé a écrit :
> On 3/7/21 5:48 PM, Laurent Vivier wrote:
>> Implement the goldfish tty device as defined in
>>
>> https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFISH-VIRTUAL-HARDWARE.TXT
>>
>> and based on the kernel driver code:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/goldfish.c
>>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>  include/hw/char/goldfish_tty.h |  35 +++++
>>  hw/char/goldfish_tty.c         | 272 +++++++++++++++++++++++++++++++++
>>  hw/char/Kconfig                |   3 +
>>  hw/char/meson.build            |   2 +
>>  hw/char/trace-events           |  10 ++
>>  5 files changed, 322 insertions(+)
>>  create mode 100644 include/hw/char/goldfish_tty.h
>>  create mode 100644 hw/char/goldfish_tty.c
> 
>> +static void goldfish_tty_write(void *opaque, hwaddr addr,
>> +                               uint64_t value, unsigned size)
>> +{
>> +    GoldfishTTYState *s = opaque;
>> +    unsigned char c;
>> +
>> +    trace_goldfish_tty_write(s, addr, size, value);
>> +
>> +    switch (addr) {
>> +    case REG_PUT_CHAR:
>> +        c = value;
>> +        qemu_chr_fe_write_all(&s->chr, &c, sizeof(c));
> 
> No IRQ here described in the spec... So this is correct.
> 
>> +        break;
>> +    case REG_CMD:
>> +        goldfish_tty_cmd(s, value);
>> +        break;
>> +    case REG_DATA_PTR:
>> +        s->data_ptr = value;
>> +        break;
>> +    case REG_DATA_PTR_HIGH:
>> +        s->data_ptr = (value << 32) | (uint32_t)s->data_ptr;
> 
> Matter of taste, I find it easier to review as:
> 
>            s->data_ptr = deposit64(s->data_ptr, value, 32, 32);

I agree.

> 
> The spec says this register is only available on 64-bit targets.
> 
> Should we restrict this "#if TARGET_LONG_SIZE == 8"?
> else log_mask(GUEST_ERROR)...
> 
> This seems overkill to me but that would respect the spec.

TARGET_LONG_SIZE depends on CPU, I don't think we can use it here.

>> +        break;
>> +    case REG_DATA_LEN:
>> +        s->data_len = value;
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_UNIMP,
>> +                      "%s: unimplemented register write 0x%02"HWADDR_PRIx"\n",
>> +                      __func__, addr);
>> +        break;
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps goldfish_tty_ops = {
>> +    .read = goldfish_tty_read,
>> +    .write = goldfish_tty_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +    .valid.max_access_size = 4,
> 
> Again, I think you also want:
> 
>        .impl.min_access_size = 4,
> 
>> +    .impl.max_access_size = 4,
>> +};

OK

> 
> With min_access_size:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 

Thanks,
Laurent

