Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E741555E3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 11:37:25 +0100 (CET)
Received: from localhost ([::1]:53740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j010n-0007pn-0p
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 05:37:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j00zK-0006kK-D7
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 05:35:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j00zI-0000g9-9w
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 05:35:53 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59925
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j00zI-0000fm-5Q
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 05:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581071751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zoIXvVlTDYgAdaKUsMt2nGzAG3tVwwT39gFdOs1W1e8=;
 b=FbEaOOQ2kR1vslpzN0c4chZ1Z4cY3gR7dY+KfaPlXy95X0KfSGt+DbwrCItlqoNuKJRQ7d
 n93kHsCR0V8pKINuB+JFx+KElN7LxKpaTl3Ta2Q9O6kuIs9KwLeQtt0KhCuKER7A1x9vgi
 +HtWSCnMJTp7gpSgC7uRerQiu/l+j8U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-0CkZnLjSOz2oKlWyAlhkAg-1; Fri, 07 Feb 2020 05:35:50 -0500
Received: by mail-wm1-f72.google.com with SMTP id g26so539641wmk.6
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 02:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zoIXvVlTDYgAdaKUsMt2nGzAG3tVwwT39gFdOs1W1e8=;
 b=gRzsezLU8t5e+s3BtuOEDk0XyGQW6Fo0UDdBgTjZi0N9KwePXhwopNOjc+O8+w2Wr3
 z7VADgFEUVMVqHHIIRbjkykNZtJPgXHY3rvbzDAYUaxp5H339JDDg2cNUwKc37tOj9O5
 XH757J5Xtfdc+6x1L317bBC4/NVapXn67T9fNJmUfxxKZsNT3vEevPrwK2XMqriPc+PJ
 lV7SGyeY5wQrSerFXxffVwKIuwU3/z4WF32ThtK373BTEJwmP6MMZ1USJdQTcgmmSPaC
 leD6roqqIK3UqEC4gQc65i9+JYzDPtbf1Dj1LfJTu3mhSKI8Zk/4xfbq2aHk5jPf7nJ7
 4cHw==
X-Gm-Message-State: APjAAAUN3TeIpBXaTmJj9e44OMGkCv8rHtgedOLTm+1Fbed2Za27q45Y
 g9OBZq8mnbuVSSzWJNSdj7+y8qtJrb8/Bu59zqBOU6B2dtHoytZaSn69bXIWplpsQaYu6jznrFP
 eXd0+E1POKnVOWxM=
X-Received: by 2002:a5d:6191:: with SMTP id j17mr3813900wru.427.1581071749140; 
 Fri, 07 Feb 2020 02:35:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqxbY5vtO42Zl8xzlSJCfHTwbD5RwP8kCZz05tOTNjdyM9k4fuy6GRtHPpDXjqgxETeYcGOC6Q==
X-Received: by 2002:a5d:6191:: with SMTP id j17mr3813880wru.427.1581071748896; 
 Fri, 07 Feb 2020 02:35:48 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id h13sm3161576wrw.54.2020.02.07.02.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2020 02:35:48 -0800 (PST)
Subject: Re: [PATCH] ppc: function to setup latest class options
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20200207064628.1196095-1-mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e77a2a7b-ed74-7584-4751-711b115e98c7@redhat.com>
Date: Fri, 7 Feb 2020 11:35:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207064628.1196095-1-mst@redhat.com>
Content-Language: en-US
X-MC-Unique: 0CkZnLjSOz2oKlWyAlhkAg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/20 7:48 AM, Michael S. Tsirkin wrote:
> We are going to add more init for the latest machine, so move the setup
> to a function so we don't have to change the DEFINE_SPAPR_MACHINE macro
> each time.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   hw/ppc/spapr.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 02cf53fc5b..4cf2a992a5 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4428,6 +4428,12 @@ static const TypeInfo spapr_machine_info = {
>       },
>   };
>   
> +static void spapr_machine_latest_class_options(MachineClass *mc)
> +{
> +    mc->alias = "pseries";
> +    mc->is_default = 1;

But we can have only 1 default per QEMU binary... How PPC manage having 
multiple defaults? The first or last listed is choosen as default?

> +}
> +
>   #define DEFINE_SPAPR_MACHINE(suffix, verstr, latest)                 \
>       static void spapr_machine_##suffix##_class_init(ObjectClass *oc, \
>                                                       void *data)      \
> @@ -4435,8 +4441,7 @@ static const TypeInfo spapr_machine_info = {
>           MachineClass *mc = MACHINE_CLASS(oc);                        \
>           spapr_machine_##suffix##_class_options(mc);                  \
>           if (latest) {                                                \
> -            mc->alias = "pseries";                                   \
> -            mc->is_default = 1;                                      \
> +            spapr_machine_latest_class_options(mc);                  \
>           }                                                            \
>       }                                                                \
>       static const TypeInfo spapr_machine_##suffix##_info = {          \
> 


