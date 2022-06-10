Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE52545CE3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 09:10:43 +0200 (CEST)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzYn2-0004yw-Rs
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 03:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1nzYdX-0001RM-O0
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:00:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1nzYdU-0006AK-Ue
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:00:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654844447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GA5LTuKSAvYwJknq5jjNnCMUZb0XZCkmbqXLjsgHkrY=;
 b=FXgNLhGwQVqvZorb0VIqUHd6oiP38tfnyuK+ITp2Sf2HYQDm6t5gKWviy263zfhFj0qMUI
 +OGx2AEyMpOVH8jJfIpfLQwomeLIM7/8/5Q5gCV+7sNtAMeccoc2CVDBd6pyC0PhatlKJV
 VMv6tQXQjBGlY0nm3tCDGvhJKka7x40=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-gjy1vNz2MN2w2FhnQbxzNg-1; Fri, 10 Jun 2022 03:00:45 -0400
X-MC-Unique: gjy1vNz2MN2w2FhnQbxzNg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08E0B800971;
 Fri, 10 Jun 2022 07:00:45 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFBBC492C3B;
 Fri, 10 Jun 2022 07:00:43 +0000 (UTC)
Subject: Re: [RFC][PATCH] docs: note exception for PCIe IO port access
To: Kevin Locke <kevin@kevinlocke.name>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>,
 Laine Stump <laine@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Alex Williamson <alex.williamson@redhat.com>
References: <922cc3081ff9c986188f881ef4d1cf15bd3adf48.1654739990.git.kevin@kevinlocke.name>
 <63e991af-0dd2-3aea-2f15-7460a6fb87db@redhat.com>
 <YqH9wt/L7vcmFe8T@kevinlocke.name>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d4f2c302-5b7e-bb2a-c44d-5b6c36d6dad6@redhat.com>
Date: Fri, 10 Jun 2022 09:00:40 +0200
MIME-Version: 1.0
In-Reply-To: <YqH9wt/L7vcmFe8T@kevinlocke.name>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/09/22 16:03, Kevin Locke wrote:
> On Thu, 2022-06-09 at 09:45 +0200, Laszlo Ersek wrote:

>>     (2) Assigned PCI Express GPUs that offer legacy VGA compatibility,
>>         and that such compatibility is expected of (due to booting with
>>         SeaBIOS, or due to UEFI driver bugs or native OS driver bugs).
> 
> That sounds great to me.  Would you like me to send that as a v2
> patch, or would you prefer to make the change?

Please send v2 :)

Thanks
Laszlo


