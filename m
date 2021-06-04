Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0218739BC37
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:49:10 +0200 (CEST)
Received: from localhost ([::1]:41056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpC4L-0000Jb-2k
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lpC3W-00084q-00
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:48:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lpC3T-0004oi-Nb
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622821694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SLsetf3j9IgDOzqs3il+kd7NhL+23u2SMvzNuEGkySU=;
 b=GVe26JtQm2BljgZagfRGQvokmR0ZLkkSSoeBNzMJXTwk6c5+PdP+6s8PDSt9IZofH/HnFz
 QbPQfTQLJIF9P328XWY4Nx3y/JL6BXXoAUv3n9tvFMu9AILohbj0rjkPd58xdhINzoqnx8
 0hjooXUgmHtbNIQ9sGCkLGCfSNlkIMc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-g3_uB7o_OSamOsDT-KWhfw-1; Fri, 04 Jun 2021 11:48:13 -0400
X-MC-Unique: g3_uB7o_OSamOsDT-KWhfw-1
Received: by mail-ej1-f71.google.com with SMTP id
 z15-20020a1709063a0fb029040d43ca6e95so525654eje.12
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SLsetf3j9IgDOzqs3il+kd7NhL+23u2SMvzNuEGkySU=;
 b=dweATAEJNeYZYwaVchAObr0X1yKyDIgbugld9LgWS91Ne0QjJWuVWlNLuL93snTac9
 iCfP+Wg+FQteRXEAgcQ2XgC7ehOez+TnEK6E9X4Ig+kXqPxHOYtAOb+SA22rZDfjJ8Rj
 MBkG1LelugAWFThEL4/e2xiG8YaxoYYuNYkcXgY4yM66L6mkiAPExGFtbwoWE+anoiuA
 ZtQgJLXTlEXe4qb4TRw/rarGT5O90Kd4n1hi9upTZdamfF55m2W04fO63u7BeWiVKhu/
 B7PZbyXTaWrR/HtQvzhliv1/9ye8sS77tE3X919nMA07wQbN+1vip9dvJDkMzpVc3FA5
 zzIw==
X-Gm-Message-State: AOAM530HeVpKHZuVMGiffN/ep/2zWKYbH0Tzih5dWTtYdheuS2fze0tm
 ojPB9ReGi6IyfVNV1jygN153PKXSwPYojewCwYMytTjIXpmi2q0khOc59mP5yW+kndth9/tLhhw
 xObdDBK1Hn1svD3f8/C+5IU220cNvACM=
X-Received: by 2002:a17:906:b10e:: with SMTP id
 u14mr4694168ejy.546.1622821692197; 
 Fri, 04 Jun 2021 08:48:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxEsHsabPssIjpMOT/hdb0hWqBqLooTUWP1vX4lHigyStZfucZ0F5qx2qbeg8OqPiZZOqCDWPSFtNT/YmECng=
X-Received: by 2002:a17:906:b10e:: with SMTP id
 u14mr4694154ejy.546.1622821692025; 
 Fri, 04 Jun 2021 08:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210524164131.383778-1-pbonzini@redhat.com>
 <20210524164131.383778-8-pbonzini@redhat.com>
 <20210604153716.5doeeoiaxgh6ots7@redhat.com>
 <c5bdbfc5-706f-4c2e-fda1-05791dfc8103@redhat.com>
In-Reply-To: <c5bdbfc5-706f-4c2e-fda1-05791dfc8103@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Fri, 4 Jun 2021 17:48:00 +0200
Message-ID: <CAP+75-XB=273Q9sJuovsp_codFsS=zjccOzgCFoXuU+L7yRhRA@mail.gmail.com>
Subject: Re: [PULL 07/28] qtest: add a QOM object for qtest
To: Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 4, 2021 at 5:45 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 6/4/21 5:37 PM, Eric Blake wrote:
> > On Mon, May 24, 2021 at 06:41:10PM +0200, Paolo Bonzini wrote:
> >> The qtest server right now can only be created using the -qtest
> >> and -qtest-log options.  Allow an alternative way to create it
> >> using "-object qtest,chardev=3D...,log=3D...".
> >>
> >> This is part of the long term plan to make more (or all) of
> >> QEMU configurable through QMP and preconfig mode.
> >>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> ---
> >>  qapi/qom.json   |  17 +++++
> >>  softmmu/qtest.c | 185 +++++++++++++++++++++++++++++++++++++++++++++--=
-
> >>  softmmu/vl.c    |   5 +-
> >>  3 files changed, 196 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/qapi/qom.json b/qapi/qom.json
> >> index 4f48035831..f7ef30f940 100644
> >> --- a/qapi/qom.json
> >> +++ b/qapi/qom.json
> >> @@ -644,6 +644,21 @@
> >>  { 'struct': 'PrManagerHelperProperties',
> >>    'data': { 'path': 'str' } }
> >>
> >> +##
> >> +# @QtestProperties:
> >> +#
> >> +# Properties for qtest objects.
> >> +#
> >> +# @chardev: the chardev to be used to receive qtest commands on.
> >> +#
> >> +# @log: the path to a log file
> >> +#
> >> +# Since: 6.0
> >
> > Do we need a followup patch to correct this to 6.1?
>
> This hasn't been merged, so since Paolo will repost,
> maybe he can fix directly?

Sorry I was on an older branch... Indeed this is merged as
commit 6ba7ada3559 ("qtest: add a QOM object for qtest").


