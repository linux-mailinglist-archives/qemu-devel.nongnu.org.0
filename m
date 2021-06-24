Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9A43B29FA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:09:06 +0200 (CEST)
Received: from localhost ([::1]:35360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKQ5-0000c2-CI
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lwKOl-0008Ln-1K
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:07:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lwKOi-00053a-PJ
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:07:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624522060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFRZPMXOqdIjkBGnBW076d3/cSsNlvMApKSs72FFsL8=;
 b=WX9etgdqBqTuwJDICYUr4sDFe/wXaG0ghDmHUHCPPXDNuSnBf34//TBmJ62FoCxTRmQHnz
 Vdz0X1hBRYEfEI1bjjd4Ko4ZpISEQ+GuaEKhc5ESWB68fqdnv4PwTPBjcXhYabNUXNudz0
 PRT/gaPxaNNBdKFI9Vdz2fKq/VbP+MI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-lMdh-8BcObevAQpI3s0evg-1; Thu, 24 Jun 2021 04:07:36 -0400
X-MC-Unique: lMdh-8BcObevAQpI3s0evg-1
Received: by mail-wr1-f70.google.com with SMTP id
 x5-20020adff0c50000b029011a7be832b7so1882620wro.18
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 01:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MFRZPMXOqdIjkBGnBW076d3/cSsNlvMApKSs72FFsL8=;
 b=K0E2nUrGrf9Hi0yZNY4hRg9zol47vbr1mInIZ+JuT7pjePmfJZ3YijChWAuBxwfHrW
 iNS4EY/phMIxEkXZq0k6TE92vGSI+j8dhCsBAikAx2sTkf3WSCKdF+/Ia29BNPrLrPKo
 6uc397hT8oFkbo1nC7TpYWwMjb7PlSaWbbqzkxcTQg7qF85Oz4GLfLmTCibOhaflIccx
 REHlNCLSjKLbkM1PYXR/HgiTTubjCugYymOjqkkZSN0Nbhc8EMr4K+lUgc4FH9rGo4mm
 y9vdl7wrn2kaqwwyuGbUewp7C8ptp2KZ03U75DHOciR3q4t4dzcsPifxOVY+G7p2X6IQ
 jefQ==
X-Gm-Message-State: AOAM532Qzh0VgnOWtOF9tK0ix+s1buh6HnAk77YC50/Xlrt7+NeC3sHp
 BDP9ONQ6mGm0W5uiYz7CgHn35SvktZL/JTRNARwLqKAp9t8+jA1WeIkFK6X+4Jm+kg1q0vSCY/i
 5tT+NDne649NJIvY=
X-Received: by 2002:a5d:410f:: with SMTP id l15mr2975593wrp.82.1624522055506; 
 Thu, 24 Jun 2021 01:07:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygWcA2oUXNJ0VeIP20fAJRlxrUJrxz0e/Fw5w3zMQbI5EKWPz3vUhP88E6dqUpE0+yWxfw6Q==
X-Received: by 2002:a5d:410f:: with SMTP id l15mr2975582wrp.82.1624522055404; 
 Thu, 24 Jun 2021 01:07:35 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x81sm9527567wmg.36.2021.06.24.01.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 01:07:35 -0700 (PDT)
Subject: Re: [RFC v1 1/1] ui: Add a plain Wayland backend for Qemu UI
To: Vivek Kasireddy <vivek.kasireddy@intel.com>, qemu-devel@nongnu.org
References: <20210624041040.1250631-1-vivek.kasireddy@intel.com>
 <20210624041040.1250631-2-vivek.kasireddy@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <18be0a83-ea61-c622-4d80-60a0651e1386@redhat.com>
Date: Thu, 24 Jun 2021 10:07:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624041040.1250631-2-vivek.kasireddy@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 6:10 AM, Vivek Kasireddy wrote:
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  configure         |  17 ++
>  meson.build       |  25 +++
>  meson_options.txt |   2 +
>  qapi/ui.json      |  19 ++-
>  ui/meson.build    |  52 ++++++
>  ui/wayland.c      | 402 ++++++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 516 insertions(+), 1 deletion(-)
>  create mode 100644 ui/wayland.c

> diff --git a/qapi/ui.json b/qapi/ui.json
> index 1052ca9c38..55e5967889 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1057,6 +1057,20 @@
>  { 'struct'  : 'DisplayEGLHeadless',
>    'data'    : { '*rendernode' : 'str' } }
>  
> +##
> +# @DisplayWayland:
> +#
> +# Wayland display options.
> +#
> +# @rendernode: Which DRM render node should be used. Default is the first
> +#              available node on the host.
> +#
> +# Since: 3.1

Likely 6.1 :)

(no need to respin for this single comment).


