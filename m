Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A665A14E593
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 23:42:11 +0100 (CET)
Received: from localhost ([::1]:40452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixIVm-0000DZ-OY
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 17:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ixIUj-0008Bq-N9
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 17:41:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ixIUi-000242-5G
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 17:41:05 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60602
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ixIUi-00021h-12
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 17:41:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580424063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aRg/X7dqk5aLtGj1TZwClNaslkOSceuIXlbHqDHzrtU=;
 b=UtGU5vj40gyLZmg77C1/5sOPuisDTFYOWUSAY1SsUVRLjhexQsUxXCcmFLc/Z2m7zLAQwt
 K/5tfD6T1VyLz1aiWyuKHmc8V96VXVJaJ4pJF4FvuTETu2dWg6wlhHGAJdya8IooJxBlc4
 k17TTqiX3EmV525KPNVsCbMUGX2sXyI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-nKXOMVxzOU2XrwugGuCSxA-1; Thu, 30 Jan 2020 17:40:59 -0500
Received: by mail-wm1-f72.google.com with SMTP id o24so1979430wmh.0
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 14:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W1CPou6KLB/Ttbe5eCDPT+1H10pUZm15fi6FhfLkREM=;
 b=iKERHoh+xWItbG+0j5rTZbANGhyh3Wk8zN1PSgsTqzrsigkuLoiw+5YeE9EKluUZGR
 +xUY2fa2dv6u2EYn+6Lap21gD4Pm3/OY5KY3LwUF6C0Nfora1nGQAcyT/lrGXF3gxEiv
 YIFtJ6jaqOV2o37M+I2Ha/pAImO9hsuddpcrtXmNiFyxb+7myqTOM6ciUzG/+okrNos4
 iqQbSVNJqcGJVRk/le4ofpcGHJkjKsdtgBNTHim6YRNy0dl21HDXmaKpksmHnOtrxwG6
 GKqyIu10esXK3/5+oe0JlHJ3y+2ttJbNcRMLtDoctwgldS1uD6LnNy4oHEzcvCvJI0vb
 o68Q==
X-Gm-Message-State: APjAAAUyIBqq6J8WjQGQsU5op+ZgUh+KVdnUqH2nX15BSKyPRn2gErfJ
 1W5hOuwWOkNpoBpt4XUxrGyrYV+x4ovlIv40O33NI0xaafDMaeO5wWRUFjepDHPexrI0YKlzc5a
 cyx1NlFFZxm+/+Ig=
X-Received: by 2002:a05:6000:367:: with SMTP id
 f7mr7842979wrf.174.1580424057914; 
 Thu, 30 Jan 2020 14:40:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqwekNRlwTvgqRxbUaxx28xw7GpvIlLqTpGMbo37YkW///k1rgT/bWPCKLsP+fYJ85I51iM8Qw==
X-Received: by 2002:a05:6000:367:: with SMTP id
 f7mr7842966wrf.174.1580424057709; 
 Thu, 30 Jan 2020 14:40:57 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id x21sm7845066wmi.30.2020.01.30.14.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 14:40:57 -0800 (PST)
Subject: Re: [PATCH 5/5] python/qemu: qmp: Remove unnused attributes
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20191227134101.244496-1-wainersm@redhat.com>
 <20191227134101.244496-6-wainersm@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e31d3dfd-d398-d4f6-2d6c-f4ee0bc3d9b4@redhat.com>
Date: Thu, 30 Jan 2020 23:40:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191227134101.244496-6-wainersm@redhat.com>
Content-Language: en-US
X-MC-Unique: nKXOMVxzOU2XrwugGuCSxA-1
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
Cc: ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/27/19 2:41 PM, Wainer dos Santos Moschetta wrote:
> The `error` and `timeout` attributes in QEMUMonitorProtocol are
> not used, so this delete them.
>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>   python/qemu/qmp.py | 4 ----
>   1 file changed, 4 deletions(-)
>=20
> diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
> index 6d55f53595..cddb94bb3c 100644
> --- a/python/qemu/qmp.py
> +++ b/python/qemu/qmp.py
> @@ -45,10 +45,6 @@ class QEMUMonitorProtocol:
>  =20
>       #: Logger object for debugging messages
>       logger =3D logging.getLogger('QMP')
> -    #: Socket's error class
> -    error =3D socket.error
> -    #: Socket's timeout
> -    timeout =3D socket.timeout
>  =20
>       def __init__(self, address, server=3DFalse):
>           """
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


