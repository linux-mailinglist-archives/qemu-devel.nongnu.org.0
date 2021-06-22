Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAE83AFDBC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 09:21:42 +0200 (CEST)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaj7-00069c-C3
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 03:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvai5-0005De-0n
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:20:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvai3-0006PV-8y
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624346434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOrjYHwWVaNxFGoCuovj+bvnyIyCbhiyONiHMJ+JO14=;
 b=DJOcimZkpnDH5s+OJETxAvZhD9RvodvMZLjOcNE4P9l/CnNaTtF2Agd2yYSdjcQCCMMAjY
 8VN9xDvqXP0AOS+x6tuM6NMMia7ZpSmiWa1gzl8lMoUvoCW7vIDOrLaUVObRSvb8Nyr3D5
 4XnRKUqjXYjHbtt7FFOH1ctQObK3/SM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-j0lHrxlaPlGQfVfgi1xy6g-1; Tue, 22 Jun 2021 03:20:32 -0400
X-MC-Unique: j0lHrxlaPlGQfVfgi1xy6g-1
Received: by mail-wm1-f72.google.com with SMTP id
 i24-20020a1c54180000b02901dbcf5d699eso753096wmb.0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 00:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zOrjYHwWVaNxFGoCuovj+bvnyIyCbhiyONiHMJ+JO14=;
 b=FTeX4xPshMA15P7dkLBv6mMOmahqNOJfKclrXn/9HYFvEyshunZVYwmu46bUjK+biD
 qfY87OsA5hT2fu6aQpTe9nIZ0BnItD8IwEgEQ2roCL8LgNLcRydVb05iCP9X/KEITbGQ
 gKAVVmkSE81dW+R7J8RcF3/+flNalN69Iu8k4dZDlD52PWslAOBztWaP2oMEJAqXkEJL
 q5bWS7ft1xyrF9RXgJ5cqiOe0feWbNM5wmUOpEs7cqu74A5Sske6KXA5YgmPbcmRNcmy
 bXK3mLZIy7686QDJDVcH0KyJ5lzNtiSNV5Mu0aGAGIDHmfK3JHMmfdH/CYMEyBV/KRPP
 FAng==
X-Gm-Message-State: AOAM531aHJulAiRuBrOTmund634cDdEY02mwH0QElnPUpMZZaADBqi2y
 4me2KG53FubKy67Lr87KuDUr052isM0JiodICMTi+8mIr9Jtg78SN4CESZxYeNbgRAedskq/3aT
 yDBzvYfW+ODtIsj4=
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr2800955wmq.109.1624346431535; 
 Tue, 22 Jun 2021 00:20:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxM/ZSvlzQo1p/gWfOxBkHKzJ1jqXu7ZwhunSmQHySy9hS/QWHw9o1oz/NQcxKlmEb6X9HEog==
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr2800945wmq.109.1624346431364; 
 Tue, 22 Jun 2021 00:20:31 -0700 (PDT)
Received: from thuth.remote.csb (pd9575f2f.dip0.t-ipconnect.de. [217.87.95.47])
 by smtp.gmail.com with ESMTPSA id t64sm1310785wma.44.2021.06.22.00.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 00:20:30 -0700 (PDT)
Subject: Re: [RFC 0/3] qtest: pick tests that require KVM at runtime
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210616152455.1270264-1-imammedo@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f136b5a1-504b-c602-2e70-12b5b0d976b6@redhat.com>
Date: Tue, 22 Jun 2021 09:20:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616152455.1270264-1-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, philmd@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/06/2021 17.24, Igor Mammedov wrote:
> 
> Sometimes it's necessary to execute a test that depends on KVM,
> however qtest is not aware if tested QEMU binary supports KVM
> on the host it the test is executed.
> 
> For an example:
>   test q35 machine with intel_iommu
>   This test will run only is KVM is available and fail
>   to start QEMU if it fallsback to TCG, thus failing whole test.
>   So if test is executed in VM where nested KVM is not enabled
>   or on other than x86 host, it will break 'make check-qtest'
> 
> Series adds a lightweight qtest_has_kvm() check, which abuses
> build system and should help to avoid running KVM only tests
> on hosts that do not support it.

You also might want to update the check in tests/qtest/migration-test.c 
while you're at it.

> PS:
> there is an alternative 'query-accels' QMP command proposal
> https://patchwork.kernel.org/project/qemu-devel/patch/20210503211020.894589-3-philmd@redhat.com/
> which I think is more robust compared to qtest_has_kvm() and
> could be extended to take into account machine type.

Could you please get in touch with Philippe directly and discuss which way 
to go? We certainly don't need two approaches in the end...

  Thanks,
   Thomas


