Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874DE3E7F2C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 19:38:06 +0200 (CEST)
Received: from localhost ([::1]:40186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDVhV-0002V9-IH
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 13:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mDVg0-0000Ss-NV
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mDVfx-0001XR-0j
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628616987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T8bIQqZunzbWUfoZpeJQaM6VEXPmLJeGbd2//5nZvFI=;
 b=ilbxjM9qDnIdWokpGE/Hx3XsK52pwW8Z79jrlJtOUqSaeMYhhREYXN+CTsEF90g1DgRf+/
 6lkXa5Kc8RygCUDq/8g4GEWwQR0uyDjaIFJ+8/wNbd1AQrkecHQal+P5BMjSEGi8ZDiBec
 DrEU17g3Fc0dUZBEKPKclrJ3Dfx4XBw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-2AhRz7FhPqySLsydOIreiA-1; Tue, 10 Aug 2021 13:36:26 -0400
X-MC-Unique: 2AhRz7FhPqySLsydOIreiA-1
Received: by mail-pj1-f70.google.com with SMTP id
 g12-20020a17090ace8cb029017797b2c0f8so895141pju.4
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 10:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T8bIQqZunzbWUfoZpeJQaM6VEXPmLJeGbd2//5nZvFI=;
 b=JFWI7VW2bOUH1Wnj8YQ7Davn9hUDwRV05S4Rz2HzpLoQN7gLfDnx0D8LetJ1+g5VO5
 Cg7YMC2hoIclrTq3xabqQr+7NgDioH7txe9qmQIRdeTJNxCFejCAOzY1xztMMbpiIAqI
 Yc+H1SzkQwxVLXmA8wih+G2igZMM1TmfWjOdYmc+NGlCkL22U4O7F4b+Vxb3uhXxFyay
 e93OFCMwpudcm0ixoRydd5Em8SbDQw+HoiVfUxtwbrE5cO4W3Fj6vOkRK+DlyMfVCWwg
 QR98dcMNur/UHq+wxF4IvwBHDvgLIssN01oEoUNgIJkt0iVSJ7B7ntyI4V2xBufXlEZF
 QGqA==
X-Gm-Message-State: AOAM530EoVjvhC/qDrIBIpSzFTECw80w4HJsXsQKz7KXvtkK4pl/+xu4
 nRlSeo/y0Kbjq899hDcNND/OlxY2fYyE5KIgTF5EsLeUF4YUoD4KKbwPxaMJC+R0dG24UYymopt
 Aak0HIjd8Z1ixv3/4whWE0HfXifSxufM=
X-Received: by 2002:a17:902:b098:b029:12c:8f60:514e with SMTP id
 p24-20020a170902b098b029012c8f60514emr15119378plr.46.1628616985104; 
 Tue, 10 Aug 2021 10:36:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzATG1siguG3J+5HN/5Y8VmnZLBJdTduVZr7Jr2cshPvuXOBjvkVS5mIt5i0r4vYaXkRU+E5GupGlnrg7qLKlg=
X-Received: by 2002:a17:902:b098:b029:12c:8f60:514e with SMTP id
 p24-20020a170902b098b029012c8f60514emr15119354plr.46.1628616984792; Tue, 10
 Aug 2021 10:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210810164416.3981147-1-berrange@redhat.com>
In-Reply-To: <20210810164416.3981147-1-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 10 Aug 2021 14:35:58 -0300
Message-ID: <CAKJDGDa+zSiXN-4W5oicbpfG+FHNZkaR34qmr9tRcY8NBMpohA@mail.gmail.com>
Subject: Re: [PATCH] build: remove redundant 'check-build' make target
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Aug 10, 2021 at 1:44 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> The 'check-build' make target was added as a way to build all the unit
> test binaries, since the standard 'all' target would not trigger this.
>
> Since the switch to meson, however, 'all' will now include the 'test'
> binaries. As a result, 'check-build' is a no-op:
>
>    $ make all check-build
>    ..snip lots of output...
>    make: Nothing to be done for 'check-build'.
>

Confirmed!

> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml           | 9 ---------
>  .gitlab-ci.d/crossbuild-template.yml | 6 +++---
>  tests/Makefile.include               | 3 ---
>  3 files changed, 3 insertions(+), 15 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


