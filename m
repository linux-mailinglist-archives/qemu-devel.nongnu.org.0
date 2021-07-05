Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C483BBE7A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 16:52:50 +0200 (CEST)
Received: from localhost ([::1]:52054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Pxp-0001lQ-G3
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 10:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0Pvf-0007z3-AA
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:50:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0Pvd-0001Ty-Oh
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625496633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M/9aJSQhjxb2aMzOXLWMskVFLQ8BF5yN6qQHTpd0WTw=;
 b=K3mjPSREkBSr5ybnD6BBUhdpAIce3K6aU+heplKQi/WfQSfP4YilKNz93db/3sCSB/edED
 hjp++ooQZ/sK/lTlVQQVcj6POpp4rUZkaV7gLV6VlHzOZS4zRbH5NmM8SbVp1zqpBTnq+W
 Y4loDFq3ljH4q/urpDmvl6F0VoiLTJE=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-QmAlLjtvOsaar8F88tk-RA-1; Mon, 05 Jul 2021 10:50:32 -0400
X-MC-Unique: QmAlLjtvOsaar8F88tk-RA-1
Received: by mail-vs1-f71.google.com with SMTP id
 z4-20020a0561020204b0290288b88a5749so1464966vsp.11
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 07:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M/9aJSQhjxb2aMzOXLWMskVFLQ8BF5yN6qQHTpd0WTw=;
 b=DAUT3xOSJacIzpYFat++tnlfgY9YuslRewzC39AodGzUYfP9UnyKb2dPrvcDzrdXC1
 tBOiQx5C/vYgo1cLu7lRoBm62VuR1pJTlZsFyHJ2hMuIpfVcmrVn78RkNojV/9ntm0cK
 UlB+z5hkpZEBWWFgS7k3SbVDDKQHwOK38QgPO/vXbHELhRImuPiJF1dGLdEWp6dZX5IU
 FuFJTJuZYt2yCAD03iKPQ2iWWEeM9Ii4Bv+gU2VeojhL856HAM3bpfXZapJCt3L0XVe8
 u4IuoDwt/ZWKBWL4NxtPUujp9CgGq9Vz3Xixv/mY1TwpRNyJD0Vlwd1Bcx8RjAjvFsS7
 4O7g==
X-Gm-Message-State: AOAM531HFSNQGp0lcaAqcuPn1Eua36FxhKHJBAQYLI+rJdC6vz1pNtEN
 +pRf0DsOelhuj8n4WfbN0KJz1diWTiaBDajM8jEVH1kykIJ6nR5gf+5262T3SxzszcLF4peqV8G
 03qzGfXT9xfDvIxHVrODo6tgxQFuQgwo=
X-Received: by 2002:ab0:744c:: with SMTP id p12mr10507865uaq.113.1625496631861; 
 Mon, 05 Jul 2021 07:50:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCPp5RgEJ7ROF/0TT/Djm3jwYwUr55236zRy+lhs9xS1LiRYclIqu6XpCElmNxxJ0ZHUO2YGvCCgtWhO3GLIg=
X-Received: by 2002:ab0:744c:: with SMTP id p12mr10507852uaq.113.1625496631711; 
 Mon, 05 Jul 2021 07:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210623085249.1151901-1-kraxel@redhat.com>
 <20210623085249.1151901-3-kraxel@redhat.com>
In-Reply-To: <20210623085249.1151901-3-kraxel@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 11:50:06 -0300
Message-ID: <CAKJDGDZCDt1i2DENdYi54gd1e6OEwwE=8SsCadG+xCG0E6j_9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ci: add libusb for windows builds
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 5:53 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Add CI coverage for usb passthrough on windows.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  tests/docker/dockerfiles/fedora-win32-cross.docker | 1 +
>  tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
>  2 files changed, 2 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


