Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADEC132874
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 15:07:49 +0100 (CET)
Received: from localhost ([::1]:49348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iopWN-0004O1-NO
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 09:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ioo45-0003vG-Aj
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:34:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ioo44-0004fj-3o
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:34:29 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54740
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ioo43-0004fR-VO
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578400467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5EahkR4Wwx9xaL2CS2mZiBFLnc3ih+MGdabVPSdzOM=;
 b=Y6B3ZmnwDXnYr0d/k9a+DGcDbJ2b63XNcbDRoYR5y/AvIpg+iYhQ0oJ7tycMTaHfkawTTn
 FRHYL5AhKPti8wwwF/6WQbkGmZG+RUZqQpV42wmLWIeOdH+iAOZJTwuLkBo9Spxo/BLJlk
 TLHG3g2YFXtbmvuk4LhXo3yRg1hcB+0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-pX4fZQUCP0-G7OCIEljVOw-1; Tue, 07 Jan 2020 07:34:26 -0500
Received: by mail-wr1-f70.google.com with SMTP id z10so24351386wrt.21
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 04:34:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D5EahkR4Wwx9xaL2CS2mZiBFLnc3ih+MGdabVPSdzOM=;
 b=tcm5M+CaawjetGu0cC+Hg9yugBQBTGt3NmjT/ckkf2ydSxiMskjcnCERD3Xodm4W2a
 sJnNq9rfjs/yUs5Q2Sibd7dRB7AuRa35/0rvHg4aoMK90m7Bo/tigzH230KAvVCsO20S
 hQO1Brc0yg1Ua9+NWj/gyoKhtSSn+63EUXRemvnA/CiPZe7eXb5sz12zDsFcJ1x6SvMM
 tR1Q8Bfq4gtGCmfZEudEsmEWRa255TyidGE7ZomWL2o16S8OPMMMMyuxu3yrTpu3hFVH
 NAu576vzOq7HXec2KMRs7ArTJEwggQwUfT/t9ermrmBu68J8cgWtJAjKTjGZLYHuk53S
 6DeQ==
X-Gm-Message-State: APjAAAXRogc49oiQVfusT/ko3BZIub/JwXLyaJdwM7b76A+jazfW5rM4
 9fTqr7HOjTaLnw3r4k0BaVcW6NeNNRv5zXT47nxIQbsRMzMF2sY+gWn0qLviddF4//4LKWmgX9o
 7WtHuWJK9Nlsg8/A=
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr105829769wrt.70.1578400465386; 
 Tue, 07 Jan 2020 04:34:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHbJBwkDNROgTH0SlexQE4eKrs9/lKXPEgf4jyGY7UXpJCe/uQ6M7OFVhROq8IC6UXfivLDQ==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr105829738wrt.70.1578400465185; 
 Tue, 07 Jan 2020 04:34:25 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id x17sm76359879wrt.74.2020.01.07.04.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 04:34:24 -0800 (PST)
Subject: Re: Priority of -accel
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200106130951.29873-1-philmd@redhat.com>
 <c493e693-13a7-7dc4-eb2d-5dbc7b3053f1@redhat.com>
 <12334054-4ae7-e580-9727-2d322bfa2bda@redhat.com>
 <58eb34db-7d32-8b0e-d9ef-98648209486b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7322b7c9-51a9-f8e3-9d90-1d242d1c8cb4@redhat.com>
Date: Tue, 7 Jan 2020 13:34:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <58eb34db-7d32-8b0e-d9ef-98648209486b@redhat.com>
Content-Language: en-US
X-MC-Unique: pX4fZQUCP0-G7OCIEljVOw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/20 1:18 PM, Thomas Huth wrote:
> On 07/01/2020 11.14, Paolo Bonzini wrote:
>> On 07/01/20 11:03, Thomas Huth wrote:
>>>>   
>>>>   vm = QEMUMachine(iotests.qemu_prog)
>>>> -vm.add_args('-machine', 'accel=kvm:tcg')
>>>> +vm.add_args('-accel', 'kvm', '-accel', 'tcg')
>>> Looking at this, I wonder whether we really want the "-accel" option to
>>> prioritize the accelerators in the order of appearance? A lot of other
>>> CLI tools give the highest priority to the last parameter instead, e.g.
>>> "gcc -O3 -O1" compiles with -O1, and not with -O3.
>>>
>>> Also I think it might be quite common that there are shell scripts which
>>> call "qemu-system-xxx -accel xyz $*" ... and if we don't invert the
>>> priorities of -accel, it will be impossible to override -accel in that
>>> case...
>>
>> Hmm, it does match "-machine accel=kvm:tcg" and in general I think it's
>> more self-explanatory.  However, it is indeed less friendly to scripts.
>>   On one hand those could be changed to place "-accel xyz" after $* (or
>> better "$@"), on the other hand we could also add a priority option to
>> "-accel".  What do you think?
> 
> I don't think we need a separate priority parameter here. But IMHO it's
>   really rather common practice to prioritize the last option. So while
> it might be more "self-explanatory" to a CLI newbie if the first
> occurrence got the highest priority, it might be rather confusing
> instead for a CLI veteran...?
> 
> What do others on the list here think about this?

We can make CLI more complex by adding a 'priority' option:

   -accel tcg,priority=1 -accel kvm,priority=0


