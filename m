Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D8416E3E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 10:51:54 +0200 (CEST)
Received: from localhost ([::1]:47506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTgvw-0003fE-BE
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 04:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTgus-00030q-Ih
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 04:50:46 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTguq-000778-Re
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 04:50:46 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u15so25053051wru.6
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 01:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KAJC2RiuRuqeI2j+1iGGm95p2VHJsI139SFhTNhJ0qI=;
 b=VSXh5yFEo8QB485/0tVcXonbfFbv43DaUpwM3MO7RGXCRzx46+Ryi/8LlsRovTnN5I
 GRmJ6fHUAquQV5v+grU6drzhccUU0JBDbJxmW/xTmW0POCaIzJG1VJtEhK0Kl/LJo1nM
 VkE1wu6Fy/UhkU8paxE4kfldaEOfT0dHWJziqcvhE/Y7/bTMQRzJOpXxQ/f4EaMLg95y
 FAUQAtOhHACKD93DxmK1Ufk+y3K2s4EBjZTsU35YIY21M3rWC0ENbpjI92BFStEp47El
 y9k/DDEyBd9dek/G9zs4YD5BVpirMotzaY0QNUuqbnpxgnMRoLwS+BpK1BWyG3R2a5A2
 eCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KAJC2RiuRuqeI2j+1iGGm95p2VHJsI139SFhTNhJ0qI=;
 b=BQKiKgkggSbQSoGTEw9aquzduQXA7CwxinXngRYLTX/cK4u2ksgw4ppoRfXwzB4btk
 CHoq9GqfIAS0ShoctLrDWUTmprwS9cE4Woxs9hJcJPyLk0tumtkzHb7OkL4a5CuHM9s9
 SJTFc0mie2T6ImsJBStniqA/84j3HgwpLF958ocp5M7LYCPtZPRM+DznroXy4PYm2PNc
 0YcsmoVR2TOYA5QdUdXNFpq03xpV1vD409L+fXjcKbzzq8evmuSVaQ7W/DOXl+bzxIeF
 qCHO19mN7uFLIzvyOjgEHvRSVJIW9bz3uuROZbABmN0+ubuyfYu8lRsQtFREQv1Xr6C6
 Q24w==
X-Gm-Message-State: AOAM531o9OaIfaOGivmKQRUY+7UP6Nn/Jix0lXloUyIMfIyvvv0+qm84
 +hbRfYFZcKparU9TC0pDwRs=
X-Google-Smtp-Source: ABdhPJz/YAkiVW6Evbnt4r3fAo58mnl6utA0EqEIV5/y06X0mGCaI+FlguvwmvnKTh8Japg2wXx6FQ==
X-Received: by 2002:a5d:47c4:: with SMTP id o4mr10234043wrc.102.1632473443211; 
 Fri, 24 Sep 2021 01:50:43 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d16sm772108wmb.2.2021.09.24.01.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 01:50:42 -0700 (PDT)
Message-ID: <86d88a87-c54b-55c5-5722-310e86e7222e@amsat.org>
Date: Fri, 24 Sep 2021 10:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 04/20] nubus: use bitmap to manage available slots
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-5-mark.cave-ayland@ilande.co.uk>
 <f39eb222-28aa-416f-61a2-ab74f52fda8f@eik.bme.hu>
 <81bd27ad-8251-4e0b-f4c6-cb03c326b2cc@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <81bd27ad-8251-4e0b-f4c6-cb03c326b2cc@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 09:16, Mark Cave-Ayland wrote:
> On 23/09/2021 15:16, BALATON Zoltan wrote:
> 
>> On Thu, 23 Sep 2021, Mark Cave-Ayland wrote:
>>> Convert nubus_device_realize() to use a bitmap to manage available 
>>> slots to allow
>>> for future Nubus devices to be plugged into arbitrary slots from the 
>>> command line
>>> using a new qdev "slot" parameter for nubus devices.
>>>
>>> Update mac_nubus_bridge_init() to only allow slots 0x9 to 0xe on a 
>>> Macintosh
>>> machines as documented in "Desigining Cards and Drivers for the 
>>> Macintosh Family".
>>
>> Small typo: "a Macintosh machnies", either a or s is not needed.
> 
> Thanks - I've updated this for v6.
> 
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>> hw/nubus/mac-nubus-bridge.c         |  4 ++++
>>> hw/nubus/nubus-bus.c                |  5 +++--
>>> hw/nubus/nubus-device.c             | 32 +++++++++++++++++++++++------
>>> include/hw/nubus/mac-nubus-bridge.h |  4 ++++
>>> include/hw/nubus/nubus.h            | 13 ++++++------
>>> 5 files changed, 43 insertions(+), 15 deletions(-)

>>> struct NubusDevice {
>>>     DeviceState qdev;
>>>
>>> -    int slot;
>>> +    int32_t slot;
>>
>> Why uint32_t? Considering its max value even uint8_t would be enough 
>> although maybe invalid value would be 255 instead of -1 then. As this 
>> was added in previous patch you could avoid churn here by introducing 
>> it with the right type in that patch already. (But feel free to ignore 
>> it if you have no time for more changes, the current version works so 
>> if you don't do another version for other reasons this probably don't 
>> worth the effort alone.)
> 
> I think it makes sense to keep this signed since -1 is used for other 
> bus implementations to indicate that an explicit slot hasn't been 
> assigned. Potentially the slot number could be represented by an 8-bit 
> value, however it seems there is no DEFINE_PROP_INT8 or 
> DEFINE_PROP_INT16. Fortunately the slot number is restricted by the 
> available slots bitmask anyhow, so this shouldn't be an issue.

I wondered the same and noticed there is no DEFINE_PROP_INT8, so didn't
want to bother Mark furthermore :) Adding & using DEFINE_PROP_INT8 seems
a good idea, but to be fair with the repository we'd need to audit the
other places where DEFINE_PROP_INT32 isn't justified and update. Extra
work for not much gain, so I'm find with this patch. Can be improved on
top.

