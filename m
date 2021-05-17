Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBA03839D0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:28:54 +0200 (CEST)
Received: from localhost ([::1]:51682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lig6v-0007UM-8u
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lifqP-0001Tr-JC
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:11:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lifqN-0006mS-Od
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621267907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7mMbSPrC6Hq6nFqNj++arXO7dl9FqszzAV/xyD2OnIs=;
 b=IyMKns+kV6iqinwwxUN0Krxd2RkUNqIaRKQ3ym34hsDgtlf1SuU7fnf3Fjz+f8KAOu91ai
 VbOSX7MI8Yt3Xk+eu4A46imjIbAq6bNzroCijg2tXsKtjJ+siCbnzDZgNEbpY2F/oGNe47
 4DT65tRMIhFJLVtdJPl3YWN5GJ4DK14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-Q3u4F4JFPfmRgm_dCn2mvw-1; Mon, 17 May 2021 12:11:45 -0400
X-MC-Unique: Q3u4F4JFPfmRgm_dCn2mvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 579336D4E3;
 Mon, 17 May 2021 16:11:44 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-115-195.ams2.redhat.com
 [10.36.115.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2458E1349A;
 Mon, 17 May 2021 16:11:35 +0000 (UTC)
Date: Mon, 17 May 2021 18:11:33 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 5/5] docs: fix references to docs/devel/s390-dasd-ipl.rst
Message-ID: <20210517181133.5800eddc.cohuck@redhat.com>
In-Reply-To: <20210517151702.109066-6-sgarzare@redhat.com>
References: <20210517151702.109066-1-sgarzare@redhat.com>
 <20210517151702.109066-6-sgarzare@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 May 2021 17:17:02 +0200
Stefano Garzarella <sgarzare@redhat.com> wrote:

> Commit cc3d15a5ea ("docs: rstfy s390 dasd ipl documentation")
> converted docs/devel/s390-dasd-ipl.txt to docs/devel/s390-dasd-ipl.rst.
> 
> We still have several references to the old file, so let's fix them
> with the following command:
> 
>   sed -i s/s390-dasd-ipl.txt/s390-dasd-ipl.rst/ \
>       $(git grep -l docs/devel/s390-dasd-ipl.txt)
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  pc-bios/s390-ccw/dasd-ipl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>


