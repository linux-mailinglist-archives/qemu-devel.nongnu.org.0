Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242BC36988C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:39:00 +0200 (CEST)
Received: from localhost ([::1]:38508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzlb-0000bP-7A
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZzjL-0008Ao-5u
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:36:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZzjG-000501-2w
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619199387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mx8ZkZF0X3KqS7ReacjvKKTpMWzjcDlQKsm6wCSTv+M=;
 b=do+58rymKvHFbKyqIe5gxrBwRbLHz0MEZD4plSMC60Y2D4QbGq0x59EorwBMopEkitQD6e
 whpIbBaKdTRdehXBeFDyzf4fLhmKSAKMa8BF/EFs2P6TUu1OCPJG7U/HUwtNPlvL4DukQQ
 f6Z0tshZ2sVmSnY4EmaWNUf1tX7jcgo=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-vJ_Z7KM-Preg3P4hA58LDg-1; Fri, 23 Apr 2021 13:36:26 -0400
X-MC-Unique: vJ_Z7KM-Preg3P4hA58LDg-1
Received: by mail-vs1-f72.google.com with SMTP id
 z3-20020a67d2830000b029021f3739c660so6955573vsi.10
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 10:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mx8ZkZF0X3KqS7ReacjvKKTpMWzjcDlQKsm6wCSTv+M=;
 b=tdzfBSsqoFgqtjE2g01IZ1iuee95+uJkE5vCI+0Umv1d4oeo68GqSiYtdxzMWAEKMP
 W2LpOttThnDDBZ116Wh9z8dLto2ahsIORSjWWU0O6pOyf1rauUHwFAlfvtRW9RgUNB4u
 Tz8zOgZO7tcfOTBeF7WtoOrIUXfx1Tc5NkwJ01N1oGQuaGhtX6FCxjXPlca9pQOj8BhB
 dcyXwO03Ho9/S1ARJ6etw0Y74LuY6qKfHfj5hzypL0BkEFJ/pWAIDdHCjtEBqIOfFLdR
 UUiKRiF4RnUtBrsmQXpVUovoRBG313LxOuizo+xwPQXfCNnTVX1KI8KMNZ4geDfRquEW
 kdbw==
X-Gm-Message-State: AOAM531MGhLKNBB1dVdo4W1Vyanaq5oRnQSjtGceAtSNvdDbpe0XrMZu
 EQRxrLn084Wh5X7HzrApihmpcOyYE165MDsjK+N0ze4aJEe7APAjLCZOCQUl53if42L9I3Ran1s
 eghGOXEBrHVuwbRiK2PWfSS5QXg421Xg=
X-Received: by 2002:a67:1744:: with SMTP id 65mr4828022vsx.50.1619199385455;
 Fri, 23 Apr 2021 10:36:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcHix+RtNqU4EieWUw51QHYh+JRvFBW9qxCCOrEgKD/WPmWbs0N3gGnCKm9MpUqDzJWRTH2Bm7HlXJwp64ar8=
X-Received: by 2002:a67:1744:: with SMTP id 65mr4828002vsx.50.1619199385269;
 Fri, 23 Apr 2021 10:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-3-alex.bennee@linaro.org>
In-Reply-To: <20210419145435.14083-3-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 23 Apr 2021 14:35:59 -0300
Message-ID: <CAKJDGDbXcmSzkPDz6KDfCv58Kdb2g00oOA0b2q+trsc4AkorqA@mail.gmail.com>
Subject: Re: [PATCH v1 02/25] tests/docker: fix copying of executable in
 "update"
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 11:54 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> We have the same symlink chasing problem when doing an "update"
> operation. Fix that.
>
> Based-on: 5e33f7fead ("tests/docker: better handle symlinked libs")
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/docker/docker.py | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


