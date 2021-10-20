Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C464349FC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:26:14 +0200 (CEST)
Received: from localhost ([::1]:53284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9jZ-0007XP-SO
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1md9F9-0005E3-AB
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:54:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1md9F6-0000gZ-EO
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634727282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=26D6RplWtJlPo89MFZk4m9/d0qq7cfTYZZAo8RZ6Qjc=;
 b=YiORo/vuRxiQOnqTC3tbiSDr4LSnHLlH3Ot0rX7uQXsa8bwgX8XSetGsUTTsd/SKpGRDX4
 6FSXaAiS2EApHJUdcVJ7Ky4pKi88NfvEgvdLsgCE1epsHp1RuVGsp+WlPKfxF2af8z9SUv
 JacxOaqIC8HPZV4aPKGvPBUxp1gAWVA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-Vu_uWR0RPaujbFcFKP-rHQ-1; Wed, 20 Oct 2021 06:54:41 -0400
X-MC-Unique: Vu_uWR0RPaujbFcFKP-rHQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z26-20020a05600c221a00b0030da55bc454so3999210wml.4
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=26D6RplWtJlPo89MFZk4m9/d0qq7cfTYZZAo8RZ6Qjc=;
 b=yYMmn748+QsS5RC0DUEXCS5slBIfs1cuWH7QzmoufgVY/bsm2t22f3HtMlEyOVaaLz
 6ISlqS/E2rpKaWFPTJIBW47hHmZLwWdsti7cknz+WaTl6KhNTaQBUkxifvbGFn7g3x5Y
 J8Vm9frRwZtHVD7Oe7s1+E4LsAlQX84EnAnV77XOgch1PWRST2kS3EQrk0l3ul03loEa
 +BJPvLsHIfOv2TD+GXVLWogK9geR9bOpnbWxwcdVR+eDpf06yZWF8SSkN/U7u7IE0tEy
 Ea1O9we94d8RVVRoWeoc0jpVZrDhgd6xQ0rHzjAMwPXMZkPpthmSEVWQYlJxx/36FDso
 lmDA==
X-Gm-Message-State: AOAM533AM8n+ImrGfUGeo8App4cWsumoWk5RIVkODHBUdxQnIIV8Ud19
 bz9cuCDSPtuc2WIfVIA+bfCfzAICWFKvg2SG1WN4DMpkjizWusywgC92+nfYOBQOlc2MvlsO+8P
 ux16B82yBz1zLmAY=
X-Received: by 2002:adf:b748:: with SMTP id n8mr50936492wre.133.1634727280549; 
 Wed, 20 Oct 2021 03:54:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXfrvnGu4z5nTp3LZTKju00gKW+3TSRxg0+0qhM72RPmMvI/6sLP0wdURj8Kohb6h1kI6e9w==
X-Received: by 2002:adf:b748:: with SMTP id n8mr50936459wre.133.1634727280295; 
 Wed, 20 Oct 2021 03:54:40 -0700 (PDT)
Received: from thuth.remote.csb (tmo-097-184.customers.d1-online.com.
 [80.187.97.184])
 by smtp.gmail.com with ESMTPSA id o10sm1876174wmq.46.2021.10.20.03.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 03:54:39 -0700 (PDT)
Subject: Re: CLI: Using -bios AND -kernel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
 <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
 <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
 <7526ae07-0054-69df-c71f-8751858ef0db@redhat.com>
 <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com> <YWQB1FMhQfmqRYxN@yekko>
 <bcdf63a4-8d22-8b25-d980-7fc574f80e82@redhat.com>
 <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
 <8c382ce4-f706-376c-289a-b8c64393decb@redhat.com>
 <880f4bde-19fc-1267-3a04-3d9efd660897@csgroup.eu>
 <c09d92d9-a5a3-328f-824c-07653f8e649@eik.bme.hu>
 <054c5b53-84ab-370f-8806-5f54265e8d3e@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5d0b9827-616b-120b-3100-dac69fe86bed@redhat.com>
Date: Wed, 20 Oct 2021 12:54:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <054c5b53-84ab-370f-8806-5f54265e8d3e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/2021 12.12, Philippe Mathieu-Daudé wrote:
> Hi John / Paolo / Markus,
> 
> On 10/19/21 12:07, BALATON Zoltan wrote:
>> On Tue, 19 Oct 2021, Christophe Leroy wrote:
>>> Le 19/10/2021 à 11:39, Thomas Huth a écrit :
>>>> On 19/10/2021 11.31, Christophe Leroy wrote:
> [...]
>>> I use the following command, but it does nothing, it stays in uboot
>>> prompt as when I don't get a kernel argument
>>>
>>>      ~/qemu/build/qemu-system-ppc -M taihu -bios
>>> ~/Téléchargements/u-boot.bin -serial null -serial mon:stdio -kernel
>>> arch/powerpc/boot/uImage
>>
>> I'm not sure using -bios and -kernel together makes sense, it probably
>> starts u-boot in this case and you have to load and start the kernel
>> from u-boot as you'd notmally do on a real machine. Alternatively you
>> could use -kernel instead of -bios which then loads a kernel and starts
>> it directly but not sure if it needs a firmware to work.
>>
>> Ot I could be completely wrong as I don't know this machine and haven't
>> tried it.
> 
> Usually -bios overwrites -kernel/-append cmdline options.
> Having them accepted together is probably a configuration mistake,
> and we should reject that (generically).

No, having -bios and -kernel together is perfectly fine if the BIOS knows 
about it. Have a look at the ppc64 pseries machine, it works perfectly fine 
with -bios and -kernel at the same time.

  Thomas


