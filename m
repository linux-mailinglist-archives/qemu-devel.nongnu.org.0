Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA09275D82
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 18:34:26 +0200 (CEST)
Received: from localhost ([::1]:49030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL7ir-0004WY-Ga
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 12:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kL7f9-0001Xr-4F
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 12:30:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kL7f7-0001ao-CK
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 12:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600878632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QX+aNyewbu4wZ89WNKt9TUL9uCE+APAvn/j61BZH9jw=;
 b=UDN1WmY5OUn1m+BvtA8tQrKRpMbS0Rc2kzU6BCAukdzU5ffSX0PaMAdhm0m4BFqKQtOcRl
 jx5nJUO0X4eIEvDych2fWx6QkDIuu1A4bJoQc0XRq3UKUxweWQTsJYtQKW0Cg66hIguJVb
 KylZ0OSlOfBgdyR2jYoRQMQMkziWnyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-bdVMlyCeMU2sVdI2Zqb_pw-1; Wed, 23 Sep 2020 12:30:30 -0400
X-MC-Unique: bdVMlyCeMU2sVdI2Zqb_pw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 758796408E;
 Wed, 23 Sep 2020 16:30:29 +0000 (UTC)
Received: from linux.fritz.box (ovpn-112-239.ams2.redhat.com [10.36.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D24160BEC;
 Wed, 23 Sep 2020 16:30:27 +0000 (UTC)
Date: Wed, 23 Sep 2020 18:30:26 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH] docs: Document the throttle block filter
Message-ID: <20200923163026.GH6912@linux.fritz.box>
References: <20200921173016.27935-1-berto@igalia.com>
 <20200923155522.GF6912@linux.fritz.box>
 <w51wo0ka3hb.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
In-Reply-To: <w51wo0ka3hb.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.09.2020 um 17:59 hat Alberto Garcia geschrieben:
> On Wed 23 Sep 2020 05:55:22 PM CEST, Kevin Wolf wrote:
> >> +A throttle-group can also be created with the -object command line
> >> +option but at the moment there is no way to pass a 'limits' parameter
> >> +that contains a ThrottleLimits structure. The solution is to set the
> >> +individual values directly, like in this example:
> >> +
> >> +   -object throttle-group,id=group0,x-iops-total=1000,x-bps-write=2097152
> >> +
> >> +Note however that this not stable API (hence the 'x-' prefixes) and
> >> +can change or disappear in the future.
> >
> > Should we use a stronger wording here, like "will disappear when
> > -object gains support for structured options and enables use of
> > 'limits'"?
> 
> Sounds good, I can send v2 if you want, or feel free to change the
> sentence yourself when applying the patch now.

Ok, I just did that and also gave the sentence a verb while at it. ;-)

Kevin


