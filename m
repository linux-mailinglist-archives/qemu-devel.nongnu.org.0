Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ADB5EDD19
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 14:46:17 +0200 (CEST)
Received: from localhost ([::1]:44986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odWS7-0000Sk-8L
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 08:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odU4h-0000MD-Me
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 06:13:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odU4e-0000W7-J2
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 06:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664360031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Kx/0+4brUhV9MfNkPkQjAqrfM4t60WDhwduNP5UsfY=;
 b=Qm+OnFBATgLcaiTrjVHL9UjHS9evGNW3W1C7cwvT6NKICs0EYuSrCJUNtzYonuMe8d4eOz
 1xeh6RAyxl5zGl3ahb/7s9iABMeLIQig4wGsZ95Ka4VP4Xmjyzij3vS5mGmLFle2zzzdM/
 dxRYk5J3Iou+ZsuMnVXa8syJMieMhlY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-nlbz4X7sMJu2yIC3cYqbVA-1; Wed, 28 Sep 2022 06:13:50 -0400
X-MC-Unique: nlbz4X7sMJu2yIC3cYqbVA-1
Received: by mail-wm1-f69.google.com with SMTP id
 t14-20020a1c770e000000b003b4856a6ecaso406588wmi.2
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 03:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5Kx/0+4brUhV9MfNkPkQjAqrfM4t60WDhwduNP5UsfY=;
 b=wdu4S4yppWTZQ1HM7J0DRowwjzoOUN7o7d9lLp0E30lewlvghrH+er3AJEFGkS0vSH
 ZnSWmZCeCYQVoTeocvamtgRN25mnZbdcx8fYxAOnVEahoD9sXaeZLKG36kZh2UPB1eK8
 cIh6NOrK1Enfl2SbW3ljnxAVD16ZW+D0BL/m4URJK9Oa1m62DiDFFVCTrI4S12/mUH1d
 n+MBImAw/sWPIrEYsDn+pnQUMohYMu+oACn8qXsasmzlcSfhIzAeJkn0II7Mu9rCDnYc
 eC99D7TXqiZ1vEjthSruIpvsZVoozZghaeXnqNI2+/w175XtPtUl+9Ogzyz727nCSQgk
 QWTA==
X-Gm-Message-State: ACrzQf2Dy/9/v/BsJGZbgJ47zKYcV2WuMPzcMqqKr0CeHSjKa35bFag6
 JKDF9dNn3v4xuPrcvzBXp6ZKfMIHrQR7MM1m8z0dNFrM0FZvF9Xgf+YObBmF2+rM7poQFkNvgji
 1s5Pce8gbVsk/DSE=
X-Received: by 2002:a5d:6504:0:b0:228:c94b:a5bb with SMTP id
 x4-20020a5d6504000000b00228c94ba5bbmr19258687wru.623.1664360029085; 
 Wed, 28 Sep 2022 03:13:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4DmE9UBMzHJ7WFLEJwDF2BXcuso1cQpIHL3sV0o+J+e6lpbb6C6CZ6eOKcucQ5/jKjqfbaow==
X-Received: by 2002:a5d:6504:0:b0:228:c94b:a5bb with SMTP id
 x4-20020a5d6504000000b00228c94ba5bbmr19258664wru.623.1664360028884; 
 Wed, 28 Sep 2022 03:13:48 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 a22-20020a05600c2d5600b003b332a7b898sm1186760wmg.45.2022.09.28.03.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 03:13:48 -0700 (PDT)
Date: Wed, 28 Sep 2022 06:13:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220928061303-mutt-send-email-mst@kernel.org>
References: <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220928052352-mutt-send-email-mst@kernel.org>
 <YzQVyj5ouhGshZ2+@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YzQVyj5ouhGshZ2+@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, Sep 28, 2022 at 10:37:14AM +0100, Daniel P. Berrangé wrote:
> There's also the perenial problem that developers frequently send
> patches that mistakenly include submodule changes, which is related to the
> way that 'git checkout' doesn't sync submodule state when switching branches.

Do you happen to know how exactly that happens?

-- 
MST


