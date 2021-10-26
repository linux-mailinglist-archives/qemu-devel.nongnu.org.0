Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C2943B552
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:17:49 +0200 (CEST)
Received: from localhost ([::1]:57510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOCy-00018q-V0
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfNzz-0000Oi-Uh
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:04:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfNzx-0002Zy-L8
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635260660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IOVSD7c0Hjt62pd7aHduOQ6evHfCmjcXgzCva1pp8Nw=;
 b=GY2rdS8yzEO5B4r3KDepaRGehVemEak2XV7rt80XXftzCKEg+yijPWLASBLoPpfOT8s8b2
 lzYC9HjwADyhAFUEKAEPz1pu0Rj8jNc0sNSltUKLV6RGOZGyXRPKAiGFKTzDHvC+Jet70G
 P/LEYu63JNoylRTB+YssncjuurJpqFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-cAqj9MOlPd6e2msLcWPeJA-1; Tue, 26 Oct 2021 11:04:17 -0400
X-MC-Unique: cAqj9MOlPd6e2msLcWPeJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F2A980668D;
 Tue, 26 Oct 2021 15:04:16 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A71A5D6BA;
 Tue, 26 Oct 2021 15:04:06 +0000 (UTC)
Date: Tue, 26 Oct 2021 17:04:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/2] docs/devel/qapi-code-gen: Belatedly document feature
 documentation
Message-ID: <YXgY5flIoi1rwUzh@redhat.com>
References: <20211026111023.76937-1-armbru@redhat.com>
 <20211026111023.76937-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211026111023.76937-3-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: jsnow@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.10.2021 um 13:10 hat Markus Armbruster geschrieben:
> Commit 6a8c0b5102 "qapi: Add feature flags to struct types" neglected
> to document how to document feature flags.  Make up for that.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/devel/qapi-code-gen.rst | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index 1f6805a705..4b79623f51 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -949,15 +949,16 @@ definition must have documentation.
>  Definition documentation starts with a line naming the definition,
>  followed by an optional overview, a description of each argument (for
>  commands and events), member (for structs and unions), branch (for
> -alternates), or value (for enums), and finally optional tagged
> -sections.
> +alternates), or value (for enums), a description of each feature (if
> +any), and finally optional tagged sections.
>  
> -Descriptions of arguments can span multiple lines.  The description
> -text can start on the line following the '\@argname:', in which case it
> -must not be indented at all.  It can also start on the same line as
> -the '\@argname:'.  In this case if it spans multiple lines then second
> -and subsequent lines must be indented to line up with the first
> -character of the first line of the description::
> +The description of an argument or feature 'name' starts with
> +'\@name:'.  The description text can start on the line following the
> +'\@argname:', in which case it must not be indented at all.  It can
> +also start on the same line as the '\@argname:'.  In this case if it
> +spans multiple lines then second and subsequent lines must be indented
> +to line up with the first character of the first line of the
> +description::

I'm confused. Are @name and @argname really two different things? What
does each one mean?

Kevin


