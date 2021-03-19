Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F02B341DAB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:05:45 +0100 (CET)
Received: from localhost ([::1]:53580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNEox-00042N-Ou
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNEnU-0003cH-IG
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:04:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNEnR-0007Vb-2P
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616159044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=52CB/zdjZgKDKkXFZ9oCw4oncDbL/4oS/S0ESI/0VZY=;
 b=ROHxKcgB+4zLDkQyEMRP4y576P7DdG1BR2H/3moMbXLUflRNbOT9fGzkAWMSJOXlrVxuYr
 IkTBzJ8L0RyMJcfahoucdExOBe9xMwwKmhLTVde7xuK3J+YS5FruRN6VsspnPFt74dyCBg
 C1ndJOlWmKQGHdRkC/tw5S/fLFoBgYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-H3i9dDSGNHq9sLeXuh7_kg-1; Fri, 19 Mar 2021 09:04:00 -0400
X-MC-Unique: H3i9dDSGNHq9sLeXuh7_kg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 423BA107ACCA;
 Fri, 19 Mar 2021 13:03:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDBB05C1D1;
 Fri, 19 Mar 2021 13:03:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7AD9C11386A7; Fri, 19 Mar 2021 14:03:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v4 0/6] QOM and fdc patches patches for 2021-03-16
References: <20210319064517.1496467-1-armbru@redhat.com>
 <CAFEAcA-yKzM5o3X020L-3w13D=kJ26fbcNZTxXBnPQXBDONwfg@mail.gmail.com>
Date: Fri, 19 Mar 2021 14:03:57 +0100
In-Reply-To: <CAFEAcA-yKzM5o3X020L-3w13D=kJ26fbcNZTxXBnPQXBDONwfg@mail.gmail.com>
 (Peter Maydell's message of "Fri, 19 Mar 2021 11:26:58 +0000")
Message-ID: <87r1kbl2gy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 19 Mar 2021 at 06:45, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> The following changes since commit 8a40754bca14df63c6d2ffe473b68a270dc50679:
>>
>>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-03-18 19:55:37 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://repo.or.cz/qemu/armbru.git tags/pull-qom-fdc-2021-03-16-v4
>>
>> for you to fetch changes up to 0c727a621a646504ccec2b08e55fd48030448466:
>>
>>   memory: Drop "qemu:" prefix from QOM memory region type names (2021-03-19 06:55:49 +0100)
>>
>> ----------------------------------------------------------------
>> QOM and fdc patches patches for 2021-03-16
>>
>> ----------------------------------------------------------------
>> Markus Armbruster (6):
>>       docs/system/deprecated: Fix note on fdc drive properties
>>       fdc: Drop deprecated floppy configuration
>>       fdc: Inline fdctrl_connect_drives() into fdctrl_realize_common()
>>       blockdev: Drop deprecated bogus -drive interface type
>>       hw: Replace anti-social QOM type names
>>       memory: Drop "qemu:" prefix from QOM memory region type name
>
> Looks like this breaks the sanitizer gitlab CI job:
>  https://gitlab.com/qemu-project/qemu/-/jobs/1111697105
>
> Testing ./build-oss-fuzz/DEST_DIR/qemu-fuzz-i386-target-generic-fuzz-sdhci-v3
> ...
> ==8556==WARNING: ASan doesn't fully support makecontext/swapcontext
> functions and may produce false positives in some cases!
> ==8556==WARNING: ASan is ignoring requested __asan_handle_no_return:
> stack type: default top: 0x7ffcb7805000; bottom 0x7f960e9fd000; size:
> 0x0066a8e08000 (440919949312)
> False positive error reports may follow
> For details see https://github.com/google/sanitizers/issues/189
> i386: -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive:
> machine type does not support if=sd,bus=0,unit=0

In tests/qtest/fuzz/generic_fuzz_configs.h:

    },{
        .name = "sdhci-v3",
        .args = "-nodefaults -device sdhci-pci,sd-spec-version=3 "
        "-device sd-card,drive=mydrive "
        "-drive if=sd,index=0,file=null-co://,format=raw,id=mydrive -nographic",
        .objects = "sd*"
    },{

The if=sd needs to be if=none.

Before this series, the test prints a deprecation warning.  Since it
also prints lots of other junk, nobody noticed.

After this series removed the deprecated misfeature, the test fails.

v5 coming.


