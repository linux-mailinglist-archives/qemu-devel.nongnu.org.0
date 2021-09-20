Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD2B4128FB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:43:28 +0200 (CEST)
Received: from localhost ([::1]:55990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSS0V-0002MR-Jk
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mSRAz-0003jN-4n
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:50:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mSRAw-0005lM-7S
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632174607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5KVqxceY64jEWMD//03vWpQXJjfSqUn292xoSEjbqO0=;
 b=NfkeKs33uRWhXOho/gV9rSI3d3+09UJkz1Z4eLE4Y+41w/oYD20G/+Lt39y4u0Pf4o8Szp
 AeP8UOu3+BuO1j4iAM/BXRd4YanuTN5X17tGHznygg3fPlBf8ZZu5LuUlt2wyAfchq8t+N
 fXOmYe1ZnUZVbv98sgCG74icD+Mjpas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-KltokqJKO9Syr982QUpGpQ-1; Mon, 20 Sep 2021 17:50:04 -0400
X-MC-Unique: KltokqJKO9Syr982QUpGpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 643C1835DE0;
 Mon, 20 Sep 2021 21:50:03 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA6F160C17;
 Mon, 20 Sep 2021 21:49:54 +0000 (UTC)
Date: Mon, 20 Sep 2021 16:49:52 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 22/23] tests/qapi-schema: Rename flat-union-* test
 cases to union-*
Message-ID: <20210920214952.hxtjsnxi2s52astr@redhat.com>
References: <20210917143134.412106-1-armbru@redhat.com>
 <20210917143134.412106-23-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210917143134.412106-23-armbru@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: michael.roth@amd.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 17, 2021 at 04:31:33PM +0200, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

>  65 files changed, 48 insertions(+), 48 deletions(-)

The diff is harder to read in email (due to file rename comparison
sometimes going astray on short and similar file contents) when
compared to applying the patch and inspecting the directory proper,
but either way, it looks okay to me.

> +++ b/tests/qapi-schema/meson.build
> @@ -107,22 +107,6 @@ schemas = [
>    'features-name-bad-type.json',
>    'features-no-list.json',
>    'features-unknown-key.json',
> -  'flat-union-array-branch.json',
> -  'flat-union-bad-base.json',
> -  'flat-union-bad-discriminator.json',
> -  'flat-union-base-any.json',
> -  'flat-union-base-union.json',
> -  'flat-union-clash-member.json',
> -  'flat-union-discriminator-bad-name.json',
> -  'flat-union-empty.json',
> -  'flat-union-inline-invalid-dict.json',
> -  'flat-union-int-branch.json',
> -  'flat-union-invalid-branch-key.json',
> -  'flat-union-invalid-discriminator.json',
> -  'flat-union-invalid-if-discriminator.json',
> -  'flat-union-no-base.json',
> -  'flat-union-optional-discriminator.json',
> -  'flat-union-string-discriminator.json',
>    'funny-char.json',
>    'funny-word.json',
>    'ident-with-escape.json',
> @@ -190,12 +174,28 @@ schemas = [
>    'unclosed-list.json',
>    'unclosed-object.json',
>    'unclosed-string.json',
> +  'union-array-branch.json',
> +  'union-bad-base.json',
> +  'union-bad-discriminator.json',
> +  'union-base-any.json',
>    'union-base-empty.json',
>    'union-base-no-discriminator.json',
> +  'union-base-union.json',
>    'union-branch-if-invalid.json',
>    'union-branch-invalid-dict.json',
> +  'union-clash-member.json',
> +  'union-discriminator-bad-name.json',
> +  'union-empty.json',
> +  'union-inline-invalid-dict.json',
> +  'union-int-branch.json',
>    'union-invalid-base.json',
> +  'union-invalid-branch-key.json',
>    'union-invalid-data.json',
> +  'union-invalid-discriminator.json',
> +  'union-invalid-if-discriminator.json',
> +  'union-no-base.json',
> +  'union-optional-discriminator.json',
> +  'union-string-discriminator.json',
>    'union-unknown.json',

This is probably the best part of the patch to focus on.

Reviewed-by: Eric Blake <eblake@redhat.com

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


