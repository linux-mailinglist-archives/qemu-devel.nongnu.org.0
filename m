Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53256500DDC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 14:43:51 +0200 (CEST)
Received: from localhost ([::1]:39692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neypC-0005Nf-D4
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 08:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1neymm-0003A7-B6
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 08:41:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1neyme-0000CW-Qh
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 08:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649940061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vWhF3n3IEbHOUm5LXY6bNJX2RqL6gvGnt9sWIHyMTL4=;
 b=Pj3g2JhXO8J7BU1ZI3FwigB95eNcRwcBhcY4umCuGuvV+SIOFBzLXlKHYphqWEqHmqZdnO
 Qsd9TnYK+KrgGz6p/JLgImIniUbXeXJtOR8ofzoX2IkvTHPMjPwRK/NmpF5QGgpURpHDVC
 orp3fj/6IkXTXVxGpBRJMe6zHXhknMg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-Cb0q-N28Oeudz8EfnRxWGw-1; Thu, 14 Apr 2022 08:41:00 -0400
X-MC-Unique: Cb0q-N28Oeudz8EfnRxWGw-1
Received: by mail-wm1-f69.google.com with SMTP id
 f12-20020a05600c154c00b0038ea9ed0a4aso2186754wmg.1
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 05:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=vWhF3n3IEbHOUm5LXY6bNJX2RqL6gvGnt9sWIHyMTL4=;
 b=0CrG2aTfjO54MVYGTh4pCCNlvqOqXVyPWjwErRCqKZA6zmnrxa1tG+X6zF8cb1qG5z
 VDnfGFCu29TQSTKmODeCmDAa5rI2ig47hmQEAHRJdp3mb31Dqmmc57tGW4RDbbbGtlFp
 dKH8fZxATmTA4TI2awwtV4fxcTjPPaAa3ZsB1EhXlJkY14OrT4jzLwr+e1Mbf53uU3n+
 mSO604faoGOyG1BqCzuotthwBxOqv9hobcMoNmyba0osNu6A6aKDPr6wL4CHvyOl4tBH
 O7MAQrgsezwWlQA7Ixmwj2bXjCzbrekpEvx68UJ33htlinI7v//NwiUm7KT0qmRIDViU
 DWmQ==
X-Gm-Message-State: AOAM532Yf9uTKyK6wfTlmWKdlofhZcnh2drVnoOl8JtLIO0U9D6dG2ax
 1UG0eZm05fy6euPQtHIm3s3QdjodZOaE6LkhcGIvsotJ8pjM4VGJhVJIzGlav2AZo40GWziYo3l
 KSWNzaqRhf7qC5JcGFUnO3UoXGSmXUH3+GvAybXXXDiX7Q4/YwR+lGNGtJLbd5v0=
X-Received: by 2002:a05:600c:3b9f:b0:38e:c8c6:ae12 with SMTP id
 n31-20020a05600c3b9f00b0038ec8c6ae12mr3414728wms.136.1649940058963; 
 Thu, 14 Apr 2022 05:40:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6Mq3K1iMEj8iPBPNTlxs51vAJIW+phLzARmY6ZHZ1yPDmJ3Jf7wOTwuagpWGlLQRzvhMbHw==
X-Received: by 2002:a05:600c:3b9f:b0:38e:c8c6:ae12 with SMTP id
 n31-20020a05600c3b9f00b0038ec8c6ae12mr3414693wms.136.1649940058562; 
 Thu, 14 Apr 2022 05:40:58 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6b43000000b001e317fb86ecsm1667457wrw.57.2022.04.14.05.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 05:40:58 -0700 (PDT)
Message-ID: <8232b917-6fcc-6508-5eb1-d313c73966e8@redhat.com>
Date: Thu, 14 Apr 2022 14:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] tests/qtest: Run the fuzz-sdcard-test only on i386 and
 x86_64
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220414122834.652103-1-thuth@redhat.com>
In-Reply-To: <20220414122834.652103-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/04/2022 14.28, Thomas Huth wrote:
> The fuzz-sdcard-test is currently scheduled for all targets,
> but the code limits itself to "i386". Move it to the right
> list in meson.build and allow it to be run on "x86_64", too.
> 
> While we're at it, also clean up the wrong indentation in
> fuzz-sdcard-test.c (it was using 3 spaces instead of 4 in some
> lines).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/fuzz-sdcard-test.c | 6 +++---

Oh, well, I just noticed that the other fuzz tests have the same issue, to 
(they only work on x86) ... so never mind this patch, I'll create a new one 
that moves the other fuzz tests, too.

  Thomas



