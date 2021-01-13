Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117292F4FF0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 17:27:43 +0100 (CET)
Received: from localhost ([::1]:46436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzizm-0001VR-5N
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 11:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kziy7-0000pO-Hb
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:25:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kziy5-0008LR-TT
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:25:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610555157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S9ioU91wQmMohWJ69wFktrt5Gq4fWKzC0cdIWRTF/aU=;
 b=ILiiXh505uVHSR5/BVFHq8UA51mrAnU5hwtLzPKeiXl8mOrMXk8+ZBcYC+ugtkBTFjrjEE
 AQ1oXcKcL/idXQF6hbZ8UapniCkfH7EvpUYBgE04lGbZIWVezB5AL9ckNIhldeWrur0X6u
 psI/Aw6kJaX8HQYZxdqPRTnLufdDjpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-xjPa2tnhMYatFLhIUt7D-w-1; Wed, 13 Jan 2021 11:25:53 -0500
X-MC-Unique: xjPa2tnhMYatFLhIUt7D-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1598C107ACF7;
 Wed, 13 Jan 2021 16:25:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D36BF6F976;
 Wed, 13 Jan 2021 16:25:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7C0A211386A7; Wed, 13 Jan 2021 17:25:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PULL 0/7] Yank patches patches for 2021-01-13
References: <20210113093101.550964-1-armbru@redhat.com>
 <CAFEAcA8HmqWuzny9bmpXNLtsK7nuRaxPW3j6ZZougn7Y+tX7+A@mail.gmail.com>
Date: Wed, 13 Jan 2021 17:25:50 +0100
In-Reply-To: <CAFEAcA8HmqWuzny9bmpXNLtsK7nuRaxPW3j6ZZougn7Y+tX7+A@mail.gmail.com>
 (Peter Maydell's message of "Wed, 13 Jan 2021 15:53:55 +0000")
Message-ID: <87v9c0vm5t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 13 Jan 2021 at 09:31, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> This pull request is on behalf of Lukas.  Hope that's okay.
>>
>> The following changes since commit f8e1d8852e393b3fd524fb005e38590063d99bc0:
>>
>>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210112-1' into staging (2021-01-12 21:23:25 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://repo.or.cz/qemu/armbru.git tags/pull-yank-2021-01-13
>>
>> for you to fetch changes up to 91d48e520a4a4f72e97aeb333029694f5d57cc93:
>>
>>   tests/test-char.c: Wait for the chardev to connect in char_socket_client_dupid_test (2021-01-13 10:21:17 +0100)
>>
>> ----------------------------------------------------------------
>> Yank patches patches for 2021-01-13
>>
>> ----------------------------------------------------------------
>> Lukas Straub (7):
>>       Introduce yank feature
>>       block/nbd.c: Add yank feature
>>       chardev/char-socket.c: Add yank feature
>>       migration: Add yank feature
>>       io/channel-tls.c: make qio_channel_tls_shutdown thread-safe
>>       io: Document qmp oob suitability of qio_channel_shutdown and io_shutdown
>>       tests/test-char.c: Wait for the chardev to connect in char_socket_client_dupid_test
>
>
> Applied, thanks.
>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
> for any user-visible changes.

Lukas, could you take care of that?


