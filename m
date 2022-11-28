Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EAC63ACE6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 16:47:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozgL8-0007vA-Oe; Mon, 28 Nov 2022 10:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozgL5-0007ux-29
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:46:35 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozgL3-00044B-7K
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:46:34 -0500
Received: by mail-wr1-x42e.google.com with SMTP id o5so8518921wrm.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 07:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bfSGs2cTQ6wOpBu+T9t2zlTHPppr6aTGSAEsKwcCS+4=;
 b=ViYeX9Id/lPfKYSlVMSu39t7thcx8Fr+jxE7BZOexURNj94ViEuTArYg0kRTqY1A02
 jMFWSEehcfck1cvpOR+88Na3qvdPoNQgYkdkTmAX0XqnoACGbyLdEiZhX5U9lUIy4JVO
 i+Mt6nvjphRD/ABMXeNyu+GHwAAOhT3LO/un0JLJVzRnOgB8+NnJnZ8phn/cLlQPp3k6
 dQeQu4n8C5fdikRTkFAE2p2ifp7pI/21ALqrKV5thxzLdv7nKUsM0iOtT/PRPdp6oqRI
 Y6efhEO/kZv/w7rdCNjQyCJFYR+Qf9NFhRsv/OxfaMQwvtuUfkeJGVpxizcJ0YCpOx7J
 C3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bfSGs2cTQ6wOpBu+T9t2zlTHPppr6aTGSAEsKwcCS+4=;
 b=56G8f9dSudJFdxs6s3N5sN9MGW+LA06XH3xGRXZTYCC8iy68D5WiTlbl9x9WAoSaqv
 PkmTBWICPzH1NUT6+GL4OBecclifoWDpU+KUUp0TSMFBzFisdUq5qgLlEUP+eJtewdCy
 RBafTEPNttcSmsJPUWrw1qKf9vr9ilLH3oPQYAkfCVhI1L+qnqW8qoZm7OIs6A+8BS2r
 LqsCYbuaKdRdzERK3y6YQoPPGc01i/kufp0Tys9pdWgw5Dfb9y9F9sOu63W5DnU8TfyN
 Os2f8w8Ki90w82zlB6nuHvin57vXPGZtUacjvVhVROp+yBO6gHdMmDjaxiWcl5XXKGpx
 XvNQ==
X-Gm-Message-State: ANoB5pnz1HLVEFjYDM1ToyUWM0TtBUvsdBDA35vDEIopi9xhtDOpGSlo
 73Ut9m0sBLaJuYqTRg/phM8AmA==
X-Google-Smtp-Source: AA0mqf6Yn7Za2Wc9xUpRTk+XiVVMIeb8GwxU+nWc2ObrSkmjbmT6LiYXLDpbZ1HVjhKBP2sPqz4geg==
X-Received: by 2002:a05:6000:1a4e:b0:242:71b:e3cf with SMTP id
 t14-20020a0560001a4e00b00242071be3cfmr9983487wry.144.1669650391163; 
 Mon, 28 Nov 2022 07:46:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c1d9000b003b3307fb98fsm15174014wms.24.2022.11.28.07.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 07:46:30 -0800 (PST)
Message-ID: <45ef70c4-1b6b-2d05-5781-9a639911b716@linaro.org>
Date: Mon, 28 Nov 2022 16:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH-for-7.2 4/5] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt (CVE-2022-4144)
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221128134832.84867-1-philmd@linaro.org>
 <20221128134832.84867-5-philmd@linaro.org>
 <CAJSP0QUNU1CEJ8AMmo=tDC60ChY=Qo67nOEBBZmtaYeXvOybFQ@mail.gmail.com>
 <68346f84-d9f0-c232-dcaf-d614c3261c4e@linaro.org>
 <CAJSP0QXt7ZpYnYhA64ByUdqH9fi=ywVmRmkm-SDnf8FwKL2MQQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJSP0QXt7ZpYnYhA64ByUdqH9fi=ywVmRmkm-SDnf8FwKL2MQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/11/22 16:32, Stefan Hajnoczi wrote:
> On Mon, 28 Nov 2022 at 10:25, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 28/11/22 16:16, Stefan Hajnoczi wrote:
>>> On Mon, 28 Nov 2022 at 08:53, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>
>>>> Have qxl_get_check_slot_offset() return false if the requested
>>>> buffer size does not fit within the slot memory region.
>>>>
>>>> Similarly qxl_phys2virt() now returns NULL in such case, and
>>>> qxl_dirty_one_surface() aborts.
>>>>
>>>> This avoids buffer overrun in the host pointer returned by
>>>> memory_region_get_ram_ptr().
>>>>
>>>> Fixes: CVE-2022-4144 (out-of-bounds read)
>>>> Reported-by: Wenxu Yin (@awxylitol)
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>    hw/display/qxl.c | 22 ++++++++++++++++++----
>>>>    hw/display/qxl.h |  2 +-
>>>>    2 files changed, 19 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
>>>> index 231d733250..afa157d327 100644
>>>> --- a/hw/display/qxl.c
>>>> +++ b/hw/display/qxl.c
>>>> @@ -1424,11 +1424,13 @@ static void qxl_reset_surfaces(PCIQXLDevice *d)
>>>>
>>>>    /* can be also called from spice server thread context */
>>>>    static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
>>>> -                                      uint32_t *s, uint64_t *o)
>>>> +                                      uint32_t *s, uint64_t *o,
>>>> +                                      size_t size_requested)
>>>>    {
>>>>        uint64_t phys   = le64_to_cpu(pqxl);
>>>>        uint32_t slot   = (phys >> (64 -  8)) & 0xff;
>>>>        uint64_t offset = phys & 0xffffffffffff;
>>>> +    uint64_t size_available;
>>>>
>>>>        if (slot >= NUM_MEMSLOTS) {
>>>>            qxl_set_guest_bug(qxl, "slot too large %d >= %d", slot,
>>>> @@ -1453,6 +1455,18 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
>>>>            return false;
>>>>        }
>>>>
>>>> +    size_available = memory_region_size(qxl->guest_slots[slot].mr);
>>>> +    assert(qxl->guest_slots[slot].offset + offset < size_available);
>>>
>>> Can this assertion be triggered by the guest (via an invalid pqxl
>>> value)? I think the answer is no, but I don't know the the qxl code
>>> well enough to be sure.
>>
>> 'qxl->guest_slots[slot].offset' is initialized in qxl_add_memslot()
>> (host); 'size_available' also comes from the host, but 'offset'
>> comes from the guest via 'QXLPHYSICAL pqxl' IIUC.
>>
>> I added this check to avoid overflow, but it can be changed to return
>> an error.
> 
> Yes, please.

Or I could use Int128 to do arithmetic, but various other places do it
this way without checking overflow with memory_region_size(). Such API
change should be global and is out of the scope of this CVE fix IMO.

> Aside from concerns about -DNDEBUG, which builds without assertions,

This isn't an issue anymore since 262a69f428 ("osdep.h: Prohibit 
disabling assert() in supported builds").

> there is also a DoS issue with nested virt where an L2 guest shouldn't
> be able to abort the L1 guest's QEMU by triggering an assertion in a
> pass through device.
> 
> Guest input validation should use explicit error checking code instead
> of assert(3).

Certainly.

