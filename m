Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C14F2C51E3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 11:16:49 +0100 (CET)
Received: from localhost ([::1]:51170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiEKV-00081t-UF
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 05:16:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kiEJ5-0007TC-Mi
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 05:15:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kiEJ2-0004de-QO
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 05:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606385714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vx4CFn2RQbcO+RWtQvzku13ImrETsTt/RtSHscIuoB0=;
 b=Fm+bIu9wDdMrpU/fGba5Ofpfrfvm0+7QbPGBcb8/0rrq6jdumK23s9hFwLO5RcxBnmUdmB
 avaGcysOrlZw4WYrtZjLQPWXx0KpaL2Egv9AJkN5vpBqNAAanw2HUAS6wp8jBmeSuMTNJw
 psSvmgG2L72duX7jlgdsIONgz7yfFuQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-QnvgdJDwPaibTl9Hi_8Ktg-1; Thu, 26 Nov 2020 05:15:12 -0500
X-MC-Unique: QnvgdJDwPaibTl9Hi_8Ktg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAFA81005D57;
 Thu, 26 Nov 2020 10:15:11 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-133.ams2.redhat.com [10.36.113.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E9DD60BFA;
 Thu, 26 Nov 2020 10:15:10 +0000 (UTC)
Subject: Re: [PATCH] Add an announcement about the 2020 QEMU advent calendar
 and a call for images to include.
To: Eldon Stegall <eldon-qemu@eldondev.com>, qemu-devel@nongnu.org
References: <20201126033754.19123-1-eldon-qemu@eldondev.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <06bcd4fa-0907-1098-59a7-383e987eb58b@redhat.com>
Date: Thu, 26 Nov 2020 11:15:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201126033754.19123-1-eldon-qemu@eldondev.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/11/2020 04.37, Eldon Stegall wrote:
> Signed-off-by: Eldon Stegall <eldon@eldondev.com>
> ---
>  _posts/2020-11-26-qemu-advent-announce.md | 39 +++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 _posts/2020-11-26-qemu-advent-announce.md

Thanks a lot for tackling this!

I've pushed the patch to the website now, so the blog entry is now online.

 Thomas


