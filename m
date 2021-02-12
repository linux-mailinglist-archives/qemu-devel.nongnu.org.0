Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF0931A2AD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 17:29:17 +0100 (CET)
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAbJk-0004sG-6z
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 11:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lAbH3-0002Nx-4T
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:26:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lAbH0-000420-6o
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613147183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ki7nT1cRq6KZkI6gduyZB44kmFbr8ZYp4MQUBx/bkbw=;
 b=dzmtC3cakNcuxooRu6Gck2nnQOjFs2Z77skVqRpGJpkJt9TAaVCYyhMTD5pC6nVTdWX6oS
 YEhZcUw2PgUEoCmD8Ig60cZ+iZLPNvn+6u7axN7xv+Q/MJrfgIMBt1mmYPg//UATni/LpX
 eFnR+mNkZg4kwyGsufSr8xTma4+ctzg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-_R62IlrYO5e1Vjgb1dG-Mw-1; Fri, 12 Feb 2021 11:26:22 -0500
X-MC-Unique: _R62IlrYO5e1Vjgb1dG-Mw-1
Received: by mail-ej1-f71.google.com with SMTP id yc4so178247ejb.2
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 08:26:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ki7nT1cRq6KZkI6gduyZB44kmFbr8ZYp4MQUBx/bkbw=;
 b=a1Pnhk1BlKfaRz93FyHJgb1JlxkEJFv8zIwwOHTBuLfp5+Z/Rs9EkYW5Rjv8RZRmEN
 JU5dI0nkRF8SYbonGCw44G40yz1POCSp07oivjWP+bzAu9q+j0JEt1VDyWc6S8HdfcHN
 QEtX9KX7ut00+IWUQdu9MLeXg3rc6ky6m2slrbpOE4GpbZwR2iOExZ4LqasIxUI3V1zS
 XgURmttumgun/NE3fGY+v9XavZaS67lsZeTz4AZY0ILdRYaZ+d6Zfcvq7zR7zl7EnBHL
 9gakgPdSwO8ezMdN+jOeuarBKNFel/kgIANFj0jkAzSHkjMpkBmIn2arZSmEGotrJJFh
 uUYg==
X-Gm-Message-State: AOAM531VLQIz3c8CdzTaR/biA0qCvQP6mHeH8Gt0zfyhdXqH8b0QUJ6D
 FUxiKQ2DsCKsJtnWerQIq67JLSnZ1OoB1DkIKQgCriUu1EcoYvLB2KvpaYii8U+UuCY6O1C5Fua
 NGrOsxqSOSyHkJTM=
X-Received: by 2002:a17:906:b28f:: with SMTP id
 q15mr3759602ejz.77.1613147181018; 
 Fri, 12 Feb 2021 08:26:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbYbhCCYtMMcSBpj80ILvf5W5CpgDzFxWua+r+P8uIWFwUcZNwJRPsLid0Y7U9mdEZ+2dX6g==
X-Received: by 2002:a17:906:b28f:: with SMTP id
 q15mr3759585ejz.77.1613147180791; 
 Fri, 12 Feb 2021 08:26:20 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j18sm6538830edj.36.2021.02.12.08.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 08:26:19 -0800 (PST)
Subject: Re: [PATCH] docs/sphinx/qapidoc.py: Handle change of QAPI's builtin
 module name
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210212161311.28915-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <04f41fed-8d79-717f-e8ea-72e1de851362@redhat.com>
Date: Fri, 12 Feb 2021 17:26:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210212161311.28915-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/02/21 17:13, Peter Maydell wrote:
> In commit e2bbc4eaa7f0 we changed the QAPI modules to name the built-in
> module "./builtin" rather than None, but forgot to update the Sphinx
> plugin. The effect of this was that when the plugin generated a dependency
> file it was including a bogus dependency on a non-existent file named
> "builtin", which meant that ninja would run Sphinx and rebuild all
> the documentation every time even if nothing had changed.
> 
> Update the plugin to use the new name of the builtin module.
> 
> Fixes: e2bbc4eaa7f0
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/sphinx/qapidoc.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> index e03abcbb959..b7b86b5dffb 100644
> --- a/docs/sphinx/qapidoc.py
> +++ b/docs/sphinx/qapidoc.py
> @@ -464,7 +464,7 @@ class QAPISchemaGenDepVisitor(QAPISchemaVisitor):
>           self._qapidir = qapidir
>   
>       def visit_module(self, name):
> -        if name is not None:
> +        if name != "./builtin":
>               qapifile = self._qapidir + '/' + name
>               self._env.note_dependency(os.path.abspath(qapifile))
>           super().visit_module(name)
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


