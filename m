Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C30E44442A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:02:01 +0100 (CET)
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHm4-0005uj-9z
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1miHfr-0006cr-UK
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1miHfp-000521-ER
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635951328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8kzQfAiqITk1P9AjMJGcJ6T70nSL+QMF3ezxesN8OUI=;
 b=RUCQ5yFAIXBUlffFKAg0DYkSwzI5N+UAQ3X2NzpVPrthYOG8P/3Wd32IL79TizUT5n8MvT
 UGAObTeTx1VldTOIwXVM4cXKWEwwDMLIifY34kddjIp2f/CEyzb3GMruUSn7yBRFG/vJ2M
 BPDqYK6QG5Sz2BLKN7l9XFhkq6lJ70k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-3Kgee6ksMgiYbXBfFy8Zlg-1; Wed, 03 Nov 2021 10:55:24 -0400
X-MC-Unique: 3Kgee6ksMgiYbXBfFy8Zlg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso1213103wms.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8kzQfAiqITk1P9AjMJGcJ6T70nSL+QMF3ezxesN8OUI=;
 b=wbhQUcYrxwNybQw9ddjZwf4wkiwVVjSo2Vs/0AypspDQF7Mqa22KW2deW5vRTOc0p1
 ODgr6AJI/sxwhGD6ROojlAmlJlFZ2iiSPWso9gvZFFZH4OjOP8jCvSaacKUlOhatRjKJ
 QozrxMOcJCYUmpnrI6LZokhoIYtQ/6tIguo04DAmwgWsipwIElGhbLmz2YntpiNtid10
 fbGk2vx+GYogu4TOiEQkYNEKItv1rYepLbhVr5ppC5gpIptCVKVqDGn6EVbeJhyPanw1
 M52OnEi+1Vl1my50F1A1PxjAbRy7nt4LQobHVbPYS71Aq1OWeqIMOrs2ETWXCy6n/wS8
 eBiw==
X-Gm-Message-State: AOAM532gQqx2exh+u7lc4H3BfcLHUwt55Hc9Fp5tJdabBGxeK8EOoQR9
 DaWZI2AaFeP0uODfMI8C1LnaH05z/YP9RYWg3uCyDPJRAmFWCG/3PLjAfiEyfBdt+L2NHyaGX3a
 8JrCoDPVu5Yv0/Xs=
X-Received: by 2002:a7b:ce02:: with SMTP id m2mr15875415wmc.166.1635951323770; 
 Wed, 03 Nov 2021 07:55:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPqENEpHxi0nAtzoKljLqI5T1UtP1muLnjwf6uQZCvzcSkeR4VG+yjqvvl3DhnSxkHVIsd1Q==
X-Received: by 2002:a7b:ce02:: with SMTP id m2mr15875385wmc.166.1635951323601; 
 Wed, 03 Nov 2021 07:55:23 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 4sm2929910wrz.90.2021.11.03.07.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 07:55:23 -0700 (PDT)
Message-ID: <cd64744c-5a46-7fb5-1935-fae4d0c56dd1@redhat.com>
Date: Wed, 3 Nov 2021 15:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/6] docker: update 'python' dockerfile to use Fedora
 registry
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <20211103144844.1285634-6-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211103144844.1285634-6-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.528, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 15:48, John Snow wrote:
> Following the lead of 102cd5c294dc, switch from using Docker hub to the
> Fedora registry itself.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/docker/dockerfiles/python.docker | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


