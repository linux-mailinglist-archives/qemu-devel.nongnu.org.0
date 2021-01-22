Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD68E3001FA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:52:22 +0100 (CET)
Received: from localhost ([::1]:56112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2uzF-0007pn-Pp
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2uws-0006Tg-Jv
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:49:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2uwr-00021h-4l
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611316192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n/ASh79hRlFnr4V2eAm04Fx2/i0bmjPiAs+IQZzoMo8=;
 b=Cg5U1M80sPuwIDRWYnYu0wZ8kmOFuHXBEHQDqFcNOlJb8mTDIaP+976bDej9yF3FAGazHs
 9MNyU/HTKPynmlkQMeKSe7UvmQYA1YM2QAW9/twU0x1+hG6L/rm5hj5jAKW1bBsV4GQQzU
 wvu5IckUVR2ch/eqU5PAJDp4J30jtA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-DpzRAeflP8yweJHajBbXzA-1; Fri, 22 Jan 2021 06:49:48 -0500
X-MC-Unique: DpzRAeflP8yweJHajBbXzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D22A1800D42;
 Fri, 22 Jan 2021 11:49:47 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BAB5E5C22B;
 Fri, 22 Jan 2021 11:49:45 +0000 (UTC)
Date: Fri, 22 Jan 2021 12:49:44 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 07/11] iotests: add findtests.py
Message-ID: <20210122114944.GD15866@merkur.fritz.box>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-8-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210116134424.82867-8-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> +        if 'disabled' not in groups and 'disabled' not in exclude_groups:
> +            # Don't want to modify function argument, so create new list.
> +            exclude_groups = exclude_groups + ['disabled']

Oops, forgot the other comment I wanted to make:

This would only have been needed if you had turned exclude_groups into a
Sequence. Now that it's still a list, copying the list isn't strictly
necessary.

Kevin


