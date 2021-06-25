Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4653B49B8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 22:23:38 +0200 (CEST)
Received: from localhost ([::1]:42654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwsMS-00013s-NT
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 16:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwsLP-0000Jk-Ez
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 16:22:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwsLM-0006PW-Gn
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 16:22:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624652547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uaMoxBqxhceGieTlXxJBuPObChe1r6LFaxnZ2t/L1jA=;
 b=gBw5adLmSSqx4l+HqzCbTXOvfG508cEeLSaQvjHj+4UIaWTu7ICM25PJQfsSb3f4CChmsl
 UyxmtqQ/IHRv5bmx2hO4TsLk1tffoRaGOmgPC0fUEzqgEsMuylekcFOpLRIvuMbfSvnX8m
 aXQ66lJBmdzQt7C7PSUAFh8L9K+Sq08=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-uMh0z-UCONSBN3enFTa5Fg-1; Fri, 25 Jun 2021 16:22:23 -0400
X-MC-Unique: uMh0z-UCONSBN3enFTa5Fg-1
Received: by mail-vk1-f197.google.com with SMTP id
 s1-20020a1ff4010000b029024e2e9504e3so3450785vkh.16
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 13:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uaMoxBqxhceGieTlXxJBuPObChe1r6LFaxnZ2t/L1jA=;
 b=J1QbQ+xwCzQz+fOGMLSO8SHwdlVwH1DM5nTuKrzt0Kc5/Gf5w6yQcjiZEGavzSSsPj
 TwG2XlTsqUjTfhwQBZZ6SpV/0xG4JSyS0PpufgnlK+nW2XX51KjgVsCl72M1CFPiXOos
 nWPbb7cIWuPhY/Eh6HCF3uaCSP0I3PaB1bTLfnTvC4xg49MViT4e/pyRY9AyHAj+qX+j
 sN6kW3L7v3b/ioUIUJXQeY4aZZMORRWnpYf22MaZZp0TVda8zQqhMzj85p03t9EKyzwU
 vGdPtdkyk8LboelWSaE53yuy2PoeytU/XnAoJbppzH6zSwk1MAy9SJdMm+UesJPacwNB
 nfDQ==
X-Gm-Message-State: AOAM5328V4Dti2lRBG1dnPms/aExHYDJhuruA/FDAVlzV5rqdW7QLMdY
 XFmMHUX6MVNfVEWcF7CG6IHAdqpjLGH1ThOya+EOf9Lc5vc79H6cPDj4pRB2afrIyxByAVVFukY
 sVcjSb4qKlGnetoGcurVf4o2oMnN2rvM=
X-Received: by 2002:a67:fa0a:: with SMTP id i10mr11308228vsq.45.1624652543153; 
 Fri, 25 Jun 2021 13:22:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy9C2YJoXrgo2Biw8mQ3a22hUd79gs9cPfTf5Tbgy5raAQEb7OKtm2OJlTQQ2nARtgJF0BroftakZ6JGMKKwg=
X-Received: by 2002:a67:fa0a:: with SMTP id i10mr11308204vsq.45.1624652542940; 
 Fri, 25 Jun 2021 13:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-3-berrange@redhat.com>
In-Reply-To: <20210623142245.307776-3-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 17:21:57 -0300
Message-ID: <CAKJDGDZxrmdCXKS5am_W5pRMOnfvfzLCuHV3NUNk1j+g3Sme3Q@mail.gmail.com>
Subject: Re: [PATCH v4 02/22] tests/docker: don't use BUILDKIT in GitLab either
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 11:23 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> Using BUILDKIT breaks with certain container registries such as CentOS,
> with docker build reporting an error such as
>
>   failed to solve with frontend dockerfile.v0:
>   failed to build LLB: failed to load cache key:
>   unexpected status code
>   https://registry.centos.org/v2/centos/manifests/7:
>   403 Forbidden
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  tests/docker/docker.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


