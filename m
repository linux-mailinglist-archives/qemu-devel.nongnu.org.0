Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52C734181E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 10:20:47 +0100 (CET)
Received: from localhost ([::1]:40168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBJG-0006hk-Cx
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 05:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lNBI8-0006AX-S3
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lNBI4-00020o-0R
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616145570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0l9cL57bo8w2ypo2X5BgpbLUOB6Zh+zL5PXGAWwMMdU=;
 b=Uz88liNMqT8SYTavnGqlzyRfYQAX3jwLOErpLsDqhWOXt+TBBBB8DbA+UXKno3mZoLdlxr
 194DfPepryyjKSKm08wjCPEg3wrcaDe1SGiPGRIvAB+2/QsqpSSUJG8NJphBCXiCCn/yp+
 BCzmqbU7e8k86Y96WJ7XzP1fEUjIsgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-ferQD2slPNyXe8vWYeCA2Q-1; Fri, 19 Mar 2021 05:19:28 -0400
X-MC-Unique: ferQD2slPNyXe8vWYeCA2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C73B081620;
 Fri, 19 Mar 2021 09:19:26 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-35.ams2.redhat.com [10.36.114.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C96110013D7;
 Fri, 19 Mar 2021 09:19:25 +0000 (UTC)
Date: Fri, 19 Mar 2021 10:19:24 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v4 00/42] Block layer patches and object-add QAPIfication
Message-ID: <YFRsnGBUae6g/o0m@merkur.fritz.box>
References: <20210318094807.10472-1-kwolf@redhat.com>
 <CAFEAcA9R4LCogF4va2o1BefjZcFYUkwS2mQLM4JWnrCeFvx1UQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9R4LCogF4va2o1BefjZcFYUkwS2mQLM4JWnrCeFvx1UQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.03.2021 um 20:55 hat Peter Maydell geschrieben:
> On Thu, 18 Mar 2021 at 09:48, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > The following changes since commit 571d413b5da6bc6f1c2aaca8484717642255ddb0:
> >
> >   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20210316' into staging (2021-03-17 21:02:37 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://repo.or.cz/qemu/kevin.git tags/for-upstream
> >
> > for you to fetch changes up to ef11a2d8972147994492c36cd3d26677e831e4d7:
> >
> >   vl: allow passing JSON to -object (2021-03-18 10:45:01 +0100)
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
> 
> Auto-merging docs/system/removed-features.rst
> CONFLICT (content): Merge conflict in docs/system/removed-features.rst
> Auto-merging docs/system/deprecated.rst
> CONFLICT (content): Merge conflict in docs/system/deprecated.rst
> 
> I'm afraid your pullreq was racing with another one deprecating features :-(

I'm not sure that not resolving trivial merge conflicts on your side is
saving anyone's time. Well, v5 is coming.

Kevin


