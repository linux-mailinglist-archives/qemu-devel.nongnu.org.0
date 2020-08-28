Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B41B2553F8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 07:14:18 +0200 (CEST)
Received: from localhost ([::1]:58204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBWiP-0000Z2-6y
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 01:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kBWhm-00007P-0J
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 01:13:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kBWhj-0000o1-Qh
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 01:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598591614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kCSA7cooby10BdoZhoj8/HJRjz4Gto6ALAWNus2lpd4=;
 b=DbVUOFilmlnn/874HgONFQh+rCC1kSjyM1GX3ZXL672VbpZv39Cx9N2RR3n5Qr6j8P1GaZ
 8O3x1Xdco2D/DvhymTm+TMB+YC+kTceuTI/lqHTmEmTwvWGewVImKBzyT2ldUzDe7DxURP
 2voHv+gT7kl7yuj2Dxm6JH5ndaaLmkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536--nzf2s7qMrGv9U02UyDOog-1; Fri, 28 Aug 2020 01:13:27 -0400
X-MC-Unique: -nzf2s7qMrGv9U02UyDOog-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C42221005E6A;
 Fri, 28 Aug 2020 05:13:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39E4919D61;
 Fri, 28 Aug 2020 05:13:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 535B89D5A; Fri, 28 Aug 2020 07:13:19 +0200 (CEST)
Date: Fri, 28 Aug 2020 07:13:19 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/3] Fixes 20200825 patches
Message-ID: <20200828051319.n5f2vq7idrcgefia@sirius.home.kraxel.org>
References: <20200825062008.6502-1-kraxel@redhat.com>
 <128e42b3-3b0f-744b-91be-f4c52837c3a2@redhat.com>
 <CAFEAcA8m13LKgeiBJGy=XKLzP8zOqqxeEG8R0w=0jG-GprBEVA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8m13LKgeiBJGy=XKLzP8zOqqxeEG8R0w=0jG-GprBEVA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 00:15:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 27, 2020 at 11:23:58AM +0100, Peter Maydell wrote:
> On Thu, 27 Aug 2020 at 08:20, Thomas Huth <thuth@redhat.com> wrote:
> > Peter, what is still missing that you could use the gitlab CI as gating
> > tests, too?
> 
> I think we're waiting on a respin of the scripts from
> Cleber, aren't we?
> 
> Also we need figure out how to handle the conflict between
> "gitlab's git repo is mirrored (by perodic push?) from
> git.qemu.org" and "test by pushing to the gitlab staging
> branch", because the former overwrites the changes that
> the latter makes.

Pushing to a qemu fork runs CI too, so the staging branch doesn't have
to live in the official qemu-project repo.

take care,
  Gerd


