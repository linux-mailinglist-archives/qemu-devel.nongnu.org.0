Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39762276178
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 21:55:17 +0200 (CEST)
Received: from localhost ([::1]:58048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLArD-0001QI-TV
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 15:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kLApZ-0000PM-4V
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 15:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kLApU-0002WR-2H
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 15:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600890806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=13NDTtHO6ewMUpACkZmWHE9FC1gvtrq/QtgEnvKAnx0=;
 b=hG05a2NfccyFsrv/I9DCHPIvMn6Hmu4pRI0YF+O0YsuewWg3nYG0mFkqWZ2xCA5NudKYCJ
 z41iwco8YI795LxQEDIXHPOBQf4k5XG27EWTQFM2HUY1BLse3Lq9yocMhHBXsgLNX/OEI4
 idJOzhS2iLF06vEDYvo5t/dYbflVaj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-iF9uhUaDPxmNe-oRnPyAFg-1; Wed, 23 Sep 2020 15:53:24 -0400
X-MC-Unique: iF9uhUaDPxmNe-oRnPyAFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA2E9192CC44;
 Wed, 23 Sep 2020 19:53:23 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5438460BF1;
 Wed, 23 Sep 2020 19:53:23 +0000 (UTC)
Date: Wed, 23 Sep 2020 15:53:22 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 04/16] qapi/expr.py: Add assertion for union type
 'check_dict'
Message-ID: <20200923195322.GE3312949@habkost.net>
References: <20200922211313.4082880-1-jsnow@redhat.com>
 <20200922211313.4082880-5-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200922211313.4082880-5-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 22, 2020 at 05:13:01PM -0400, John Snow wrote:
> mypy isn't fond of allowing you to check for bool membership in a
> collection of str elements. Guard this lookup for precisely when we were
> given a name.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/expr.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index f6b55a87c1..67892502e9 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -166,7 +166,9 @@ def check_type(value, info, source,
>          raise QAPISemError(info,
>                             "%s should be an object or type name" % source)
>  
> -    permit_upper = allow_dict in info.pragma.name_case_whitelist
> +    permit_upper = False
> +    if isinstance(allow_dict, str):
> +        permit_upper = allow_dict in info.pragma.name_case_whitelist

Well, this keeps existing behavior, so:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

But: what exactly is the meaning of allow_dict=False,
allow_dict=True, and allow_dict being a string?


>  
>      # value is a dictionary, check that each member is okay
>      for (key, arg) in value.items():
> -- 
> 2.26.2
> 

-- 
Eduardo


