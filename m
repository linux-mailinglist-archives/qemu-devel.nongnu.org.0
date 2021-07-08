Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861923C17BF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:07:49 +0200 (CEST)
Received: from localhost ([::1]:55736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XV6-0000i5-IN
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1m1Wf8-0001HV-5e
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:14:06 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:49435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1m1Wf5-0000Vc-SU
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:14:05 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailforward.nyi.internal (Postfix) with ESMTP id BB3AB1940BBC;
 Thu,  8 Jul 2021 12:14:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 08 Jul 2021 12:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Y9L7mn
 PoCTM9eva9Nk3xNyfoePPSqUmsc1qRlRIrQdw=; b=WOCOEfVpAWhAx9OzZN72Gr
 yovqrAcfKcov4l0h4AYdb9AA0KufNz7Kf2PgRAdW+FeiWN17Bhg4Rdzr+ON4rxmd
 daS92GV3K4+3UX8QrLOtwAUkJegbir7Hub6diKYCDYADaSUnZEUuUYqHWJkjKu2y
 wCRTlpVmKb4OxF9Vo3fhDkG9rnYmtlBBHkfeSPvFNuBtudg/DlW6nGlhjzd7WU4R
 jJX9UowEKhixIdmB0/UDpICZfjzNlGt+CiRfeZ278zXDQ0FI7A4VB6FsD76aNHiE
 01yA2k1PE1jHP+Tw52V0INtX/DVua7440LXLio8ZqiLDh5lUtmarG/q0aVpk201A
 ==
X-ME-Sender: <xms:SCTnYMtY5AzJIlFAWXtfT4E846YOH103Hxc-jdBu-ceF4WFR72u2lA>
 <xme:SCTnYJdMGtIfrd7BTpEcHYPTa3XYna7CUsZpA3BFjOPV_enbMfs9sYfuI49Od-LF2
 0Smp1RXLRzgNq9zV98>
X-ME-Received: <xmr:SCTnYHyelpq2n9mUp7X-hYtGIX0MrMz8A9MIomodABj7hMwGWnZlfIByZDk61PFqwCaRgXeXujQRqwK5Cj0O8kXcFkWNm8JCOv9BDuRGo24>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefvufgjfhfhfffkgggtsehttdertddttddtnecuhfhrohhmpeffrghvihguucfg
 ughmohhnughsohhnuceoughmvgesughmvgdrohhrgheqnecuggftrfgrthhtvghrnhephf
 ekgeeutddvgeffffetheejvdejieetgfefgfffudegffffgeduheegteegleeknecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepughmvgesughmvg
 drohhrgh
X-ME-Proxy: <xmx:SCTnYPNOuAtliKVlWttL8H5HwkoPTIp643iCdF383l78HDfFOykn_w>
 <xmx:SCTnYM-zr1K0HIy_V_8S0gV80I3Z-D1JjqRA5-_lzcdqi10lQFpM4Q>
 <xmx:SCTnYHUlFtahG1P2u-7yHV_bFCOLMWRCdTL7MHNkbFrRMjRBcHrZHQ>
 <xmx:SCTnYN3XNggwSSy19oheJovx5ocYSvSA-AsL6n5VXe1bAP2ZZ2olgA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 12:13:59 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 6ef51eab;
 Thu, 8 Jul 2021 16:13:57 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 8/8] target/i386: Move X86XSaveArea into TCG
In-Reply-To: <e4a048f5-cc6d-7bbe-6659-54075cafb9c6@linaro.org>
References: <20210705104632.2902400-1-david.edmondson@oracle.com>
 <20210705104632.2902400-9-david.edmondson@oracle.com>
 <0d75c3ab-926b-d4cd-244a-8c8b603535f9@linaro.org> <m2czru4epe.fsf@dme.org>
 <m24kd5p7uf.fsf@dme.org> <e4a048f5-cc6d-7bbe-6659-54075cafb9c6@linaro.org>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Thu, 08 Jul 2021 17:13:57 +0100
Message-ID: <m235so4wca.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=66.111.4.223; envelope-from=dme@dme.org;
 helo=forward1-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, babu.moger@amd.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday, 2021-07-08 at 08:22:02 -07, Richard Henderson wrote:

> On 7/8/21 12:45 AM, David Edmondson wrote:
>> Actually, that's nonsense. With KVM or HVF we have to use the offsets of
>> the host CPU, as the hardware won't do anything else, irrespective of
>> the general CPU model chosen.
>> 
>> To have KVM -> TCG migration work it would be necessary to pass the
>> offsets in the migration stream and have TCG observe them, as you
>> originally said.
>> 
>> TCG -> KVM migration would only be possible if TCG was configured to use
>> the same offsets as would later required by KVM (meaning, the host CPU).
>
> And kvm -> kvm migration, with the same general cpu model chosen, but with different host 
> cpus with different offsets?
>
> It seems like we must migrate then and verify the offsets in that case, so that we can 
> fail the migration.

Agreed.

I will look into migrating the offsets.

dme.
-- 
The sound of a barking dog on a loop, a plane rises in the crystal blue.

