Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AA63986CD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:45:53 +0200 (CEST)
Received: from localhost ([::1]:47098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loONk-0003wm-He
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loOMF-0002KR-9P
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:44:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loOMD-0002Hj-Qt
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622630657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KQC3TACgZH49xwHot21eB/xyKhXx/bWpBNJr14iqKrE=;
 b=D6GqXz0r50hsGthLoT9zrwO+yyQ9tzZXAOhDG10IF+Y1/EClD8230uZxYxB/ykmd7eyI6+
 pvmwWUDe60zYHm8pKuZ72HRzG5lKTo8VWZA2rd4DxbtJAP3EKWMOVmRZR8xOku1kmCBS4v
 CmAZXObV4FuaLmjyftps8FeYYfbqkcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-UP8FHiUGMQG80XtJ_cZVrA-1; Wed, 02 Jun 2021 06:44:15 -0400
X-MC-Unique: UP8FHiUGMQG80XtJ_cZVrA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A62348DD10A;
 Wed,  2 Jun 2021 10:44:14 +0000 (UTC)
Received: from localhost (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08A565D6DC;
 Wed,  2 Jun 2021 10:44:10 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [RFC v4 11/14] target/s390x: remove kvm-stub.c
In-Reply-To: <20210524025256.22252-11-acho@suse.com>
Organization: Red Hat GmbH
References: <20210524025256.22252-1-acho@suse.com>
 <20210524025256.22252-11-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 02 Jun 2021 12:44:09 +0200
Message-ID: <87sg20pmva.fsf@redhat.com>
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

> all function calls are protected by kvm_enabled(),
> so we should not need the stubs.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>  target/s390x/kvm-stub.c  | 126 ---------------------------------------
>  target/s390x/meson.build |   2 +-
>  2 files changed, 1 insertion(+), 127 deletions(-)
>  delete mode 100644 target/s390x/kvm-stub.c

(...)

> -int kvm_s390_get_gs(void)
> -{
> -    return 0;
> -}

Unrelated to this patch: Nobody seems to call kvm_s390_get_gs()
(anymore?); are we missing something, or can that function be removed?


