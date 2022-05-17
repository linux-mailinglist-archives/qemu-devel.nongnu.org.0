Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DDC52A3A6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:41:16 +0200 (CEST)
Received: from localhost ([::1]:41866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxRr-0002Od-5Z
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqx6I-0002XZ-Hl
 for qemu-devel@nongnu.org; Tue, 17 May 2022 09:18:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqx6F-000335-J5
 for qemu-devel@nongnu.org; Tue, 17 May 2022 09:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652793534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gbu3fCzEja5JiZZ1ktm2rgsPoL0eoVdFMVnXD5uu1Xc=;
 b=DF3hWGHO3Vnf06NcAf1yBKmNtotdUwswaN86NqdCNj9ZMir0WCuM8YE2qi9eVNdZ++Jqaw
 kaKgz1hMGUbREG/GTpgNtiPE0aRGlS6Q7tx/XH8ESBJ54HG78mmT3aN8X+MKPmc5AGcQiX
 NKlT4IrG9GfweR/9Nxc+c+1MDTAnh40=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-G2xHl9XNNHuNcXFYbqXJkA-1; Tue, 17 May 2022 09:18:51 -0400
X-MC-Unique: G2xHl9XNNHuNcXFYbqXJkA-1
Received: by mail-wm1-f72.google.com with SMTP id
 s14-20020a05600c29ce00b00394611a8059so1259164wmd.4
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 06:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gbu3fCzEja5JiZZ1ktm2rgsPoL0eoVdFMVnXD5uu1Xc=;
 b=JMBjhOnmkLwVyDj++fV16yQqOnoaHh7TlJSqkXmGuUioAIQE2KAH7/R9/aON6RY3Kp
 4OrGcG4BeBF83oA9unRDlfwc662H3Pl8fJzq4q+y8PQ+XPNSmTQihEus3ZGJXkMWq/NZ
 AyBszOhlFIfSj4zgr08CbEDnv/CfeUjTOISlUG5kjDm/+r2dMxCsfDzAlnAvWwujYP/Q
 4C295u5Nupd4D26WVhzxli1TfeVnMx04DaPR1kqbhkh7QT2HnX/mzDo6dCJWzCl5VVPm
 DNVkQlAehVGpOTVonkIRtmmitiU95c3HjJdr5wD6FQilGz8+P2H/FOzjz2vOhc35uT2C
 DqAg==
X-Gm-Message-State: AOAM532u/NqF6Q0D9+UeYiAIgc25bmm7zqgWpNvcGg1aW7xVRrg4H80K
 GWqI8k1cEFSGJHLvwiC3tV+530KbwfZGoQs/Ly5peEiPPZxI8rCMURKShUrsMLsKoARYKPSH8vk
 OKKpDpD1vahADtLI=
X-Received: by 2002:a7b:c24d:0:b0:393:fac9:3015 with SMTP id
 b13-20020a7bc24d000000b00393fac93015mr21565081wmj.186.1652793530073; 
 Tue, 17 May 2022 06:18:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyCB6Fl9fjmvEJUDFhod3xt/RZMB7uFkr0+lFf6Fx7IOMl3HN17rfr+qRQz75bibGKU9wTzQ==
X-Received: by 2002:a7b:c24d:0:b0:393:fac9:3015 with SMTP id
 b13-20020a7bc24d000000b00393fac93015mr21565056wmj.186.1652793529825; 
 Tue, 17 May 2022 06:18:49 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 b9-20020adfc749000000b0020c6a524fd5sm14343206wrh.99.2022.05.17.06.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 06:18:49 -0700 (PDT)
Message-ID: <1fdfea3d-b9d9-371d-e743-706c3a31223d@redhat.com>
Date: Tue, 17 May 2022 15:18:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] ui: Switch "-display sdl" to use the QAPI parser
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, libvir-list@redhat.com
References: <20220511175147.917707-1-thuth@redhat.com>
 <20220511175147.917707-3-thuth@redhat.com> <878rr77xpn.fsf@pond.sub.org>
 <870d24be-6c37-ff3d-616b-68255345ebb9@redhat.com>
 <a0c572b3-243a-2ee7-67c6-47744a5ac330@redhat.com>
 <87zgjgqudb.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87zgjgqudb.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/05/2022 13.19, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 5/17/22 10:34, Thomas Huth wrote:
>>>> This remains, and that's fine.  One step at time.
>>> Not sure how we want to proceed with that in the long run, though
>>> ... IIRC clearly, Paolo once said that it doesn't really belong into
>>> "-display" anyway and should be handled with the separate "-vnc"
>>> option instead?
>>
>> Not me, Gerd
>> (https://lore.kernel.org/all/20210825092023.81396-2-thuth@redhat.com/T/#e8c4f826cc8ff48b9afad37703e11704137f540c8):
>>
>>> Other way around, -display vnc should be dropped.  -display is about
>>> local displays, and there can be only one instance.  -vnc / -spice
>>> enable remote access, and this can be done in addition to a local
>>> display.
>>> not possible:
>>>   -display gtk + -display sdl
>>> possible:
>>>   -display gtk + -vnc
>>>   -display gtk + -vnc + -spice
>>>   -display none + -vnc + -spice
>>
>> For what it's worth, Libvirt uses both -vnc and -spice, so we might
>> very well proceed with Gerd's idea.  If we don't like -vnc and -spice
>> then it may be possible to QOMify them and go with -object.
> 
> Are we ready to deprecate -display vnc?

If nobody disagrees, I'd say yes.

  Thomas


