Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6903B8640
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:28:20 +0200 (CEST)
Received: from localhost ([::1]:47430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyc8R-0001cC-DT
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lyc7T-0000tP-Af
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:27:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lyc7R-0001lf-Ik
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625066837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ge1nRH2eaThq0HbwF2fph1WwXY1DQhLEAVlNG1QYuBQ=;
 b=JmwvzaRFFmAVrTQzaCspXx70gEDdyNM2DcQr8/CltoS/+opGKJvH4YX6sgeFshQysLgP4D
 Jz/qxjy2/8YT3fmXG0ua5uApMM+Qc5EEli+rbHlQBkBkPRysmZb9WLZbrDk0xbs48NtXa9
 LLHUKXM1SmpMj8cGd1y0xEL8DUQfbFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-GKgtIwTxNICPXx_9rtYUTQ-1; Wed, 30 Jun 2021 11:27:13 -0400
X-MC-Unique: GKgtIwTxNICPXx_9rtYUTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 076719F92A;
 Wed, 30 Jun 2021 15:27:12 +0000 (UTC)
Received: from localhost (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 863B360C17;
 Wed, 30 Jun 2021 15:27:11 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [RFC v6 00/13] s390x cleanup
In-Reply-To: <20210629141931.4489-1-acho@suse.com>
Organization: Red Hat GmbH
References: <20210629141931.4489-1-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 30 Jun 2021 17:27:09 +0200
Message-ID: <875yxvl6eq.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> this is the next version of a cleanup series for s390x.
>

(...)

> Cho, Yu-Chen (13):
>   target/s390x: meson: add target_user_arch
>   hw/s390x: rename tod-qemu.c to tod-tcg.c
>   hw/s390x: only build tod-tcg from the CONFIG_TCG build
>   hw/s390x: tod: make explicit checks for accelerators when initializing
>   target/s390x: remove tcg-stub.c
>   target/s390x: start moving TCG-only code to tcg/
>   target/s390x: move sysemu-only code out to cpu-sysemu.c
>   target/s390x: split cpu-dump from helper.c
>   target/s390x: make helper.c sysemu-only
>   target/s390x: use kvm_enabled() to wrap call to kvm_s390_get_hpage_1m
>   target/s390x: remove kvm-stub.c
>   target/s390x: move kvm files into kvm/
>   target/s390x: split sysemu part of cpu models

I think this generally looks fine.

However, I'd like to have a second pair of eyes look at this, especially
at the cpu models.


