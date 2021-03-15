Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACFE33B4A1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:34:10 +0100 (CET)
Received: from localhost ([::1]:40168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnMH-0001PJ-FA
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lLnK8-000056-Kw
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lLnK4-0006Yf-Mc
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615815111;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TWsR4VI8rZHT2wuNGN9wf5ZJaNs3QZug2/6eALYmjy4=;
 b=DY8vyosSHs4qM38T3s2sxTunD5ER4+C+bUdcN358PgRfez5RgsGqa+n9FKnisrEXoqkd3R
 E8vXBPwPB+ZaqzReMsPCMsBmOY/LzoNTIt25fHk1V1n4IilT9UpRPEp+nhZBp5FML5/ahj
 j4uY9+/4HvnvRCymUJIw90kyRLT/gTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-MgQy7DSJPQS-PRuGt8RaWw-1; Mon, 15 Mar 2021 09:31:42 -0400
X-MC-Unique: MgQy7DSJPQS-PRuGt8RaWw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F493100C660;
 Mon, 15 Mar 2021 13:31:41 +0000 (UTC)
Received: from redhat.com (ovpn-115-81.ams2.redhat.com [10.36.115.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F3E75D745;
 Mon, 15 Mar 2021 13:31:34 +0000 (UTC)
Date: Mon, 15 Mar 2021 13:31:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH v7 3/3] qmp: add new qmp display-reload
Message-ID: <YE9htFdodlSz54fr@redhat.com>
References: <20210315131609.2208-1-changzihao1@huawei.com>
 <20210315131609.2208-4-changzihao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210315131609.2208-4-changzihao1@huawei.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: oscar.zhangbo@huawei.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 armbru@redhat.com, yebiaoxiang@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 09:16:09PM +0800, Zihao Chang wrote:
> This patch provides a new qmp to reload display configuration
> without restart VM, but only reloading the vnc tls certificates
> is implemented.
> Example:
> {"execute": "display-reload", "arguments":{"type": "vnc", "tls-certs": true}}
> 
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> ---
>  monitor/qmp-cmds.c | 13 ++++++++++
>  qapi/ui.json       | 61 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


