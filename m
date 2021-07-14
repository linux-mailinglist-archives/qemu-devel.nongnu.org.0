Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3A03C9367
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 23:53:33 +0200 (CEST)
Received: from localhost ([::1]:49636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3mou-0005pj-IE
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 17:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3mni-00059s-DM
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 17:52:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3mng-0002aO-47
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 17:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626299534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OdNc2ErX4R84fkzxblmymtkO1R4aUhT4tBB2IofQv6M=;
 b=GTza+Ie3zoRlb2svj/cyhNKc25435OPM2XQn+N/IbI2B7KGiUkvz3I8BvGDs8BFsVsjtlp
 pWnGx6h7EYMPgXS//qNZNBfga/ucg2xZ0eNXgRRUSE4j65qod/1XuHoV0Sc5ZmnBhO2KjK
 hraMRt9oG2ZKSqQpj0J+YnaCWUV9rCQ=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-Lb8dLgCaOgGCE2bWYICZMQ-1; Wed, 14 Jul 2021 17:52:12 -0400
X-MC-Unique: Lb8dLgCaOgGCE2bWYICZMQ-1
Received: by mail-vk1-f200.google.com with SMTP id
 o196-20020a1f41cd0000b0290258f921ac0dso1044602vka.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 14:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OdNc2ErX4R84fkzxblmymtkO1R4aUhT4tBB2IofQv6M=;
 b=GFCqa/eGpIOnnoPlopWzBr0tYw2KrCLShJr0fIFxiRiMKsf1xbqiBUeRxR6Z/veYQN
 AM0XCo12wMP2aJLzGVbYMb3b/fVev6iwBzH3NRX0MBf7DyuWzqB2yoIOXLPIi8olGw9J
 5DRiOh1LCIINp8lSJ36A010IrjzcRWgwxMmShgqNFSWBNiY77L+BjINgNGzOtt4ecoZl
 5ZzBackpW4mzmI6mZjGZ91iXBuPt2vRQpSqXIf06sluh3v/NJfNSosFGioXDF0EDoDdT
 mXjXj7bnNaMLKHfq7SgJFQTf0sW01TmP1b3GqPdc1KU6Nr8nl8/FP0hNIxVIeLUC2n+Z
 ESkg==
X-Gm-Message-State: AOAM532M/TFbhi5C8N8WYy6ZMcGcq4fUydhgUD+ajp55LqGCCPPBPRpL
 7CDaoICXWiXsMdJxSeR0d2xtcrHOd1Ayj7LyVvoBJoQiPpwaoucGT/6P3DKkqrnaoHfPZIBHwGv
 MIfnpkTK/pnZmJNKskFyRLF/OOgcDdgg=
X-Received: by 2002:ab0:7116:: with SMTP id x22mr330886uan.133.1626299532530; 
 Wed, 14 Jul 2021 14:52:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXpLjfA1TcDZL9SeABS8S/pFVoLkvfmYl1EqBxpf39V2KZkZJkKdZoK9qt7YGUqo1bDK14r2GyB6yjzOizP+Q=
X-Received: by 2002:ab0:7116:: with SMTP id x22mr330874uan.133.1626299532390; 
 Wed, 14 Jul 2021 14:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210714174051.28164-1-crosa@redhat.com>
 <20210714174051.28164-2-crosa@redhat.com>
In-Reply-To: <20210714174051.28164-2-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 14 Jul 2021 18:51:46 -0300
Message-ID: <CAKJDGDbUsDzq7+SnGFtt4JFOBBJ+jaJj7O1zz3V1=2JYK4aCSQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] tests/acceptance/virtio-gpu.py: use
 require_accelerator()
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 2:41 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Since efe30d501 there's a shorthand for requiring specific
> accelerators, and canceling the test if it's not available.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtio-gpu.py | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


