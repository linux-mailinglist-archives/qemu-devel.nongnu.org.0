Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA6E483E27
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:33:51 +0100 (CET)
Received: from localhost ([::1]:44004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fGQ-00039x-TG
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:33:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n4eq3-0004g2-RR
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 03:06:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n4epz-0004X9-Ne
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 03:06:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641283588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufkguumP4E1awB84m3xoHWqOGGvobaB7XXqkx+hJsRY=;
 b=WNjBLGmBRv7sy+N2bYModWDtjOnZ+poQBCb8VWMt6Dngu6twkEWw4Kzfd7K6G8WMURI1+/
 4oweyGU55j929pYjvpPVhNqDGEXSDqVEwiURmZ7XX18mieIUivx/DXBHz/QjwC9T67O0fT
 sFwTVS4y+sFPRw6AgZJ9qcGn5i1fW+Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-7ksGW-bVPISaslgTyn2NGg-1; Tue, 04 Jan 2022 03:06:26 -0500
X-MC-Unique: 7ksGW-bVPISaslgTyn2NGg-1
Received: by mail-wr1-f70.google.com with SMTP id
 a11-20020adffb8b000000b001a0b0f4afe9so11402813wrr.13
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 00:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:cc:in-reply-to
 :content-transfer-encoding;
 bh=ufkguumP4E1awB84m3xoHWqOGGvobaB7XXqkx+hJsRY=;
 b=fXU/P2gfm0uhAjHukDZCRBLwr4FRgRxzuXXzsFBL0Lxgk9NE1KzvggDqLJUdJy7Gq3
 qYVqAbTK1GQ1nAuxigd81Pnb6/rMDxA59fLwo3m2T0+omCPQOcxTicgHpJVtxhqP//L1
 W72+3svrplEy+Bixf7Q8/26zxOheFNA+m62Ai1hjJWrX/Rcd7pPBTeFhyD3ld+aSF+VB
 pdzfygH5eruSliW92jxYwNWFKdQx4R3oW1/zZych/LlORMI8gErnK1ccci863rSvcUxU
 LEgTgbphR21rVDLxGOISRdZcPpQaUvvQ5AhDHG42phb86jGaQZHCz3n51iHY2XZBWyaB
 OEdA==
X-Gm-Message-State: AOAM531z8nW+oAvL2829HKRdqix4iKyYUaq4HJWG4QaogRCzUNnQ9/26
 MPihl/zdPmNDSHZYUVNUZiLCRCrE73rggsxhbYqU+NqyV1Gn34raCvkVHn1gK97XAZv00CpWR57
 LIyxFZmX3o9PEjpbRdTXuaeJtdg14tzC8SUavC/Kh+ZpoDYw0J4WrFBMoSNBCJkQ=
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr41191597wrz.60.1641283585547; 
 Tue, 04 Jan 2022 00:06:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJwSIqAOuS0pqZr6Dwq1ZkN4Ek6697Gl+7i7rjDd/Z1eOFglSQlUOhs1klR4unPNRZ3wAFOA==
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr41191572wrz.60.1641283585279; 
 Tue, 04 Jan 2022 00:06:25 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id a20sm31704155wmb.27.2022.01.04.00.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 00:06:24 -0800 (PST)
Message-ID: <6c2b3fef-6644-37c6-c61c-a17da0de3c7f@redhat.com>
Date: Tue, 4 Jan 2022 09:06:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Something broke "make html" and "make man"
From: Thomas Huth <thuth@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <23807667-2b98-60d4-b3f8-dd571e2f5927@redhat.com>
In-Reply-To: <23807667-2b98-60d4-b3f8-dd571e2f5927@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/01/2022 21.33, Thomas Huth wrote:
> 
>   Hi!
> 
> "make html" and "make man" do not work anymore:
> 
> $ make help | grep -B1 html
> Documentation targets:
>    html man              - Build documentation in specified format
> $ make html
>    GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 
> tests/fp/berkeley-softfloat-3 dtc capstone slirp
> make: *** No rule to make target 'html'.  Stop.
> $ make man
>    GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 
> tests/fp/berkeley-softfloat-3 dtc capstone slirp
> make: *** No rule to make target 'man'.  Stop.
> 
> Anybody any ideas how to fix it?

Never mind, the problem was this one here:

https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg00222.html

After applying that patch, "make html" works fine for me again.

  Thomas


