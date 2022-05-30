Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F8353757A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 09:36:10 +0200 (CEST)
Received: from localhost ([::1]:59886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvZwe-0003na-AX
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 03:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvZu7-0002ZF-RJ
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:33:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvZu4-0007o8-0W
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653896005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8kVcXePHVwFjyf45DozwMyk5Pdi2WMnYnDfWjgjf4s=;
 b=hEMjLa67LnFvDDNAw8TkQx3zxC+lAoSd1XzTaenqNuBPdY+77Qv5hPHw9hEqip3KNROgAd
 i6dDFImPkwlhS/OqQvk+gs6nxlSs27OGZWuLZBe3Zm1j3SLhFI3bijZjCylWXStv/yE/+1
 1No6VvQBJzcmR82bR5JaJ2rnl9Xq/Jw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-VLbf0m1zO-KUkpBE02XafQ-1; Mon, 30 May 2022 03:33:16 -0400
X-MC-Unique: VLbf0m1zO-KUkpBE02XafQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 m6-20020ac866c6000000b002f52f9fb4edso9531692qtp.19
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 00:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I8kVcXePHVwFjyf45DozwMyk5Pdi2WMnYnDfWjgjf4s=;
 b=j+oVHn1DnY9zB7+EzW658QQ0ajoIZ8Spk1sWYld+WbG2X0ZKLQxvwERrA9f5UhlppY
 RWn1CcG5fqhz0iC647siuoTEdEDErRz1NUyWMhlAgmRnMZWXsiCeRWZ158SMgUi+tITZ
 TA9QXDzbNOOjQf0EFBaC+iunEP7HB2dt5mSdtNnjfTFsBum6HDliH6BiC3rrRDWyNZKR
 uZvnSJ66wM6pEY8mBw6i7E+t9wHkEUdeCAuWJL9FGdFOhIvTH8Zdk40cUU2nSeyph+xp
 YyOJ/LzPrlTlfCamJMyshYMID5HHfx02ae5JUzJWgUUiCMvWosIedM9PFrxI74VLTNIk
 QjVA==
X-Gm-Message-State: AOAM533nzDD4Ihwpk9DDVMB3Mg1fx9sTP9hC8ncZrxgZ4izsXNXLZ14S
 K439POagPyUlY0EEnslgXwujlBMRl/e4iVzG65Cn+/PM0zQ+IaF0rd3HHyi9szoxvU/9Jt4BfWB
 bIDmA9zyJPQfPQu8=
X-Received: by 2002:ac8:58ca:0:b0:2f3:da32:ab1 with SMTP id
 u10-20020ac858ca000000b002f3da320ab1mr42945808qta.308.1653895996293; 
 Mon, 30 May 2022 00:33:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFeUv65+X2oWpUeTzJRgQhQmIEELmyN+4Gih1z5/48UyCXIwHRoWjl8O/ko5M0jaX5oc3q5g==
X-Received: by 2002:ac8:58ca:0:b0:2f3:da32:ab1 with SMTP id
 u10-20020ac858ca000000b002f3da320ab1mr42945795qta.308.1653895996074; 
 Mon, 30 May 2022 00:33:16 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-216.web.vodafone.de.
 [109.43.179.216]) by smtp.gmail.com with ESMTPSA id
 h4-20020ac85144000000b002ffad31c4easm3961204qtn.50.2022.05.30.00.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 00:33:15 -0700 (PDT)
Message-ID: <3a0913d7-c148-2619-bdee-7f70b091a6a9@redhat.com>
Date: Mon, 30 May 2022 09:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 8/9] tests: add python3-venv to debian10.docker
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <20220526000921.1581503-9-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220526000921.1581503-9-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/05/2022 02.09, John Snow wrote:
> This is needed to be able to add a venv-building step to 'make check';
> the clang-user job in particular needs this to be able to run
> check-unit.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/docker/dockerfiles/debian10.docker | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
> index b414af1b9f7..03be9230664 100644
> --- a/tests/docker/dockerfiles/debian10.docker
> +++ b/tests/docker/dockerfiles/debian10.docker
> @@ -34,4 +34,5 @@ RUN apt update && \
>           python3 \
>           python3-sphinx \
>           python3-sphinx-rtd-theme \
> +        python3-venv \
>           $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)

Note that we'll (hopefully) drop the debian 10 container soon, since Debian 
10 is EOL by the time we publish the next QEMU release.

  Thomas


