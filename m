Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951A1398584
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:46:29 +0200 (CEST)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loNSF-00026j-Pk
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loNQg-0001HQ-C4
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:44:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loNQd-0004sj-F9
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:44:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622627085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qQ7xRv7d3Srzj64z1yby1sGaT5h9VYhcoKMzL0qqAJI=;
 b=IF3Uuitv1LfPV4s1hVLGkkOjhShchuI6t83XKK4BbRLBhVGd4CWtdMQtbe6mFqqubJHQ6p
 MUWPoaafnUiEBwFN74iBfRV684xTnZXAd/Tm+38yxgxKUrFG7+Ek0eQrTctVLOwOVA9j2A
 +tg2uqK/9IvpH5uHcLsWF1VRfuTfzsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-xQgcqNDwN8SrJqNdf0xKMw-1; Wed, 02 Jun 2021 05:44:44 -0400
X-MC-Unique: xQgcqNDwN8SrJqNdf0xKMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34818501E0;
 Wed,  2 Jun 2021 09:44:43 +0000 (UTC)
Received: from localhost (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BAB405D6DC;
 Wed,  2 Jun 2021 09:44:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [RFC v4 01/14] target/s390x: meson: add target_user_arch
In-Reply-To: <20210524025256.22252-1-acho@suse.com>
Organization: Red Hat GmbH
References: <20210524025256.22252-1-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 02 Jun 2021 11:44:38 +0200
Message-ID: <87a6o8r46x.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: thuth@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, cfontana@suse.de,
 pbonzini@redhat.com, acho@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 24 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> the lack of target_user_arch makes it hard to fully leverage the
> build system in order to separate user code from sysemu code.
>
> Provide it, so that we can avoid the proliferation of #ifdef
> in target code.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>  target/s390x/meson.build | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Cornelia Huck <cohuck@redhat.com>


