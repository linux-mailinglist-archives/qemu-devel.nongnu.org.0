Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09363573479
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 12:42:11 +0200 (CEST)
Received: from localhost ([::1]:50952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBZon-00026J-Ur
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 06:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBZlC-0008BI-OZ
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 06:38:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBZl9-0000GT-FP
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 06:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657708702;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sDZ0cqZOM+XlVFyuDGi0lJtH9JhTPs4r3LdYWpIF8zk=;
 b=gpqpRDkROjyuenBN1MJOtCT2KTLOPTEm80Z0w3H7EXfvFNRD0ZeSQDHc55F5gh5L8AuWjm
 rHKEVFA9AsgZNXA/qBSbRNyvzGxt6UozB6RWF2iuJgElnpTWZlp2m91x9f3Kq4w1LumlFo
 qTJj5tCQrHfiDyY/NKN23uFYi6o/3vM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-va4hwsUrN4mRzSPiPB2W3A-1; Wed, 13 Jul 2022 06:38:19 -0400
X-MC-Unique: va4hwsUrN4mRzSPiPB2W3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0777B3802B8D;
 Wed, 13 Jul 2022 10:38:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26A191121314;
 Wed, 13 Jul 2022 10:38:18 +0000 (UTC)
Date: Wed, 13 Jul 2022 11:38:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PULL 1/3] MAINTAINERS: Add myself as Guest Agent reviewer
Message-ID: <Ys6gl74SLea6dsfU@redhat.com>
References: <20220713101908.2212307-1-kkostiuk@redhat.com>
 <20220713101908.2212307-2-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220713101908.2212307-2-kkostiuk@redhat.com>
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

On Wed, Jul 13, 2022 at 01:19:06PM +0300, Konstantin Kostiuk wrote:
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> Message-Id: <20220712092715.2136898-1-kkostiuk@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 450abd0252..b1e73d99f3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2880,6 +2880,7 @@ T: git https://repo.or.cz/qemu/armbru.git qapi-next
>  
>  QEMU Guest Agent
>  M: Michael Roth <michael.roth@amd.com>
> +R: Konstantin Kostiuk <kkostiuk@redhat.com>

This pull request contains functional changes under qga/, which
suggests you're acting as a (co-)maintainer for QGA, not merely
a reviewer. I wouldn't normally expect reviewers to send pull
requests for a subsystem. As such should this be "M:", to
indicate co-maintainership and have an explicit ACK from
Michael Roth.

>  S: Maintained
>  F: qga/
>  F: docs/interop/qemu-ga.rst


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


