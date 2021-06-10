Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C2E3A2CD1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:21:57 +0200 (CEST)
Received: from localhost ([::1]:50372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKdA-0001zm-Db
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lrKYG-000104-W7
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:16:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lrKYD-0001LY-Rc
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623331007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OfivHGgE85788EZIRMBUTPl2VV0X0BLgX4W7PYLnwHg=;
 b=TYAXZvBtlb/LjtDYA0eZap9bYXjxc2z/KBicgkqMc/PyVr+avglb9rTwPvtR5YB9DjVvG4
 8zK5rzATjU2o6VTt38TFXSFOGosWT/uNSDcbXaPjYqAeXPH8ZVAlPLKsCw0fqYTDr09pxl
 kcb6zh6B61vTVkwcbcW35jcRkaqK9Rk=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-G4gMX2cYMzK6A9cUOMA8QA-1; Thu, 10 Jun 2021 09:16:45 -0400
X-MC-Unique: G4gMX2cYMzK6A9cUOMA8QA-1
Received: by mail-ot1-f70.google.com with SMTP id
 i25-20020a9d4a990000b0290304f00e3e3aso18290559otf.15
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OfivHGgE85788EZIRMBUTPl2VV0X0BLgX4W7PYLnwHg=;
 b=H+89eWiueb2p8/lAMKOcoHpXItEEcybBnX4n+4+xzI3g5OAbyZ0pvxCRv5oMD8e7vd
 XMQI6sao1PQNAtZCEdu//g8AA30Gxw+TKrdF1CYOjBt6mJwtZCbYGu8PBYRxMGEoTiqT
 fjS4D59MYVbh3rlJcGOqkCyHT22bJDa6IKbRNWgs6dBpyk1ORWtGZijPrRNmIOy5jGpu
 dJLBL0V3QHFYEI8qCF5sBzoGaDjh+PdPn6ggjtvcx4dxvTJ82zE8JoHH8e91QGMlP0GF
 E+hhxLMpNyqoqGhNXVX16qg+pjCCxPXNk/6TDEViKjhLWe2dOk7XdsMzV7T2YvrBsSU2
 PU0g==
X-Gm-Message-State: AOAM5324WPMRqnykjHJZ1An3TaRAjIfPsVTHNpiteMdnTWA7OZ+Rie0z
 wHaxpiaUyXTq0C07s2/geBGMtr9uNSg1SKpOIwLWI1Kx59/T4RAZgfypaXnHsDUPgWI/MSr4QHE
 l96FS8jyNEQpDlPyr1EkhYWEJDO+uJe0=
X-Received: by 2002:a9d:6081:: with SMTP id m1mr2454607otj.226.1623331004816; 
 Thu, 10 Jun 2021 06:16:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQm3iCKt/aPrB0XaEWNuKfuX6wne3yM8Hg55bhhutUOUPwEm+ui/OfzinnCCJQ3rxOMhyzI3wyI9qfd0OQnL0=
X-Received: by 2002:a9d:6081:: with SMTP id m1mr2454595otj.226.1623331004580; 
 Thu, 10 Jun 2021 06:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210609180118.1003774-1-eblake@redhat.com>
 <20210609180118.1003774-3-eblake@redhat.com>
 <CAMRbyyuyK5r11bxDD4Gyy8ru-RBPB_WufmSFktnXQ+G-Hxg3nw@mail.gmail.com>
In-Reply-To: <CAMRbyyuyK5r11bxDD4Gyy8ru-RBPB_WufmSFktnXQ+G-Hxg3nw@mail.gmail.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Thu, 10 Jun 2021 16:16:27 +0300
Message-ID: <CAMRbyys9kwJyg3AiowZwFg8uK1pHVPcKOJNckX0h0KUmNQZaMg@mail.gmail.com>
Subject: Re: [PATCH 2/2] nbd: Add new qemu:joint-allocation metadata context
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 2:52 AM Nir Soffer <nsoffer@redhat.com> wrote:
>
> On Wed, Jun 9, 2021 at 9:01 PM Eric Blake <eblake@redhat.com> wrote:

I posted a work in progress patch implementing support for
qemu:joint-allocaition
in oVirt:
https://gerrit.ovirt.org/c/ovirt-imageio/+/115197

The most important part is the nbd client:
https://gerrit.ovirt.org/c/ovirt-imageio/+/115197/1/daemon/ovirt_imageio/_internal/nbd.py

With this our tests pass with qemu-nbd build with Eric patch:
https://gerrit.ovirt.org/c/ovirt-imageio/+/115197/1/daemon/test/client_test.py

We may need to use qemu:joint-allocation only for qcow2 images, and
base:allocation
for raw images, because allocation depth reporting is not correct for
raw images. Since
we control the qemu-nbd in both cases this should not be an issue. But
it would be
better if allocation depth would work for any kind of image, and we always use
qemu:joint-allocation.

Nir


