Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F8920CDCD
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 12:12:46 +0200 (CEST)
Received: from localhost ([::1]:35308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpqmL-0003VH-9N
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 06:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jpqlK-0002lS-At
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 06:11:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33229
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jpqlI-000674-IL
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 06:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593425499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/2KRhy0fz2HIkMRWo0bjbhExbun3UcEBsNyjFP/NuJI=;
 b=WDkvHmTRkVNhBuv3C0LvVpz+PYhwRq4v7SOEVYrMYER+LKf+OhtCQSLclAyphiY6jDkNvg
 Hf3BlLkDV0xwsLnY9VmWve+AF+31I+eEPHSdeJT7lrqw/myu81OruUjLPCru9+oQsFiNiy
 RuEC+L6BFaeUet+KIwuRPLBXAhYyDgg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-RpwCBW2zMBybYrnudF9v-w-1; Mon, 29 Jun 2020 06:11:36 -0400
X-MC-Unique: RpwCBW2zMBybYrnudF9v-w-1
Received: by mail-wm1-f72.google.com with SMTP id v6so16005469wmg.1
 for <qemu-devel@nongnu.org>; Mon, 29 Jun 2020 03:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/2KRhy0fz2HIkMRWo0bjbhExbun3UcEBsNyjFP/NuJI=;
 b=Cw9we4gtMPNp4oyUT4PW6PvxIsf17yS+GYAirhKoeO0cer9yFaxef0yZglwo4w//O6
 1AtkWFTgFvxP5WZe+RR01aWTcE3+IIK+19WY3g+8yRAXZva18nlkyava6NnpaMPEVYL6
 zmo4vltU4od+zuhBN+Y9R+eqkA832HwQFyIZ3DLmz+HscFrWrvRFajh2vVZCwiXnuY8d
 2bYg8Dre5yX2/Kq6SFI/wfBCOc3Rj9fSgQRIqcXsFz4auBVBsLqupzeZPCMSfyKkisrQ
 16fUQV7lWTOl8SDHmeZkOhK7pjE74OppdzobHA9Wyu3S1NLpyYzrQPYme6paZDtTsDc3
 igmQ==
X-Gm-Message-State: AOAM533iYbuGdX/IJlJcjiW7MWQ6h4/LQ1mm/p3jAjECip+FxdtrqAB0
 iqHmOtj46T6/eYgSu96BTcRUenG4GRywZTT2jxKc9NdaStqn9NgMlvjFgv4wvF2CdseNpb3XnD2
 KL/YYwwnO/gurVIw=
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr15988294wml.170.1593425495286; 
 Mon, 29 Jun 2020 03:11:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS7r3gvGPGGnw52cKwfQiCZFrK6p0lYNeSPlaHigCWgA9eq2l2AMAimbrtJ4H1jgKVuH4Xqg==
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr15988272wml.170.1593425495046; 
 Mon, 29 Jun 2020 03:11:35 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id l190sm27355594wml.12.2020.06.29.03.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 03:11:34 -0700 (PDT)
Subject: Re: [PATCH v3 23/30] tests/docker: add packages needed for
 check-acceptance
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200626181357.26211-1-alex.bennee@linaro.org>
 <20200626181357.26211-24-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <596de056-717c-bf7e-e603-9d608c9d428c@redhat.com>
Date: Mon, 29 Jun 2020 12:11:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200626181357.26211-24-alex.bennee@linaro.org>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:37:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, cota@braap.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 6/26/20 8:13 PM, Alex Bennée wrote:
> We need additional python packages to run check-acceptance. Add them
> to the docker images we will be using later.

I'm not sure everybody is interested by that. Maybe we could add an
extra 'acceptance-testing' Docker layer on top and use these images
when running acceptance tests.

Anyway this works so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/dockerfiles/fedora.docker     |  7 +++++++
>  tests/docker/dockerfiles/ubuntu2004.docker | 10 +++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> index 798ddd2c3e0..70b6186bd3e 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -80,7 +80,12 @@ ENV PACKAGES \
>      pixman-devel \
>      python3 \
>      python3-PyYAML \
> +    python3-numpy \
> +    python3-opencv \
> +    python3-pillow \
> +    python3-pip \
>      python3-sphinx \
> +    python3-virtualenv \
>      rdma-core-devel \
>      SDL2-devel \
>      snappy-devel \
> @@ -89,6 +94,8 @@ ENV PACKAGES \
>      systemd-devel \
>      systemtap-sdt-devel \
>      tar \
> +    tesseract \
> +    tesseract-langpack-eng \
>      texinfo \
>      usbredir-devel \
>      virglrenderer-devel \
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index 6050ce7e8a8..f7aac840bf8 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -46,9 +46,17 @@ ENV PACKAGES flex bison \
>      libxen-dev \
>      libzstd-dev \
>      make \
> -    python3-yaml \
> +    python3-numpy \
> +    python3-opencv \
> +    python3-pil \
> +    python3-pip \
>      python3-sphinx \
> +    python3-venv \
> +    python3-yaml \
> +    rpm2cpio \
>      sparse \
> +    tesseract-ocr \
> +    tesseract-ocr-eng \
>      texinfo \
>      xfslibs-dev\
>      vim
> 


