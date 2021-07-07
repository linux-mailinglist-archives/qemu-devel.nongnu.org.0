Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3662C3BE783
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:57:47 +0200 (CEST)
Received: from localhost ([::1]:60364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m16BV-0005F0-Vt
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m16AL-0004TY-Bk
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:56:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m16AJ-0000uC-22
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625658989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/+SHd2BU6BM+fJWoMw5OXjeGPJwo22un2Y8c0DFM0io=;
 b=WaUKXAaRzsfZrW6JPukVs3YkOIVFeeeCcIdRjrN4daY4h0cLgf/JRTreYt1PGDycAb/hTe
 pcgghodYdDE2nDfWfgSe35V21AhHyCGhCA+WI2DLN+V4jfOooF7v4k9XWSRcT33nEKGRGT
 /0wfbdkYMin6sy+XfRzRfZOS3R4W8L8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-RR_r3co8MDepYcwK6xLozA-1; Wed, 07 Jul 2021 07:56:28 -0400
X-MC-Unique: RR_r3co8MDepYcwK6xLozA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6337A100C662;
 Wed,  7 Jul 2021 11:56:27 +0000 (UTC)
Received: from localhost (ovpn-112-160.ams2.redhat.com [10.36.112.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D263C60C17;
 Wed,  7 Jul 2021 11:56:26 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v7 00/14] s390x cleanup
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
Organization: Red Hat GmbH
References: <20210707105324.23400-1-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 07 Jul 2021 13:56:25 +0200
Message-ID: <87fswqfic6.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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

On Wed, Jul 07 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> this is the next version of a cleanup series for s390x.

This seems to be in good shape now, I guess we can do any remaining
cleanups on top. I'll give it a whirl and queue it if nothing shows up.


