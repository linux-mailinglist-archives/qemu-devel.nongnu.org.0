Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C763EED6D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 15:29:07 +0200 (CEST)
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFz9O-0000vk-SG
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 09:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mFz8G-0008Ej-Io
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:27:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mFz8F-0006SA-6i
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629206874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xVLp8sgPKeE9NKC2gG4zrF3Bj3ryhR+sVjKGU/JjcIU=;
 b=Z/UiTnc9ouopVgaZXkxHEixSMLIv5TRvMnij+66fB/++ind+0TSeLP5xguK/QsXkFL2xzM
 wwXab88DRI+LitFz0C8y4sgN9ApfBDa+46zDEnHrFHJKjmBo9ctP3nbgd195mepMbnJ2HI
 5ntXi1Ao53LTYyoT2BU3MblPwLabUmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-ORG06FF7P62YYIivD2o3sA-1; Tue, 17 Aug 2021 09:27:51 -0400
X-MC-Unique: ORG06FF7P62YYIivD2o3sA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22C798799ED;
 Tue, 17 Aug 2021 13:27:50 +0000 (UTC)
Received: from localhost (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C698619D9F;
 Tue, 17 Aug 2021 13:27:42 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Andrew Jones <drjones@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH] qapi/machine.json: Remove zero value reference from
 SMPConfiguration documentation
In-Reply-To: <20210817125356.9461-1-drjones@redhat.com>
Organization: Red Hat GmbH
References: <20210817125356.9461-1-drjones@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 17 Aug 2021 15:27:41 +0200
Message-ID: <8735r8td4i.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 17 2021, Andrew Jones <drjones@redhat.com> wrote:

> Commit 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
> introduced documentation stating that a zero input value for an SMP
> parameter indicates that its value should be automatically configured.
> This is indeed how things work today, but we'd like to change that.
> Avoid documenting behaviors we want to leave undefined for the time
> being, giving us freedom to change it later.
>
> Fixes: 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  qapi/machine.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


