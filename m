Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA91831CD0B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:36:03 +0100 (CET)
Received: from localhost ([::1]:56978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2OQ-0005ut-Oa
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lC2Kp-0003UQ-4f
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:32:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lC2Kf-0001Vg-SJ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:32:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613489523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U7IxCPi4D21SfBnx9taPowMHWtKEgl3oHsbelJlGr8E=;
 b=azYA66QN1Rsqlpk2WLLqV8cuNkVkiF+kzkRK0gqodchYcV+OmL6mmnJZYYrYFsQmYT6T+c
 q69Vm/s5sPCJXR4paXkJla+1GYfm0mH2gQRrZDEMZE+QrQa03cTYCouU/G9wl+/YtvCAB5
 HA/CxdesAvrNVDqACfeFId3CiQwI8zA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-aovdtwsJO-meTr8O_vE7zA-1; Tue, 16 Feb 2021 10:32:02 -0500
X-MC-Unique: aovdtwsJO-meTr8O_vE7zA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B6BD100CCC0
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 15:32:01 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-159.ams2.redhat.com [10.36.113.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4907A722F0;
 Tue, 16 Feb 2021 15:32:00 +0000 (UTC)
Date: Tue, 16 Feb 2021 16:31:58 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 6/6] tests/qapi-schema: Test cases for aliases
Message-ID: <20210216153158.GB5282@merkur.fritz.box>
References: <20210211183118.422036-1-kwolf@redhat.com>
 <20210211183118.422036-7-kwolf@redhat.com>
 <87eehgrqn9.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87eehgrqn9.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.02.2021 um 16:14 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> [...]
> > diff --git a/tests/qapi-schema/alias-name-bad-type.err b/tests/qapi-schema/alias-name-bad-type.err
> > new file mode 100644
> > index 0000000000..489f45ff9b
> > --- /dev/null
> > +++ b/tests/qapi-schema/alias-name-bad-type.err
> > @@ -0,0 +1,2 @@
> > +alias-name-bad-type.json: In struct 'AliasStruct0':
> > +alias-name-bad-type.json:1: alias member 'name' requires a string name
> 
> Would "'aliases' member 'name'..." be more consistent?

'aliases' is a list, not a single alias definition, so technically it
would have to be "'aliases' member member 'name'...", which I feel is a
bit too confusing.

I think I have consistently used "alias" for "'aliases' member"
everywhere, though. At least, that was the intention.

Kevin


