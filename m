Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC4F5ECA27
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:54:09 +0200 (CEST)
Received: from localhost ([::1]:54402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDqT-0004gl-0i
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1odDXl-0006aY-2X; Tue, 27 Sep 2022 12:34:49 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:40947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1odDXf-0007zD-KQ; Tue, 27 Sep 2022 12:34:48 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 r13-20020a056830418d00b0065601df69c0so6649709otu.7; 
 Tue, 27 Sep 2022 09:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=sbrSu2192bMxjGqsJgr4MOaCi6oFRKHaiD+Ob3I2/W8=;
 b=GMB+/GF9T5E/DFTxGFiQXeVaCMm1p3DkX1WeclqkAmOUEX4eqcrIFHadF6ZbCi5z1s
 ljRUn1NDPW5D12k0tKIXUEMsVAHz5gfTbIANZSDHiwwF0dZ4XLxvT1sfCwNyPuG5Mlsb
 K08Jur4KlIb2Uze46YhmlIVrGniKkKq2fqHqxkCWaBmFqRW0hR/t0gwD+clKW5G2e91J
 +Z/8ihn9D6fuhfEyEmpqpvKRRUTAVTOSCx6gMiSOee3t273Q11ORVzhOv5HaJNbAoBz+
 PTJnxdJ7s0HBjKQF0VVeadcb4cskTc/5atDmNHnr3adZU6lJlatsG8fl8UxX1SujtbBw
 oCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=sbrSu2192bMxjGqsJgr4MOaCi6oFRKHaiD+Ob3I2/W8=;
 b=0pcjDo5ulhPBnVAXiIRQiMpLiJ7CJDJhtf/gWjxU8g0CiJ7/o/aqOrckO7nQFeg1v+
 gPKeeRr4msF5F4aLkrq2p3MLj7lxrElBHlpHMO8TXxtU2wspEPDA2LQ8FsghcyypZFwK
 1Vmh/wXcWghVdpT2YQ0kd4QZiUEYu11zYmBDf0+N5B3tHOfX6OwAEfbsI2SvA2LE07e7
 q2o0KKyxGQfMi3b2rgWPPA7sEkP8kKnnd/Yz7UvYy+8snA7msgsL7yp1bNQCrJhnVVYG
 zIOmTv/3MomkOaC8QRx19Himp7WDMaqoF1ufVZIqy8FJ9dJ+ZEl0g9HYnPLcpzk1h2N3
 QHbg==
X-Gm-Message-State: ACrzQf3n3mS05BNsMHv0VG8ds62k+OULTfpL9huOIWIqW656lhlYeLDL
 zlF9thWt1nyM3K8L/JZSxPc=
X-Google-Smtp-Source: AMsMyM6DNh+a4+aVCCbRuf4+H89jVZ9lIQDZXJBnSG41Bi+o8A+6rHO+Ga9uTnlApJM9qlW5WnUJ8g==
X-Received: by 2002:a05:6830:31bb:b0:654:d29:32d5 with SMTP id
 q27-20020a05683031bb00b006540d2932d5mr12651475ots.130.1664296480565; 
 Tue, 27 Sep 2022 09:34:40 -0700 (PDT)
Received: from [192.168.10.102] (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 l9-20020a056871068900b0013191b00f72sm591630oao.17.2022.09.27.09.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 09:34:40 -0700 (PDT)
Message-ID: <c6897368-1d0c-dca9-218c-91709a4b27fc@gmail.com>
Date: Tue, 27 Sep 2022 13:34:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: qemu and -vga vs. -device
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, Adam Williamson <awilliam@redhat.com>
Cc: qemu-ppc@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <b773b085e1a3bda7aae1b6498216c416b30843bc.camel@redhat.com>
 <20220919044209.u7iy4c6zaibgtlpc@sirius.home.kraxel.org>
 <3aae1641f95503b40341c1130194a19e5e156b51.camel@redhat.com>
 <20220926092649.yjly7pkejttcqdlc@sirius.home.kraxel.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220926092649.yjly7pkejttcqdlc@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Adam,

On 9/26/22 06:26, Gerd Hoffmann wrote:
> On Sat, Sep 24, 2022 at 12:12:45AM -0700, Adam Williamson wrote:
>> On Mon, 2022-09-19 at 06:42 +0200, Gerd Hoffmann wrote:
>>> On Fri, Sep 16, 2022 at 10:02:17AM -0700, Adam Williamson wrote:
>>>> Hi Gerd!
>>>>
>>>> I'm working on a patch to revise how openQA sets video devices in qemu.
>>>> In that context, a question: if we always want to specify a single
>>>> video device with `-device` (e.g. `-device VGA` or `-device virtio-
>>>> vga`), should we also specify `-vga none` to ensure qemu doesn't also
>>>> include another adapter as a default for the -vga arg?
>>>
>>> Doesn't hurt to include it.  In theory it should not be needed, qemu has
>>> a list of vga devices and in case '-device $vga' is found on the command
>>> line will turn off the default vga device automatically.  In practice
>>> there are qemu versions where this list is not complete, so it
>>> sometimes doesn't work as intended.
>>>
>>> Alternatively use '-nodefaults' which will disable all automatically
>>> added devices (vga, nic, cdrom, ...).
>>
>> Thanks Gerd!
>>
>> So, I got around to testing this today, and found something
>> interesting. On ppc64le, adding `-vga none` seems to break things.
>> Booting a Fedora installer ISO, which should show the boot menu with a
>> 60 second timeout then boot to the installer, if we run the VM with `-
>> vga std`, we see the bootloader. If we run it with `-device VGA` and no
>> `-vga` arg, we see the bootloader. But if we run qemu with `-vga none -
>> device VGA`, we don't see the bootloader. The system just sits at the
>> OFW init screen apparently forever (I thought it might actually be
>> running in the background and recover to anaconda after the 60 second
>> boot timeout, but it doesn't seem to).
>>
>> Not sure what's going on there, but thought you might be interested.

Can you please send the full command line you're using?

I'm actually surprised that you can combo '-vga none -display VGA' together
in the command line is executed without a parse error.


This also works, which is also surprising to me:


(launches the process with the 'curses' display)
./qemu-system-ppc64 -M pseries -display none -display curses


(launches with the 'none' display)
./qemu-system-ppc64 -M pseries -display curses -display none


It seems that we're considering just the last entry as valid.

Should I send a patch to make QEMU error out when multiple '-display'
options are present in the command line?



Thanks,


Daniel

> 
> Hmm, no clue offhand.  Cc'ing qemu-ppc list (+ keeping full context).
> 
> I know ppc has some vga quirks in the machine init code path, switching
> framebuffer byteorder to bigendian for example, maybe more.  Possibly
> something goes wrong there.
> 
> take care,
>    Gerd
> 
> 

