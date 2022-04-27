Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A04D511BF5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 17:38:41 +0200 (CEST)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njjkW-0003Yj-9S
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 11:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njjil-0002gD-ID
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 11:36:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njjij-0001Yc-7B
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 11:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651073807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLzRtimpMwkEhbx4emiYpoBgN4Y+vripnsA+QcNWh8Y=;
 b=e47a7PD0YkmU/SfL8MdTj/j4I3eG/MNATViODoJBjly2VikmMm2RhGMCx0CyoN3FEFf9Ro
 nUY0xX2eVN7XyLYmpCnMHPXg5MmW6wCQShVkpjZljxGyiwbq7TbHvCFkB2C5l3I0cFO3Ha
 P3NtpnY+HLk2r4X48yM0mE6iNMQBqNg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-JPu2ZEQXP5CU8mLaYtk4NQ-1; Wed, 27 Apr 2022 11:36:46 -0400
X-MC-Unique: JPu2ZEQXP5CU8mLaYtk4NQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v13-20020adfc5cd000000b0020ad3580cd0so888885wrg.10
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 08:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=PLzRtimpMwkEhbx4emiYpoBgN4Y+vripnsA+QcNWh8Y=;
 b=bh3oOgcIwNcBfyEblSGaB8dbAPp4+M+aCx5dwNh6GWd1MVcx+np4/TxwkJ4iEN5YZ+
 rON0yH/yWQMzMJCUa1I/ng3nQ0wSy0uSuts9EMtoZ1xF8WTNHSakN2zB9b370uYpGtOw
 +xQjPV/88Ys9M1GUt1A6lld5JwX/P2HL+kIyumOnnj5kaYh3vdxRb8Enlbz1GqT1XGED
 wwpiV1u7vVgQGL0xTVNuobArsFvpDgD5fbUImC7AWsiMC7ESuB3VEIQuZgDrE7woM5JP
 +TuCqwxlzzASoTRRoErh2yNJ3pGp8isycSJRQzCQJ1nmDaUUKGpUklTbyiy6b1cURjVk
 vXfA==
X-Gm-Message-State: AOAM533Lrx4BjKfJl3dqmOiJH1V5b8C0v2ilm9sbZYMgRQR7nIiWepbW
 d1N/LYBFsU9lhCSsfy55hrTALVd/45hLuxzmjjIJf7fkvHP59AC3A7Tys3Gy2CfhCq40VQBUlGc
 DZr/BbsXnU3sJ4yQ=
X-Received: by 2002:adf:bd91:0:b0:209:19ac:7159 with SMTP id
 l17-20020adfbd91000000b0020919ac7159mr21994609wrh.3.1651073805311; 
 Wed, 27 Apr 2022 08:36:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeRxULmrOLQQqJqV/2VI13K13LIoNQxVijy/gvXXFK1QVi4JzXOkCbG+oqjLDKbRpFmoLMvQ==
X-Received: by 2002:adf:bd91:0:b0:209:19ac:7159 with SMTP id
 l17-20020adfbd91000000b0020919ac7159mr21994591wrh.3.1651073805033; 
 Wed, 27 Apr 2022 08:36:45 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a1ce910000000b0038eabd31749sm2160786wmc.32.2022.04.27.08.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 08:36:44 -0700 (PDT)
Message-ID: <4106256f-1648-cf8b-b0e2-cefc84caf18e@redhat.com>
Date: Wed, 27 Apr 2022 17:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: serial hang in qemu-system-ppc64 -M pseries
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Rob Landley <rob@landley.net>, QEMU Developers <qemu-devel@nongnu.org>
References: <74b9755a-4b5d-56b1-86f5-0c5c7688845a@landley.net>
 <8558c117-75a0-dc73-9b1a-be128e04056c@redhat.com>
In-Reply-To: <8558c117-75a0-dc73-9b1a-be128e04056c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/04/2022 17.27, Thomas Huth wrote:
> On 26/04/2022 12.26, Rob Landley wrote:
>> When I cut and paste 80-ish characters of text into the Linux serial 
>> console, it
>> reads 16 characters and stops. When I hit space, it reads another 16 
>> characters,
>> and if I keep at it will eventually catch up without losing data. If I type,
>> every character shows up immediately.
> 
> That "16" certainly comes from VTERM_BUFSIZE in hw/char/spapr_vty.c in the 
> QEMU sources, I think.
> 
>> (On other qemu targets and kernels I can cut and paste an entire uuencoded
>> binary and it goes through just fine in one go, but this target hangs with 
>> big
>> pastes until I hit keys.)
>>
>> Is this a qemu-side bug, or a kernel-side bug?
>>
>> Kernel config attached (linux 5.18-rc3 or thereabouts), qemu invocation is:
>>
>> qemu-system-ppc64 -M pseries -vga none -nographic -no-reboot -m 256 -kernel
>> vmlinux -initrd powerpc64leroot.cpio.gz -append "panic=1 HOST=powerpc64le
>> console=hvc0"
> 
> Which version of QEMU are you using? Which frontend (GTK or terminal?) ... 
> this rings a distant bell, but I thought we had fixed these issues long ago 
> in the past... e.g.:
> 
> https://yhbt.net/lore/all/1380113886-16845-10-git-send-email-mdroth@linux.vnet.ibm.com/ 
> 
> https://git.qemu.org/?p=qemu.git;a=commitdiff;h=8a273cbe53221d28
> 
> ... but maybe my memory also just fails and this has never been properly fixed.

In case you're using GTK, I think I just found the problem that I was 
remembering again:

https://lists.gnu.org/archive/html/qemu-ppc/2016-11/msg00142.html
https://lists.gnu.org/archive/html/qemu-ppc/2016-11/msg00143.html

I assume this has never been properly fixed.

  Thomas


