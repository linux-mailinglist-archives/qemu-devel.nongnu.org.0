Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD4F4F6230
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 16:52:40 +0200 (CEST)
Received: from localhost ([::1]:50596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc71T-0001R0-6K
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 10:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nc70I-0008St-Qg; Wed, 06 Apr 2022 10:51:27 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:33347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nc70H-0000Nz-5T; Wed, 06 Apr 2022 10:51:26 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso1898904otj.0; 
 Wed, 06 Apr 2022 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/GVje3wrK8/xLriHckpqUQ3tE/0O/0CQJ4t9CpU9KZU=;
 b=Z5laZQ8jvd9XDOpc5Y4KUrfgklholOopznCRZFOumBrltfYGM4aaJap2GRdWjo51+8
 V9iW0ZHBeaTY2DqYQB0KuIhMES3+kDuFD1KXJw8tXMSjWZRZgtJvyNBkdY0GmkQ8eKaw
 tbhBj68sjJ/dzHJ8c2zfV59gRAbAW5MUq+RcOzsHN6y+FJ1uAVZ5xljjrF5LpNfTKnbW
 6jcVQit5zEmkPLtsBmzAd890MyGD0ZuMy3Asio3p5i8FCXm9lDjKGU2dryR3Q62bCXOj
 LyPaY6R4K0fYpPbzm3Rq/C31LxzVfWmEONpWhmRzsl1U8eBW3YokASdlE+vdLsaZJjFS
 3U4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/GVje3wrK8/xLriHckpqUQ3tE/0O/0CQJ4t9CpU9KZU=;
 b=WpII/NeM9+xQt6J1hhG/sQl8oKvEXDquuQpBsS5j3ALl9gJO+hdwYebfQqjmqwyWov
 Gxahx+zeYrNzApfECcxcO/ozSUvmKPGXgzQ9S0OSeEuE2qFZ3qo+c6ZsJV7CzzAa5ZZT
 lQw8vlwkGCZ3IiOuOMgF9/sfv/nzazf7gXX01eCXxTU8UnlLeIsjSunc3YUVHAvkrH9z
 CPilLzTasjs0ib41yFSmtmWRKPLDOcjcuV6HBf1tfTJVwr44MasI9qm+FrnfZbWccyC9
 FKYxprsYT4RMmiRUl2q3vqQ24pAAw1qqNj6yxoKK1/sn9ZJvi4llK4lWn3KqQ8VsyBAv
 HP2A==
X-Gm-Message-State: AOAM533Ch9ESUELV3jP5FkSHPoRI2o+WXv490AJcvFOcUxhk0fU5iTgi
 bmsYsbGLRfn509khLE7cHNA=
X-Google-Smtp-Source: ABdhPJzDFBHYrLbqrL1OOboI0V4pqHivvmzcKk0QQDjiEtYqaorwizTZQzgCX+tP/D6UyqilVTND0w==
X-Received: by 2002:a05:6830:915:b0:5cd:b39e:1eb with SMTP id
 v21-20020a056830091500b005cdb39e01ebmr3070939ott.358.1649256683132; 
 Wed, 06 Apr 2022 07:51:23 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:7ee3:afd9:f010:3a9:fd23?
 ([2804:431:c7c7:7ee3:afd9:f010:3a9:fd23])
 by smtp.gmail.com with ESMTPSA id
 g8-20020acab608000000b002ecf38fb699sm6534306oif.38.2022.04.06.07.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:51:22 -0700 (PDT)
Message-ID: <d99eee3a-79a2-42e4-dec3-9de1c6e153e8@gmail.com>
Date: Wed, 6 Apr 2022 11:51:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH qemu] ppc/vof: Fix uninitialized string tracing
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
References: <20220406045013.3610172-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220406045013.3610172-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/6/22 01:50, Alexey Kardashevskiy wrote:
> There are error paths which do not initialize propname but the trace_exit
> label prints it anyway. This initializes the problem string.
> 
> Spotted by Coverity CID 1487241.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/vof.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> index 2b63a6287561..5ce3ca32c998 100644
> --- a/hw/ppc/vof.c
> +++ b/hw/ppc/vof.c
> @@ -294,7 +294,7 @@ static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
>                               uint32_t nodeph, uint32_t pname,
>                               uint32_t valaddr, uint32_t vallen)
>   {
> -    char propname[OF_PROPNAME_LEN_MAX + 1];
> +    char propname[OF_PROPNAME_LEN_MAX + 1] = "";
>       uint32_t ret = PROM_ERROR;
>       int offset, rc;
>       char trval[64] = "";

