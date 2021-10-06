Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71D94246A0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 21:21:03 +0200 (CEST)
Received: from localhost ([::1]:51440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYCTK-0004p3-MK
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 15:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYCQz-0003r4-FB
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 15:18:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYCQw-0001xH-8F
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 15:18:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633547908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xi0RNr/P4XDkRvyPTX9vJdps9bF90XyVC4G3DWbLhxw=;
 b=UsGCLX17lITNdyEbYGbucZSB0j2fS3ezU+6mMQv1Vy0AXcdIW7Q2Co77lb6T3ixFRY3tDd
 sBi6qtRoKwUr1WEacev9GizjaYpCrLJJfnAVyk6uLw7PG8eILCDPIv+hlr0+W8n+rHR3+W
 CCVKwYHKn40xx2hVl4Fr67zGulwPEcI=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-vu4VPt5SPkKUtliGHgc-Cw-1; Wed, 06 Oct 2021 15:18:27 -0400
X-MC-Unique: vu4VPt5SPkKUtliGHgc-Cw-1
Received: by mail-pf1-f200.google.com with SMTP id
 142-20020a621694000000b0044c801e5befso1873011pfw.11
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 12:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xi0RNr/P4XDkRvyPTX9vJdps9bF90XyVC4G3DWbLhxw=;
 b=Mx1L+WSyX9zxiBXwve8RCWZR91T5qIM5eJVsOBBLZfyuDn2RHnx86mOeagit0Ah2pL
 hOApxi+MysIVFB8IyHY2zkYJoQmaZVVsL7fZkjBTN83VvsU26jsrJCKUEEwLafOdwZbw
 iV1So4eTmwkF69060xzVJxzhhw3xUOt+ztJ9VQHpeDs1yRK/nffEI5s1WXRPpQybjZk8
 BZ7TK9Q3Yo9bFH8gSe73rdxJOyHeCMFYyQ7nb+TP54cMLHOoK90aanZtfv9llLrkGEXl
 IvmlOCxN9YK+XrpGLaLLNnpJGgwy3wLHLBcducvUBnMhtyhDIMMyaQrm0XZxvZWc/8Xx
 me8A==
X-Gm-Message-State: AOAM531Cguvzv52/NoChToGmIQkr+bvfpOn3LoO3jELnL57F2QEtXR4t
 F8bZcIQbX8KuIvR22WXtRxMnYYY4+rawFvLOQ8lq6oTF9U/GIbvfnSTPm2qhhnzSAUmGzhKdahd
 P77Jn1bnprpPw8mgd7g3xPjQ032RDmzg=
X-Received: by 2002:a63:9d4c:: with SMTP id i73mr388138pgd.216.1633547906015; 
 Wed, 06 Oct 2021 12:18:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb9i2MzvW3x+4q6XTXVak2h3rL/gviSjmE5osKqAVV7vBQJc8iqxpXHyYe3HuPPhumx/DgSV4Fv/A+VX/9f4Y=
X-Received: by 2002:a63:9d4c:: with SMTP id i73mr388107pgd.216.1633547905790; 
 Wed, 06 Oct 2021 12:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-17-crosa@redhat.com>
In-Reply-To: <20210924185506.2542588-17-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 6 Oct 2021 16:17:59 -0300
Message-ID: <CAKJDGDZ0wXko+34sQujsd7iLKNRtm3BhZ=DFpD6nXtvZVF2uRg@mail.gmail.com>
Subject: Re: [PATCH 16/16] tests/acceptance/ppc_prep_40p.py: unify tags
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 4:01 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> The arch and machine tags apply to all tests, so let's define them
> only once.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/ppc_prep_40p.py | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


