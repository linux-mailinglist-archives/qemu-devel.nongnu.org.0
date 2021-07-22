Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4304C3D20C3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 11:21:11 +0200 (CEST)
Received: from localhost ([::1]:59052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6UtC-0007qu-CF
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 05:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6Uro-0006Q1-Lh
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:19:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6Urn-0001hN-2J
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:19:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626945582;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hfuh9NoENStZRRecoCVNHAvk4a0JZFNppoc14TAQhg0=;
 b=RPd88a5KLU2lsJofRTuEwIqjnOxfwrOrmLn5eVWy/EyWW+11v7S0rvgF6nV6BgvpqNloZs
 Ny/9HGdgY7mGEcwp0xVIG5wBoE3phzwQLqFLGlLezLYfl7lUhiYA26X5l8A1Lnvzol0Euc
 mk4OU+aLuUUBR0khjlShDsWd6hAA3+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-Ny2UCYoiNuGZptzVx3375g-1; Thu, 22 Jul 2021 05:19:41 -0400
X-MC-Unique: Ny2UCYoiNuGZptzVx3375g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01E3C801AB0;
 Thu, 22 Jul 2021 09:19:40 +0000 (UTC)
Received: from redhat.com (ovpn-114-125.ams2.redhat.com [10.36.114.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC07E19D9B;
 Thu, 22 Jul 2021 09:19:38 +0000 (UTC)
Date: Thu, 22 Jul 2021 10:19:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?B?5pyx5YWJ5a6P?= <zhuguanghong@uniontech.com>
Subject: Re: [PATCH v2] qom/object.c 'if (type_table == NULL)' statement is
 redundant , delete it.
Message-ID: <YPk4J/pQzGajG3NZ@redhat.com>
References: <20210721084446.26377-1-zhuguanghong@uniontech.com>
 <CAJ+F1CKkgfp8nDqHZD1Y8xAiY4_+eRmQBddE8W8bgV22BKoEQA@mail.gmail.com>
 <YPgoV0cUZKi0fMlr@redhat.com>
 <tencent_45F13726486174B635D9CD6A@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_45F13726486174B635D9CD6A@qq.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 05:15:46PM +0800, 朱光宏 wrote:
> &nbsp;Hi
> Signed-off-by: zhuguanghong <zhuguanghong@uniontech.com&gt;
> ---
> &nbsp;qom/object.c | 4 ++++
> &nbsp;1 file changed, 4 insertions(+)
> 
> 
> diff --git a/qom/object.c b/qom/object.c
> index 6a01d56546..dc0a363ed0 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -73,15 +73,19 @@ struct TypeImpl
> &nbsp;};
> 
> 
> &nbsp;static Type type_interface;
> +G_LOCK_DEFINE (GHashTable_mutex);
> 
> 
> &nbsp;static GHashTable *type_table_get(void)
> &nbsp;{
> &nbsp; &nbsp; &nbsp;static GHashTable *type_table;
> +&nbsp; &nbsp; G_LOCK ( GHashTable_mutex);&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
> 
> 
> &nbsp; &nbsp; &nbsp;if (type_table == NULL) {
> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;type_table = g_hash_table_new(g_str_hash, g_str_equal);
> &nbsp; &nbsp; &nbsp;}
> 
> 
> +&nbsp; &nbsp; G_UNLOCK ( GHashTable_mutex);&nbsp; &nbsp; &nbsp;&nbsp;
> +
> &nbsp; &nbsp; &nbsp;return type_table;
> &nbsp;}

Please could you check your mail client settings so that it correctly
sends *plain* text messages.  This is a multipart text/plain+text/html
message, but the text/plain part is full of HTML entities. This makes
your messages almost impossible to read and reply to.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


