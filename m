Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B52453A1A6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 12:02:58 +0200 (CEST)
Received: from localhost ([::1]:47228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwLBp-00015F-8e
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 06:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwL8k-0007cb-Mp; Wed, 01 Jun 2022 05:59:46 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:45620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwL8i-000485-R8; Wed, 01 Jun 2022 05:59:46 -0400
Received: by mail-oi1-x230.google.com with SMTP id k11so1939605oia.12;
 Wed, 01 Jun 2022 02:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XttoVUO90FAY6RMSblaoILEdEx/5rt4uyEIdiqVinMQ=;
 b=b6+E7ig7gR9E96W1wqg8sLl/9krzAsE4kR98TEOBWHupnr945BjfghpKzd4QljCRza
 lrhcPimTjJzuXv0eyg+PMboAJYMfpv9NHZ3cLyIiVQtXSjbyYvN++dzIzh8Q4MbqGHhp
 uTvzudJr5678rgR+6v+g1ljZaP48z0ZH8wOXe6D8w6Fr83RD9jDPDDLTlgqBS4n7eFTD
 gFNpUQ187zx7SxlOfIOQoTwsyTPkRvb6LcRJ6oRdF6p/D0digjnC2xMatvmufafO/YIW
 +C2ByDs+i+2D39JYiQVCfKLd1REop734uyV7bHfZkCF06Liv+ESq7quym4NruY0ifK8o
 mBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XttoVUO90FAY6RMSblaoILEdEx/5rt4uyEIdiqVinMQ=;
 b=wW0L2ZOFSHsPjlSMKDdRX2p0q+l+0P//pwVRsB5aXitRjDKw6vbO/irvA62RZBKHBF
 aQTYl+a2cnuFAlmsrg5gl1z/XXVynHNXRZhtww0xfOrp8n33mISY3iCTHpEouLMReG1h
 EKj8RVfEZfpCaqDghabj0r6KLZrbPURky8/0caRZjLlHF4K0VKC3v+eDFZkS/15P6pC+
 8QSClxmND21CwPNrQD5tsHlu+Ht0xzXapFMC+UDdREcMK6sy8h+OIE77XonGPzlRfmcQ
 yAmipTyQskh1f7WsCJR7RczM7MKkPbLT++o3HKz2BpngL5MfMbacA01NxXHk+nFY5Cjf
 GYDQ==
X-Gm-Message-State: AOAM530UhwEWY2nfeOx495QKmaLNsOc0Md7H6nASRDCUPddg3qUSgJWj
 G/ECOiOfDzJCLPq88LOvxm8=
X-Google-Smtp-Source: ABdhPJxw2UpAsNm+WfOA5dYVLRiojLhbW/f/AviXPqVwAv1dlhm8XnmZ5DIk8/DgQ0TL7JbcAVmXXQ==
X-Received: by 2002:a05:6808:19a6:b0:32b:fc85:e0a7 with SMTP id
 bj38-20020a05680819a600b0032bfc85e0a7mr9094974oib.48.1654077582472; 
 Wed, 01 Jun 2022 02:59:42 -0700 (PDT)
Received: from [192.168.10.102] ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a54460e000000b003289f51c2d7sm654751oip.34.2022.06.01.02.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 02:59:42 -0700 (PDT)
Message-ID: <28d5e774-c097-99ee-356c-2aa59602f181@gmail.com>
Date: Wed, 1 Jun 2022 06:59:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/ppc/cpu-models: Update max alias to power10
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>
Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, mopsfelder@gmail.com,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20220531172711.94564-1-muriloo@linux.ibm.com>
 <475c2f40-8c58-8d51-4cc5-da5b9db814f2@redhat.com>
 <20220601103825.498c378f@bahia>
 <5076ea8a-428d-5aa2-1a8c-cd38bf67c7f9@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <5076ea8a-428d-5aa2-1a8c-cd38bf67c7f9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 6/1/22 06:25, Thomas Huth wrote:
> On 01/06/2022 10.38, Greg Kurz wrote:
>> On Wed, 1 Jun 2022 09:27:31 +0200
>> Thomas Huth <thuth@redhat.com> wrote:
>>
>>> On 31/05/2022 19.27, Murilo Opsfelder Araujo wrote:
>>>> Update max alias to power10 so users can take advantage of a more
>>>> recent CPU model when '-cpu max' is provided.
> ...
>> We already have the concept of default CPU for the spapr
>> machine types, that is usually popped up to the newer
>> CPU model that is going to be supported in production.
>> This goes with a bump of the machine type version as
>> well for the sake of migration. This seems a lot more
>> reliable than the "max" thingy IMHO.
>>
>> Unless there's a very important use case I'm missing,
>> I'd rather kill the thing instead of trying to resurrect
>> it.
> 
> It's about making ppc similar to other architectures, which
> have "-cpu max" as well, see:
> 
>   https://gitlab.com/qemu-project/qemu/-/issues/1038
> 
> It would be nice to get something similar on ppc.


I agree that it's preferable to fix it.

This is how I would implement -cpu max today:

pseries (default ppc64 machine):
  - kvm: equal to -cpu host
  - tcg: the latest IBM chip available (POWER10 today)

powernv8: POWER8E
powernv9: POWER9
powernv10: POWER10

pseries requires more work because the -cpu max varies with the host CPU
when running with KVM.

About the implementation, for the bug fix it's fine to just hardcode the alias
for each machine-CPU pair. In the long run I would add more code to make -cpu max
always point to the current default CPU of the chosen machine by default, with
each machine overwriting it if needed. This would prevent this alias to be
deprecated over time because we forgot to change it after adding new CPUs.

For qemu-system-ppc the default machine seems to be g3beige and its default
CPU is PowerPC 750. I would set -cpu max to this CPU in this case. Matter of
fact I would attempt to set -cpu max = default cpu for all 32 bits CPUs for
simplicity. This is also outside of gitlab 1038 as well since the bug isn't
mentioning 32 bit machines, hence can be done later.


Thanks,

Daniel


> 
> By the way, the warnings that you currently get when running with
> TCG are quite ugly, too:
> 
> $ ./qemu-system-ppc64
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-cfpc=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-sbbc=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ibs=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ccf-assist=on
> 
> Maybe these could get fixed with a proper "max" CPU in TCG
> mode, too?
> 
>   Thomas
> 


