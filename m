Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E8158099
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 18:09:00 +0100 (CET)
Received: from localhost ([::1]:36556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1CYN-000729-3I
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 12:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1CT0-00025h-Cm
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 12:03:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1CSy-0002pF-U5
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 12:03:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27740
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1CSy-0002ot-PV
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 12:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581354204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PltalCh91sZEwyrH93DAz7mZjcsH4pChA5yTbNFaIE8=;
 b=SPPg1bZ9Bu1MnFKrzD7GhAbyJX26qrXtKnjFgU1p0RH/S0NbvAHARl9PJSGoIVbM1IevG5
 P6mjH/5q0JSi5R3NEOw2Ydu7aFmontXf41v+AcWrcyfU5g3sV+KjuoDWBmTNfr1/BExI7d
 Ue+AQ37pIjqO6YwqzHBZmClz1QxODns=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-Z3un5-JdMOCPz472PNqpqg-1; Mon, 10 Feb 2020 12:03:08 -0500
Received: by mail-wm1-f70.google.com with SMTP id m18so619wmc.4
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2020 09:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CsVN9YzWEcVWH16CgE8Vfz796Et/lOyp88xvd4FoXvo=;
 b=P3lTZrxeR34QkOvmLeBPHB8U7BGouHvsYi5YHyYt5dyiVQs709YW242SkUdVfsMV99
 lMIGBu4cCTh4A/esPJCloZsdAjKiwLyTTPo6rGBIuLkS9pU+mQvAGVmdw4ChvUwl+tqe
 oN/sQVRV0UuU5qeDj0IE8ZiEV06nxeoyYfW/zUbyZ0h0JxK15dqfYGRKk7P4dNxIPaOH
 2IOXDFo0bIE9VBbQ+MegljJtgVfx62LZb0E/dGSxRCfv7t+bSISx79i+hfAYhO3OVkhB
 L+PiEtp5v4daxjbTf4SRBHbok7dhsHWvX8Yzl1uR2B0XWw2JwNd6O0cy4ZL1e7CoHAbH
 RHgA==
X-Gm-Message-State: APjAAAUvRdlTLgx6/kpDNyjkpJk2SqdunZoBh5BJcO6xLHc/kNHlpmzz
 eOhHFpTVwt6vMsMcLKkW3Pc4Y/CeWIDHGq4W35AuNCwVl/HM9rz8yeVmmb5sXpnpAeYThfAgQNQ
 FfBcDCPnvG6FYM+4=
X-Received: by 2002:a7b:c459:: with SMTP id l25mr15964368wmi.17.1581354186794; 
 Mon, 10 Feb 2020 09:03:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyjxi5JRSclbxLv8vy+CFA+U7o59oIZNL/uRie/nMbgicDXjIahYewxMdP8xD5xBc0pBm+pg==
X-Received: by 2002:a7b:c459:: with SMTP id l25mr15964354wmi.17.1581354186604; 
 Mon, 10 Feb 2020 09:03:06 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id n10sm1406880wrt.14.2020.02.10.09.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 09:03:06 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Add Philippe, Alex and Wainer to the
 Gitlab-CI section
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20200210155115.9371-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <70ca97cb-1075-5618-fdcf-85d530bbba1d@redhat.com>
Date: Mon, 10 Feb 2020 18:03:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210155115.9371-1-thuth@redhat.com>
Content-Language: en-US
X-MC-Unique: Z3un5-JdMOCPz472PNqpqg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/20 4:51 PM, Thomas Huth wrote:
> Initially, I was the only one who was using Gitlab while most developers
> had their git trees still on other systems, but that has changed nowadays=
.
> There is now much more interest in the Gitlab-CI today, so it would be
> good to have more than only one maintainer / reviewer for the gitlab-ci.y=
ml
> file. Alex, Wainer and Philippe kindly offered their help here, so let's
> add them to the corresponding section in the MAINTAINERS file now.
>=20

Thanks for the trust.
Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>

> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: Wainer Moschetta <wainersm@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 3 +++
>   1 file changed, 3 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e72b5e5f69..64ef7a1906 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2743,6 +2743,9 @@ W: https://cirrus-ci.com/github/qemu/qemu
>  =20
>   GitLab Continuous Integration
>   M: Thomas Huth <thuth@redhat.com>
> +M: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> +M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +R: Wainer dos Santos Moschetta <wainersm@redhat.com>
>   S: Maintained
>   F: .gitlab-ci.yml
>  =20
>=20


