Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1887C4CDDF3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:25:22 +0100 (CET)
Received: from localhost ([::1]:46962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQEUL-0000zc-6w
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:25:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQESh-0008FM-G6
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:23:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQESd-0005bw-T2
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646425414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N7bPn7MCjctk6tAOFnon9CX0UQjIy0nnoSx93UIaM2c=;
 b=hiAPofz4ehjnm6Odv7Og1PmU4Vc+Lc6jHj9gjvGaCdwYPEHdj1BMzrCQRJNTAi031ynPko
 sOx1jEroMI/zByLZ91vXLEBCksB7D84dETE9aveKg7TwZSQQUiftwF8yQuW82UX7FLMexk
 qlJjJO0zyTTPBRIuc69grdt3JWFj1gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-md3Ws7sDMiu_EdamDRqODA-1; Fri, 04 Mar 2022 15:23:31 -0500
X-MC-Unique: md3Ws7sDMiu_EdamDRqODA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94EB81006AA5;
 Fri,  4 Mar 2022 20:23:30 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06DC2ADD5;
 Fri,  4 Mar 2022 20:23:28 +0000 (UTC)
Date: Fri, 4 Mar 2022 14:23:26 -0600
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 3/5] iotests: Remove explicit checks for qemu_img() == 0
Message-ID: <20220304202326.cj265z3pxrm45c34@redhat.com>
References: <20220304194746.486226-1-jsnow@redhat.com>
 <20220304194746.486226-4-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304194746.486226-4-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-383-c6e293
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 02:47:44PM -0500, John Snow wrote:
> qemu_img() returning zero ought to be the rule, not the
> exception. Remove all explicit checks against the condition in
> preparation for making non-zero returns an Exception.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---

> +++ b/tests/qemu-iotests/310

> @@ -105,8 +105,8 @@ with iotests.FilePath('base.img') as base_img_path, \
>      log('')
>  
>      # Detach backing to check that we can read the data from the top level now
> -    assert qemu_img('rebase', '-u', '-b', '', '-f', iotests.imgfmt,
> -                    top_img_path) == 0
> +    qemu_img('rebase', '-u', '-b', '', '-f', iotests.imgfmt,
> +             top_img_path)

You collapsed other wrapped lines into one where they fit, why not
this one?  But it's not essential.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


