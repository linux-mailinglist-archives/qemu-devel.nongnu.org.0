Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224C73BBA4E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:38:42 +0200 (CEST)
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0L3p-0003Cn-56
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m0L07-0006Wx-2l
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:34:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m0L05-0004fL-4i
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625477686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XAG3jW7nk5UADa6irkN97gptITIvM/ENe5x0iI3pi5o=;
 b=EyhqUFcemrsz0Qghg/lNn8SQvyy5ZJcpxIrKw1RiEPDFdzZ/u1h+9cSXw6MyKgLJGZcrcR
 sp4BdqFY/NJhGz1oFHdnn4MGnEyS9PzGRNk+tdy++Df+jK6+PJKz6BeFooJ/R/U0v59T8q
 QDdhmpx5OYUiDKKYDWEY0TUv6JK5MtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-aQLDXaezNNya81lIDem37w-1; Mon, 05 Jul 2021 05:34:45 -0400
X-MC-Unique: aQLDXaezNNya81lIDem37w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 822A3800C78;
 Mon,  5 Jul 2021 09:34:44 +0000 (UTC)
Received: from localhost (ovpn-112-39.ams2.redhat.com [10.36.112.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A82760864;
 Mon,  5 Jul 2021 09:34:43 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [RFC v6 00/13] s390x cleanup
In-Reply-To: <875yxvl6eq.fsf@redhat.com>
Organization: Red Hat GmbH
References: <20210629141931.4489-1-acho@suse.com> <875yxvl6eq.fsf@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 05 Jul 2021 11:34:42 +0200
Message-ID: <87r1gdhznx.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
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
Cc: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30 2021, Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, Jun 29 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:
>
>> this is the next version of a cleanup series for s390x.
>>
>
> (...)
>
>> Cho, Yu-Chen (13):
>>   target/s390x: meson: add target_user_arch
>>   hw/s390x: rename tod-qemu.c to tod-tcg.c
>>   hw/s390x: only build tod-tcg from the CONFIG_TCG build
>>   hw/s390x: tod: make explicit checks for accelerators when initializing
>>   target/s390x: remove tcg-stub.c
>>   target/s390x: start moving TCG-only code to tcg/
>>   target/s390x: move sysemu-only code out to cpu-sysemu.c
>>   target/s390x: split cpu-dump from helper.c
>>   target/s390x: make helper.c sysemu-only
>>   target/s390x: use kvm_enabled() to wrap call to kvm_s390_get_hpage_1m
>>   target/s390x: remove kvm-stub.c
>>   target/s390x: move kvm files into kvm/
>>   target/s390x: split sysemu part of cpu models
>
> I think this generally looks fine.
>
> However, I'd like to have a second pair of eyes look at this, especially
> at the cpu models.

Just a short note from my side: I'm planning to send a pull request
(late) this week, so having a version that is ready to merge before that
would be nice :)


