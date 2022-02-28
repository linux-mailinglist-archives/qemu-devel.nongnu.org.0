Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF9D4C6D46
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 13:58:24 +0100 (CET)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOfbb-0007Qx-CP
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 07:58:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOfW6-0002lH-UI
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:52:43 -0500
Received: from [2a00:1450:4864:20::42b] (port=38828
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOfW5-0003yO-FV
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:52:42 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v21so15276064wrv.5
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 04:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=D6xdlTCpD5VyLoFhqkhMfc+nFD9xEraWPzZiUNkTk1Q=;
 b=f6YzgOYzEVcZJnBoObnXHY1NFHc1SzWf6nOBoqL078UQifTaBjcvdx+tKtYG+wVKBu
 EjrCLNTE+CbtNxtnNK2H18BUhKyvsYGobOuRs4Gl4htyVujesZww9zFLsEuIxxRUyR2Y
 4x71ftkKwIEayyGUtjMRtgCnZpSvIVQlzI0swM6oNtcmhroVbggCfGCKqz3AayjRbpyL
 mfKdHCk3CocnvHGH5DSbQisrDwGynqAAzxRh9gTN4+RZv6xo75kPoTB+v6iswq4OIvoL
 OGH6SlMpTn2vblhTNLOna3rAGqBG6HhWIALu/TeL2j07QLVWfZyaO/5qCA40Zga4iQgQ
 nHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D6xdlTCpD5VyLoFhqkhMfc+nFD9xEraWPzZiUNkTk1Q=;
 b=UvKrGy3JoPDeF1VrRwFA3zKfij5/kqPgN3cUfNQC+IsdPAkmOK2pEf7OKN32iFadGj
 qFFEpqEHrssG7tC0AUEsde9wtsYlcgkqhn7jMM/N8PACdspf6moraGIh99+P6zWGSNxW
 iqRKRVNo3SkV18OCg0hnkCeMY5BM5Yx/rm4QFqNWvDx2UsFQrL/WsSG5aX/mg8MIYLVm
 avajWzEicALGkL2kOibDw/G+iqvfAPTG+0J62pXTCSPxcjEiJUomZYq2Fl13zgzUwvKj
 URng3PQJvUls3lyK92uuYCLPvLnK734sJn1CdCw+Ax+odBOKKcnBEZs6Ra0YnP7vBJZI
 flJg==
X-Gm-Message-State: AOAM533Agg3rsC3qykvZbL5ohFV5Kb4agmJXQ8eg9LclRN908RnrkkIZ
 YkztYKYygySLJb6EAkrwQLc=
X-Google-Smtp-Source: ABdhPJyjPKcjM+kIvGWH27OJd21NosEzkfOLCtX8mw4WjzWB1jjINIpEd/AYzkHFGQP8mmkGjm41gg==
X-Received: by 2002:adf:ed42:0:b0:1ef:9203:55d2 with SMTP id
 u2-20020adfed42000000b001ef920355d2mr6354078wro.320.1646052758430; 
 Mon, 28 Feb 2022 04:52:38 -0800 (PST)
Received: from [192.168.64.175] (22.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.22]) by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm12165084wmb.3.2022.02.28.04.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:52:37 -0800 (PST)
Message-ID: <ba726361-b9f5-b182-c79d-7d95fab840e6@gmail.com>
Date: Mon, 28 Feb 2022 13:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Content-Language: en-US
To: Kshitij Suri <kshitij.suri@nutanix.com>, qemu-devel@nongnu.org
References: <20220228052222.138890-1-kshitij.suri@nutanix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220228052222.138890-1-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: soham.ghosh@nutanix.com, prerna.saxena@nutanix.com, armbru@redhat.com,
 dgilbert@redhat.com, kraxel@redhat.com, thuth@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/2/22 06:22, Kshitij Suri wrote:
> Libpng is only detected if VNC is enabled currently. This patch adds a
> generalised png option in the meson build which is aimed to replace use of
> CONFIG_VNC_PNG with CONFIG_PNG.
> 
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> ---
>   meson.build        | 10 +++++-----
>   meson_options.txt  |  4 ++--
>   ui/vnc-enc-tight.c | 18 +++++++++---------
>   ui/vnc.c           |  4 ++--
>   ui/vnc.h           |  2 +-
>   5 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 8df40bfac4..3638957fc5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1112,14 +1112,14 @@ if gtkx11.found()
>     x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
>                      kwargs: static_kwargs)
>   endif
> -vnc = not_found
>   png = not_found

^ dead code, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +png = dependency('libpng', required: get_option('png'),
> +                 method: 'pkg-config', kwargs: static_kwargs)
> +vnc = not_found

