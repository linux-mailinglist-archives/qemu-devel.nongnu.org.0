Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446ED38B4B8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 18:57:52 +0200 (CEST)
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljlza-0006sY-QI
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 12:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljlyH-00062r-Sg
 for qemu-devel@nongnu.org; Thu, 20 May 2021 12:56:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljlyE-00018k-CF
 for qemu-devel@nongnu.org; Thu, 20 May 2021 12:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621529782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=upbr1yOyr+Mzrx+5R6a4nYgM5rCSvgax2WW2ImSmiD8=;
 b=SSEFQYgLrWNcSmjkmJByos8vts9LiGXPdx2Pewz1xj2AQmHWUzA19gSNxSN67naVT4lmn+
 oWr8CJWPjTxAVMnAkfnUUoVjW5rhGU6MXmJNA3Ply0bheGFbT+UseHZ2S5FT04yac7Gk27
 5Ntnfepl5VS5vs1KeATe/MrK9341GqE=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-xbevkBeNNFuImRteInxxVQ-1; Thu, 20 May 2021 12:56:21 -0400
X-MC-Unique: xbevkBeNNFuImRteInxxVQ-1
Received: by mail-vs1-f71.google.com with SMTP id
 y13-20020a67d20d0000b02902354e7b1beaso4917048vsi.5
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 09:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=upbr1yOyr+Mzrx+5R6a4nYgM5rCSvgax2WW2ImSmiD8=;
 b=Wy+u83Xlkd+exOi49187w8/70Fj4gnkx28ih+/CKlfkcbzbVkDUQofN60X7wzQeoIb
 mKWQSuqrW/VFe+FmEHnH3vwGFzYcVaA5VqxN4HbklH7yMkkEa0pfr2DiOck09IF0QaOc
 ayCwYEiVJa9vjY34Ctll5pDi86tQXJd5wjXZJw8e3r0jk99wL7751cnkLCHq2Dq51Hov
 UBEQUUPN7qi0cavm3rnrfbc0t2soFiZ0aLGFKUvwbXTz1uBj7IQwkmY2Aic1FFfLTbAY
 C9WUg2g32/tGXywYsAPABjXSLahKxGPuC2PIU47+Byg2cgn9+s3vQmosXHfGbbI0gP7b
 NSbg==
X-Gm-Message-State: AOAM531SwIZ43W8/7VCQcTpBwvUdOaiRX8tS82xxbBPgEb/sZPvQV/ZC
 gH7ad4ODdrhCEwleitZHPswcQ9jWHp9tzR/N5E9YFs2FfoiEqK2GWxFj9W2ch6aNoKKBBvzyfdH
 jFR19Lbk5UgOPiboAM2r1Y3f6CElEH6M=
X-Received: by 2002:a1f:9d90:: with SMTP id g138mr5734369vke.2.1621529780538; 
 Thu, 20 May 2021 09:56:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjuio7bsCA3m5HEzhchmoW/GvZDogOFRFEWVXSo/JSQ+meg7k3cwNZbZUIsUj6wHqUVLUZqVuWeeJZqZUnHu4=
X-Received: by 2002:a1f:9d90:: with SMTP id g138mr5734357vke.2.1621529780354; 
 Thu, 20 May 2021 09:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210520153831.11873-1-alex.bennee@linaro.org>
In-Reply-To: <20210520153831.11873-1-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 20 May 2021 13:55:54 -0300
Message-ID: <CAKJDGDbfUNZYA5c1PfUqgzE6mNjNc9rDtG1crpkMN8RV5WKYjw@mail.gmail.com>
Subject: Re: [RFC PATCH v2] gitlab: add special rule for the hexagon container
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 20, 2021 at 12:38 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> The hexagon container is always manually built but of course not
> everyone will be building it themselves and pushing to their
> registries. We still need to create a "local" registry copy for the
> actual gitlab tests to run. We don't build it in this case, just pull
> it across from the upstream registry. We disable this rule from
> running on the qemu-project itself so it doesn't accidentally wipe out
> our master copy.
>
> Fixes: 910c40ee94 ("gitlab: add build-user-hexagon test")
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
>
> ---
> v2
>   - fix silly typo
> ---
>  .gitlab-ci.d/containers.yml | 27 +++++++++++++++++++++++++++
>  .gitlab-ci.yml              |  2 ++
>  2 files changed, 29 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


