Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCF632B65C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:55:03 +0100 (CET)
Received: from localhost ([::1]:35318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHODd-0006Q2-Vk
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHOC8-0005nr-0J
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:53:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHOC6-0002ea-Bg
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614765205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rzpPEKUK7s3TenfWk0CCQZjweNIC7+iYOSpjNmoGUrw=;
 b=XDNhHMh3wgcwtVK7YiVbSFwhbbYPGmfubowDYurohlB3OIQpSqw+SpNJWeWDjOExrP1/tC
 V600hErgo3/i64vFm+B05uNCb2e3RUrk9vG0sg2DiVShCCqtZFllAk+CN+SnOUb++aSzpx
 oL4cuzhvE56+ClAyghDK/IPIrzf0apI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-bz6HcWk6P1ac_gvqlBk1Hw-1; Wed, 03 Mar 2021 04:53:24 -0500
X-MC-Unique: bz6HcWk6P1ac_gvqlBk1Hw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E89A1020C25;
 Wed,  3 Mar 2021 09:53:23 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-195.ams2.redhat.com [10.36.113.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EDC960C13;
 Wed,  3 Mar 2021 09:53:21 +0000 (UTC)
Date: Wed, 3 Mar 2021 10:53:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH 0/2] Clarify error messages pertaining to 'node-name'
Message-ID: <20210303095320.GC5254@merkur.fritz.box>
References: <20210301233607.748412-1-ckuehl@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210301233607.748412-1-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: armbru@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.03.2021 um 00:36 hat Connor Kuehl geschrieben:
> Some error messages contain ambiguous representations of the 'node-name'
> parameter. This can be particularly confusing when exchanging QMP
> messages (C = client, S = server):
> 
> C: {"execute": "block_resize", "arguments": { "device": "my_file", "size": 26843545600 }}
> S: {"error": {"class": "GenericError", "desc": "Cannot find device=my_file nor node_name="}}
>                                                                                ^^^^^^^^^

Arguably, this error message isn't great anyway because of the empty
string node name. We didn't even look for a node name, so why mention it
in the error message?

But your patches are certainly a good improvement already. I would have
merged them, but git grep 'nor node_name=' shows that you missed to
update a few tests, so they fail after the series. I suppose you only
caught the ones that are run by default in 'make check' and missed the
ones that require running the qemu-iotests 'check' script manually.

> This error message suggests one could send a message with a key called
> 'node_name':
> 
> C: {"execute": "block_resize", "arguments": { "node_name": "my_file", "size": 26843545600 }}
>                                                ^^^^^^^^^
> 
> but using the underscore is actually incorrect, the parameter should be
> 'node-name':
> 
> S: {"error": {"class": "GenericError", "desc": "Parameter 'node_name' is unexpected"}}
> 
> This behavior was uncovered in bz1651437[1], but I ended up going down a
> rabbit hole looking for other areas where this miscommunication might
> occur and changing those accordingly as well.
> 
> [1] https://bugzilla.redhat.com/1651437

This is a good explanation for the change you're making. I think it
deserves being committed to the repository in the commit message for
patch 1.

Kevin


