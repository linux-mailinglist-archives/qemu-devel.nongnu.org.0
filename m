Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD792D1E87
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 00:47:42 +0100 (CET)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmQEH-0006wB-Cp
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 18:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1kmQBs-0005p7-0I
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:45:12 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1kmQBp-000087-Ep
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:45:11 -0500
Received: by mail-pg1-x541.google.com with SMTP id g18so10499849pgk.1
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 15:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X5VpAkxloHfTlmKfPhg3FGOKH5kP2pd28WaM06MRR14=;
 b=TIdTzA5dZ2ll5VVI5Y3aUokuyyDGXgPA3pZOmFbaRWNTMdd5ZrLcAIEqn1nx0AaBtJ
 DV6JFahG+hXNDVc0uUte6rZeHCtF5mb8oRVo+HEkbE23+oIkCfXfUNsHl81ZOHI0uY/H
 eM37sfMk8owaHICeZVWU91gAsZQJLiT5Cpbdh7XQG+/A1FkJ1rG1cFAJ8PjVpgYC4xiI
 g2biyjU28Lbl5Qp17J8ohJJ3KDjBOPQmsD73Oc0CIdM4CJq2UVRjkH/OMcs2RQlU/seg
 KvRzU/aej/jmfcDVHnpAp6Pkz6jxRwnwf45qoXpYIyZLr1TW1PkgtlLP8hxSaFyt0ziy
 sNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X5VpAkxloHfTlmKfPhg3FGOKH5kP2pd28WaM06MRR14=;
 b=unNnVC+WNUmBkqDi0GDZg7iaX01eNrZENpibNxuPx0Jocz3jem7sElK9anqzERlfNi
 hmhYA6k/XZ+3GQICodoEvNv/ykIiz1xEwFEE969UaK5LozTdAg5bFuEp2QBkUL/HHh65
 biDHrTy5j8T9b4tnFHuUDZEP2asbEgetEmFRzv6VeD2OHqpLGPgJAwtR05/31zexF5s6
 JbKT2OoW0EAmquKM5j9Y2R4ZBmmm1CwwJdz+eYB1s/0P/cpfQoLJqlXm5nwoopmnI4av
 2kNwwoXCQO9K6D+TdRRjwIyhh5d7z+TR40ndb4i5nnWCJ+EpxffqA+Mfx8rLoff28ghX
 T8Yg==
X-Gm-Message-State: AOAM5310gD+7S3rPaEDH1xJTOdaWfXLBKAHHPgzZt80TT6L/fOdOjFAi
 Q73IjzvzUzjuf7+qeUJVfBUPn0xx8DB+uQ==
X-Google-Smtp-Source: ABdhPJwXEzDTuHaMYLdUDkx48BIkCclyCn8Kj6iGbCafbqTW9iW3UjdkMMbOMyfjFSqObU6L8fFdsQ==
X-Received: by 2002:aa7:8517:0:b029:19d:d70f:86ec with SMTP id
 v23-20020aa785170000b029019dd70f86ecmr11258193pfn.19.1607384706141; 
 Mon, 07 Dec 2020 15:45:06 -0800 (PST)
Received: from [192.168.10.153] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id f92sm477216pjk.54.2020.12.07.15.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 15:45:05 -0800 (PST)
Subject: Re: [PATCH qemu v11] spapr: Implement Open Firmware client interface
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>
References: <20201207073327.33367-1-aik@ozlabs.ru>
 <20201207181547.54453964@bahia.lan>
 <a86e3a6d-cf4d-a11a-3312-2f171a4a09ef@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <9df20756-a17a-71d9-2c42-2e881b4b1652@ozlabs.ru>
