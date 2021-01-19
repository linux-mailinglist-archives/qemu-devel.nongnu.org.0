Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0A62FC155
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:42:03 +0100 (CET)
Received: from localhost ([::1]:44688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xpC-00075Z-Ba
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1xRz-0006zg-Qb
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:18:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1xRu-00076Q-9O
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611087476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7+rh8xIY8j3KISW/orPERG4TZn7smWnWEeVkxLQiu1k=;
 b=b3FFp+rwGhx/4PP8eQMZ3wTR8aOJfbYwgjhbZV0zgJtz+UhAk0mTN3MoxKllE+dWeo1w5A
 U97EE/6cVkg7acTx7ZLAjGjVgBpCdiIHyu91uYNwT3ZNolN9DdCxo+l1bg2QxbkIsvPlP4
 2yr3L1T3l4XS5fhOsdgsMlJlqNp/8jo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-qvqApo_uPzCz6ipnkjKWEA-1; Tue, 19 Jan 2021 15:17:52 -0500
X-MC-Unique: qvqApo_uPzCz6ipnkjKWEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2676E1005D4F;
 Tue, 19 Jan 2021 20:17:51 +0000 (UTC)
Received: from work-vm (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 268D75F9B0;
 Tue, 19 Jan 2021 20:17:49 +0000 (UTC)
Date: Tue, 19 Jan 2021 20:17:47 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: =?utf-8?B?5rGf6Iqz5p2w?= <18401698361@126.com>
Subject: Re: Ask for suggestions for CVE-2019-12928
Message-ID: <20210119201747.GE3888@work-vm>
References: <74ca794a.6063.176f21e2fca.Coremail.18401698361@126.com>
MIME-Version: 1.0
In-Reply-To: <74ca794a.6063.176f21e2fca.Coremail.18401698361@126.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, pjp@fedoraproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* 江芳杰 (18401698361@126.com) wrote:
> Hi:
>     Sorry to bother you~
>     I have read the discussions about CVE--2019-12928 ( https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01153.html).
> But, for the scenario of PC users, which is no requirement of network access to QMP, there are some mitigating proposes.
> 1. Modify the compilation options to disable QMP.
> 2. Modify command line parsing function to discard the QMP parameters with network configurations.
> 3. PC manager or other manage software make sure only the trusted user can use QMP.
> 4. Other ideas?

QMP is a useful part of QEMU - so we don't want to do 1 - we need it to
let things control QEMU; including configuring complex setups.

The important part is (3) - anything that runs a qemu must make sure it
wires the QMP up securely; e.g. using unix sockets with appropriate
permissions or something like that.

As long as they do that, then we're fine.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


