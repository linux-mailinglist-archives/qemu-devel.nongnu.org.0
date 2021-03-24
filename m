Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7A4347DC3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 17:35:12 +0100 (CET)
Received: from localhost ([::1]:33000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP6TP-0008TX-Cb
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 12:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP6PY-0007PT-EU
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:31:13 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP6PV-0002qh-9r
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:31:12 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo1540163wmq.4
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 09:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=dl28Dc8FiMNahe49aMA9ePxJG314L2c9WIb7PD0L7Ac=;
 b=SFeCPvx5rd3nCu6nUIdm1of9+L3KlrOPAfzcPcpM7w1uM28HQjNAm7gkn73r9bsOed
 4zZYpg87DW/c4NVRhYBCeEA+0+XvGpiKdSAXJjfnNSia/iVUKX0SuF+rEHFJHqNaJ0bI
 bvVhHqKEOAvKAyZDSmw9geT3d3sU3Yn1nIg1TLLDg1XWk5bcAa3cGK7+i7pkzUyfu78e
 b8OuiNeH6HKBCxI0AiMeRruBV8arrtRwtdqcems64FzO9bXlG7wJmYWSm8kxMV0QHfD/
 WMVUdPAGeFw6ufYf5IjIBMso1Pj64iW/DXgqeTZ7oMMbhpg3rhEoomTWCH3pNg1ZE/8z
 8GjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=dl28Dc8FiMNahe49aMA9ePxJG314L2c9WIb7PD0L7Ac=;
 b=hrQMeEXp43qnQZFwikMgBZ0cLVB1KKYlzAPZCsZA2MFfeTbHFToQUsPnnlgIaqFUVG
 Mz18m527sb7XuPw+gYrPGp0rBfX1GUMsPbnvrOwaijhLhj+dkpE21/j6himyp4AUpIxZ
 2/wtAUwCrTmLAVonX1e0UTn0T83fP4GycTu4kbnzirNsbkr+Oka45cUY2YmEr6qyNpnR
 fvgDJlYBdwd2F80HMfH3KsWRv+SYh6Hvf0W0vupdHRYzCvK1aym4niw3SuMB6bFTd/FQ
 JzYheGAEYkFn8VeDrIypFYxp5lPP1+i9/5UL8+o7p5lS3Zv7N5QdOHry1SAxzvmSM1wq
 Ixdw==
X-Gm-Message-State: AOAM533Zio26pVTWt1tKybNgoFiIxsvJqumrWHENLm0o3skrrmL8LoLD
 wK+iB38FOqkEUlJXABDEhhoHKg==
X-Google-Smtp-Source: ABdhPJxrtTzAGiQvX43q03+ei0W9oTnz+Zr6eV1ZUthyk6yY+dD5CFb/J4dqiGyPrczPwGuEvvokQQ==
X-Received: by 2002:a7b:c1c9:: with SMTP id a9mr3660843wmj.145.1616603467665; 
 Wed, 24 Mar 2021 09:31:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j4sm2897130wmo.10.2021.03.24.09.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:31:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D5871FF7E;
 Wed, 24 Mar 2021 16:31:05 +0000 (GMT)
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-23-cfontana@suse.de> <87eeg5iivn.fsf@linaro.org>
 <1ba15970-749a-27c5-ef72-6468b5501f46@suse.de> <87blb8ixmw.fsf@linaro.org>
 <878s6cixg2.fsf@linaro.org> <0d3378f7-03a0-58bb-445f-bbb174de65f8@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v11 30/55] target/arm: wrap call to aarch64_sve_change_el
 in tcg_enabled()
Date: Wed, 24 Mar 2021 16:30:20 +0000
In-reply-to: <0d3378f7-03a0-58bb-445f-bbb174de65f8@suse.de>
Message-ID: <87zgysh5ti.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 3/24/21 12:48 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>=20
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> On 3/23/21 11:50 PM, Alex Benn=C3=A9e wrote:
>> <snip>
>>> Moving up the build chain to the revert I now get:
>>>
>>>   ./qemu-system-aarch64 -M virt,gic=3Dhost -cpu host -accel kvm -m 2048
>>> -net none -nographic -kernel
>>> ~/lsrc/linux.git/builds/arm64.virt/arch/arm64/boot/Image -append
>>> "panic=3D-1"
>>>   --no-reboot
>>>   qemu-system-aarch64: Property 'virt-6.0-machine.gic' not found
>
>
> I think I am seeing this on master too, can you check?
>
>  ./qemu-system-aarch64 -M virt,gic=3Dhost -cpu host -accel kvm -m 2048
> -net none -nographic -drive
> if=3Dpflash,format=3Draw,file=3D/home/cfontana/QEMU_EFI.img -drive
> if=3Dpflash,file=3D/home/cfontana/varstore.img -drive
> if=3Dvirtio,file=3D/home/cfontana/debian.img -drive
> if=3Dvirtio,format=3Draw,file=3D/home/cfontana/debian-10.8.0-arm64-netins=
t.iso
>
> qemu-system-aarch64: Property 'virt-6.0-machine.gic' not found
>
>
>>=20
>> PEBKAC:
>>=20
>> The proper command line is "-M virt,gic-version=3Dhost"
>>

Sorry apologies for the acronym: Problem Exists Between Keyboard and
Chair - i.e. I messed up the command line ;-)


--=20
Alex Benn=C3=A9e

