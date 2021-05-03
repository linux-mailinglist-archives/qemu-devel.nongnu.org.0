Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F733713B7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:41:39 +0200 (CEST)
Received: from localhost ([::1]:50872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldW1C-0001Yo-Te
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ldVzS-00014r-Fi
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:39:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ldVzP-0008C4-8O
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620038386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4av32hHRSdvuVDM9cyqbvFjkXiJWgWDtYVgcxDOB0BM=;
 b=c2gMnXTTSTgUv1zKwCr3iABDFzJZnVC5zGKH3U1N5NYgDymEb4+XXrcwHaFfi7Kr+vzdEf
 TXI8tzE4Dqsgjb3WISjNApcJYz7iToOzPu9NUUhOPqOBN8htxRJ/ScXdpGjkSVtzQThq06
 rlKXWJH2djA/el2bXu3CZHRjdfqlNQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-eCYwiC7fN5CmNiBdjneAbw-1; Mon, 03 May 2021 06:39:42 -0400
X-MC-Unique: eCYwiC7fN5CmNiBdjneAbw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4900580402F;
 Mon,  3 May 2021 10:39:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E36405D703;
 Mon,  3 May 2021 10:39:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5DF73113525D; Mon,  3 May 2021 12:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Let's remove some deprecated stuff
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <978e7623-8150-a2ac-20b0-69ab094c8a43@redhat.com>
 <CAFEAcA8dWp0Y4=tA9wUZ10h5hNdaUP-xcCku96uhciB32i7gPg@mail.gmail.com>
Date: Mon, 03 May 2021 12:39:32 +0200
In-Reply-To: <CAFEAcA8dWp0Y4=tA9wUZ10h5hNdaUP-xcCku96uhciB32i7gPg@mail.gmail.com>
 (Peter Maydell's message of "Thu, 29 Apr 2021 12:24:11 +0100")
Message-ID: <875z00ayor.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?Q?P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Green <green@moxielogic.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 Robert Hoo <robert.hu@linux.intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 29 Apr 2021 at 12:19, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 29/04/2021 11.59, Markus Armbruster wrote:
>> > If you're cc'ed, you added a section to docs/system/deprecated.rst that
>> > is old enough to permit removal.  This is *not* a demand to remove, it's
>> > a polite request to consider whether the time for removal has come.
>> > Extra points for telling us in a reply.  "We should remove, but I can't
>> > do it myself right now" is a valid answer.  Let's review the file:
>> [...]
>> > Thomas Huth:
>> >
>> >      ``moxie`` CPU (since 5.2.0)
>> >      '''''''''''''''''''''''''''
>> >
>> >      The ``moxie`` guest CPU support is deprecated and will be removed in
>> >      a future version of QEMU. It's unclear whether anybody is still using
>> >      CPU emulation in QEMU, and there are no test images available to make
>> >      sure that the code is still working.
>>
>> I'm fine with dropping moxie now - I've never seen anybody using it and I've
>> never spotted any binaries in the internet that could still be used for
>> regression testing of this target. And I've also put Anthony Green on CC:
>> when I suggested the deprecation and he never replied. So I think it's
>> really completely unused.
>>
>> >      ``lm32`` CPUs (since 5.2.0)
>> >      '''''''''''''''''''''''''''
>> >
>> >      The ``lm32`` guest CPU support is deprecated and will be removed in
>> >      a future version of QEMU. The only public user of this architecture
>> >      was the milkymist project, which has been dead for years; there was
>> >      never an upstream Linux port.
>> >
>> >      ``unicore32`` CPUs (since 5.2.0)
>> >      ''''''''''''''''''''''''''''''''
>> >
>> >      The ``unicore32`` guest CPU support is deprecated and will be removed in
>> >      a future version of QEMU. Support for this CPU was removed from the
>> >      upstream Linux kernel, and there is no available upstream toolchain
>> >      to build binaries for it.
>>
>> I didn't add these two entries to the deprecation list, I just moved them
>> around since they were in the wrong section. Both have been added by Peter
>> instead (commit d8498005122 and 8e4ff4a8d2b)
>
> Yes, I think moxie, lm32 and unicore32 are all OK to drop now.

Done:

    [PATCH] Remove the deprecated moxie target
    Message-Id: <20210430160355.698194-1-thuth@redhat.com>

    [PATCH 0/2] Drop deprecated lm32 and unicore32
    Message-Id: <20210503084034.3804963-1-armbru@redhat.com>


