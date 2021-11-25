Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700BC45E1D8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 21:51:12 +0100 (CET)
Received: from localhost ([::1]:49264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqLi3-0003nd-1g
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 15:51:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mqLgz-00031i-Vc
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 15:50:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mqLgt-0008Pq-NT
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 15:50:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637873397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=20Ifpa+X5UBOBL4Mf4expTrLucx2wPZ6xW8+89va9bY=;
 b=IQPQ/71p22kyLSvrwPGnWhjr3L6Na2uu8vuTBW9UPJrmGq/a0XzDRtfnI5iTWkTzlijsuy
 gRwreQNGuCARLSvgG22t2x62CMiitns3zOQpV2BGk25f3xzvy0CZgBdFqgHe33esUvj1rg
 ijKNFK9THreEspyqK6KighRg0I7tPRE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-105-Awgit_nbMjO9QrSB7YXFSA-1; Thu, 25 Nov 2021 15:49:56 -0500
X-MC-Unique: Awgit_nbMjO9QrSB7YXFSA-1
Received: by mail-ed1-f71.google.com with SMTP id
 d13-20020a056402516d00b003e7e67a8f93so6298075ede.0
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 12:49:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=20Ifpa+X5UBOBL4Mf4expTrLucx2wPZ6xW8+89va9bY=;
 b=7luDrtGIdTZrQVK6pnVfOdvgvSOaLzHLA+5QkuGEQ/gj30wutrhSkp/WwEs4V+0Y7d
 BzvP72ZJ7h6XzNTrkajd+zv6VzQ9Fwp23fHOYmfZvzMwuMAiw3VacwAx7h2jerYN7Kqv
 VoEGJEmGvLP0zyr4uBw+0/9Jk0xBSXtFJeT/MsYIX7cyLp3TNnjFOHrXLzd1Gk1rvesv
 qj1kk7QQlU9zvkiAxF8ulOmkoV2f/irO3hFZo1CZZC/vOSwjbNLvCQEodpHg37bRX4Nj
 LFMf4EwwQlUpiJqypKo6v8YKQZ7t7soRc9b0Kjd9c74eYFJRqfVOd6mXE6DlP+Fd/KY/
 Kzaw==
X-Gm-Message-State: AOAM533CwGk6nFCRnk9ZfkJPncGwGqLs1B/FQYqraNbo5acDgD43VBgn
 F7m+OAhGnywfiZqlbX6x0tO3djnrPM/z47WXq5/ZCdRHG8Yd4SoCvWawInHWm1hBRe1oLdybo9F
 uA9mHwLxP8DF3ydk=
X-Received: by 2002:a17:907:d22:: with SMTP id
 gn34mr34423918ejc.195.1637873394869; 
 Thu, 25 Nov 2021 12:49:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6Go3CJ9gM9C/NdDwbwqYk/tCIDqptOu6nlb1WRBW4fYwgwgRwlkAVCgqUNSo8BWliHo+FgQ==
X-Received: by 2002:a17:907:d22:: with SMTP id
 gn34mr34423895ejc.195.1637873394643; 
 Thu, 25 Nov 2021 12:49:54 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:e87:2d40:4ed4:5676:5c1a])
 by smtp.gmail.com with ESMTPSA id d3sm2584936edx.79.2021.11.25.12.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 12:49:54 -0800 (PST)
Date: Thu, 25 Nov 2021 15:49:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH-for-6.2] docs: add a word of caution on x-native-hotplug
 property for pcie-root-ports
Message-ID: <20211125154927-mutt-send-email-mst@kernel.org>
References: <20211125120629.187014-1-ani@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <20211125120629.187014-1-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 05:36:29PM +0530, Ani Sinha wrote:
> x-native-hotplug property, when used in order to disable HPC bit on the PCIE
> root ports, can lead to unexpected results from the guest operating system.
> Users are strongly advised not to touch this property in order to manipulte the
> HPC bit. Add a word of caution in the pcie.txt doc file to document this.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Do we want to generally document this for all "x-" options?

> ---
>  docs/pcie.txt | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/pcie.txt b/docs/pcie.txt
> index 89e3502075..e1f99f725f 100644
> --- a/docs/pcie.txt
> +++ b/docs/pcie.txt
> @@ -262,11 +262,26 @@ PCI Express Root Ports (and PCI Express Downstream Ports).
>          Port, which may come handy for hot-plugging another device.
>  
>  
> -5.3 Hot-plug example:
> +5.2 Hot-plug example:
>  Using HMP: (add -monitor stdio to QEMU command line)
>    device_add <dev>,id=<id>,bus=<PCI Express Root Port Id/PCI Express Downstream Port Id/PCI-PCI Bridge Id/>
>  
>  
> +5.3 A word of caution using hotplug on PCI Express Root Ports:
> +Starting Qemu version 6.2, PCI Express Root ports have a property
> +"x-native-hotplug" ("native-hotplug" for Qemu version 6.1), that can be used to
> +enable or disable hotplug on that port. For example:
> +
> +-device pcie-root-port,x-native-hotplug=off,... etc.
> +
> +The "x-" prefix indicates that this property is highly experimental and can
> +lead to unexpected results from the guest operating system if users try to use
> +it to alter the native hotplug on the port. It also means that the property
> +name and its behavior is liable to change in the future and is not expected to
> +be stable across Qemu versions. Therefore, end users are advised not to change
> +the value of this option from its default set value or use it in the Qemu
> +command line.
> +
>  6. Device assignment
>  ====================
>  Host devices are mostly PCI Express and should be plugged only into
> -- 
> 2.25.1


