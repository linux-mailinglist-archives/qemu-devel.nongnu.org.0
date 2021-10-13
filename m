Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D7242BEEB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 13:29:42 +0200 (CEST)
Received: from localhost ([::1]:57470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1macS6-0005xV-2t
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 07:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1macQG-0003qs-FL
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:27:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1macQE-0003ai-Hg
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:27:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634124465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gh4E61gz8IBBqDxgjMjIIrq5Ft0cldzOkscpIBSGel4=;
 b=ekPi8TCgqDJlS9QGZ/hA5O4dSVGWFNj32KihRp2ee3luhUjiIe6lOrSotFCaSYL2SYNyHn
 n8B0f7wH3Hh0bA2Vkp+gJRgNIf7782Fi8xx8Kjm2j+G3xor9zaznm3FUb0DJaxo2TWSgYw
 1Sm418K8I/Zt2W4ypiIJ2dXJVjo3P+Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-d4KYQsUyMTiozfvribjtgA-1; Wed, 13 Oct 2021 07:27:44 -0400
X-MC-Unique: d4KYQsUyMTiozfvribjtgA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h19-20020aa7de13000000b003db6ad5245bso1941024edv.9
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 04:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gh4E61gz8IBBqDxgjMjIIrq5Ft0cldzOkscpIBSGel4=;
 b=Nct52O/sMiEtyabs0OIDB3rg0spv6OePGeiZWsnfzOhFC3a19zvIhfIm+aW7+xqvop
 qURHx8jxah3urD4IvapjEh91URc63dzLXSnRc2PZF+ozU/NL7qEATVVSOcWIhEmJH0Wa
 9YZBjGzuu/qXPtD42y1ldQOQHn34qfWO09Zv5yWm6QnTXP67XAJJiewOq+02LOy2wVFq
 q/TK99U+pKf17a9J7reG4wESFiW0SxW2pUCN2z7cRwETQRhkyTwS/GKrCQsQYKiAzXWD
 561TnS7yCeE6P8Lj86f67FdGrd3jo1vH5BdGSlFrZ8B3UZFK+r8ocEWjyQEAhXxWJ6lp
 aPyA==
X-Gm-Message-State: AOAM530wFxgLqLj5GxGAts88ixQlfcLSOHlevjcYo9Ko/eKcydAAHBV2
 0WcYkGruTgFwjVoVHhbxIqJfY6uwV6f9WhAE6g4mxOxKB6z1ucxgGXf0XwnfsH9Lq+AsPypQ+nz
 EbsGXwNGhr9alNQU=
X-Received: by 2002:a17:907:961d:: with SMTP id
 gb29mr4256591ejc.457.1634124463627; 
 Wed, 13 Oct 2021 04:27:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFlFY5YlcYIkE8Jm6+kKvTIWtcNjQBSlsYYB1DcNS4cc4Z+6UKfOQ2OhSYUi5e2TymsvYBAw==
X-Received: by 2002:a17:907:961d:: with SMTP id
 gb29mr4256569ejc.457.1634124463474; 
 Wed, 13 Oct 2021 04:27:43 -0700 (PDT)
Received: from thuth.remote.csb (p54886540.dip0.t-ipconnect.de.
 [84.136.101.64])
 by smtp.gmail.com with ESMTPSA id u8sm6135134edo.50.2021.10.13.04.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 04:27:42 -0700 (PDT)
Subject: Re: [PATCH v2 24/24] configure: automatically parse command line for
 meson -D options
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-25-pbonzini@redhat.com>
 <de0d99d9-8375-5f01-c0a6-8174b6f57b49@redhat.com>
 <9f0d78be-b840-4ec1-f61c-11765650285f@redhat.com>
 <16181a8b-4676-24c9-796d-56207731d4c2@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c4807a16-7d32-bf92-a73e-d57b7cf13e9d@redhat.com>
Date: Wed, 13 Oct 2021 13:27:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16181a8b-4676-24c9-796d-56207731d4c2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/10/2021 13.11, Paolo Bonzini wrote:
> On 13/10/21 09:43, Paolo Bonzini wrote:
>> On 12/10/21 20:15, Thomas Huth wrote:
>>>
>>> Old output with --help:
>>>
>>>   --enable-trace-backend=B Set trace backend
>>>                             Available backends: nop, dtrace, ftrace, 
>>> simple, stderr, ust
>>>
>>> New output:
>>>
>>>    --enable-trace-backends=CHOICE
>>>                             Set available tracing backends [log]
>>>
>>> Why does it fail to list the choices here? ... it works for the other
>>> options like "--enable-malloc"?
>>
>> Oh, that's a pity: array options don't include the choices in their 
>> introspection data.  I'll fix it up ad hoc and submit a patch to Meson.
> 
> ---------------- 8< ----------------
> From: Paolo Bonzini <pbonzini@redhat.com>
> Subject: [PATCH] meson-buildoptions: restore list of tracing backends
> 
> Manually patch the introspection data to include the tracing backends.
> 
> This works around a deficiency in Meson that will be fixed by
> https://github.com/mesonbuild/meson/pull/9395.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   scripts/meson-buildoptions.py | 18 +++++++++++++++++-
>   scripts/meson-buildoptions.sh |  3 ++-
>   2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
> index 54b591d8a4..256523c09d 100755
> --- a/scripts/meson-buildoptions.py
> +++ b/scripts/meson-buildoptions.py
> @@ -66,7 +66,7 @@ def sh_print(line=""):
> 
> 
>   def help_line(left, opt, indent, long):
> -    right = f"{opt['description']}"
> +    right = f'{opt["description"]}'
>       if long:
>           value = value_to_help(opt["value"])
>           if value != "auto":
> @@ -150,7 +150,23 @@ def print_parse(options):
>       print("}")
> 
> 
> +def fixup_options(options):
> +    # Meson <= 0.60 does not include the choices in array options, fix that up
> +    for opt in options:
> +        if opt["name"] == "trace_backends":
> +            opt["choices"] = [
> +                "dtrace",
> +                "ftrace",
> +                "log",
> +                "nop",
> +                "simple",
> +                "syslog",
> +                "ust",
> +            ]

Do we need a check for a fixed meson version here?

  Thomas


