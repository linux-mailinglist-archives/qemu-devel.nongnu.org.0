Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1F73E1C90
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:22:51 +0200 (CEST)
Received: from localhost ([::1]:42820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBix8-0003hg-Nu
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBiwA-0002zp-8w
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:21:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBiw7-0001B6-Ko
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628191306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OTF52flOAa7wtPv1BhJGAzxOUMYkPSW0qSJW2c8byCE=;
 b=I8hvnFr0xNjYjZxhlmx5kvMEmb5mK5cR43hgYa8S46ufyRXDcMm3tqk5gUzrfE5MFcYsJ7
 LppAlf0bmv/hhFMVjb+Xwe5yiHiJy3WQiQK+Uwmu9wmNe5V1zhxuk78CfBhYXfvh6fWWWS
 ecuKftKzQtDe7X4SGY0KQNmxPhcfv1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-CJK8M8JoO_63BiUJKipIPA-1; Thu, 05 Aug 2021 15:21:44 -0400
X-MC-Unique: CJK8M8JoO_63BiUJKipIPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65B66100A605
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 19:21:43 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC698105C885;
 Thu,  5 Aug 2021 19:21:39 +0000 (UTC)
Date: Thu, 5 Aug 2021 14:21:37 -0500
From: Eric Blake <eblake@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v7 10/10] qapi: make 'if' condition strings simple
 identifiers
Message-ID: <20210805192137.rpeyqaulu3f7pveb@redhat.com>
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
 <20210804083105.97531-11-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210804083105.97531-11-marcandre.lureau@redhat.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 12:31:05PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Change the 'if' condition strings to be C-agnostic. It will accept
> '[A-Z][A-Z0-9_]*' identifiers. This allows to express configuration

This allows the expression of configuration

> conditions in other languages (Rust or Python for ex) or other more

I'd spell out 'example'

> suitable forms.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Tested-by: John Snow <jsnow@redhat.com>
> ---

> @@ -4307,8 +4307,8 @@
>  # @size: Size of the virtual disk in bytes
>  # @preallocation: Preallocation mode for the new image (default: off;
>  #                 allowed values: off,
> -#                 falloc (if defined CONFIG_POSIX_FALLOCATE),
> -#                 full (if defined CONFIG_POSIX))
> +#                 falloc (if CONFIG_POSIX_FALLOCATE),
> +#                 full (if CONFIG_POSIX))

Pre-existing, but the (double (nesting)) is a bit lisp-y considering
this comment is user-facing, where using [] for one of the layers
might help readability.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


