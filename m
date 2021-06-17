Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D413AB9E9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 18:50:58 +0200 (CEST)
Received: from localhost ([::1]:38968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltvEH-0004xG-Fc
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 12:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ltvCk-0004FS-H9
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 12:49:22 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:59428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ltvCi-0000iS-I0
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 12:49:22 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9B59D1FDDE;
 Thu, 17 Jun 2021 16:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623948558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tjCV1LG1jLTOJkmmfThnxG6onxP/O8SHJnwW5R9frso=;
 b=katS4CvS4t8vkCuTOH4fiUm7NNzAxkDt7Ueda3bQzFPh/MflslI6yxFtjiHxxO4+fLqv1k
 MHvTip4Y4NbisJPB79IZWTbfXuuXrYP7bwFWvx9cplWsaRBMu9uqt8AOEBvgM/Iw+S6lru
 0zkfMYOwWCkYcJhJY3zMLPbDt/QmziM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623948558;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tjCV1LG1jLTOJkmmfThnxG6onxP/O8SHJnwW5R9frso=;
 b=3zygt9zHNrVSnW76C7FafAR2l36pkMIbQl/y/Vgt4ZYkZkRdoUT6Tbi7E7OqT1B3TOWvug
 xbXqeNoM5jSlLYCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 410DA118DD;
 Thu, 17 Jun 2021 16:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623948558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tjCV1LG1jLTOJkmmfThnxG6onxP/O8SHJnwW5R9frso=;
 b=katS4CvS4t8vkCuTOH4fiUm7NNzAxkDt7Ueda3bQzFPh/MflslI6yxFtjiHxxO4+fLqv1k
 MHvTip4Y4NbisJPB79IZWTbfXuuXrYP7bwFWvx9cplWsaRBMu9uqt8AOEBvgM/Iw+S6lru
 0zkfMYOwWCkYcJhJY3zMLPbDt/QmziM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623948558;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tjCV1LG1jLTOJkmmfThnxG6onxP/O8SHJnwW5R9frso=;
 b=3zygt9zHNrVSnW76C7FafAR2l36pkMIbQl/y/Vgt4ZYkZkRdoUT6Tbi7E7OqT1B3TOWvug
 xbXqeNoM5jSlLYCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 0w6uDQ59y2DuLwAALh3uQQ
 (envelope-from <cfontana@suse.de>); Thu, 17 Jun 2021 16:49:18 +0000
Subject: Re: [RFC 0/3] qtest: pick tests that require KVM at runtime
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210616152455.1270264-1-imammedo@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <d10ba45f-c71c-f472-fac7-9f8e5770c735@suse.de>
Date: Thu, 17 Jun 2021 18:49:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210616152455.1270264-1-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.254,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 mst@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 5:24 PM, Igor Mammedov wrote:
> 
> Sometimes it's necessary to execute a test that depends on KVM,
> however qtest is not aware if tested QEMU binary supports KVM
> on the host it the test is executed.

Hello,

It seems to me that we are constantly re-implementing the same feature with slight variations?

Didn't we have a generic series to introduce qtest_has_accel() from Philippe before?

Does this series work with --disable-kvm builds? (TCG-only builds?)

Thanks,

CLaudio


> 
> For an example:
>  test q35 machine with intel_iommu
>  This test will run only is KVM is available and fail
>  to start QEMU if it fallsback to TCG, thus failing whole test.
>  So if test is executed in VM where nested KVM is not enabled
>  or on other than x86 host, it will break 'make check-qtest'
> 
> Series adds a lightweight qtest_has_kvm() check, which abuses
> build system and should help to avoid running KVM only tests
> on hosts that do not support it.
> 
> PS:
> there is an alternative 'query-accels' QMP command proposal
> https://patchwork.kernel.org/project/qemu-devel/patch/20210503211020.894589-3-philmd@redhat.com/
> which I think is more robust compared to qtest_has_kvm() and
> could be extended to take into account machine type.
> But it's more complex and what I dislike about it most,
> it requires execution of 'probing' QEMU instance to find
> execute 'query-accels' QMP command, which is rather resource
> consuming. So I'd use query-accels approach only when it's
> the only possible option to minimize load on CI systems.
> 
> Igor Mammedov (2):
>   tests: acpi: q35: test for x2APIC entries in SRAT
>   tests: acpi: update expected tables blobs
> 
> root (1):
>   tests: qtest: add qtest_has_kvm() to check if tested bynary supports
>     KVM
> 
>  tests/qtest/libqos/libqtest.h    |   7 +++++++
>  meson.build                      |   1 +
>  tests/data/acpi/q35/APIC.numamem | Bin 0 -> 2686 bytes
>  tests/data/acpi/q35/DSDT.numamem | Bin 7865 -> 35222 bytes
>  tests/data/acpi/q35/FACP.numamem | Bin 0 -> 244 bytes
>  tests/data/acpi/q35/SRAT.numamem | Bin 224 -> 5080 bytes
>  tests/qtest/bios-tables-test.c   |  10 +++++++---
>  tests/qtest/libqtest.c           |  20 ++++++++++++++++++++
>  8 files changed, 35 insertions(+), 3 deletions(-)
>  create mode 100644 tests/data/acpi/q35/APIC.numamem
>  create mode 100644 tests/data/acpi/q35/FACP.numamem
> 


