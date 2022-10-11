Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9345FAD46
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 09:13:56 +0200 (CEST)
Received: from localhost ([::1]:58136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi9Sd-0005aa-Er
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 03:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oi95e-0001pz-Tg
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 02:50:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oi95a-0004SM-9B
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 02:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665471005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ODNWiZG+c+PiPSoqvIcQN509t43MEXIAkMuwOSRBXI4=;
 b=ZLHjjOBNyl9kruVrUY9aCtQCnz4v7nji5Z8rq4tAVo7r8gSitRsU6ABgI+I0axfYybav0a
 G0xQX26LavUD4Ej6sQOLnvSVIKH/nPkKn/DN+1wCum5CaTHVD0iqlRhK6yCoECJ1A2nh34
 7TOVzTtwLV3DdhQEw5xB6xvNdwJu5Q4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-AEY9nD4jPYecnGgMBnl6oQ-1; Tue, 11 Oct 2022 02:50:03 -0400
X-MC-Unique: AEY9nD4jPYecnGgMBnl6oQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 f9-20020adfc989000000b0022b3bbc7a7eso3479542wrh.13
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 23:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ODNWiZG+c+PiPSoqvIcQN509t43MEXIAkMuwOSRBXI4=;
 b=MFvCWQW8gSFmFPT5LUFnxipdA9iUFJ89tqQ/StVnCp1REryi7XTOUASSagKAiPaThj
 moanL0NJ8ZfD0W34V4IN3ycwfiG1IWfaGVIlkGmJ3FuwZF7yx3Og7eHULEyFyFSe7Ip6
 3N/s/Vv8Nk67Ic8D6Vnm0CQ+xw/H+E0r1v8zqDwxPFYpXD74Ih7om4kV54pN3Ro7ftO9
 g87cdT++JMqqzEPx7uFfxfCgpfYM0BX9g4LPAPYEWfz9XPnrH/I4eU9e4Nyzegi992FW
 eVrurjOcvVFYLNavEitUeKU0mUjTMe+A5VPKJFHJTDHBAyfel0ioVT39e7UJgJMwfSEw
 8a/Q==
X-Gm-Message-State: ACrzQf34faEcD95iHJE6AKjRKFMaryNL7+3n/PDBVc/rMGFqlPs5vPEF
 0hO1nJwuuVkuxE1G0QXbFa8zYCv2XEyfM5VCc8Sfa733RAj3O3VElhGQhMETm0ooJpNBfjmwTvO
 dnWcWxkNAYRL5Z2E=
X-Received: by 2002:a05:6000:170b:b0:22e:44d0:6bae with SMTP id
 n11-20020a056000170b00b0022e44d06baemr13630354wrc.99.1665471002656; 
 Mon, 10 Oct 2022 23:50:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7U2Bm6e+HkDUAKitQed6hhHHwe7l7vqZnlWHUVJRXQfK5SnvN6TOqrFTDx2+hyCihPpXpQbQ==
X-Received: by 2002:a05:6000:170b:b0:22e:44d0:6bae with SMTP id
 n11-20020a056000170b00b0022e44d06baemr13630345wrc.99.1665471002428; 
 Mon, 10 Oct 2022 23:50:02 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 m5-20020a056000180500b0022f40a2d06esm8068609wrh.35.2022.10.10.23.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 23:50:01 -0700 (PDT)
Message-ID: <e48006dd-6952-e9c8-272f-999064cf4991@redhat.com>
Date: Tue, 11 Oct 2022 08:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20221010160957.40779-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] s390x: step down as general arch maintainer
In-Reply-To: <20221010160957.40779-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.007, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/10/2022 18.09, Cornelia Huck wrote:
> I haven't really been working on s390x for some time now, and in
> practice, I don't have time for it, either. So let's remove myself
> from this entry.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   MAINTAINERS | 2 --
>   1 file changed, 2 deletions(-)

Cornelia, thank you again very much for all your s390x work that you did 
through all those years! If you ever want to come back to the heavy metal 
computers (those that you cannot throw that easily through a window ;-)), 
you're very welcome to send a reverting patch for this one here!

Queued to my s390x-next branch:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


