Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E049A36D8FE
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:58:38 +0200 (CEST)
Received: from localhost ([::1]:39788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbki5-0003qh-Vo
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lbkfv-0001Zs-TT
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:56:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lbkfu-0007RL-4F
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619618181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Litgp0tE5vvQbVgO+itgVxmLbaGa9do1wsdBmjnGJGE=;
 b=cQ7jFYQT1HkipHd0dvHPseG7usJgD4g+XZyTuSudsLJiqq0FhuMf9vom8jdFdc5kG+4EvV
 +an+NoM0Ea/dLSvloz+Xhn6I1Vh48Y4Zx635Ivmn4m0FHey4BYyaLvJktDvpgFsY90pyWi
 KAmkD3j9WXtUvjN6Foe/8zyiektJ6Tg=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-q43A8SFAPgSiA08YbCAklw-1; Wed, 28 Apr 2021 09:56:17 -0400
X-MC-Unique: q43A8SFAPgSiA08YbCAklw-1
Received: by mail-ot1-f70.google.com with SMTP id
 u24-20020a0568301f18b02902a53900ec66so2427338otg.12
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 06:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Litgp0tE5vvQbVgO+itgVxmLbaGa9do1wsdBmjnGJGE=;
 b=ZFbl+XsOelqlbM4Om/dCTg8u53UPTZZRF0PH1+O/EjBI2ad7tVEDngPmUh+ivQYTHS
 JBpasOkqPx1cBI+sbiByqbNGJnwl5ODEJPyio89bHQ0gLk2tU9t1aOC5U+hccRZrtHMq
 ruWuBEwwhvTf6a/W9GHaD56qht0x1AIAELNwf5KSVo/BN9d+7OofgrV/220+QyBq23YQ
 TK55UauH983JdOLh6ZobBawZzgiLEjhwHFFHsLAXggOK1PoBl+E53C5hlntAtcnQLcmB
 znARhibx63PUBBm4r9OKe6IX1BOj/3p14DqgiX4hVJHBAxx0NZfdaeeODYNT9unJgmUE
 ywKQ==
X-Gm-Message-State: AOAM5339eEnLIL+CaAz7HLYEN1TeTJpaY3UmiotH2CZEPb4wYIyaJQ5A
 o5ijgPc0b8uFgthTtRYT+Ou98rwkjO6yZ4apSsUSiX5rnl+bv3Y67/QhloTONAwKuIKWY5C/GMJ
 VdH8vSBdcY2qOuf8=
X-Received: by 2002:a9d:12b5:: with SMTP id g50mr24577408otg.97.1619618176634; 
 Wed, 28 Apr 2021 06:56:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/pdX6IidYfiWOtnBaXMTh4d4yOP9z6qiKEI1VZriLxZwa6yOVM0Kznadzq9LcNi1wdtgTLA==
X-Received: by 2002:a9d:12b5:: with SMTP id g50mr24577397otg.97.1619618176448; 
 Wed, 28 Apr 2021 06:56:16 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id v26sm11991ott.4.2021.04.28.06.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 06:56:16 -0700 (PDT)
Subject: Re: [PATCH] tools/meson.build: Error on enabling virtiofsd and
 have_system is false
To: Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel@nongnu.org
References: <20210428133507.52066-1-ma.mandourr@gmail.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <e1059890-79ab-eae6-1db1-5c4033f7b584@redhat.com>
Date: Wed, 28 Apr 2021 08:56:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428133507.52066-1-ma.mandourr@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, dgilbert@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 8:35 AM, Mahmoud Mandour wrote:
> Previously, on configuring with --enable-virtiofsd and specifying
> a target list that does not contain a full-system emulation target,
> a spurious error message is emitted. This patch introduces a
> meaningful error message for such case.
> 
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  tools/meson.build | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 3e5a0abfa2..f6a4ced2f4 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -5,7 +5,9 @@ have_virtiofsd = (targetos == 'linux' and
>      'CONFIG_VHOST_USER' in config_host)
>  
>  if get_option('virtiofsd').enabled()
> -  if not have_virtiofsd
> +  if not have_system
> +    error('virtiofsd requires full-system emulation target(s)')

I am not entirely sure if this is true. The error message before this
patch is applied is:

	../tools/meson.build:12:6: ERROR: Problem encountered: virtiofsd
	requires libcap-ng-devel and seccomp-devel

From what I know about virtiofsd, I know it definitely depends on those
two things.

Is it possible that the error here is that the top-level meson.build is
not properly collecting the seccomp and libcap-ng dependencies if the
configure invocation doesn't require a system emulation target?

Thanks,

Connor

> +  elif not have_virtiofsd
>      if targetos != 'linux'
>        error('virtiofsd requires Linux')
>      elif not seccomp.found() or not libcap_ng.found()
> 


