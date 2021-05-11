Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B630837B023
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:37:15 +0200 (CEST)
Received: from localhost ([::1]:49418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZ7y-0001k5-Oo
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZ6e-0000Ix-2e
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:35:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZ6c-0001DT-Fj
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620765349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16r6Wk2KhudekOmTihJ3ESnInubC/2cP17nKef3Cgt4=;
 b=RUR4XrymLEFATSgljeOtbfy9hHk8jr9S8tGr3qm+bWaSv7/iEwKSbB7/lu48aMvcLnRg1c
 SSXD2WSNw4gPiL6bfcrFPjHEIFqLz9OIfIT+e91eGblCYEkTnvFk4nm9UKjFqg8OLykxmb
 36SQAtY6OMJGmyq7aF9F0fRm6UJkUlU=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-cOBQqBslNH2S1mPbYZrEsQ-1; Tue, 11 May 2021 16:35:48 -0400
X-MC-Unique: cOBQqBslNH2S1mPbYZrEsQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 u3-20020ab069c30000b02901ebe1c8da33so2632738uaq.7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=16r6Wk2KhudekOmTihJ3ESnInubC/2cP17nKef3Cgt4=;
 b=Er8gHYuw6VNCxJfUc7d1xi19byK+LpLbfV+tvzFROSv80Cg+eK2KZijk3jIdOweXb2
 M51L7BiYPV8u4tCEh+RB84ExLIeYfKEFwmgM1F0xVXlZFupWcBZwQOasAhi1bgMD+L4h
 U4MnqzC02pi5R+VaAfrwX9G9fs2pujqAPJOfs9YsrQtJhkAyEkDjDFy1q1dK6uQkY4Hw
 y0QjyHKL6tnJq04YIsnch6YhbRraBNRU6WDdOOYyIWDLg0YRJjNmTrhR1VSnOVC2WDCf
 zoD6SUVW4M4mIzOePmEMFTtrp6c25imZ0DYRqn1D4BXAnXkIp+ApU33hGWba1ycMkMLF
 YB3A==
X-Gm-Message-State: AOAM531lTkxXkBCYpeHWMcRfup3yWiZ9Eb46KtFRATpjm32vG/OGC463
 FNTw33PJqlqNH4Ft0vHumVe3/ktrpFc2Qh3Wc5CpaWxlWtOI1rKgnRPicF9rQXFOlrTb2NICR50
 8aEjDYF9zxQeUaBU1WeUN0nZ5ON4f/gQ=
X-Received: by 2002:ab0:1648:: with SMTP id l8mr27724123uae.124.1620765347607; 
 Tue, 11 May 2021 13:35:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOxMZ86BvXvzKQEx+DAnCXsKA0R1viHs55P1uuBqaWn0AFmtI0/QZKNFXOuwrrRuRY4Jb7AjVMNElw70jaNow=
X-Received: by 2002:ab0:1648:: with SMTP id l8mr27724107uae.124.1620765347420; 
 Tue, 11 May 2021 13:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210511072952.2813358-1-f4bug@amsat.org>
 <20210511072952.2813358-9-f4bug@amsat.org>
In-Reply-To: <20210511072952.2813358-9-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 17:35:21 -0300
Message-ID: <CAKJDGDYZ4j3_L2ELPo4WYb_dWDw_uFxupCM+Mv6-qcfNU4jx2w@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] gitlab-ci: Extract all default build/test jobs
 to buildtest.yml
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 4:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Extract the build/test jobs run by default on the mainstream
> CI into a new file (buildtest.yml).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest.yml | 726 +++++++++++++++++++++++++++++++++++++
>  .gitlab-ci.yml             | 726 +------------------------------------
>  2 files changed, 727 insertions(+), 725 deletions(-)
>  create mode 100644 .gitlab-ci.d/buildtest.yml
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


