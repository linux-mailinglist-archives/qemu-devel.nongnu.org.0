Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4702F9428
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 18:30:02 +0100 (CET)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1BsH-0007Go-4r
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 12:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BrI-0006gs-FA; Sun, 17 Jan 2021 12:29:00 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BrG-0007df-Ne; Sun, 17 Jan 2021 12:29:00 -0500
Received: by mail-wm1-x32b.google.com with SMTP id e15so5490513wme.0;
 Sun, 17 Jan 2021 09:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wjL5E7Yxi5OMKSh3EgWuck0lfVOC8x4MHz5HEOfuN+g=;
 b=m1A13RzD2QmNYbjyP18xwQElSWd2g3MacTbZWlM2R9PKO0FJI1W43f5RznbZiWIwjh
 IpwyBARnFi7PcZnVZY5WiHYMmySLQWLZFTmW6IDdxmMd+TtmeDeRsHnUXi0LsI70H1jK
 X6uSi0p+RBiA1sv2i+pFWLzjuIx2iHWI/ZmnHxvt0ScaipIgV0DlGux3QbgjeUkPjyLF
 wp6MSnS35o0fEGTcQQQFbccbr2zie8vqp2vjD6Iy6ltGS6UFN+EPCpMiiHAnDS/oq+2b
 VYe3sDreMNzQjvuxc0353MD8WfSz1TLXa9X5qCEKp+KI44nIGnT/NpSIhz0nXocmA+TU
 6GsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wjL5E7Yxi5OMKSh3EgWuck0lfVOC8x4MHz5HEOfuN+g=;
 b=hhnLrioFjFGieIO8NhAdJH1uOKML59ahXCjB2PWWVrJEySC56ey+Ydev4hYxHgLs2m
 hqM0i/RTxEe25kxirtEQD6I3c/ndAJp5rwASrBkDyeukivdK+uKCFMxuxp4UQOi87xPY
 J7QDTUPKeuhjnPgE1G96AsB8q+WoNVJEaVkHhFDDNZ4QyPNO8JPugfbxQPQYZoSMVwzq
 ReH1tOL0PQ/FDuG9C86vQw/2sOE6KuDLiML0AfO48VDuu/SFI1QYWkGlL3iNvA3WRKU6
 0V881JYUCt2io3/Y9SKN4P4+is4inKQvQo73eRK5feEURxPxgkJepBOPjWw4Ew5Osp6r
 umow==
X-Gm-Message-State: AOAM531akbxr2rTQkBnADycGrN8LIJJdEII10ywe5zPzZKQl6aEnbxxc
 RzGxbv8RUpo+33ay9nXNZYg=
X-Google-Smtp-Source: ABdhPJz8orFYe8xxexYRsRBKx7GUI3PquFuZhxb7Fc0kSdp5h1dGh7XvwPhTtaTJLQF3xPEOuTjsJg==
X-Received: by 2002:a1c:5454:: with SMTP id p20mr517738wmi.128.1610904536020; 
 Sun, 17 Jan 2021 09:28:56 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x17sm24097616wro.40.2021.01.17.09.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 09:28:55 -0800 (PST)
Subject: Re: [RFC PATCH 18/18] hw/core/qdev: Display warning for devices
 missing migration state
To: Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20200703201911.26573-1-f4bug@amsat.org>
 <20200703201911.26573-19-f4bug@amsat.org>
 <CAFEAcA98Wz2URx3Pt0YfaoQSPnnMT4wg6HBfzdDO4Zq+4fgT5g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a4a0c335-8ebf-4b22-b7ff-be59054b5705@amsat.org>
Date: Sun, 17 Jan 2021 18:28:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA98Wz2URx3Pt0YfaoQSPnnMT4wg6HBfzdDO4Zq+4fgT5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.252,
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
Cc: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/20 9:14 PM, Peter Maydell wrote:
> On Fri, 3 Jul 2020 at 21:19, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> When built with --enable-qdev-debug, QEMU displays warnings
>> listing devices missing migration state:
>>
>>   $ qemu-system-arm -S -M spitz
>>   qemu-system-arm: warning: missing migration state for type: 'pxa270-c0-arm-cpu'
>>   qemu-system-arm: warning: missing migration state for type: 'serial'
>>   qemu-system-arm: warning: missing migration state for type: 'pxa2xx-pcmcia'
>>   qemu-system-arm: warning: missing migration state for type: 'pxa2xx-pcmcia'
>>   qemu-system-arm: warning: missing migration state for type: 'pxa2xx-i2c-slave'
>>   qemu-system-arm: warning: missing migration state for type: 'pxa2xx-i2c-slave'
>>   qemu-system-arm: warning: missing migration state for type: 'ads7846'
>>   qemu-system-arm: warning: missing migration state for type: 'max1111'
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> RFC because there might be something simpler than --enable-qdev-debug.
> 
> I think where we'd like to get to is installing a migration
> blocker if the machine has any devices which don't have a vmsd.
> But for that we'd need to be pretty sure we'd got all the devices
> on machines where we care about migration, and we're clearly a
> fair way from that (eg we need to do something about the
> devices like the CPU which don't have a vmsd but handle their
> migration some other way so they don't trigger the condition
> for warning/migration-blocker).

Dave made a comment about it, I'd rather let him have a look.

> I don't have a strong objection to this --enable-qdev-debug, I guess.
> Another option halfway between this and a full migration-blocker
> would be do a warn_report() for the relevant devices when savevm
> tries to migrate them.

OK. The problem is vmstate_save_state() is not qdev specific, it
migrates a blob, which we can not report much about. I'll repost
using 2 warnings.

Thanks for your review,

Phil.

