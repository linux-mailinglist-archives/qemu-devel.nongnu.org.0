Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2B3341EF5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:06:51 +0100 (CET)
Received: from localhost ([::1]:49428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFm6-00033V-1s
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lNFkk-0002Xz-Ag
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lNFkb-0000aE-3k
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616162716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kMF3gnATf36ZS/laR81rseJDG/KozY0GsI6JBv9PV30=;
 b=ILnYHt3VtYOtfusVYZ62Zw38FUmgMoqOBd0mtjYEqaDVDsiDnUq7U3Tqw2jg+VpqCJQ/n6
 td1Rvp1FXsqiDK6+s21/+xGqXYrP0dMeIUFw7sMQYnLYRP2C9Z7E7cuJnalNOajYQuaG6e
 osdA8OoNHpN6zM07ElQEdzBX5nDDsSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-hecRdqkBMzanCrRpIyeCYw-1; Fri, 19 Mar 2021 10:05:12 -0400
X-MC-Unique: hecRdqkBMzanCrRpIyeCYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27A4C800D53;
 Fri, 19 Mar 2021 14:05:11 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-35.ams2.redhat.com [10.36.114.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 433FB5D9C6;
 Fri, 19 Mar 2021 14:05:09 +0000 (UTC)
Date: Fri, 19 Mar 2021 15:05:07 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v5 00/42] Block layer patches and object-add QAPIfication
Message-ID: <YFSvk41vwGuEG/Hn@merkur.fritz.box>
References: <20210319092036.9744-1-kwolf@redhat.com>
 <CAFEAcA-R2MuuaVhwyWxAhMyWNG5jPZTwqs6bKe97O+5Ertr2cg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-R2MuuaVhwyWxAhMyWNG5jPZTwqs6bKe97O+5Ertr2cg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Am 19.03.2021 um 14:34 hat Peter Maydell geschrieben:
> On Fri, 19 Mar 2021 at 09:20, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > The following changes since commit 8a40754bca14df63c6d2ffe473b68a270dc50679:
> >
> >   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-03-18 19:55:37 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://repo.or.cz/qemu/kevin.git tags/for-upstream
> >
> > for you to fetch changes up to 009ff89328b1da3ea8ba316bf2be2125bc9937c5:
> >
> >   vl: allow passing JSON to -object (2021-03-19 10:18:17 +0100)
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
> 
> Applied, thanks.

Hallelujah!

I was already worried about making the hard freeze even though I had
sent v1 well before soft freeze. :-)

Kevin


