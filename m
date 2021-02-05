Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06376310933
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:36:03 +0100 (CET)
Received: from localhost ([::1]:35374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yT3-0008CL-Qn
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l7yP2-0005oJ-1w
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:31:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l7yOx-0006yn-O5
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612521107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uij7T5+Ck3pzkavPN3D+XLkvmTBQs3qVSKcFtPslBkk=;
 b=WkH+hC4sD/XicOLg0Vdbsp0toIay5+arbjNuqHzAYQOnr0lIylL3dF2ZYM2G9kfGHdQLDh
 8IhkZglDtxOLtFy2wCCGic/IPuUiykGzXqXSCgxFrF8M6wJH6Df7W5pNs1CShgX2Qc+BuB
 5lYHqOnvnve/mLaoeVxW7Y978nYRCXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-NVLZc1SgMgWV1iIuQxJQfA-1; Fri, 05 Feb 2021 05:31:44 -0500
X-MC-Unique: NVLZc1SgMgWV1iIuQxJQfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B349E1008311;
 Fri,  5 Feb 2021 10:31:42 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71DAA722F3;
 Fri,  5 Feb 2021 10:31:39 +0000 (UTC)
Date: Fri, 5 Feb 2021 10:31:38 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 2/3] utils: Deprecate hex-with-suffix sizes
Message-ID: <20210205103138.GB30079@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-3-eblake@redhat.com>
 <7d2c705b-8bac-5229-00e1-0c3d2f1a6f07@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <7d2c705b-8bac-5229-00e1-0c3d2f1a6f07@virtuozzo.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, qemu-block@nongnu.org,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>, tao3.xu@intel.com,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 01:25:18PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 04.02.2021 22:07, Eric Blake wrote:
> >Supporting '0x20M' looks odd, particularly since we have an 'E' suffix
> 
> What about also deprecating 'E' suffix? (just my problem of reviewing previous patch)

Ha! What if people want to specify exabytes?!  That actually works at
the moment:

$ nbdkit memory 7E --run 'qemu-io -f raw -c "r -v 1E 512" "$uri"'

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/


