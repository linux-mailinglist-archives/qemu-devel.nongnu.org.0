Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5EE300596
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:37:49 +0100 (CET)
Received: from localhost ([::1]:33682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xZM-0001cK-9Y
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2xWg-00007q-8u
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:35:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2xWe-0008Mh-Kf
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:35:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611326099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zh27d1+1vGNqT9p/vtvfgwI/OFHcL78ZE/JwdgILExU=;
 b=Z2R1foLlrTOZt+6Jd8P6AMmAgiQppY+clFMyrnFdRWeQAeslSDKmSqGqyAVv51KVokUwk3
 /NGY+WihUBzWjuUgz9PFWwJdlugUAyacTMYIQwQ9qS/43QRn5zuOyOpFF+kAFjd4KSAO1S
 ZINNj7XNMk5Xwvp9dkdwPhlM0gj06ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-jc6Zj_CPM12h_-iwPRflzA-1; Fri, 22 Jan 2021 09:34:57 -0500
X-MC-Unique: jc6Zj_CPM12h_-iwPRflzA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9160E107ACE3;
 Fri, 22 Jan 2021 14:34:56 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED8B260BF3;
 Fri, 22 Jan 2021 14:34:54 +0000 (UTC)
Date: Fri, 22 Jan 2021 15:34:53 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 08/11] iotests: add testenv.py
Message-ID: <20210122143453.GH15866@merkur.fritz.box>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-9-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210116134424.82867-9-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Add TestEnv class, which will handle test environment in a new python
> iotests running framework.
> 
> Difference with current ./check interface:
> - -v (verbose) option dropped, as it is unused
> 
> - -xdiff option is dropped, until somebody complains that it is needed
> - same for -n option
> - same for looking for binaries in $build_iotests directory.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> +        if self.imgfmt == 'luks':
> +            self.imgoptssyntax = 'true'
> +            self.imgkeysecret = '123456'
> +            if not self.imgopts:
> +                self.imgopts = 'iter-time=10'
> +            elif 'iter-time=' not in self.imgopts:
> +                self.imgopts += ',iter-time=10'
> +        else:
> +            self.imgoptssyntax = 'false'
> +            self.qemu_io_options += ' -f ' + self.imgfmt
> +
> +        if self.imgfmt == 'vmkd':

This should be 'vmdk', of course.

> +            if not self.imgopts:
> +                self.imgopts = 'zeroed_grain=on'
> +            elif 'zeroed_grain=' not in self.imgopts:
> +                self.imgopts += ',zeroed_grain=on'

Kevin


