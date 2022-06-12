Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEC4547824
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 03:12:49 +0200 (CEST)
Received: from localhost ([::1]:38204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0C9o-0006Js-2p
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 21:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o0C7Z-0005WB-6w
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 21:10:29 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o0C7X-0002Qu-E9
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 21:10:28 -0400
Received: by mail-pf1-x42b.google.com with SMTP id z17so2721967pff.7
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 18:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ed2L5Xukb0x530A4eAXxNU5Y2kMwxFVSJ7UPqpwGeqo=;
 b=abxM082Dlwxi65fThPNfZemww/5/56Sdae15mJ/9NowCfcVuO1BqCEcCjPX/iKj5gP
 jzaz/vgCrovBaYKU7U9+DArZtxg20Oi8wzCFth72tIjPW7GrJrqg1NPST0hoDFw6f/qk
 KzfbM+Y7SMTmAzFFC9NVDfjYWyESskIrdWmM0HcE2uxttenUuAlpWUxGkkL8Z+PxT7g2
 zsSo3NIcs/Mt+V5YdgVNm+7bCWhbJiumqSQq/nrIyEnWKoyK1N1zQeuqdiRE+kVdQeoh
 4WUNfAexkeSJ50lHbZ85+JiVZmFwsazFUmHl76hZ4kpL73VbBMMIXogi0mc5zzct/5Zl
 Ruew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ed2L5Xukb0x530A4eAXxNU5Y2kMwxFVSJ7UPqpwGeqo=;
 b=MUH8TrjQFmpFfQV2tMZANHYUzawj2bgwrVY3KigSvDpY3cGwXSZ6EhC7tVbnmIjbBD
 EmFs6Qha0/cRp38HConr/FzRbhbV6GO9eF92jESs2oNEXgQpWumpqbtTvxiJ5nc+dUB+
 p4mbUDiUCz6kgEHjw2NGAOGZxi8QPoCb42eVkN4DHvEBztpSd+w/QGm4RZotoj4qri/Z
 ngHPDEMhjfo1URxkb9e3tqxkfaVyQw/hJiUCIZxgpDblqR68tJdPQJ9R7R2vaWMAOhpP
 HBlZVdnej5EBMYkQLgsLd3kAo9m2vgGQiW3p2I2O4VuoGACLWUUvUJ2l5iDJhn+wleP+
 5lLA==
X-Gm-Message-State: AOAM532E8njZ7yFRKnO6OiTyR0zIVlwhv3c+4LjCgc3E464r/Z3vHKNd
 aZF43lDvMieDHOuiqNjlT2g=
X-Google-Smtp-Source: ABdhPJx6nOH3fmkp/Vrk+8u78czzsqal/W8wFxPqKLD2ytrgYjBiiB/mtGp+2rlz16bQrrPZgqSQ7w==
X-Received: by 2002:a05:6a00:194d:b0:51b:eb84:49b1 with SMTP id
 s13-20020a056a00194d00b0051beb8449b1mr43072278pfk.77.1654996224101; 
 Sat, 11 Jun 2022 18:10:24 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 kw19-20020a17090b221300b001dd11e4b927sm4212883pjb.39.2022.06.11.18.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 18:10:23 -0700 (PDT)
Message-ID: <77ae4462-6cd6-b612-a36d-68f196d6a0cf@gmail.com>
Date: Sun, 12 Jun 2022 10:10:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PULL 00/17] Kraxel 20220610 patches
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: "Canokeys.org" <contact@canokeys.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>, xen-devel@lists.xenproject.org,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220610092043.1874654-1-kraxel@redhat.com>
 <adec1cff-54f1-e2bf-8092-945601aeb912@linaro.org>
 <60c72935-85ce-4e24-43a5-119f6428b916@t-online.de>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <60c72935-85ce-4e24-43a5-119f6428b916@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2022/06/12 1:34, Volker Rümelin wrote:
> Am 10.06.22 um 22:16 schrieb Richard Henderson:
>> On 6/10/22 02:20, Gerd Hoffmann wrote:
>>> The following changes since commit 
>>> 9cc1bf1ebca550f8d90f967ccd2b6d2e00e81387:
>>>
>>>    Merge tag 'pull-xen-20220609' of 
>>> https://xenbits.xen.org/git-http/people/aperard/qemu-dm into staging 
>>> (2022-06-09 08:25:17 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://git.kraxel.org/qemu tags/kraxel-20220610-pull-request
>>>
>>> for you to fetch changes up to 02319a4d67d3f19039127b8dc9ca9478b6d6ccd8:
>>>
>>>    virtio-gpu: Respect UI refresh rate for EDID (2022-06-10 11:11:44 
>>> +0200)
>>>
>>> ----------------------------------------------------------------
>>> usb: add CanoKey device, fixes for ehci + redir
>>> ui: fixes for gtk and cocoa, move keymaps, rework refresh rate
>>> virtio-gpu: scanout flush fix
>>
>> This introduces regressions:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/2576157660
>> https://gitlab.com/qemu-project/qemu/-/jobs/2576151565
>> https://gitlab.com/qemu-project/qemu/-/jobs/2576154539
>> https://gitlab.com/qemu-project/qemu/-/jobs/2575867208
>>
>>
>>  (27/43) 
>> tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password: 
>> ERROR: ConnectError: Failed to establish session: EOFError\n Exit 
>> code: 1\n    Command: ./qemu-system-x86_64 -display none -vga none 
>> -chardev 
>> socket,id=mon,path=/var/tmp/avo_qemu_sock_4nrz0r37/qemu-2912538-7f732e94e0f0-monitor.sock 
>> -mon chardev=mon,mode=control -node... (0.09 s)
>>  (28/43) tests/avocado/vnc.py:Vnc.test_change_password:  ERROR: 
>> ConnectError: Failed to establish session: EOFError\n    Exit code: 
>> 1\n    Command: ./qemu-system-x86_64 -display none -vga none -chardev 
>> socket,id=mon,path=/var/tmp/avo_qemu_sock_yhpzy5c3/qemu-2912543-7f732e94b438-monitor.sock 
>> -mon chardev=mon,mode=control -node... (0.09 s)
>>  (29/43) 
>> tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password: 
>> ERROR: ConnectError: Failed to establish session: EOFError\n Exit 
>> code: 1\n    Command: ./qemu-system-x86_64 -display none -vga none 
>> -chardev 
>> socket,id=mon,path=/var/tmp/avo_qemu_sock_tk3pfmt2/qemu-2912548-7f732e93d7b8-monitor.sock 
>> -mon chardev=mon,mode=control -node... (0.09 s)
>>
>>
>> r~
>>
> 
> This is caused by [PATCH 14/17] ui: move 'pc-bios/keymaps' to 
> 'ui/keymaps'. After this patch QEMU no longer finds it's keymaps if 
> started directly from the build directory.
> 
> With best regards,
> Volker
> 

I have a patch series which allow to find files not in pc-bios directory 
even if started directly from the build directory:
https://patchew.org/QEMU/20220228005710.10442-1-akihiko.odaki@gmail.com/

Regards,
Akihiko Odaki

