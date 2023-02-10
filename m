Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D14691953
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 08:46:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQO6s-0002v8-F3; Fri, 10 Feb 2023 02:46:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQO6S-0002uZ-23
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 02:45:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQO6O-00044d-Kw
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 02:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676015146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5TojVq2EprzgUawDdrIhzzJGeBNwrZegYMZWc71Cea4=;
 b=YIjkVrpKD/1New9uVfp/L2ckj/Apg9j83TgB7haK1X1xSf4JkPDnGlhxZrNpuulzS691Sp
 +wDTAv47txg39V9H4V9RiaVygWvPqUdOHDjXPprFm1K/x/LQKVUzzIdDWCf9nBxDk0Hxus
 uaHQ0a9Ep9agiM5Nc8VaL2wk4bPdDRE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-57-a74EdGMWPbaPf__nHzweFg-1; Fri, 10 Feb 2023 02:45:44 -0500
X-MC-Unique: a74EdGMWPbaPf__nHzweFg-1
Received: by mail-qt1-f200.google.com with SMTP id
 v3-20020a05622a188300b003ba183e8272so2644686qtc.0
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 23:45:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5TojVq2EprzgUawDdrIhzzJGeBNwrZegYMZWc71Cea4=;
 b=jTETJt3VCLE9v+Mq4vI5sLr+DSHzoT6W4U3135wBRuNgKhT06YGxp03bQJPLBKIK9S
 pWvOVCmNqSfMGBNpEcjILn8uc1rFJK3S4d6MJ1iKACbQOU6Dzbl5+uAdK+oTn8MXdmlh
 FkT7/NHayVxfHqOrpQ+T4kL6WKwJLC8Aa+NqfpBHWrXD6deHvd+chAOI0Jzin2vNETJB
 emkByLnMdW67jXJcOom5tvGeM+qzBkStWRKUfc0SVm5wFPnB7L6Z8udQIcSHE9dYFFBi
 lEB9Qs5XjvoUUIvbBaHYfXNoJrj8QIq0Vu4W+1NlDrwGLnwTeWkdutGZvXE6Ul1LqyUg
 bscA==
X-Gm-Message-State: AO0yUKVGHMqkfyqu6mjwahrOYx03Gz1qLBYCUCIa+GTEsun+6yDgM9/o
 ne0Y02LNWqpD65DP8JZRg5VZCfcDdFz+/xhHlaPhQWmuY9Q9nXEkej829qaa+7XWXFDc7sJHAOV
 NMkVRU2BxZibcxzg=
X-Received: by 2002:a05:622a:1804:b0:3b1:4a8:4665 with SMTP id
 t4-20020a05622a180400b003b104a84665mr23719482qtc.62.1676015144374; 
 Thu, 09 Feb 2023 23:45:44 -0800 (PST)
X-Google-Smtp-Source: AK7set9sHSIvHuLnZ6Id1QuiNEWfk7qxwkbub5lnfDEVHeykZz6qe8xcTXiuWhF+Pb4KkFbl/eT0Qg==
X-Received: by 2002:a05:622a:1804:b0:3b1:4a8:4665 with SMTP id
 t4-20020a05622a180400b003b104a84665mr23719460qtc.62.1676015144141; 
 Thu, 09 Feb 2023 23:45:44 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-85.web.vodafone.de.
 [109.43.178.85]) by smtp.gmail.com with ESMTPSA id
 x21-20020ac87a95000000b003b869f71eedsm2827418qtr.66.2023.02.09.23.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 23:45:43 -0800 (PST)
Message-ID: <c9fbb361-bf79-2196-aafd-68a831f0a1c5@redhat.com>
Date: Fri, 10 Feb 2023 08:45:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 4/7] configure: Add nice hint to Python failure message
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-5-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230210003147.1309376-5-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/02/2023 01.31, John Snow wrote:
> If we begin requiring Python 3.7+, a few platforms are going to need to
> install an additional package.
> 
> This is at least mildly annoying to the user (and I hate negative
> attention), so solve the user's problem for them before they get a
> chance to become irritated while searching on Google for how to install
> newer Python packages.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   configure | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index ea8c973d13b..bf512273f44 100755
> --- a/configure
> +++ b/configure
> @@ -1058,7 +1058,10 @@ fi
>   
>   if ! check_py_version "$python"; then
>     error_exit "Cannot use '$python', Python >= 3.6 is required." \
> -      "Use --python=/path/to/python to specify a supported Python."
> +             "Use --python=/path/to/python to specify a supported Python." \
> +             "Maybe try:" \
> +             "  openSUSE Leap 15.3+: zypper install python39" \
> +             "  CentOS 8: dnf install python38"

IMHO the "Python > 3.6" is already pretty clear, and the hints that you 
provide here will expire pretty fast (unless you bump them regularly), so 
I'd rather drop this patch. Just my 0.02 €.

  Thomas


