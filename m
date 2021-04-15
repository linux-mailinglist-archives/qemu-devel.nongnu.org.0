Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9463604DA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 10:49:58 +0200 (CEST)
Received: from localhost ([::1]:57110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWxhF-0002tp-NF
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 04:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWxfM-0001ub-A8
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 04:48:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWxfJ-0001GS-4Q
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 04:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618476475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVtmZzheO9Oa1pBV94skLClviApHHj/2pwF8Et10MDA=;
 b=dCoWe/4dfnHBjm9MjDy0npUDr+dXBle+ZDsQ/099JdC37be6b2mhvLfotmg0GTnomshtwB
 UW6ZUsAjEv/o9b5BV7bc83WlBI7SA0UxevT2N3utymMnbjPb2qR5i5fLFR1TkJMY6W/6th
 Nm9IQ5dCwSQILvKrA3IU8fSplnRnY7Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-SAVO-oVjMGOZODafsi0haw-1; Thu, 15 Apr 2021 04:47:54 -0400
X-MC-Unique: SAVO-oVjMGOZODafsi0haw-1
Received: by mail-wr1-f71.google.com with SMTP id
 d15-20020a5d538f0000b02901027c18c581so2385582wrv.3
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 01:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aVtmZzheO9Oa1pBV94skLClviApHHj/2pwF8Et10MDA=;
 b=AAg635tpmVsOuXc8PK+xtESfVPSibpJnKWys18GA4kE1QhuZ4sHvk7QkYtUVt4bb8L
 dVU2JdWgtSJgspMj8yLzHQpxOVxA31GmOj3aWoQYwWXTflx5zHRczOORZp9qYDj98OjH
 lrh3vUU2k+fhjF4hGinFUoCQi4l9SoCdoQ7rrhrzhF4w7fITCX0VKL7cb7z4OGbSb2B1
 j3cNH+Bp16zjlreqCDccexg626kt1jbAjDuoSpOlF2hgaMyC/y2jU3+fyqXhk/LIUQd/
 5RplWCdnnXkNAGMMi01mvZmspd6Be/qoqFc47euOWr6db9qulUVFl0+gULDZtr5bVogT
 /YnQ==
X-Gm-Message-State: AOAM531YrM7j4q3cTi/JI3PKKGh/8/AllwuEL1f0tFFK8Laz2yIniy02
 fF00Okh75riYX6Abxxe1hMOvqgnZFsb1QMGfHZlxgUIiu+89TtFvSop/BkaJKiltXMhvD9BXR+2
 rY+j5IsvIfDOCfOY=
X-Received: by 2002:adf:e603:: with SMTP id p3mr2268100wrm.360.1618476472896; 
 Thu, 15 Apr 2021 01:47:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrbsIHD/nFY6rsvtT2kmCsUvJ79VDzZj0xb0eF94vh5J2yyqin9sP/otnFBnC/lMbJp+DoHQ==
X-Received: by 2002:adf:e603:: with SMTP id p3mr2268084wrm.360.1618476472734; 
 Thu, 15 Apr 2021 01:47:52 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id e13sm2229194wrg.72.2021.04.15.01.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 01:47:52 -0700 (PDT)
Subject: Re: [PATCH] include/qemu/osdep.h: Move system includes to top
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210414184343.26235-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9825b00a-f332-aa5c-8223-e33d5b1f5f8d@redhat.com>
Date: Thu, 15 Apr 2021 10:47:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414184343.26235-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 8:43 PM, Peter Maydell wrote:
> Mostly osdep.h puts the system includes at the top of the file; but
> there are a couple of exceptions where we include a system header
> halfway through the file.  Move these up to the top with the rest
> so that all the system headers we include are included before
> we include os-win32.h or os-posix.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qemu/osdep.h | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


