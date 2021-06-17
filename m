Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3066E3ABABD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:41:49 +0200 (CEST)
Received: from localhost ([::1]:57002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltw1T-0004gA-IV
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltvzW-0003tM-Ev
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:39:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltvzT-0007NM-LY
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623951583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zTMP1LPA3v2tQ9cvEQLeYruWIbI3VhtpzTcaFuUPjE0=;
 b=KwDDIT8KwwNBOo2STcadpyoiu/yQnKI33LSmATDidESla+eRSb3latmoHmvLlNj3zVGrDg
 lz5y54pZB3iLrxjaHi69EWr+Dr7gQdxYVwmOWC1sXH8SRNq2ObcT4+HpEzlsR7wwQO/W1o
 +8sacPNXR7kQSEBSe8LPNNr/X4AGNg0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-gQAYlf3qMcumWkNB3yYoKA-1; Thu, 17 Jun 2021 13:39:39 -0400
X-MC-Unique: gQAYlf3qMcumWkNB3yYoKA-1
Received: by mail-wr1-f71.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso3256994wrf.4
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zTMP1LPA3v2tQ9cvEQLeYruWIbI3VhtpzTcaFuUPjE0=;
 b=ILMG/7h9quFeqlL7JG/vTM93tun/cYwaOTeq6Pz6H57IY43etmW49V2KJXhGSySPtA
 n7g2otJtZfYvbXXtkUe06op7BBELLXYoGD63/BF2CXZWHe3LJbHqiZP0mtoeN+NfVz0m
 44dnj+/HcrKj0vXqkmyugXUB9HfLvwHjKqBnNLYd/T0JHHJwP9uYXrVO4a0b0jqMFAeB
 QrDF7u8LuThKO5Cn1mjfNDkJaGFa4emg6AX1mgmsmtN+rF8sXw5ASqp1YxhAECVEkIR3
 kwdAJ1Vlu2irYcruYIjI2WMR3pkHDKbD7Znv0eevu7MUHgKwrbGsT3qHqZAoOaqW4hQP
 TfTg==
X-Gm-Message-State: AOAM533BNjcneWxvbi3SI+WiX3A1CH6byfos9xov10gnCIj+2aodE6LO
 oZUGuNwo3ExI07ApgTrVPBAfzsvJlVUQGziXLBlYX9uQe9m0glx2A6QjoSXmfS/5De6ZzECGmPX
 Qsh1EJ5CDl4pF1Mw=
X-Received: by 2002:a7b:c005:: with SMTP id c5mr6488379wmb.113.1623951578366; 
 Thu, 17 Jun 2021 10:39:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBAiQ990TRz0SEjMMwSZTQMpolXkt5tdaneh1vvOdCyTbYD3qMdOQ9rZCUVKENGvadYXDmZQ==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr6488367wmb.113.1623951578216; 
 Thu, 17 Jun 2021 10:39:38 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b15sm7311382wrr.27.2021.06.17.10.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 10:39:37 -0700 (PDT)
Subject: Re: [PATCH v2] meson: Add gnutls as a dependency to libmigration
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20210617171958.34606-1-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e8aa2d4c-520a-543f-f12f-b4cf702ab6e3@redhat.com>
Date: Thu, 17 Jun 2021 19:39:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210617171958.34606-1-akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 7:19 PM, Akihiko Odaki wrote:
> qemu-file-channel.c may depend on GnuTLS.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  meson.build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meson.build b/meson.build
> index a2311eda6ec..29d854699ca 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2090,6 +2090,7 @@ libio = static_library('io', io_ss.sources() + genh,
>  io = declare_dependency(link_whole: libio, dependencies: [crypto, qom])
>  
>  libmigration = static_library('migration', sources: migration_files + genh,
> +                              dependencies: [gnutls],
>                                name_suffix: 'fa',
>                                build_by_default: false)
>  migration = declare_dependency(link_with: libmigration,

Please see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg816565.html


