Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0E4473F49
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 10:23:47 +0100 (CET)
Received: from localhost ([::1]:39300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx42E-0001Iy-16
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 04:23:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mx41I-0000ch-TG
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 04:22:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mx41G-0003DG-C1
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 04:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639473765;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHospckRNEFi586JCRUr+7kFQ3wPioYAMTFIHRurmHg=;
 b=fg9rfsOObxnHbIUjJqD5Kb5cSJa/i69TcV8oxXsfvE5eLeQmyVhylZj8ge3jASVUeOUIye
 H5kMNN0mvtSvVPspHFurkHWPBuwKV8I7AKwjaVf/5IheTap35XHEMQlCdl1oLWrMrSPQC7
 74McNtLD1IN9kq52XdYi+h0spxyGXcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-CIWiyxuSPTuRxEc2sdzabA-1; Tue, 14 Dec 2021 04:22:42 -0500
X-MC-Unique: CIWiyxuSPTuRxEc2sdzabA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E551B801962;
 Tue, 14 Dec 2021 09:22:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CF3C13AB3;
 Tue, 14 Dec 2021 09:22:37 +0000 (UTC)
Date: Tue, 14 Dec 2021 09:22:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2] MAINTAINERS: Change my email address
Message-ID: <YbhiU8ARoS5LcORY@redhat.com>
References: <20211214075424.6920-1-zhanghailiang@xfusion.com>
 <fc7b5d91-98f6-b146-4a67-5e6800bccadc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fc7b5d91-98f6-b146-4a67-5e6800bccadc@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, quintela@redhat.com,
 Wen Congyang <wencongyang2@huawei.com>, qemu-devel@nongnu.org,
 dgilbert@redhat.com, Gonglei <arei.gonglei@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 10:04:03AM +0100, Philippe Mathieu-Daudé wrote:
> On 12/14/21 08:54, Hailiang Zhang wrote:
> > The zhang.zhanghailiang@huawei.com email address has been
> > stopped. Change it to my new email address.
> > 
> > Signed-off-by: Hailiang Zhang <zhanghailiang@xfusion.com>
> > ---
> > hi Juan & Dave,
> > 
> > Firstly, thank you for your working on maintaining the COLO framework.
> > I didn't have much time on it in the past days.
> > 
> > I may have some time in the next days since my job has changed.
> > 
> > Because of my old email being stopped, i can not use it to send this patch.
> > Please help me to merge this patch.
> 
> Can we have an Ack-by from someone working at Huawei?

Why do we need that ? Subsystems are not owned by companies.

If someone moves company and wants to carry on in their existing
role as maintainer that is fine and doesn't need approva from their
old company IMHO.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


