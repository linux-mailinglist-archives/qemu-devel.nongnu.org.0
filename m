Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A367278376
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 11:01:43 +0200 (CEST)
Received: from localhost ([::1]:48580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLjbp-0005a6-Uv
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 05:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kLjZd-00056w-JC
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 04:59:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kLjZb-0006Q2-Ud
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 04:59:25 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601024363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oBCC0w76WF+uQ9Sdd8ikXPtmCf0CmB0SWid0uFkwucY=;
 b=ajWyO5iI31V0RBEjbi7P274+pDDRyX21lMWb/QoM0VR98ikIFpKPnOg4ryCDTQV+rg0gRd
 oTfrPTllKP2sOAgQCLLB9JLqlyjrW7rZHyNOoRlQ70lq7y5sSng1ivYkIJfO5S7yNECIZa
 3+HJz5iO6NyOMeM0wZsKAJ7c3FcACbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-GYMietp_NwmSl_EKfjJDEg-1; Fri, 25 Sep 2020 04:59:19 -0400
X-MC-Unique: GYMietp_NwmSl_EKfjJDEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABBCE802EA3
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 08:59:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-70.ams2.redhat.com
 [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78BE85C1C2;
 Fri, 25 Sep 2020 08:59:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DCB50113865F; Fri, 25 Sep 2020 10:59:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 05/47] qapi/doc.py: Change code templates from
 function to string
References: <20200925002900.465855-1-jsnow@redhat.com>
 <20200925002900.465855-6-jsnow@redhat.com>
Date: Fri, 25 Sep 2020 10:59:15 +0200
In-Reply-To: <20200925002900.465855-6-jsnow@redhat.com> (John Snow's message
 of "Thu, 24 Sep 2020 20:28:18 -0400")
Message-ID: <87pn6aw7to.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 02:48:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> For whatever reason, when these are stored as functions instead of
> strings, it confuses sphinx-autodoc into believing them to be
> docstrings, and it chokes on the syntax.
>
> Keeping them as dumb strings instead avoids the problem.
>
> Signed-off-by: John Snow <jsnow@redhat.com>

Quoting my review of the patch that added it: "This .format business is
perhaps a bit too clever.  But let's move on."

doc.py is about to be replaced, obsoleting this patch.  Regardless:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


