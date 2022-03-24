Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F934E6276
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 12:27:13 +0100 (CET)
Received: from localhost ([::1]:51906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXLcW-0000kE-SX
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 07:27:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXLZc-00089i-Qy
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:24:18 -0400
Received: from [2a00:1450:4864:20::52a] (port=35425
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXLZY-0008Un-L0
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:24:10 -0400
Received: by mail-ed1-x52a.google.com with SMTP id k10so5256536edj.2
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 04:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fpIP2aaxTIaH0Mj59D8I6LdrLFMvxnSnr60opnY/vLg=;
 b=pfjXUsqzYdWthubHXLIEW4RXX3q0ucJJdSdKwJYVwg4qvWkV++RZwi8gKKl7lqOPoQ
 9VZei0z71dIpJdek2nWS8WLae2UCEgjaXdVGOOInxY0kyvc12V9UeZVldd1mM9u+hD2P
 V2+HqeqPtPuoHvzCBE9Kig/kORAfMYmFBvu7IAsN0tM8JLtDY4clxWjtsPoP/aebl27O
 g4YddeWpiKg4Xz7E3Ewkz2opZCS1dqfaHyZkRyB+5JQ3pJAe4vs/WhGSD+y7Tku31+k/
 2a7lSrEvTnlW5Kbu+edaSkVEKP55Xc2OixNfw3v+v42YmYp+TENhAM8MoxI+fufIHwCV
 po4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fpIP2aaxTIaH0Mj59D8I6LdrLFMvxnSnr60opnY/vLg=;
 b=K08GBQ7FMOXtnPZQdudYytZTfUm7h6RG7pCdrvRIYVx03Cn+ibz4L0oSRw3TJdRhhn
 b+spR1twrD3N3ObJvBVmrtx8kyrIHPD/OHkZJEty5RO1IVVrT582udfAQahvcLXA/NzE
 YW1vbeBJrYhOkDsGUF9K3MyLxXi5rULAnVdCD0npFYczsR1/k7Zd/tpFR+umGXhoZ/4X
 ODOXA8Mb2mNIQ5ljlK7iOBrV0howszAXaU8j7Drd2XNka+w+lXhlpwhBi4k9jUP8tPfh
 kDgTgYJumTCeznV/RwYB7MnEdMQdrBXm+czeiHfirMWZBvLk+kX91SLaAXTK6aDhXCiq
 u3Rg==
X-Gm-Message-State: AOAM530j+BSCyOwz80WYn+kDPyr9SXGTq0PMrB/SRMuLlbPPlDjbEaNb
 6LlnkaIAsKRMQGmHSl3A1n8=
X-Google-Smtp-Source: ABdhPJzon1A27j0M8FhIAEpk/UU6MvN7m+tG7u+1MY3381gX2wlpnLIpr3y/sBN1xmcVJWRJoBKMtQ==
X-Received: by 2002:a05:6402:11d2:b0:419:4da5:ed71 with SMTP id
 j18-20020a05640211d200b004194da5ed71mr6059160edw.272.1648121044268; 
 Thu, 24 Mar 2022 04:24:04 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 z6-20020a056402274600b004194fc1b7casm1317598edd.48.2022.03.24.04.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 04:24:03 -0700 (PDT)
Message-ID: <6bad2204-4a21-19e7-e2f6-3ef30632bda4@redhat.com>
Date: Thu, 24 Mar 2022 12:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] target/i386: introduce CPU property to work around
 Windows reset bug
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220324082346.72180-1-pbonzini@redhat.com>
 <Yjw2KG4y8fK5Dw4F@redhat.com> <Yjw2yvN1OHkmBb2X@redhat.com>
 <e0a39a1e-abef-722b-eed7-8bb79e7c151d@redhat.com>
 <YjxQAKKKBR3oHdRN@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YjxQAKKKBR3oHdRN@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Vadim Rozenfeld <vrozenfe@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/22 12:03, Daniel P. Berrangé wrote:
> 
>    "This only applies to virtual machine hardware version 10 as Windows
>     resets the TSC on all CPUs on virtual machines with older hardware
>     versions (which do not support hypervisor.cpuid.v2)."
> 
> do you know what they mean when they refer to 'hypervisor.cpuid.v2'
> here ? I wonder if it gives any hints as to a root cause that could
> be fixed ?

The difference between hardware versions probably is that older versions 
do not support Hyper-V enlightenments.  The bug does not happen if 
Windows uses the RTC for timekeeping, which is consistent with the 
description above.

> This hardware version 10 is well old - their current hardware version
> is 19, so it seems to show the implemented some built-in fix in newer
> hardware versions (their equiv of machine types). The vmware setting
> dates from 2013, and if I read that kbase correctly isn't needed on
> their modern hardware versions. Or maybe monitor_control.enable_softResetClearTSC
> became the default in newer hardware versions ?

Yeah, maybe it became the default but they didn't want to change 
previously-released hardware versions.  So that would be basically 
treating it as an ABI change, and only enable it in 7.0 machine types.

That said, the VMware kbase does paint a slightly different picture.  It 
implies that starting with hardware version 11 rebooting Windows is done 
through a hard reset instead of INIT.  I'm not sure how that would be 
done, but in the meanwhile our fix should take care of do_cpu_init as well.

Paolo

