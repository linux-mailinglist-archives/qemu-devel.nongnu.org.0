Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECFE30D512
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 09:22:33 +0100 (CET)
Received: from localhost ([::1]:55728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7DQm-0003xb-5A
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 03:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7DPk-0003MX-Nw
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 03:21:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7DPj-0000Xq-4y
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 03:21:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612340486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0HaMfCeA3mW7tOo+p9WhxttBgAhTD/hBKuTFreACb0Y=;
 b=e8iqccb4//99J0ZFjA+DhUXklJhl0iDDql2gXgtev898PgOzNQ6UK90+XDKeMCqamYiA+j
 2BDsVMXG6mQTR7n1Rd5Hg2PnxWk58qis/V2lVD3bCkJ57OA8hPiaLszEorQJn3as4MZWYP
 jozBcjXCQs/cO6/1egBAS89Xg+7291g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-b5M95Ia0OqO1jHaQs3qnyg-1; Wed, 03 Feb 2021 03:21:21 -0500
X-MC-Unique: b5M95Ia0OqO1jHaQs3qnyg-1
Received: by mail-wr1-f69.google.com with SMTP id s15so14025669wrt.14
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 00:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0HaMfCeA3mW7tOo+p9WhxttBgAhTD/hBKuTFreACb0Y=;
 b=Kl8JwlfCVjtx8Vc4XL41xTqibpBovjLGKQmQy+cEgNfriQMBqOMnG6x9IQx58eLzQY
 L/yOCfR3p3YFj6GSSrgHLC4oPCY2FfWAK/cqCEtKms8wTIJxk8SE5e1Svo9PvwSx/dIT
 4CRBuhtEbqCbdyuc4aDgiUIzIa1KAQyOXxpYaHYbYpsSJZu0cRfWXyzX+RikfWMUm86N
 A3vpb62ctEDtUEksLhf21zvlXW3b+XRRWzCj2IvsBdnEtiQBNhLPG2XEz/9KRiZFFd1G
 ljSpNBvOtPP3pP4oNpK+QaRdSI+QKDlNL2VrmPLlzFEqOHsoJiEp//dSoLwDl+q/U0PJ
 sc/Q==
X-Gm-Message-State: AOAM531VdQaO32PMtrHy0QsnL/e51+tm75QnLRwPhQMwiNKuEUfk9/iE
 FRO2eNCyhGPvRSlap9kcXYx+cUJgT7HU3o+HBl0seFpnhfZir6W2pblxxx/n+CPcNSxVBTBR+56
 MoSjz+xwSBw9TdP8=
X-Received: by 2002:a05:600c:35ce:: with SMTP id
 r14mr1697987wmq.136.1612340480249; 
 Wed, 03 Feb 2021 00:21:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqlk2Llr0JZLc2lbDTQIuHpWr8uXqtM11tLokM6Vpyjlzj3L46ZO0480VRP0Xh43cV2ylD1g==
X-Received: by 2002:a05:600c:35ce:: with SMTP id
 r14mr1697960wmq.136.1612340479881; 
 Wed, 03 Feb 2021 00:21:19 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id i8sm2435645wry.90.2021.02.03.00.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 00:21:19 -0800 (PST)
Subject: Re: ARM Snapshots Not Backwards-Compatible
To: Aaron Lindsay <aaron@os.amperecomputing.com>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
Date: Wed, 3 Feb 2021 09:21:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YBogDGJRU5pcDKmi@strawberry.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing migration team and qemu-arm@ list.

On 2/3/21 5:01 AM, Aaron Lindsay wrote:
> Hello,
> 
> I'm attempting to restore an AArch64 snapshot taken on QEMU 4.1.0 on
> QEMU 5.2.0, using system mode. My previous impression, possibly from
> https://wiki.qemu.org/Features/Migration/Troubleshooting#Basics was that
> this ought to work:
> 
>> Note that QEMU supports migrating forward between QEMU versions
> 
> Note that I'm using qemu-system-aarch64 with -loadvm.
> 
> However, I've run into several issues I thought I should report. The
> first of them was that this commit changed the address of CBAR, which
> resulted in a mismatch of the register IDs in `cpu_post_load` in
> target/arm/machine.c:
> https://patchwork.kernel.org/project/qemu-devel/patch/20190927144249.29999-2-peter.maydell@linaro.org/
> 
> The second was that several system registers have changed which bits are
> allowed to be written in different circumstances, seemingly as a result
> of a combination of bugfixes and implementation of additional behavior.
> These hit errors detected in `write_list_to_cpustate` in
> target/arm/helper.c.
> 
> The third is that meanings of the bits in env->features (as defined by
> `enum arm_features` in target/arm/cpu.h) has shifted. For example,
> ARM_FEATURE_PXN, ARM_FEATURE_CRC, ARM_FEATURE_VFP, ARM_FEATURE_VFP3,
> ARM_FEATURE_VFP4 have all been removed and ARM_FEATURE_V8_1M has been
> added since 4.1.0. Heck, even I have added a field there in the past.
> Unfortunately, these additions/removals mean that when env->features is
> saved on one version and restored on another the bits can mean different
> things. Notably, the removal of the *VFP features means that a snapshot
> of a CPU reporting it supports ARM_FEATURE_VFP3 on 4.1.0 thinks it's now
> ARM_FEATURE_M on 5.2.0!
> 
> My guess, given the numerous issues and the additional complexity
> required to properly implement backwards-compatible snapshotting, is
> that this is not a primary goal. However, if it is a goal, what steps
> can/should we take to support it more thoroughly?
> 
> Thanks!
> 
> -Aaron
> 
> p.s. Now for an admission: the snapshots I'm testing with were
> originally taken with `-cpu max`. This was unintentional, and I
> understand if the response is that I can't expect `-cpu max` checkpoints
> to work across QEMU versions... but I also don't think that all of these
> issues can be blamed on that (notably CBAR and env->features).
> 


