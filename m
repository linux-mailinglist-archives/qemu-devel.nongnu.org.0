Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD0732512E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:05:15 +0100 (CET)
Received: from localhost ([::1]:37294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHGU-0008Ni-2K
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFHF5-0007bM-VD
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:03:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFHF2-0000dV-LI
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614261824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BE4UIpxeXnH1SM89QtabCm2uHzriyfLFKoywK05GfJs=;
 b=djVbj3SxCrysB+eu9Uh9vhEwznLyj88rksBNX/nA2aM0Smxird/NJRG9btaWvNpobvWGNp
 0H8vFoY7xV9w1c31bVOndexZ8r/p8sYM1/DdHNzE3r23wGktlyaacPrRejtyECj1bZGkqp
 DqkrivrFHwgJL9WT8Jh+SZv/ZqiIhQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-PWvuQEg8MRm48dK9yYVl5g-1; Thu, 25 Feb 2021 09:03:40 -0500
X-MC-Unique: PWvuQEg8MRm48dK9yYVl5g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28C7584E24D;
 Thu, 25 Feb 2021 14:03:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBF2760855;
 Thu, 25 Feb 2021 14:03:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 821E4113860F; Thu, 25 Feb 2021 15:03:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 10/16] qapi/expr.py: Remove single-letter variable
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-11-jsnow@redhat.com>
Date: Thu, 25 Feb 2021 15:03:37 +0100
In-Reply-To: <20210223003408.964543-11-jsnow@redhat.com> (John Snow's message
 of "Mon, 22 Feb 2021 19:34:02 -0500")
Message-ID: <87r1l4b5xi.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Why?  Is it to appease a style checker?

I disagree with a blanket ban of single-letter variable names.

If @f is deemed too terrible to live, then I'd prefer @feat over
@feature, because it's more visually distant to @features.

John Snow <jsnow@redhat.com> writes:

> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/qapi/expr.py | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 3235a3b809e..473ee4f7f7e 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -214,14 +214,14 @@ def check_features(features: Optional[object],
>          raise QAPISemError(info, "'features' must be an array")
>      features[:] = [f if isinstance(f, dict) else {'name': f}
>                     for f in features]
> -    for f in features:
> +    for feature in features:
>          source = "'features' member"
> -        assert isinstance(f, dict)
> -        check_keys(f, info, source, ['name'], ['if'])
> -        check_name_is_str(f['name'], info, source)
> -        source = "%s '%s'" % (source, f['name'])
> -        check_name_str(f['name'], info, source)
> -        check_if(f, info, source)
> +        assert isinstance(feature, dict)
> +        check_keys(feature, info, source, ['name'], ['if'])
> +        check_name_is_str(feature['name'], info, source)
> +        source = "%s '%s'" % (source, feature['name'])
> +        check_name_str(feature['name'], info, source)
> +        check_if(feature, info, source)
>  
>  
>  def check_enum(expr: Expression, info: QAPISourceInfo) -> None:


