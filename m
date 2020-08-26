Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97F72527AC
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 08:47:06 +0200 (CEST)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kApD8-0001Un-2F
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 02:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kApBR-0000KG-RJ
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 02:45:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kApBP-0002zU-MH
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 02:45:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598424317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LjOTBcPTLweCn0HhPxT0y8Z7PQBicT+lw7ToInE54Lg=;
 b=hWz9q5cgLLf/2lbW7Z25moHsqWPaTFk1DaVFyKSgAYG7/Gii7RgljPm9QIgofKcutgOKKJ
 9i+8KgNjeg5umQTR7IJPBXk9Polae4CPr5LUA3UQondpHKr0PHREfivKD6kdaDdcw5c1zS
 HeB3qFRfO+4xpq9aZeuv/8xPMMhW4Jg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-z8d222OgNAewfpINv4QJWA-1; Wed, 26 Aug 2020 02:45:14 -0400
X-MC-Unique: z8d222OgNAewfpINv4QJWA-1
Received: by mail-ej1-f69.google.com with SMTP id f13so501290ejt.16
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 23:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LjOTBcPTLweCn0HhPxT0y8Z7PQBicT+lw7ToInE54Lg=;
 b=Le4WXgoV415vHiAtbpnjMFyrq63m1P/v/AEV7VfkNV4T1Njt75+7kgtuLc19723Ci3
 2sO5Cmw57+Bz0HUV1KOfIVDOVac2tOsqK5phR4acmv6P8AlxYE8WygaQcqPvQrW4N7Dk
 JNBQZOEfIoe6p6JBI0kWnrCE+kXZGk/c9FDTkuM94Jco5Btpx0KtzrL6OekS/xxjIMMv
 XoJtjT8curIqR02TdwNVxNJUtymSNbqMBQIMMdLmgUdzhWMINYlF64zLeols3JMszZnx
 hLEVhDBLOh5VEWOrvH5DIKcctSkJW3cHKvzexuMFHtu69wCtfaOmIQcp2UrhbfxsBKxm
 5/qg==
X-Gm-Message-State: AOAM532w2Iu7TOrOipbvM8e4/LnWiQrChcJIOmt1W6Pe4tBKvRUuguVo
 3EZwGgEG/Ihi7dsxf5XFg6yWIdJ9j9ffQF1qKbdjsK98XVc4RwJapQu6FtkiwsuAMLxFjGzV3Ia
 sTzzqwuNzKCUHo6H8zDbm864ky0XjEA8=
X-Received: by 2002:a17:906:1cc5:: with SMTP id
 i5mr11685358ejh.449.1598424313571; 
 Tue, 25 Aug 2020 23:45:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTzgRqE9D2X83Y7VHXhcP5aV/P2ddh9e+BMz+27AFiPNjIWVzpF7y4NiuNB/tEoHBbxbLxCr3GyPzuC8O+vXQ=
X-Received: by 2002:a17:906:1cc5:: with SMTP id
 i5mr11685336ejh.449.1598424313350; 
 Tue, 25 Aug 2020 23:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200825165341.520-1-luoyonggang@gmail.com>
 <426ddc96-c26d-e762-0598-7ae61c711d8e@ilande.co.uk>
In-Reply-To: <426ddc96-c26d-e762-0598-7ae61c711d8e@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 26 Aug 2020 08:45:02 +0200
Message-ID: <CABgObfb4K8=5Ydkhx2px+kfDwb8SmQ97LFpsaNbRbU6U0rvXwA@mail.gmail.com>
Subject: Re: [PATCH 1/4] meson: Fixes the ninjatool issue that E$$: are
 generated in Makefile.ninja
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 02:45:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: luoyonggang@gmail.com,
 =?UTF-8?B?RGFuaWVsIFAgLiBCZXJyYW5n6IyF?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 25, 2020 at 11:26 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
> I've tested this and it changes build.ninja so instead of Windows paths beginning C$$
> they now begin C$ instead e.g.:
>
> build qemu-version.h: CUSTOM_COMMAND  |
> C$:/msys64/home/Mark/qemu/scripts/qemu-version.sh PHONY

The patch should not change build.ninja in any way, but indeed it will
fix the transformation so that the (correct) ninja quoting is removed.

Paolo


