Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC09D1D4619
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 08:45:18 +0200 (CEST)
Received: from localhost ([::1]:43036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZU5t-00071p-Or
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 02:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZU54-0006Li-P9
 for qemu-devel@nongnu.org; Fri, 15 May 2020 02:44:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39656
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZU53-0005u1-Ih
 for qemu-devel@nongnu.org; Fri, 15 May 2020 02:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589525064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtwa+XnVoncOJDcsCJRU5ECSZTg7y7dBMLin873wIc4=;
 b=WCydeOaILNIlm0KZ0eLeWKz2heRgN9URdihAOZVk/Grsf8WgRoXv+F6kVJSz9wFg3J40hK
 o468bqdHYkLvzL1V0KyaCaqDgOFpLlShfpwql3MDPNQwuZcQZOeXX1zPA9O62uaUXAsdGm
 IVfJqctUiKyiuWOMj+GWfXWtuQovEGs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-NqVbY5Q-NJKLPT3lSvzGow-1; Fri, 15 May 2020 02:44:19 -0400
X-MC-Unique: NqVbY5Q-NJKLPT3lSvzGow-1
Received: by mail-wr1-f72.google.com with SMTP id z8so681380wrp.7
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 23:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qtwa+XnVoncOJDcsCJRU5ECSZTg7y7dBMLin873wIc4=;
 b=ewxRPm7+YHLvxH67A8xzz3cBlVJH2uaaEoaTeldOHCzV20vC1E2bOGJbv81vyOEXuP
 7pr0AI/xLERy9Vg5hZ3Pqax+Cp4qMgwk+H1FgXr8G9PBcs9gG4aHwUkjRzjU1ARbhmpU
 l62fLMCeAcD/x+qNXsj6HbFy6aK4eBk6iM9c64KxJX/UT26nLooBMNDBCaAAQbxWCBWR
 L8uKEisXtTuZwkGa0hLGvLUnrN4M9G4MZH1gFfu8HeP2E67MorR1req/yGWlTFjo6vII
 oan7FD7W5/j8y9XXn4rcWV8tCY2s9RvbJsnoPX6YgPW72r7oeEtREVUpGyybpcRwqw8x
 FCWg==
X-Gm-Message-State: AOAM531Je1dZxrV8vm/Op3kyT5xF1YuhYitHe+WRrcVWJ16bSDZhN9Wy
 rxd8+pEooQquXQhECjxshmnJiOCDY/t4EpnWqTX8wZH4zA6AmEbXzyjCV8kuz9stMRMBjAlfOX5
 XL9s8cqhu759tjhA=
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr2395802wmr.160.1589525058310; 
 Thu, 14 May 2020 23:44:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX9OpAI81gv7v2O6YnyY8Adh7agUhjbAN/zTufRlI9td9IwUfcBNiV8M4+Hh7+blS9eYRxtg==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr2395782wmr.160.1589525058036; 
 Thu, 14 May 2020 23:44:18 -0700 (PDT)
Received: from [192.168.1.39] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id 37sm2082348wrk.61.2020.05.14.23.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 23:44:17 -0700 (PDT)
Subject: Re: [PATCH v2] cpus: Fix botched configure_icount() error API
 violation fix
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200515042231.18201-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2d87501c-4b59-3b89-8281-70f96e8cd989@redhat.com>
Date: Fri, 15 May 2020 08:44:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200515042231.18201-1-armbru@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 23:27:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/15/20 6:22 AM, Markus Armbruster wrote:
> Before recent commit abc9bf69a66, configure_icount() returned early
> when option "shift" was absent: succeed when option "align" was also
> absent, else fail.
> 
> Since then, it still errors out when only "align" is present, but
> continues when both are absent.  Crashes when examining the value of
> "shift" further.  Reproducer: -icount "".
> 
> Revert this erroneous part of the commit.
> 
> Fixes: abc9bf69a66a11499a801ff545b8fe7adbb3a04c
> Fixes: Coverity CID 1428754
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   cpus.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/cpus.c b/cpus.c
> index 5670c96bcf..ee906dd08f 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -803,8 +803,10 @@ void configure_icount(QemuOpts *opts, Error **errp)
>       bool align = qemu_opt_get_bool(opts, "align", false);
>       long time_shift = -1;
>   
> -    if (!option && qemu_opt_get(opts, "align")) {
> -        error_setg(errp, "Please specify shift option when using align");
> +    if (!option) {
> +        if (qemu_opt_get(opts, "align") != NULL) {

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +            error_setg(errp, "Please specify shift option when using align");
> +        }
>           return;
>       }
>   
> 