Date: Tue, 8 Dec 2020 10:45:01 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <a86e3a6d-cf4d-a11a-3312-2f171a4a09ef@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x541.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/12/2020 04:47, Cédric Le Goater wrote:
> On 12/7/20 6:15 PM, Greg Kurz wrote:
>> On Mon, 7 Dec 2020 18:33:27 +1100
>> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>>> The PAPR platform which describes an OS environment that's presented by
>>> a combination of a hypervisor and firmware. The features it specifies
>>> require collaboration between the firmware and the hypervisor.
>>>
>>> Since the beginning, the runtime component of the firmware (RTAS) has
>>> been implemented as a 20 byte shim which simply forwards it to
>>> a hypercall implemented in qemu. The boot time firmware component is
>>> SLOF - but a build that's specific to qemu, and has always needed to be
>>> updated in sync with it. Even though we've managed to limit the amount
>>> of runtime communication we need between qemu and SLOF, there's some,
>>> and it has become increasingly awkward to handle as we've implemented
>>> new features.
>>>
>>> This implements a boot time OF client interface (CI) which is
>>> enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
>>> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
>>> which implements Open Firmware Client Interface (OF CI). This allows
>>> using a smaller stateless firmware which does not have to manage
>>> the device tree.
>>>
>>> The new "vof.bin" firmware image is included with source code under
>>> pc-bios/. It also includes RTAS blob.
>>>
>>> This implements a handful of CI methods just to get -kernel/-initrd
>>> working. In particular, this implements the device tree fetching and
>>> simple memory allocator - "claim" (an OF CI memory allocator) and updates
>>> "/memory@0/available" to report the client about available memory.
>>>
>>> This implements changing some device tree properties which we know how
>>> to deal with, the rest is ignored. To allow changes, this skips
>>> fdt_pack() when x-vof=on as not packing the blob leaves some room for
>>> appending.
>>>
>>> In absence of SLOF, this assigns phandles to device tree nodes to make
>>> device tree traversing work.
>>>
>>> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
>>>
>>> This adds basic instances support which are managed by a hash map
>>> ihandle -> [phandle].
>>>
>>> Before the guest started, the used memory is:
>>> 0..4000 - the initial firmware
>>> 10000..180000 - stack
>>>
>>> This OF CI does not implement "interpret".
>>>
>>> Unlike SLOF, this does not format uninitialized nvram. Instead, this
>>> includes a disk image with pre-formatted nvram.
>>>
>>
>> [...]
>>
>>> diff --git a/pc-bios/vof/nvram.bin b/pc-bios/vof/nvram.bin
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..d183901cf980a91d81c4348bb20487c7bb62a2ec
>>> GIT binary patch
>>> literal 16384
>>> zcmeI%Jx;?g6bEpZJ8*)oSZeqZi&Z2pKnD)sI4{AHlNb4;RW}a70XPHaW57uo=-#R7
>>> zKSLBhJJ0sdixY3IuY@hzo0r$OmE%T;XE9uh@s1k=AOHafKmY;|fB*y_009U<00Izz
>>> z00bZa0SG_<0uX=z1Rwwb2tWV=XCbip6d#B4{{rX#XR%}$Bm^J;0SG|gWP$!?Aq=-I
>>> zcT+0Ix{{?1q>9J8r+eW^JK1tYYZZMWQCUwW%0S*~w^p@wfkX-<yRFx)H*+YEt0RRd
>>> zmn}6xtwbP`yp4O=>kxMAEA<~5@*g)@mb%KD5!;O~8c)>8rRQBx55=trhk#+1+T3J_
>>> zaf*G4vZAduqy$qda{``6Gnc2DQg<Es<GLxL#9<Oj*zP!8ZSnwf@-j7l47!nFXQO$a
>>> z^Hes6YU^_M<KsM*k~zwOSa+2g3Sx{*Eyu^XrB0FM5IJ-*?8`VvpBc4}vS(+_UKJ;=
>>> xITAns0uX=z1Rwwb2tWV=5P-nt34DD||Nni|VfbXeJORuY0uX=z1R!vE0>7B^s4f5i
>>>
>>> literal 0
>>> HcmV?d00001
>>>
>>
>> So this needs an extra drive on the command line, eg:
>>
>> -drive file=pc-bios/vof/nvram.bin,format=raw,if=pflash
>>
>> Any chance this can be generated internally if the user
>> didn't provide one already ?

We can do everything :) The patch is already big and misformatted nvram 
is hardly noticeable.

> 
> or simply change the bios filename if x-vof=on ?

It is not bios (pc-bios/vof.bin is), it is NVRAM. You do not usually 
pass a file, instead QEMU creates in-memory blob and SLOF formats it 
when booted the first time. You can use a file to preserve changes made 
in SLOF across QEMU instances.


-- 
Alexey

