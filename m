Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA6E4691CA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 09:51:22 +0100 (CET)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu9iT-0006Xv-SZ
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 03:51:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mu9fM-00054w-DF
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 03:48:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mu9fJ-0002Rx-B8
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 03:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638780484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6NvUxywZDq7YzwQzTPjXMoq8MWqsqbOcPWmjagmVMNg=;
 b=L6TQdKMRfxj+qQs1sQn5PknUxrOoeEHFZHYX28cZmFrDC2wyCZG9ceQDQGXhLn6+UUnzq+
 6VeCCWNSwpC48H2i27FoSN5i0H0+Yax/1AO7ns4bwI7XPWqjYCiqQTDhF+J4VmWLcAZ2bx
 rPVHDs9oz4cfLxseGU4hDIl/Ve3Ck/g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-6Ta8ZHC6N36NgQlmdlCuEQ-1; Mon, 06 Dec 2021 03:48:01 -0500
X-MC-Unique: 6Ta8ZHC6N36NgQlmdlCuEQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r2-20020adfe682000000b00198af042b0dso1768981wrm.23
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 00:48:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=6NvUxywZDq7YzwQzTPjXMoq8MWqsqbOcPWmjagmVMNg=;
 b=i1tDvdpGJXEMi8N57gdnGWwYat+BQ7a9wqHiVgBVOANpzWUkBgBjCO8HRX+CXc9LOy
 /QN3MWWa7dJqKkPkir2QFNUsQ/oQnep3Rb5zAusbZXIIIUApQ5AfOmhEWsixRUatbSrV
 WimSn1lriI975JklQscFp9njCBZuBi+AMZKxVwpDxIjlRiWyshJ0TMhnGgiY5P4QpYlO
 uZVdoMqnZhGotsfMoA6FfDxJ2bLTP79mVkulrhSJwQBx5ZLwIGcNQnSZaUNZfbSBlk0R
 XWcCgQ6eqmqbjJTldoSw1zxn6rdXjTmuo8gvLFDfG33Dwj1VPiaowelCtvQv69tUMKAm
 AqJA==
X-Gm-Message-State: AOAM532pwgnR7w5SR3ghNVEQqrybFdnhgqVJDqVdxhQVC1y8H7szpeQX
 mK9czoVLO3sQqzZJ/YcyceyQn7kfDTp0NK17vj7S16DjOOORZ3ZMjgX/Qu4H557AFevlKrza8V7
 c5IPOViA7VdVLNHZS+OZRnJvRvtKv5cb1g6wv3YEpom+tAc9sq7oNuHYSLQnHFlw=
X-Received: by 2002:a5d:614f:: with SMTP id y15mr41683566wrt.587.1638780479915; 
 Mon, 06 Dec 2021 00:47:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfkdL+N/XgP3y6TUsHypWCWSX5u8CmyrzwcaxIfsUwg3RahnLIsLSBWoXhbfh4YMXLVi9n3A==
X-Received: by 2002:a5d:614f:: with SMTP id y15mr41683535wrt.587.1638780479664; 
 Mon, 06 Dec 2021 00:47:59 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id z5sm15281463wmp.26.2021.12.06.00.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 00:47:59 -0800 (PST)
Message-ID: <10bc4172-f6c0-504b-cecb-e7caf9edb074@redhat.com>
Date: Mon, 6 Dec 2021 09:47:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0] i386: Deprecate the -no-hpet QEMU command line
 option
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20211206084012.49277-1-thuth@redhat.com>
In-Reply-To: <20211206084012.49277-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.076, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Libvirt <libvir-list@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/2021 09.40, Thomas Huth wrote:
> The HPET setting has been turned into a machine property a while ago
> already, so we should finally do the next step and deprecate the
> legacy CLI option, too.
> While we're at it, add a proper help text for the machine property, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst | 6 ++++++
>   hw/i386/pc.c              | 2 ++
>   qemu-options.hx           | 2 +-
>   softmmu/vl.c              | 1 +
>   4 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 5693abb663..1dfe69aa6a 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -198,6 +198,12 @@ form is preferred.
>   Using ``-drive if=none`` to configure the OTP device of the sifive_u
>   RISC-V machine is deprecated. Use ``-drive if=pflash`` instead.
>   
> +``-no-hpet`` (since 7.0)
> +''''''''''''''''''''''''
> +
> +The HPET setting has been turned into a machine property.
> +Use ``-machine hpet=off`` instead.
[...]

Forgot to CC: the libvirt folks, doing so now.

Seems like libvirt is still using -no-hpet in some few spots, so I guess 
these would need to be changed first, before we could finally remove this 
option in QEMU?

  Thomas


