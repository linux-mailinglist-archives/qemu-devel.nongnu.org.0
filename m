Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD543B414B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 12:16:31 +0200 (CEST)
Received: from localhost ([::1]:54436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwisw-00085a-4t
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 06:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lwiYi-0007qN-0Q
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lwiYf-0008P0-Eq
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624614931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TlNww+eUmHk4h3fpIAAWmfEBG3ZS98wqj6ZxCDaBtzc=;
 b=UgCtnqRuLxm8Vvga0HIImlMDvS4bj1DjWdCSSuclyrgnBTYcibKsw0x6PY1gPMWueLF1h0
 rdwYW2STMNMQsGcJNuRBjNUborjX2Jq+AMVKgwFTsXRwGWVsnBP80eHx++pGPxeh01+AS/
 dizKZoULCIUX6hXy5sHtKGq8fMB+Abk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-X4ZAqq5-OzyvzCTYfJba_Q-1; Fri, 25 Jun 2021 05:55:30 -0400
X-MC-Unique: X4ZAqq5-OzyvzCTYfJba_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16A38804143;
 Fri, 25 Jun 2021 09:55:29 +0000 (UTC)
Received: from localhost (ovpn-113-51.ams2.redhat.com [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CDC75C1A3;
 Fri, 25 Jun 2021 09:55:22 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH 0/1] Add features and cpu models
In-Reply-To: <20210622201923.150205-1-borntraeger@de.ibm.com>
Organization: Red Hat GmbH
References: <20210622201923.150205-1-borntraeger@de.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 25 Jun 2021 11:55:20 +0200
Message-ID: <87eecqmfp3.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 22 2021, Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> 5 new features and 2 new models
>
> Christian Borntraeger (1):
>   s390x/cpumodel: add 3931 and 3932
>
>  target/s390x/cpu_features_def.h.inc |  5 +++++
>  target/s390x/cpu_models.c           |  6 ++++++
>  target/s390x/gen-features.c         | 14 ++++++++++++++
>  3 files changed, 25 insertions(+)

Thanks, applied.


