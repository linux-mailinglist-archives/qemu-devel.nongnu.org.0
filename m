Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182DD417B7C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:09:05 +0200 (CEST)
Received: from localhost ([::1]:41888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqZD-00025F-W3
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTqSf-0001a1-7E
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:02:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTqSc-0000ds-Hm
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632510133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jCfiWp9KwlZOTIKgWVvec6dkVvbw8sQxxd2W0q0la+o=;
 b=cvbKxUw/b+BiaH98FLpX+4luLeBjYgAIHJTm6YEIzlbIZn5MRPCnm1rxEMgj4bZ6Co3sO9
 qNl341zHTA3i0Fw9SNW1WXn72CrqbYswby4GC3B/dIPujCYy1eq1/MhnpTh6kdQvTWOfWk
 19EhIrQ6SB+/oghcJ+Jw9L3/l1Suhqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-Y_oM7hT6Mq2vDm8nhmitmw-1; Fri, 24 Sep 2021 15:02:10 -0400
X-MC-Unique: Y_oM7hT6Mq2vDm8nhmitmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A992C1808311;
 Fri, 24 Sep 2021 19:02:08 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F76B1017CE7;
 Fri, 24 Sep 2021 19:02:05 +0000 (UTC)
Date: Fri, 24 Sep 2021 14:02:03 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 11/11] Deprecate stable non-JSON -device and -object
Message-ID: <20210924190203.igztisq2k5o2rs5y@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-12-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210924090427.9218-12-kwolf@redhat.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pkrempa@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 11:04:27AM +0200, Kevin Wolf wrote:
> We want to switch both from QemuOpts to the keyval parser in the future,
> which results in some incompatibilities, mainly around list handling.
> Mark the non-JSON version of both as unstable syntax so that management
> tools switch to JSON and we can later make the change without breaking
> things.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  docs/about/deprecated.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 3c2be84d80..42f6a478fb 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -160,6 +160,17 @@ Use ``-display sdl`` instead.
>  
>  Use ``-display curses`` instead.
>  
> +Stable non-JSON ``-device`` and ``-object`` syntax (since 6.2)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +If you rely on a stable interface for ``-device`` and ``-object`` that doesn't
> +change incompatibly between QEMU versions (e.g. because you are using the QEMU
> +command line as a machine interface in scripts rather than interactively), use
> +JSON syntax for these options instead.
> +
> +There is no intention to remove support for non-JSON syntax entirely, but
> +future versions may change the way to spell some options.
> +
>  
>  Plugin argument passing through ``arg=<string>`` (since 6.1)
>  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -- 
> 2.31.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


