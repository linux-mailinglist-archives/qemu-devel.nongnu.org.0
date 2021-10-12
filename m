Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD66942A570
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 15:21:29 +0200 (CEST)
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maHii-0000aS-Dl
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 09:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maHea-0004gY-3U
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:17:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maHeV-0007hK-P0
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634044625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JTq5N6uLewTfLjymwF4p1QW9I3pbBgd+eB0c7l5bGK0=;
 b=flm0NA7ZvZbcHzP0mS3YeXcV6uDG3pbl8otU0gSyqTc+QbH2qgsrBZDZWwWoJQbHV2xjK2
 yQUA99kEQoE2Cuiup426HeSbkO2JbGCGB0eiTAYoot0OKzQ4iKCp/x82azTrGgkjk1U214
 yv3LPmezEBdNsJBF/5QuieLN+GqM/1g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-DfUWcby6MRSgxNVqsn3QjQ-1; Tue, 12 Oct 2021 09:17:04 -0400
X-MC-Unique: DfUWcby6MRSgxNVqsn3QjQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 i7-20020a50d747000000b003db0225d219so18955903edj.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 06:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JTq5N6uLewTfLjymwF4p1QW9I3pbBgd+eB0c7l5bGK0=;
 b=W01q0TdX5bphAZYfb1ZnPdmZVquLIiwWiTPUKG0cHs8/bUxAKyEe7wQPAeGZqTdRDs
 HxQdB7OI9yyFUz78vAb1ggwEzns78ZlkRuNBc1F6S1RanRlsNnVQKNLME6Swxc1sHttq
 pj1LdZTWe5wwojLMpRXz7c3SMU59s2dwbMOaFxH5Ho5PPB7DbeTmhUo4/J2gZNYOTNF1
 IUvREhEp5+UPrdfK0nFS45cjhDjRvLHFx3qfpSSNt4OgDP8/55WjXEafbPgwLM07HwpC
 Tluc64/9gofWgv5c2FiNkEf+gr1s99hV5FQT1s2BUuXsd68LZa1JHUBUnlfDA5xgGhGU
 m8hA==
X-Gm-Message-State: AOAM531zdcM7tOT1vUWobYowoJrC8GkmVJGitOXBWB5iQ4gy5zmsNsee
 JPth0iuC5NAafoqi8/G9OfStMBDRJhKusFMr3z8h2t5XhaqaqL0nAKEdUnEHaAQoyX+bPetBN2g
 TXUwnNQw+flDwYec=
X-Received: by 2002:a17:906:5d5:: with SMTP id
 t21mr34191375ejt.160.1634044623204; 
 Tue, 12 Oct 2021 06:17:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyT06vpGTvLAnR47nHwSZT1CeuHAY2XImo4MxWgkY0SsC4PVF7CmmTLYH5893/e4tuY3bx0Q==
X-Received: by 2002:a17:906:5d5:: with SMTP id
 t21mr34191357ejt.160.1634044622983; 
 Tue, 12 Oct 2021 06:17:02 -0700 (PDT)
Received: from thuth.remote.csb (p54886540.dip0.t-ipconnect.de.
 [84.136.101.64])
 by smtp.gmail.com with ESMTPSA id p7sm5946198edr.6.2021.10.12.06.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 06:17:02 -0700 (PDT)
Subject: Re: [PATCH v2 13/24] configure, meson: move remaining HAVE_* compiler
 tests to Meson
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-14-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <730e39f2-69c2-b26e-24b7-1be52ae4e23d@redhat.com>
Date: Tue, 12 Oct 2021 15:17:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012111302.246627-14-pbonzini@redhat.com>
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

On 12/10/2021 13.12, Paolo Bonzini wrote:
> Remove some special cases by moving them to Meson.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20211007130829.632254-8-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
...
> @@ -1609,7 +1626,8 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
>           return printf("%zu", SIZE_MAX);
>       }''', args: ['-Werror']))
>   
> -ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
> +ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
> +    'HAVE_GDB_BIN']

That HAVE_GDB_BIN shows up here a little bit by surprise  ... maybe mention 
it in the patch description?

>   arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
>   strings = ['CONFIG_IASL']
>   foreach k, v: config_host
> @@ -1624,7 +1642,7 @@ foreach k, v: config_host
>       config_host_data.set('HOST_' + v.to_upper(), 1)
>     elif strings.contains(k)
>       config_host_data.set_quoted(k, v)
> -  elif k.startswith('CONFIG_') or k.startswith('HAVE_')
> +  elif k.startswith('CONFIG_')
>       config_host_data.set(k, v == 'y' ? 1 : v)
>     endif
>   endforeach
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


