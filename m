Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F504B9B5C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:45:24 +0100 (CET)
Received: from localhost ([::1]:34944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcPj-0007aQ-80
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:45:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nKbqe-0004GB-A4
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:09:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nKbqa-0007Si-VJ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645085343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DgNyLi7bCkYnZX71NVS3sCALXajeApt58fKuxwoAd3o=;
 b=ijbIdaMB+N3BCTdtVXvLt/8APz4pL+kBOCnsjjO36LGuopyUaFGeElr/L4ruK4B+eu7F0f
 W4shzRwF64xUPJw9l4Frnd7zRBt5XZmKnx02SNvwnFVdzox1Lnczxg0XDfGmB9JWhbRY8U
 Atz2stJLfoNidtVqeX0zUxBhOAgKqY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-ethh1FD5MQCHH7C0cCGAFA-1; Thu, 17 Feb 2022 03:09:01 -0500
X-MC-Unique: ethh1FD5MQCHH7C0cCGAFA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9206180CC21;
 Thu, 17 Feb 2022 08:09:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0104F5E489;
 Thu, 17 Feb 2022 08:08:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E005818000AA; Thu, 17 Feb 2022 09:08:52 +0100 (CET)
Date: Thu, 17 Feb 2022 09:08:52 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <20220217080852.omqkckc5i2lav7gb@sirius.home.kraxel.org>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm>
 <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
 <Yg03HB5KHGYWyI0J@work-vm>
 <f5ea8b34-2d50-c0d7-4ec0-ff0921dbcbd4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f5ea8b34-2d50-c0d7-4ec0-ff0921dbcbd4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, Laurent Vivier <lvivier@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, mst@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Other heretic question: Should we maybe get rid of the default machine type
> for *all* targets? ... so that we do not continue to run into this issue
> again and again and again...

/me votes "yes".

take care,
  Gerd


