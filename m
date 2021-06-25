Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4503B3FC7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:51:45 +0200 (CEST)
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhYu-0001aJ-Tk
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lwhY3-0000uI-L4
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:50:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lwhY2-00015A-1d
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624611049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h39BBZH0j5+9TSxR6UfabDbH8P14musJtvsXWENAVFI=;
 b=Bg9wdl9p5l/6IISGgiWVU6WI+bjWNSE9aATGXbQgJMBx1E6X1WnvmbtPyhNcwND1V+r5Cu
 HCPoDiFPS5gFwHhm4vpjnCz4MrCIUaVXuK9inSsqIlg0NHJytts/W5Xk6n6MUkcYI4llhX
 XO8MOoz0pXJ4B7T1ez534JzIpwQVkAU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-2vlccYWqM6WXg0DrJLNofQ-1; Fri, 25 Jun 2021 04:50:48 -0400
X-MC-Unique: 2vlccYWqM6WXg0DrJLNofQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 w1-20020a0564022681b0290394cedd8a6aso4791554edd.14
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h39BBZH0j5+9TSxR6UfabDbH8P14musJtvsXWENAVFI=;
 b=MsmdWqFhNnk6fVd5tlGV3ICB452Ziwik/X4Ow3vTO+JTRyHSVsoe/zaGPiXbdaZHQn
 VfzyejrxzMbIZw8xyqRQNtjYnwA7AopUpCBndut8mj1zB4SXHE48gnBKyEoeaKb9xVdU
 tI1HUIcxFK7fGPE7gidRYZ9JMVWPRwSPf+noi0MQu8WAPikXDPSYeP/O2qIIoBW3D3dL
 jrjYfoQYLJXtY5fTmnhgVniIDpaHbAoq3Mcqfq0nvYBog0chRdRBBL0fOiwcgrdU+ZxZ
 g4Kcy7cJufr9FPRdkUltMiYPeOVE3EgEVJHtyJ4D9Wv1WjTpOFCndDwXeZWtpG5IGfWU
 dxKw==
X-Gm-Message-State: AOAM533p1emhUTk/qLRJMKvBKIyvrpCnELFcZeb0r0ruCpFGdvzlDYsK
 y4dJ2GBC/iMQ4GrQdnio3lF1dKx8BMnOtxtpKvLuLqNBpUPdoWSWHUnQuMpa2JBMA/h72bPL6X1
 q43SRLz7oN2tdnyW/pndx3sFMMIOG7XUkBfHrHbeMu6YOVHDMXed6o+jdXEkoytJbNYo=
X-Received: by 2002:aa7:d74d:: with SMTP id a13mr13208548eds.43.1624611046662; 
 Fri, 25 Jun 2021 01:50:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCkB+aNqYio70oxsl+UGix1ZBZ9n7FGNp2Nr5v3jKBVUT+PtyrOQQ2hL/RN6Omzjmh8cSPtA==
X-Received: by 2002:aa7:d74d:: with SMTP id a13mr13208521eds.43.1624611046430; 
 Fri, 25 Jun 2021 01:50:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u21sm2411500eja.59.2021.06.25.01.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:50:45 -0700 (PDT)
Subject: Re: [PULL 09/12] configure, meson: convert libusb detection to meson
To: luoyonggang@gmail.com
References: <20210623121424.1259496-1-pbonzini@redhat.com>
 <20210623121424.1259496-10-pbonzini@redhat.com>
 <CAE2XoE9XWqyt3VM-miUdUy-+=nwNEPnUMgk62ea7Fv6eF16cOw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <91cd2b0f-8caf-f2b9-8022-3eddfcb96828@redhat.com>
Date: Fri, 25 Jun 2021 10:50:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAE2XoE9XWqyt3VM-miUdUy-+=nwNEPnUMgk62ea7Fv6eF16cOw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/21 04:09, 罗勇刚(Yonggang Luo) wrote:
> 
>  > +if not get_option('libusb').auto() or have_system
>  > +  libusb = dependency('libusb-1.0', required: get_option('libusb'),
>  > +                      version: '>=1.0.13', method: 'pkg-config',
>  > +                      kwargs: static_kwargs)
>  >  endif
> 
> Hi, I am not sure if it's right, but I think the dection may need 
> convert to this:
> 
> ```
> if not get_option('libusb').disabled()
>    libusb = dependency('libusb-1.0', required: get_option('libusb').auto(),
>                        version: '>=1.0.13', method: 'pkg-config',
>                        kwargs: static_kwargs)

No, Meson knows what to do with feature objects passed to "required".
With Meson 0.59 however it will be possible to write

   libusb = dependency('libusb-1.0',
                       required: get_option('libusb').disable_auto_if(not have_system),
                       version: '>=1.0.13', method: 'pkg-config',
                       kwargs: static_kwargs)

without any if.

Paolo


