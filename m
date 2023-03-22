Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21246C53A6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 19:24:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf36g-0001Dh-Q4; Wed, 22 Mar 2023 14:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pf36f-0001Cw-9j
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 14:22:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pf36d-0002gh-Hl
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 14:22:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679509358;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QR6nX+WGKWy1SEdvFFJdgu0V/gcKbHNDW9fT4biPZUk=;
 b=WsrIfe2FBAPgVNDCnFwd0vG0dycv/QR5NTf0MaZ3Zy2sx8ZmdJbXImhbnCVp/CKbU2z6hb
 7O8SjDx4zAXMpjnGKwTx4su1v/0IONc/WedlTE4xLeAWot1zGWmzXuV81lXwKD8cW1IwDS
 QQOnlf3DhrbQLLgsnG/qL9ZhJXQ8pgo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-Av-f8nizPhWpvJgzzINWIg-1; Wed, 22 Mar 2023 14:22:34 -0400
X-MC-Unique: Av-f8nizPhWpvJgzzINWIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A79218E52BF;
 Wed, 22 Mar 2023 18:22:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE1481121314;
 Wed, 22 Mar 2023 18:22:30 +0000 (UTC)
Date: Wed, 22 Mar 2023 18:22:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jintao Yin <nicememory@gmail.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v2 1/2] gitlab-ci: Cover SPICE in the MSYS2 job
Message-ID: <ZBtHZGtEBchXzae1@redhat.com>
References: <20230322135721.61138-1-philmd@linaro.org>
 <20230322135721.61138-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230322135721.61138-2-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

On Wed, Mar 22, 2023 at 02:57:20PM +0100, Philippe Mathieu-Daudé wrote:
> Include the mingw-w64-x86_64-spice package so SPICE is covered:
> 
>   C compiler for the host machine: cc -m64 -mcx16 (gcc 12.2.0 "cc (Rev10, Built by MSYS2 project) 12.2.0")
>   ...
>   Run-time dependency spice-protocol found: YES 0.14.4
>   Run-time dependency spice-server found: YES 0.15.1
> 
> In particular this would have helped catching the build issue
> reported as https://gitlab.com/qemu-project/qemu/-/issues/1553:
> 
>   [1851/5253] Compiling C object libcommon.fa.p/ui_spice-core.c.obj
>   FAILED: libcommon.fa.p/ui_spice-core.c.obj
>   ../ui/spice-core.c: In function 'watch_remove':
>   ../ui/spice-core.c:152:5: error: implicit declaration of function 'qemu_close_to_socket' [-Werror=implicit-function-declaration]
>   152 |     qemu_close_to_socket(watch->fd);
>       |     ^~~~~~~~~~~~~~~~~~~~
>   ../ui/spice-core.c:152:5: error: nested extern declaration of 'qemu_close_to_socket' [-Werror=nested-externs]
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> See https://gitlab.com/philmd/qemu/-/jobs/3980693656#L2378
> ---
>  .gitlab-ci.d/windows.yml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


