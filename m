Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02F551BC4D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:39:47 +0200 (CEST)
Received: from localhost ([::1]:39150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXxa-0001b6-QL
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmX4H-0002Dz-0S
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:42:38 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:49807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmX4F-0005Kr-F5
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651740154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lDsIMgpI/n3BOcodbYA3KixOq7rBwMDC1TALMYWBJhI=;
 b=NRd6anXNn4WSVxEfa9tuveUI2f3vtV7k46Cnxk1uQaO/womFLhrVnShRXzZ/cW2A50HuWC
 6NkVZ3KdZDTMkfMVpv1LXzyWEYcG0BMbX3Pt/KQERPumSMqmnGOmUuT60AxzaBqDWoZ0z+
 yRiUfj8c1YOVC9PdQWFnSO6P/91y+Lg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-IzYeazC3OU-h-XXUWO6YIQ-1; Thu, 05 May 2022 04:42:33 -0400
X-MC-Unique: IzYeazC3OU-h-XXUWO6YIQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 o7-20020a17090a0a0700b001d93c491131so4190692pjo.6
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lDsIMgpI/n3BOcodbYA3KixOq7rBwMDC1TALMYWBJhI=;
 b=pUDnjFK4tdIlf3ukGCNv2CbiVxDAl7ySXfQvkC+U5+AKdbPGIzZNGWcsXAFLTKWaf0
 3j3G5+9/3QycMGwLz8bCnNi91u/Cin9AiCRweArUpz8ZAK8tmG5h+UATjY0YMhquON2X
 Vk4QbSLxLgfn610pmPc/s1+KMb6bjQx8scM3zBwPDOK43V1CouMjwQmJys54tz++d1N9
 8b5dLy6AEr2LJul/UZNIY5Wak8W09CM9/exauiQ4cKf5sP1E1miDyg18dVmCSJYyQr0t
 MRHa90wKm8624bOwJaIxcDzj+Zt6pDaOmAyfVuMYEyPktBJsQjvr81oyUvCZh7ec7olW
 d37g==
X-Gm-Message-State: AOAM533tt1QYd0zjqaCx26R/5yoJNxThdQviVzsPbxVBs+SqUjSmzJTG
 ZjDKwEauHwgO1rq450fy+3Jt8HaPhX3A2Z5hsSW/bnlD5GAfo5i0CdsXdqvdMkoMHrDe3pkr/f6
 sksDjJOdFANStkxfcU7dr24WpViaYNHY=
X-Received: by 2002:a17:902:ec92:b0:15e:9c61:2acb with SMTP id
 x18-20020a170902ec9200b0015e9c612acbmr21792842plg.141.1651740152641; 
 Thu, 05 May 2022 01:42:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjVmbOX33teSsC4zaLiUM2ZS1ZBureLsAMi9pHnPuMDlcZdX50y4ml9jTqcF8hmUwv0PegWn897bPRF6IOPbc=
X-Received: by 2002:a17:902:ec92:b0:15e:9c61:2acb with SMTP id
 x18-20020a170902ec9200b0015e9c612acbmr21792831plg.141.1651740152342; Thu, 05
 May 2022 01:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220504210001.678419-1-pbonzini@redhat.com>
 <20220504210001.678419-2-pbonzini@redhat.com>
 <CAJ+F1CJgNMcVNFsctNR9MAaQ_5XojbX1J=LgjsVqyveArW6Xuw@mail.gmail.com>
 <CABgObfY=YNOPa0DjqEgWkeZZOCrOJAco1xfnmSjYSme8T=KcOQ@mail.gmail.com>
 <CAJ+F1CLKHrEUNoYoYmXw2_pDp+An1TqjhniWqoMZO3brZ1m2Fg@mail.gmail.com>
In-Reply-To: <CAJ+F1CLKHrEUNoYoYmXw2_pDp+An1TqjhniWqoMZO3brZ1m2Fg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 5 May 2022 10:42:21 +0200
Message-ID: <CABgObfbXOotyk-UX6BBEgvHzWDa8oG2M221AC=EYoWjYpxV3eQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] slirp: bump submodule to 4.7 release
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 5, 2022 at 10:38 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> Sad the CI didn't catch it. What is missing to cover it?

The QEMU CI did, but the slirp one didn't because -Wmissing-prototypes
is not included in -Wall.

> To me it's fine to update the submodule to the fixed commit, with a comme=
nt explaining why.

Ok, thanks.


