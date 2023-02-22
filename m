Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619C469F0AA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 09:51:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUkp7-0002H6-OW; Wed, 22 Feb 2023 03:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pUkp5-0002Gp-0x
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 03:49:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pUkp3-0001Wy-3o
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 03:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677055795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DSCihIiS6D710FIJkwCK6tUrzIdLrd0VDVuuIVSTgV8=;
 b=i2cwXW33gBTcKW1FauJ+D1XGuKPsF+mTtgehwg2XjWnCP5ukURQVd++JFSTP85SSo32yUe
 tgGrMfY0nz1lVI8OK1l3TksRQjU1n4LOoRibf5VBIMHfSgJBmjSBTFSFDAwv8cBF7NgQxz
 /ykvZqOXDbrswGg+riQsVSBgAUHGUNc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-09MNwSqvP4aKeZcJ6S8VWQ-1; Wed, 22 Feb 2023 03:49:53 -0500
X-MC-Unique: 09MNwSqvP4aKeZcJ6S8VWQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6134C802C18;
 Wed, 22 Feb 2023 08:49:53 +0000 (UTC)
Received: from localhost (unknown [10.39.194.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02A3B492B00;
 Wed, 22 Feb 2023 08:49:52 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH v1 1/6] linux-headers: Update for dirty ring
In-Reply-To: <2a13c5ba-e20a-ae96-3efd-1f7e2d224eff@redhat.com>
Organization: Red Hat GmbH
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-2-gshan@redhat.com>
 <CAFEAcA9OvObRT731oaF7kOo8z32nH+egXfDcOpw1nHormHsp9A@mail.gmail.com>
 <2a13c5ba-e20a-ae96-3efd-1f7e2d224eff@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 22 Feb 2023 09:49:51 +0100
Message-ID: <875ybuaxu8.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 22 2023, Gavin Shan <gshan@redhat.com> wrote:

> On 2/22/23 3:30 AM, Peter Maydell wrote:
>> On Mon, 13 Feb 2023 at 00:39, Gavin Shan <gshan@redhat.com> wrote:
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   linux-headers/asm-arm64/kvm.h | 1 +
>>>   linux-headers/linux/kvm.h     | 2 ++
>>>   2 files changed, 3 insertions(+)
>> 
>> For this to be a non-RFC patch, this needs to be a proper
>> sync of the headers against an upstream kernel tree.
>> (By-hand tweaks are fine for purposes of working on
>> and getting patchsets reviewed.)
>> 
>
> Yes, I vaguely remember there is script to synchronize linux header files,
> which is './scripts/update-linux-headers.sh'. I think I need to run the
> following command to update?
>
>    # ./scripts/update-linux-headers.sh <LINUX_PATH> <QEMU_PATH>

Yes, and please include a reference to the exact Linux version you used
in the commit :)


