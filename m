Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8664345A8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 09:03:19 +0200 (CEST)
Received: from localhost ([::1]:40952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md5d8-0004tK-Hk
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 03:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1md5aV-0002RN-LL
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:00:35 -0400
Received: from apollo.dupie.be ([51.159.20.238]:58916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1md5aQ-0000De-47
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:00:35 -0400
Received: from [IPV6:2a02:a03f:fa8f:3301:eba1:a8ad:64a3:d6c8] (unknown
 [IPv6:2a02:a03f:fa8f:3301:eba1:a8ad:64a3:d6c8])
 by apollo.dupie.be (Postfix) with ESMTPSA id 1488B1520E03;
 Wed, 20 Oct 2021 09:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dupond.be; s=dkim;
 t=1634713227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TgOnuJ2+GY05PVffN8yynHDCfrSdGKgvDipAtFKwfMU=;
 b=HD+ZJXSlfGlHSX4S5RSaS4x/kd/0UKCupycmQZDHrb/apaTeU8yw3plnaPMpPaW6cLpjSq
 MqM2lDfBiWR1StM4u8ZyF0VJ+EzWdqHSrli2MiKFxqH9+21v8QpN7Ehi7m2tlakId3jMGd
 5i5Gd6egvaV5Pib9kqOC1SDkLNlr9s5htdh8do+KYSEWNJjrZqUbYR2duJnOh31cD7DQMX
 jLBM0J27au/d5cjZ9Jb9h4rDYhbCsBeF+3ZpuEOJt9CljLsPuZT0i7UYoMhvo0u9ExWgSD
 anQiPyvWQUZmsDV7dw9fmMRFHuxOBzFjyd3P5dKEvY5vBxSZDTvgp2jituQBvA==
Message-ID: <fd5d8692-c2c7-4bf1-40e1-d0b6d6704537@dupond.be>
Date: Wed, 20 Oct 2021 09:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
Content-Language: nl-BE
To: Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, berrange@redhat.com, jasowang@redhat.com
References: <20211012082428.16222-1-jean-louis@dupond.be>
 <a9b2ff3a-0bba-216c-eeda-50821be4940e@dupond.be>
 <YW6h+YcNEgyzh5zw@stefanha-x1.localdomain>
 <20211019065850-mutt-send-email-mst@kernel.org>
 <20211019152913.wjipmv6trjx6k7xa@habkost.net>
 <20211019120619-mutt-send-email-mst@kernel.org>
 <20211019165611.scfagcp4ikhigx5k@habkost.net>
From: Jean-Louis Dupond <jean-louis@dupond.be>
In-Reply-To: <20211019165611.scfagcp4ikhigx5k@habkost.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=51.159.20.238; envelope-from=jean-louis@dupond.be;
 helo=apollo.dupie.be
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/2021 18:56, Eduardo Habkost wrote:
> On Tue, Oct 19, 2021 at 12:13:17PM -0400, Michael S. Tsirkin wrote:
>> On Tue, Oct 19, 2021 at 11:29:13AM -0400, Eduardo Habkost wrote:
>>> On Tue, Oct 19, 2021 at 06:59:09AM -0400, Michael S. Tsirkin wrote:
>>>> On Tue, Oct 19, 2021 at 11:46:17AM +0100, Stefan Hajnoczi wrote:
>>>>> On Tue, Oct 12, 2021 at 10:36:01AM +0200, Jean-Louis Dupond wrote:
>>>>>> Forgot to CC maintainers.
>>>>> Also CCing Jason Wang and Michael Tsirkin for VIRTIO.
>>>>>
>>>>> Stefan
>>>> OMG
>>>> where all compat properties broken all the time?
>>> Compat properties that existed when commit f6e501a28ef9 ("virtio:
>>> Provide version-specific variants of virtio PCI devices") was
>>> merged are not broken, because virtio-*-transitional and
>>> virtio-*-non-transitional were brand new QOM types (so there's no
>>> compatibility to be kept with old QEMU versions).
>>>
>>> Compat properties referencing "virtio-*-pci" instead of
>>> "virtio-*-pci-base" added after commit f6e501a28ef9 are probably
>>> broken, yes.
>>>
>>> -- 
>>> Eduardo
>> Oh. So just this one:
>>      { "virtio-net-pci", "vectors", "3"},
>>
>> right?
> I think so.  That's the only post-4.0 virtio-*-pci compat property I see in
> hw/core/machine.c.
>
> pc.c doesn't have any post-4.0 virtio-*-pci compat props.  I didn't see any
> virtio compat props on spapr.c and s390-virtio-ccw.c.
>
>> about the patch: how do people feel about virtio specific
>> stuff in qdev core? Ok by everyone?
> Not OK, if we have a mechanism to avoid that, already (the
> "virtio-net-pci-base" type name).  I wonder what we can do to
> make this kind of mistake less likely, though.
>
> Jean-Louis, Jason, does the following fix work?
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index b8d95eec32d..bd9c6156c1a 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -56,7 +56,7 @@ GlobalProperty hw_compat_5_2[] = {
>       { "ICH9-LPC", "smm-compat", "on"},
>       { "PIIX4_PM", "smm-compat", "on"},
>       { "virtio-blk-device", "report-discard-granularity", "off" },
> -    { "virtio-net-pci", "vectors", "3"},
> +    { "virtio-net-pci-base", "vectors", "3"},
>   };
>   const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
>   
That patch fixes it indeed!

Acked-by: Jean-Louis Dupond <jean-louis@dupond.be>

