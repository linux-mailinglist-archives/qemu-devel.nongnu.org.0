Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ABC547EE3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 07:25:15 +0200 (CEST)
Received: from localhost ([::1]:52924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0cZd-0003xr-EI
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 01:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o0cWa-0001v1-Eo
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 01:22:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o0cWX-0006H1-Ts
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 01:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655097720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G4C6jB15mWtJNdgHMqLRQuph73Zk3iuHTTHjnjEKKVo=;
 b=XMOOAwfcBh+AJ7BqCUhKKfaTU3pzKmQKLudJjWtVyNA/VG2tfRQdWg5oXIc3v/nQiQVG/S
 llRZypyOegVdUVjlLSOdYsq8Ni/2ykPXBqER2lV1Kj+f5rGIIKQlXhreGrImqbadWKHQkU
 5HCg1obL7BrreVFZ9D7oYqFgE336B6M=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-TErZyPMDPkOeAa4d2bd53A-1; Mon, 13 Jun 2022 01:21:58 -0400
X-MC-Unique: TErZyPMDPkOeAa4d2bd53A-1
Received: by mail-qv1-f70.google.com with SMTP id
 kl30-20020a056214519e00b0046d8f1cd655so3174737qvb.19
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 22:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G4C6jB15mWtJNdgHMqLRQuph73Zk3iuHTTHjnjEKKVo=;
 b=MarOM6ebHJ/gH1S6OdjGYn/ekvGRmAh7MskiUNBxxkoeFTcrBIqUmFfGOqBcCTgXkG
 qILOCqko+QX6Dp+DtGGmTWHXfCEWyVmhBzq+J9VX7kNfRYk1nC8IFWYJA7Zc7sopDIvV
 87FTiTFydtGWBuGUat6NaxTWmjA1Cc6re3py5TDFPED42ZGnqq+uM3kD3j3ryDiiumMO
 kmp+ykKwQAVjG3C2OSBeSpNCSaJy2LO8/ngtyfO+D/IHkvi9lYwAHostWj869zdyC7Xp
 HOIQDQ5PYFUB+ZVcpcZ0lZDH02qpOSaqji+8T8juOPkrSCRXCCMEqyL1C6TYA8QV01vj
 rpXg==
X-Gm-Message-State: AOAM532wGxAgsrACfnJLoBj5tv8lkXlC9lt2GWCMIhUYp0WrfOmOQ+kv
 wR7RILbOTgdighJG+/VYhyCNUO7JU8i2L/xYdqS5kYvwIXr4j8ay0SncNb01Zva7ajL2p+ucbpo
 ySKFG3qR2d72ldTU=
X-Received: by 2002:ae9:e414:0:b0:6a6:8fc8:d9b4 with SMTP id
 q20-20020ae9e414000000b006a68fc8d9b4mr35243613qkc.390.1655097718190; 
 Sun, 12 Jun 2022 22:21:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi0UnKNJNnoAT0EAto8+Z8NqW/zkmTqNJ86P0rJ5wPmnUiizG6WJbDDM0TKF7+4CCuipdmyg==
X-Received: by 2002:a05:620a:254f:b0:6a6:313:3ccc with SMTP id
 s15-20020a05620a254f00b006a603133cccmr38173990qko.716.1655097707519; 
 Sun, 12 Jun 2022 22:21:47 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-115-130.web.vodafone.de.
 [109.42.115.130]) by smtp.gmail.com with ESMTPSA id
 2-20020a05620a040200b006a7502d0070sm5794463qkp.21.2022.06.12.22.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jun 2022 22:21:47 -0700 (PDT)
Message-ID: <8e8e08c6-3d4b-a63a-dbdc-9fd9559d7181@redhat.com>
Date: Mon, 13 Jun 2022 07:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: vm-build-haiku.x86_64 failures
Content-Language: en-US
To: John Snow <jsnow@redhat.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <CAFn=p-bmPm7xA0R4r4RahWQmOMUd=zr4x5nEAnk4aCZHkPXiAA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFn=p-bmPm7xA0R4r4RahWQmOMUd=zr4x5nEAnk4aCZHkPXiAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 11/06/2022 02.16, John Snow wrote:
> Hi,
> 
> on today's upstream of b3cd3b5a66f0dddfe3d5ba2bef13cd4f5b89cde9, I am
> seeing failures with the Haiku VM building test:
> 
> FAILED: libqemuutil.a.p/util_cutils.c.o
[...]
> ../src/util/cutils.c: In function 'qemu_init_exec_dir':
> ../src/util/cutils.c:1019:9: error: unknown type name 'image_info';
> did you mean 'g_info'?
>   1019 |         image_info ii;
>        |         ^~~~~~~~~~
>        |         g_info
> ../src/util/cutils.c:1023:16: warning: implicit declaration of
> function 'get_next_image_info' [-Wimplicit-function-declaration]
>   1023 |         while (get_next_image_info(0, &c, &ii) == B_OK) {
>        |                ^~~~~~~~~~~~~~~~~~~
> ../src/util/cutils.c:1023:16: warning: nested extern declaration of
> 'get_next_image_info' [-Wnested-externs]
> ../src/util/cutils.c:1024:19: error: request for member 'type' in
> something not a structure or union
>   1024 |             if (ii.type == B_APP_IMAGE) {
>        |                   ^
> ../src/util/cutils.c:1024:28: error: 'B_APP_IMAGE' undeclared (first
> use in this function)
>   1024 |             if (ii.type == B_APP_IMAGE) {
>        |                            ^~~~~~~~~~~
> ../src/util/cutils.c:1024:28: note: each undeclared identifier is
> reported only once for each function it appears in
> ../src/util/cutils.c:1025:32: error: request for member 'name' in
> something not a structure or union
>   1025 |                 strncpy(buf, ii.name, sizeof(buf));
>        |                                ^

I think this likely has been broken by commit 06680b15b4ee3184b57
("include: move qemu_*_exec_dir() to cutils") ... Marc-André, could you 
maybe have a look?

> I can't seemingly get older versions of QEMU to build right now in
> order to do a bisect, and I can't find a version of the QEMU tree
> where this test actually works.
> 
> Alexander, do you have any information on this test right now?

The Haiku test has been working fine two month ago after it has been 
updated. See commit 63021223ff2d3d ("Update haiku test vm to R1/Beta3").

  Thomas


