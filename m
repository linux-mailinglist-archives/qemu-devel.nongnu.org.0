Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8207C642742
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 12:11:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p29MQ-00030R-Er; Mon, 05 Dec 2022 06:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p29MN-00030I-M8
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 06:10:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p29MM-0008To-4W
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 06:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670238605;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OyjWiG3esE7oLZNEDCzlDxNo9QIF0E0VSl0UeaiwB4k=;
 b=Eg5rslVsdc2V2q2Y37SDoTqGbKO2hDAVRei5nd2uvmiJdwct6rUPQjRe7bxqiVuRf+aews
 1+Iqr+VJyZdRSQCa6dBNC0C4xq4qr3ISEAetmOYOddFJf/P94+2W/LPo/IALdUduX4mPKO
 2FNx5WFgTz9a2Vl9IJOnOPUV+ZHLtBI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-68gz9o-sNpyvJOVRouA_GA-1; Mon, 05 Dec 2022 06:10:04 -0500
X-MC-Unique: 68gz9o-sNpyvJOVRouA_GA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 107B6811E7A;
 Mon,  5 Dec 2022 11:10:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 491922028E96;
 Mon,  5 Dec 2022 11:10:03 +0000 (UTC)
Date: Mon, 5 Dec 2022 11:09:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, dgilbert@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH v2 04/14] Revert "hmp: info spice: take out webdav"
Message-ID: <Y43Rh2G7/2CEfLwd@redhat.com>
References: <20221202100512.4161901-1-armbru@redhat.com>
 <20221202100512.4161901-5-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221202100512.4161901-5-armbru@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 02, 2022 at 11:05:02AM +0100, Markus Armbruster wrote:
> This reverts commit 7c6044a94e52db8aef9a71d616c7a0914adb71ab.
> 
> We had to take it out because SPICE_CHANNEL_WEBDAV requires
> spice-protocol 0.12.7, but we had only 0.12.3.  We have 0.14.0 now, so
> put it back in.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  monitor/hmp-cmds.c | 5 -----
>  1 file changed, 5 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


