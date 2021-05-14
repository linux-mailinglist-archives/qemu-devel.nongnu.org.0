Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28787380F08
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:33:39 +0200 (CEST)
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbgw-0005Aw-7I
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhb0A-000497-1N
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:49:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhb08-0007hA-EO
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46CPwCJW60YM8kbwSBB7h5+hclHjXpig72D4w842bCo=;
 b=XJzSg0vklorBJ5hWMTKxWtO6kUBo4LtqpFgUTHnNodPngSYHZP0VtzCg7kH+RauvY78Z6l
 DgLeZFKOFloTJKVw08ICKDS4X4xz34hz4aocZDZuU3iblxlf1qTW1Pn8oPwKsOTP7gFbUm
 O5TE8JPBUYhcV5j7r6kCWWY5s7XszY0=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-Y8bq96_CPy--j3s0EDTMuw-1; Fri, 14 May 2021 12:49:22 -0400
X-MC-Unique: Y8bq96_CPy--j3s0EDTMuw-1
Received: by mail-vk1-f197.google.com with SMTP id
 f77-20020a1f9c500000b02901ebb5d0b1cbso58562vke.23
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=46CPwCJW60YM8kbwSBB7h5+hclHjXpig72D4w842bCo=;
 b=trTaiDZFJELs6qPBOww58CtZe/NBnI9GTeHbLntS7GOsSIc/3WWw3KLypqt6WAiphO
 nFVEs3EHE5LIP7NBiWAX4yxNtoEUpFVl2VTAD1nZaZ7kbRq0JXmpjJ6BJIaK3/mlA9Fs
 sQohgjm9EeuZNqnlm9+L2rV8KndZ+6oxf5vCR7y3feLTXOlg4yEQTd7nsLBszujtFcqN
 N6VjjC8piyJ/7+kSdDfl2xsQE/Z0doeEeFwkCTJaDEHORwUBGe7E7kbhPkgLQbA8PJSi
 zsLXUTjbj8D3kcMtKJpkd0Lf3og/5Z/5lbrPxMTLVBN3oySpBV0mVbBzvI+9iN82bWDX
 IHbQ==
X-Gm-Message-State: AOAM5308zPKLpHL42G18JMzHu6uk15dDJunp8XlCmhihNE/vGEFRB4aG
 B64senYDT8s7G1yUEjYIDW49PDvn3Enq3j5SLixETVZYrVL21wk8KIIxnSeONt6o8x/IsC9knCu
 OywiRmSHNvc7XBO7kag4OA8zXv9Ra1TM=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr44969026uap.113.1621010961619; 
 Fri, 14 May 2021 09:49:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz69oep6kM7wljZXhhIeY5eqGwlFuVubRdDv0oiyCh4VoLMfcb74prlbzv3UeNh3Or+qHd/xwrMUoCOmQQ3lZU=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr44969014uap.113.1621010961472; 
 Fri, 14 May 2021 09:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-4-berrange@redhat.com>
In-Reply-To: <20210514120415.1368922-4-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 14 May 2021 13:48:55 -0300
Message-ID: <CAKJDGDYHQ7BPXY6Qi5bDoRZs=h1ZYypn946T6wa9t8EvK9jmyw@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] crypto: bump min nettle to 3.4,
 dropping RHEL-7 support
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 9:04 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target. This lets us increment the minimum required nettle version and
> drop a lot of backwards compatibility code for 2.x series of nettle.
>
> Per repology, current shipping versions are:
>
>              RHEL-8: 3.4.1
>       Debian Buster: 3.4.1
>  openSUSE Leap 15.2: 3.4.1
>    Ubuntu LTS 18.04: 3.4
>    Ubuntu LTS 20.04: 3.5.1
>             FreeBSD: 3.7.2
>           Fedora 33: 3.5.1
>           Fedora 34: 3.7.2
>             OpenBSD: 3.7.2
>      macOS HomeBrew: 3.7.2
>
> Ubuntu LTS 18.04 has the oldest version and so 3.4 is the new minimum.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.yml             | 10 ----------
>  configure                  |  4 +---
>  crypto/cipher-nettle.c.inc | 31 -------------------------------
>  crypto/hash-nettle.c       |  4 ----
>  crypto/hmac-nettle.c       |  4 ----
>  5 files changed, 1 insertion(+), 52 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


