Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38E63B6A92
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 23:45:43 +0200 (CEST)
Received: from localhost ([::1]:50576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxz4Y-00035Z-HS
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 17:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxz39-0002KL-Hq
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:44:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxz38-0007vy-0X
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624916653;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6gj4BxTt2hFmG/BNRmcErmroRbvSL2Gnscjma8Uczng=;
 b=JOJee/mn11XcF77TE7YL03MbPCAcZszr6TjfHlESXBTigqU6DJ//+BY8etdSfNsOd9VddO
 j40pzbK2b3Cu6ehUWSmZhbTvdb2uwpRWITtQW7VYM2yrv2ixO3+ZxqKTCa1JeIPZ8RSxXW
 J+qJVSDJdYFp+1ZMJo3oURBspZVp17k=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-AtOGewSpMymCxP3hp51O6w-1; Mon, 28 Jun 2021 17:44:12 -0400
X-MC-Unique: AtOGewSpMymCxP3hp51O6w-1
Received: by mail-pj1-f72.google.com with SMTP id
 cv22-20020a17090afd16b029017071bb3b48so786887pjb.9
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 14:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=6gj4BxTt2hFmG/BNRmcErmroRbvSL2Gnscjma8Uczng=;
 b=NY6i4l6UJ8Rz/ECKM5ZG8OY1KQ2StF5BcxSmgY9iVizfgJW0FjHHVFn+7f7dzS0HOw
 Se63riF7LV6mYGX+eDNqq0GS3vHnAow2ucJ+Efj6/+qQvTCgtFmmzphxNc9atg06Govq
 2P0xQjiC7CxRFmtiYtu1O9F7JvpHpy0EmHVOaNpMVztq+S2z3hz93yDEEmot/FtNovem
 73DJZd0yOFEzVzoQ1DRTzJdf72oTiBTbf6DxA0Jp/1pegeWxbiujtbAlTgh1eS8dantO
 UZc/Kd0PtRYBHIl/gDhtobjdmTYJq/Elj+oG/9yA6ohEYfkDR+G6hqLEoLZALLc/KDdm
 7Kfw==
X-Gm-Message-State: AOAM533Ce1JPSpnine7whD7ChrGq6ebmTeNJ+GVZ2Y/Ofw6v47mo4jmN
 M6NYOfLlURYZ7Mt3uP9WGoCTqQg5nVxMZD0gB0rZ0zbUbAhbYgE0B+cNG7rPKVCrzni0O0apEEF
 2DGt+UJLZQfJU4Bo=
X-Received: by 2002:a63:312:: with SMTP id 18mr25273925pgd.33.1624916651290;
 Mon, 28 Jun 2021 14:44:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpOSKisK50kXjZ5kX8Bw/rS/SEJTyjic1pUTIlX0CMH3fszPzyYDq6fzKv5U/QNKrU/cEFxg==
X-Received: by 2002:a63:312:: with SMTP id 18mr25273910pgd.33.1624916651091;
 Mon, 28 Jun 2021 14:44:11 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id k25sm15134192pfa.213.2021.06.28.14.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 14:44:10 -0700 (PDT)
Subject: Re: [PATCH 10/11] python: Update help text on 'make clean', 'make
 distclean'
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-11-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <c47351d4-1074-8978-41de-18e10d17ad5c@redhat.com>
Date: Mon, 28 Jun 2021 18:44:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625154540.783306-11-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Reply-To: wainersm@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/25/21 12:45 PM, John Snow wrote:
> Just for visual parity with everything else.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/Makefile | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/python/Makefile b/python/Makefile
> index 4ed37c29f0..06f78f760a 100644
> --- a/python/Makefile
> +++ b/python/Makefile
> @@ -37,11 +37,14 @@ help:
>   	@echo "make venv"
>   	@echo "    Creates a simple venv for check-venv. ($(QEMU_VENV_DIR))"
>   	@echo ""
> -	@echo "make clean:      remove package build output."
> +	@echo "make clean:"
> +	@echo "    Remove package build output."
>   	@echo ""
> -	@echo "make distclean:  remove venv files, qemu package forwarder,"
> -	@echo "                 built distribution files, and everything"
> -	@echo "                 from 'make clean'."
> +	@echo "make distclean:"
> +	@echo "    remove pipenv/venv files, qemu package forwarder,"
> +	@echo "    built distribution files, and everything from 'make clean'."
> +	@echo ""
> +	@echo -e "Have a nice day ^_^\n"

Devs will like the last message. ;)

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>   
>   pipenv: .venv
>   .venv: Pipfile.lock


