Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B00734026A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:49:00 +0100 (CET)
Received: from localhost ([::1]:36882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpH1-00036X-44
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMpF7-0001ng-EI
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:47:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMpF4-000443-UW
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616060818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZjFIhbEfhC5A5uN4iYFTgrfWDRR8k0sV1yWfB1iDuys=;
 b=BdSVxxGwMiUdpKp5qKTQcUclj4YLPMPY5CEnXNFsUaBZHVNkswLW/9fMsBGMUs8XgudGVR
 AFUKo+erDHa4VB4WGymQxy7hPkeXX1K27ls2g+keRwX6S64RoAR9BBpwPr//cR4Q4dRauy
 BDQurepcWrE2T9/kuQ39rePb9rT0AuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-r2iaYd5KMi2G4PtGpB8sFA-1; Thu, 18 Mar 2021 05:46:54 -0400
X-MC-Unique: r2iaYd5KMi2G4PtGpB8sFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AF4180006E;
 Thu, 18 Mar 2021 09:46:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-127.ams2.redhat.com [10.36.114.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 843A71F427;
 Thu, 18 Mar 2021 09:46:52 +0000 (UTC)
Date: Thu, 18 Mar 2021 10:46:51 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v3 00/42] Block layer patches and object-add QAPIfication
Message-ID: <YFMhixwG8b53b3PD@merkur.fritz.box>
References: <20210316181216.414537-1-kwolf@redhat.com>
 <CAFEAcA87MpMh-nRViCJB4ow_myLJKpTFxFK0ZPch3anG43Fo9A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA87MpMh-nRViCJB4ow_myLJKpTFxFK0ZPch3anG43Fo9A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.03.2021 um 22:01 hat Peter Maydell geschrieben:
> On Tue, 16 Mar 2021 at 18:12, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3:
> >
> >   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-03-16 10:53:47 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://repo.or.cz/qemu/kevin.git tags/for-upstream
> >
> > for you to fetch changes up to f5dda4c2186975ed75ec07b58bc6031e4867bb45:
> >
> >   vl: allow passing JSON to -object (2021-03-16 18:52:10 +0100)
> >
> > ----------------------------------------------------------------
> > Block layer patches and object-add QAPIfication
> >
> > - QAPIfy object-add and --object
> > - stream: Fail gracefully if permission is denied
> > - storage-daemon: Fix crash on quit when job is still running
> > - curl: Fix use after free
> > - char: Deprecate backend aliases, fix QMP query-chardev-backends
> > - Fix image creation option defaults that exist in both the format and
> >   the protocol layer (e.g. 'cluster_size' in qcow2 and rbd; the qcow2
> >   default was incorrectly applied to the rbd layer)
> >
> > ----------------------------------------------------------------
> 
> CONFLICT (content): Merge conflict in docs/system/deprecated.rst
> 
> Please fix up and resend.

Aaarrgh... I mean, the conflict resolution is trivial (we obviously want
both addititons), but I guess that means that the new pull request will
be last in the queue *again*.

Kevin


