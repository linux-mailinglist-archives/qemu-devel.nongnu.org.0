Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E9B41E9FF
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 11:44:38 +0200 (CEST)
Received: from localhost ([::1]:48974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWF5p-0003dD-Vh
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 05:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWF4l-0002nm-Pd
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:43:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWF4h-00075D-TP
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633081405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Afp741LRbL4j3sGksIA2A+E8Q4hy/Eqo6iuoYJfA3CE=;
 b=d2LHOygiKgRJPChjugVkiEoS8JMhE5vno54f4I6tmFMPVW6vGoCTQ5h890aE1i0nn0ZBwu
 AFxP8/S1zIDIrZrqr8Pg5p6AgodzQDjbNVJ6QgpWZK6ZUCbEVrqw968aYwUbiJuXUVLFGm
 B0ijQDE8qq9s/AwvmUqBLNk4jIyxEfA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-vohk1GKHNy-5oI8Xhi9ZTw-1; Fri, 01 Oct 2021 05:43:23 -0400
X-MC-Unique: vohk1GKHNy-5oI8Xhi9ZTw-1
Received: by mail-wr1-f72.google.com with SMTP id
 a10-20020a5d508a000000b00160723ce588so2611296wrt.23
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 02:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Afp741LRbL4j3sGksIA2A+E8Q4hy/Eqo6iuoYJfA3CE=;
 b=75IlO5nqmO06whIDaiv2/28u2iHhB/29v4diIR1LiLMT1kKiKfOVUsTUrAwFDW5qPv
 S03UYzCQvl9tcc9VUorOuFOiuXNIQNSDeq7mKSNChtZ6xKPagO4JDxt28akmX+CctoZ8
 xh/GL+qKqhHIUAbDz+22p3AndcUR+SRcQbl6/2+8fxCPzx97HbcreBf0KTv0IVuskfnv
 fiqW+3GdfmIw/thf9o/FjADqaQH6NfJNdpX9XK2dmtxBdCnGKqM8UQ2tLNGrAYtNo+0b
 nZM145SFOBF98SuAD0yIbylMBcOkcYKaxPB7ncvdxdH5GBNL65HIao3CWl7Ms/tPt3K1
 0wFg==
X-Gm-Message-State: AOAM533MczjKgLk6UGMA/Wdlw78ME35BqknMJMy4M5GMS8UwnE91/HIp
 IxBozT48qcdNjW8JRBigMbu3R25WC92SBtDycBXaLB2iv+oIztTCMVVos0q3Ar+t/B2EYSXNexZ
 QwPFBvFNVpoDwEKk=
X-Received: by 2002:a5d:464c:: with SMTP id j12mr11187213wrs.261.1633081401856; 
 Fri, 01 Oct 2021 02:43:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNVvQzh5AceK2zX3P4XkXWWYi9dMDTCKQUCR+KwwQUeTKEOXQEryg8hA68VvWOBaX22wGXdQ==
X-Received: by 2002:a5d:464c:: with SMTP id j12mr11187189wrs.261.1633081401657; 
 Fri, 01 Oct 2021 02:43:21 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id d7sm5299151wrh.13.2021.10.01.02.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 02:43:21 -0700 (PDT)
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
Date: Fri, 1 Oct 2021 11:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, peter.maydell@linaro.org,
 dbarboza@redhat.com, aik@ozlabs.ru, mark.cave-ayland@ilande.co.uk,
 groug@kaod.org, wainersm@redhat.com, Alexander Graf <agraf@csgraf.de>,
 hpoussin@reactos.org, clg@kaod.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/10/2021 11.14, Christophe Leroy wrote:
> 
> 
> Le 01/10/2021 à 10:35, Thomas Huth a écrit :
>> On 27/09/2021 06.48, David Gibson wrote:
>>> There are a nunber of old embedded ppc machine types which have been little
>>> changed and in "Odd Fixes" state for a long time.  With both myself and
>>> Greg Kurz moving toward other areas, we no longer have the capacity to
>>> keep reviewing and maintaining even the rare patches that come in for those
>>> platforms.
>>>
>>> Therefore, remove our names as reviewers and mark these platforms as
>>> orphaned.
>>>
>>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>>> Reviewed-by: Greg Kurz <groug@kaod.org>
>>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   MAINTAINERS | 19 +++++--------------
>>>   1 file changed, 5 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index f2060b46f9..1ecb5716c8 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1236,24 +1236,18 @@ F: hw/openrisc/openrisc_sim.c
>>>   PowerPC Machines
>>>   ----------------
>>>   405
>>> -M: David Gibson <david@gibson.dropbear.id.au>
>>> -M: Greg Kurz <groug@kaod.org>
>>>   L: qemu-ppc@nongnu.org
>>> -S: Odd Fixes
>>> +S: Orphan
>>>   F: hw/ppc/ppc405_boards.c
>>
>> Related question: Does *anybody* know how to still use the ref405ep or 
>> taihu board in QEMU? We just got another ticket asking for the related 
>> firmware image:
>>
>>   https://gitlab.com/qemu-project/qemu/-/issues/651
>>
>> And if you google for 'ppc405_rom.bin', I only find pages where people are 
>> asking basically the same question, e.g.:
>>
>>   https://lists.nongnu.org/archive/html/qemu-devel/2007-08/msg00252.html 
>> (in 2007 already! And no answer)
>>
>>   https://github.com/Xilinx/qemu/issues/36 (in 2019, no answer)
>>
>>   https://lists.libreplanet.org/archive/html/qemu-ppc/2019-12/msg00263.html (in 
>> 2019, no answer about bios location)
>>
>>   https://lkml.org/lkml/2020/4/25/61 (in 2020, no answer)
>>
>>
>> Seems like the Linux kernel removed support for the 405ep board here:
>>
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=548f5244f1064c9facb19c5e9 
>>
> 
> The EP405 board was removed because it was apparently based on the buggy 
> 405GP processor (It was selecting option CONFIG_405GP).
> 
> AFAIU the EP405 board is different from the ref405ep. The ref405ep has a 
> 405EP processor which is still supported, see 
> https://elixir.bootlin.com/linux/v5.15-rc3/source/arch/powerpc/kernel/cputable.c#L1300 

Oh, that's pretty confusing, thank a lot for the clarification!

Nevertheless, as long as nobody has a hint where to find that 
ppc405_rom.bin, I think both boards are pretty useless in QEMU (as far as I 
can see, they do not work without the bios at all, so it's also not possible 
to use a Linux image with the "-kernel" CLI option directly).

  Thomas



