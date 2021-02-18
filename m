Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC71F31EF24
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 20:03:12 +0100 (CET)
Received: from localhost ([::1]:36678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCoZz-0000Pf-WD
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 14:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCoYN-0008Me-Er
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:01:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCoYL-000075-Qs
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:01:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613674889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PPacXR8ed9ZN5CPHQg33QlL8uM4DWhEygD1xF2hx1rA=;
 b=Ar8cDajEf+VbRuNqT5I/7DG63kjeOrqgKctbCZdzA66Me8wS6XYY1eG9NuSt9idJkzNUR3
 +RS1DNFnQ0KnHPRlE0+qMfb1p5pdkeQ3YskRcEtsvhxSnLLAEMFnnBlL6hc4bghiOuZbRX
 w+hkByt9x5n6UokIad35qnyuFWh/eqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-eazUa-wyMSum8wptMp_X5Q-1; Thu, 18 Feb 2021 14:01:25 -0500
X-MC-Unique: eazUa-wyMSum8wptMp_X5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27F6680196E;
 Thu, 18 Feb 2021 19:01:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E67051002393;
 Thu, 18 Feb 2021 19:01:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 79AD6113860F; Thu, 18 Feb 2021 20:01:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v6 14/19] qapi/introspect.py: add type hint annotations
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-15-jsnow@redhat.com>
 <8735xturux.fsf@dusky.pond.sub.org>
Date: Thu, 18 Feb 2021 20:01:22 +0100
In-Reply-To: <8735xturux.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Thu, 18 Feb 2021 19:56:54 +0100")
Message-ID: <87tuq9td31.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> John Snow <jsnow@redhat.com> writes:
>
>> NB: The type aliases (SchemaInfo et al) declare intent for some of the
>> "dictly-typed" objects we pass around in introspect.py. They do not
>> enforce the shape of those objects, and cannot, until Python 3.7 or
>> later. (And even then, it may not be "worth it".)
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>
> Series:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> I'm queuing all but the last patch.

Meant to send this in reply to the cover letter.


