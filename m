Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9F434D27A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 16:39:06 +0200 (CEST)
Received: from localhost ([::1]:33062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQt2n-0006Jw-3D
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 10:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lQt1f-0005qZ-7R
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 10:37:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lQt1b-0004Yg-2V
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 10:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617028668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sxDRXmyYgiHdsSWWni0/Pva9OuCu5hf24fDSd4wFKlg=;
 b=RRfm7KzfEon3E88OlgQyGcbemKK++8yYKBPVPRxFaN5ea13Atn8DMdrRZyd0CrDrqj0N2G
 Sifa9VVQxQe5k8jr3Quxjr93yI3r0NQv9CC1UEWJbGUJlwOEa3Sh1jwNfwZG5HQwMQBiMg
 hb02J4mgAgp1U7BURp0kP7OdCCS9J44=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-Exwu_gO-PO-VWx3zSvQwhg-1; Mon, 29 Mar 2021 10:37:46 -0400
X-MC-Unique: Exwu_gO-PO-VWx3zSvQwhg-1
Received: by mail-vk1-f200.google.com with SMTP id l2so4532917vkl.5
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 07:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sxDRXmyYgiHdsSWWni0/Pva9OuCu5hf24fDSd4wFKlg=;
 b=NJ6CIEhTfmRphXA7z/IUGKntpX/08XmndwWm6vz1vZMCg7sUMNKRJHzlG8svttnzg3
 1aT47tszHun5u4qEcVLVahwUyrYF3zrRFpVF1xVK3dYXuC4lQHKpO5B6b/QMVTnYr8+F
 KK5i7Lfd/ddtoaGSpuHMz+FnkUCUobx/VhOwX5r+4VYCXg3ktutriJqwbJoCDvzbEc4l
 VSyR+VPKWd6ZjHy89WaQCxV3P+5+plsgxXblg5GN3UVdRWc/F0PxM4ZVOuXEtdQIrAEX
 oZhCEvew1iSWQoDDK1qnm4wPAn0ZPNAtApqY6RMvFUkPZVv1bLthepRET/QBY+Z41cYs
 n/RQ==
X-Gm-Message-State: AOAM531C16kMobzBk+jFtqyqnPE2cM2xh2vukviCAa/efydKdhZZGm3L
 zRsfoPlfd16+5J9ptohcZj4ZTDmTRGYqOdtMdLgUPDO/3RYtOrmCLFVtnfsXK7diprCphQvw1BN
 bWhHt6q6V4Nl+fkqoOj8fg0RYwIQa364=
X-Received: by 2002:a1f:7889:: with SMTP id t131mr15010611vkc.2.1617028665812; 
 Mon, 29 Mar 2021 07:37:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrgJ+V69GXBdWS/guCiTaL4ughUHQWVzus/zPCsty2eZlOQAM/mbGwPJnTaoDycqg5IXcFL/BnFEXz3u54JyI=
X-Received: by 2002:a1f:7889:: with SMTP id t131mr15010600vkc.2.1617028665602; 
 Mon, 29 Mar 2021 07:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210329110303.15235-1-alex.bennee@linaro.org>
 <20210329110303.15235-3-alex.bennee@linaro.org>
In-Reply-To: <20210329110303.15235-3-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 29 Mar 2021 11:37:19 -0300
Message-ID: <CAKJDGDZT4BAOcFLGmeQqOMcQkk2ndu+i79OYRG7SJ6RxNN4PkA@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] tests/docker: don't set DOCKER_REGISTRY on
 non-x86_64
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 29, 2021 at 8:03 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Currently our gitlab registry is x86_64 only so attempting to pull an
> image from it on something else will end in tears.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/docker/Makefile.include | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


