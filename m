Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869E914F060
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 17:06:31 +0100 (CET)
Received: from localhost ([::1]:55378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYoP-00068Y-ET
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 11:06:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46862)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ixY96-0002Na-4w
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:23:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ixY94-0003yj-8D
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:23:48 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:28048
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ixY94-0003yb-4c
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580484225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JBxfr8tqLIX7BgeKnayr4sSQv21BdomsOj0F4ouHTEA=;
 b=GAP0YSBSsnnp3p/xgfZCWf3ufC/hpZ1YEy9uO5lD3KW9/fVyWi9S3tyUCoZdWjkA5PqD60
 WAl+pgiVhW231NTdiEns7+swTfI9oUU/tmLHc736kDR7WGNp9gL4kSwuE1/Dvh60tbBaEQ
 7kGFzUzfBQW57sHc8D52nEgne/N8/pA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-TJnfRr7-Okq5blDh0-A8vQ-1; Fri, 31 Jan 2020 10:23:43 -0500
Received: by mail-wm1-f69.google.com with SMTP id z7so2180758wmi.0
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 07:23:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8J2ZikQbzKKB9kr05CSrJUGqFnWUQ3TPfFhD0DMhDdc=;
 b=eB0ZWZQtZVH0BAzgwtVk9ucdP1sxHWZM6wb7F1+7XII+tTr9/bieTGlGWBjCiLnk+r
 iH5HuUYPMNWwYGdpzExotNqIqh88SA12wfaHC+7JI1nqq41Hkokz7tvKw0wdbNONuKqu
 v/Hv1Q86R2s3sIYPaWD4uhOL+FEKxQ6b2pQi9v2y7zopCXATR0YznBv9QVHTOgq5v4tQ
 LS1pJx9XPXFHgLOqjAR15o4cED0mCj95tVMIotJfFW6AUctX1hPoy03tI3T1v9K492bR
 VcvR4aPYdxB6QE/XVH2WWUU667ko5eZngdNZuLw4lMRSuWUWh5YLJ68gc1LPXrAqCnHS
 nsNw==
X-Gm-Message-State: APjAAAX5VJUT+/Ue04BilbBaIjwYFvdHFCH8t/453H8uoCDXQj3tdcin
 cFIpRoPSxykSC+dD0rtocqBnnlRGNB5nmRXYneQCPO4atSpFDNZw5GhewmjRlJShSNHKaArd2Ps
 lrnWi7UppfCS6Veo=
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr12603414wmi.21.1580484222404; 
 Fri, 31 Jan 2020 07:23:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqyX+Ad738gjBicyPa4z3b8Cp9h0nu2EDFElF95S9gWaSWodAzT4Jr5cgrvZRGuJeWwhzzYfUw==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr12603394wmi.21.1580484222235; 
 Fri, 31 Jan 2020 07:23:42 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id f127sm11174479wma.4.2020.01.31.07.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2020 07:23:41 -0800 (PST)
Subject: Re: [PATCH v2 05/12] .shippable: --disable-docs for cross-compile
 tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200130113223.31046-1-alex.bennee@linaro.org>
 <20200130113223.31046-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b7f06863-256c-9bf9-2d76-a4b17f01646c@redhat.com>
Date: Fri, 31 Jan 2020 16:23:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200130113223.31046-6-alex.bennee@linaro.org>
Content-Language: en-US
X-MC-Unique: TJnfRr7-Okq5blDh0-A8vQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/30/20 12:32 PM, Alex Benn=C3=A9e wrote:
> The sphinx support is fairly new and we don't seem to have all the
> bugs worked out for cross development environments right now.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>   .shippable.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/.shippable.yml b/.shippable.yml
> index 83aae08bb4..2cce7b5689 100644
> --- a/.shippable.yml
> +++ b/.shippable.yml
> @@ -37,5 +37,5 @@ build:
>       - unset CC
>       - mkdir build
>       - cd build
> -    - ../configure ${QEMU_CONFIGURE_OPTS} --target-list=3D${TARGET_LIST}
> +    - ../configure --disable-docs ${QEMU_CONFIGURE_OPTS} --target-list=
=3D${TARGET_LIST}
>       - make -j$(($(getconf _NPROCESSORS_ONLN) + 1))
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


