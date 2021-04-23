Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB353699E6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 20:41:05 +0200 (CEST)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la0jg-0003EY-8u
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 14:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1la0hi-0001p8-Ks
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 14:39:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1la0hg-00019d-Vh
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 14:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619203140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UY0Q6tnC8lIxeFTPTTg+2vlfMF22DOdDI3s3ZDjSleU=;
 b=TKynYly7k5HmRmYDBMIiiBpoZRx9jcRoRn3DQmXrDW0se/JztL8KGiaJeqfMOh7+YNHVdG
 JmxIufiyZpxtHd5m/vu0tY7eNjbTvzeuAUbAu7lz4Ze3aAQ2aZhkJ35CuVd9y8OS/EgowD
 PKsa3oTgLkGLG7DnWpvWbz+AkQaTRIg=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-Y-vIDOdfPbOjzIC_PKvZnA-1; Fri, 23 Apr 2021 14:38:57 -0400
X-MC-Unique: Y-vIDOdfPbOjzIC_PKvZnA-1
Received: by mail-vk1-f199.google.com with SMTP id
 h6-20020a0561220b66b02901e488cc9b21so4739297vkf.10
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 11:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UY0Q6tnC8lIxeFTPTTg+2vlfMF22DOdDI3s3ZDjSleU=;
 b=HkmkVWyjYqHCDkpvLBxrQIxN6BlZPgV4MomLpR9NFY1FUyENo4u230KyLgoUb7qHfX
 5gzMNHr4uhFxqrpDD2VTofsELdOeaArW62r7xYZY9ZiW0nIujISWpTmZnqFpnbFQZuiZ
 Y+X3Tiks3xCeawyO7yYGb5rfceelj1qDCChismifX15i7FtvhJRZLN+tCHDEtxAeW215
 WhC6AFOkKw4hlt/6+hRug0Ak/0ejPE0GVlhFPL6OGHoqwlpYdIuR0jbNabeZrRz69rm6
 MPPyTAGczFopHLm03fYhseMcs/PqkYxCIqOisM1MdP/Zyl/4yIYz2NKFpqKiPdydruOG
 uqaA==
X-Gm-Message-State: AOAM531UHzfTzYQyWa4SGGzDypxUxb51O6Yqyly9oSK0ot749k8dG1ZA
 snWqqLdOkDPlrkHFqvJPF0JW7Zl6dzgmlv54w52YfjK6Kx9Zsai8wTdICWHrSWUD5cnH7xgMdPH
 evbeVY1q8nt6du2nwiNceTUyvaiTTe9w=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr232987uap.113.1619203137065;
 Fri, 23 Apr 2021 11:38:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJutAu5IdMP/oHKqABHAvRrzxz/RqVhK/pGPvR6KuE+k5jcXpp8gS4u2/ZEDOZW13UHoxNVoRW2pAO5RzIgjc=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr232982uap.113.1619203136929;
 Fri, 23 Apr 2021 11:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-9-alex.bennee@linaro.org>
In-Reply-To: <20210419145435.14083-9-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 23 Apr 2021 15:38:31 -0300
Message-ID: <CAKJDGDbAA5hE_nrCFdYPQORhz4p_xAa92zwT4phC15yMaH-P9g@mail.gmail.com>
Subject: Re: [PATCH v1 08/25] gitlab: add build-user-hexagon test
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
> We special case this as the container with the cross compiler for the
> tests takes so long to build it is manually uploaded into the
> registry.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Message-Id: <20210305092328.31792-7-alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


