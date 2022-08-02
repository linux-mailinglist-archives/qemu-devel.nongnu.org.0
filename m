Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523B4587A11
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:49:28 +0200 (CEST)
Received: from localhost ([::1]:39388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIoWk-0008KV-JC
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oIoRv-0004c5-LH
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:44:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oIoRt-0000Ux-8U
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:44:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659433464;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I9dUKmqBPeqFnu3uK2x66lAAU0234ajDVGmTlSzR7gI=;
 b=JSmrnKhy22CjGZIbfv+A97iIg6b8gU4qKwaUVZFNAmajEilq0nSbgWqcYZ2FSvyPqZUjfw
 RfIYkEa+ugHb+OHN81nLBXIsObSeOjI+rvpmFcv49d6fgF40HuhEemYnC2ryZqXjQ2lPlU
 o8fT6O0MZmGM/kcxw5yjuUemjvFXGj8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-Axs_JUXbPZ2IJrqRQFuhcQ-1; Tue, 02 Aug 2022 05:44:21 -0400
X-MC-Unique: Axs_JUXbPZ2IJrqRQFuhcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB9E8185A7B2;
 Tue,  2 Aug 2022 09:44:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2D521121314;
 Tue,  2 Aug 2022 09:44:19 +0000 (UTC)
Date: Tue, 2 Aug 2022 10:44:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org, stefanha@gmail.com
Subject: Re: [PATCH 1/1] vfio-user: update submodule to latest
Message-ID: <Yujx8ZlUIAO0eQ24@redhat.com>
References: <cover.1659403195.git.jag.raman@oracle.com>
 <6b9dc37842ea533622c09d0ca7462f77c18cd67d.1659403195.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b9dc37842ea533622c09d0ca7462f77c18cd67d.1659403195.git.jag.raman@oracle.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 01, 2022 at 09:24:04PM -0400, Jagannathan Raman wrote:
> Update libvfio-user submodule to the latest
> 
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  subprojects/libvfio-user | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
> index 0b28d20557..1305f161b7 160000
> --- a/subprojects/libvfio-user
> +++ b/subprojects/libvfio-user
> @@ -1 +1 @@
> -Subproject commit 0b28d205572c80b568a1003db2c8f37ca333e4d7
> +Subproject commit 1305f161b7e0dd2c2a420c17efcb0bd49b94dad4

Only 3 changes in the submodule with this:

1305f161b7e0dd2c2a420c17efcb0bd49b94dad4 disable client-server test by default (#700)
36beb63be45ad1412562a98d9373a4c0bd91ab3d support for shadow ioeventfd (#698)
1c274027bb4f9d68eee846036e8d50dcde2fd7e9 improve README.md (#696)

That fixes the testing bug we see, the other change affects an API that
QEMU doesn't use. Overall looks safe for applying during soft freeze.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


