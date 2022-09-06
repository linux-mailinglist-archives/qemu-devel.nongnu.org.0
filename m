Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9525AE8BD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:51:16 +0200 (CEST)
Received: from localhost ([::1]:46460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVY2s-0002lF-PP
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oVW5Q-0006qb-9W
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:45:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oVW5O-0001vG-OZ
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662461141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S4bCCwvBNX4RRpCpzC2JOgGmx6mm6iGrmXBRrUBQcCM=;
 b=EdaMxe9SBiIt11lRKnF3gRutc58+Nb7YVEXp2eNYkf3zkKreaR+/DBhm7cY+j8Y0qKX/cX
 wirGcNu6b/gMucwVKc6xmN6nrO+fBNjkCrtNs2JnedSAkjR8bOaiuGBDBqa46ktlpRuIH2
 Dyt5Sc6zmhzo3ZVkU1OlJbEH59C6kLo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-XFmPri5UNvCbjvAT3Ezypg-1; Tue, 06 Sep 2022 06:45:40 -0400
X-MC-Unique: XFmPri5UNvCbjvAT3Ezypg-1
Received: by mail-ed1-f72.google.com with SMTP id
 b13-20020a056402350d00b0043dfc84c533so7293799edd.5
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=S4bCCwvBNX4RRpCpzC2JOgGmx6mm6iGrmXBRrUBQcCM=;
 b=7tHqGfSzVGKAg21sy6oK55om3o0lsGfk510qyQ0Z0anl/sZ8Crw3kMxEt/C6LMd3ER
 kmhYDwRmE9yffuq1yzqFhj/k/IfUIJQAPdzJZ/HNY7EnX/RztbTqtbNoPCIbmyrXyfN4
 /uU+A2KMwkJDx1naFLLiHqX9KrvWSPaLFY9I90n8dRKT3sc0Ecwoqh8aYVTqOCZ73uLk
 J99/C4bO9U5PM5h3W3ZY4IODTC10s7a2BPVKy5FZ1gV6GYZo6yCJRu1yv1pHxLMe7jPu
 sqnP+ksUycaFj0RdHq0N5LJzGVtUDn92jIZ0Cr84z0KDDpwkDAxxcMJ5SkxgfyEOqR06
 FFmQ==
X-Gm-Message-State: ACgBeo1CP8w+bvHuLqTWibAuXMcVHivk2p7szwPxFNnQ1HXZqe2FmsVM
 k1H62PyuSeWAveQaiO0XyFnXI1KSXKcRaQ37kihkfDiHR4mulmTUchMaXUy2b9YSmhC9ZhYEMBe
 LJbTAzBzNOkUu8Qg=
X-Received: by 2002:a17:906:b305:b0:742:1e04:998b with SMTP id
 n5-20020a170906b30500b007421e04998bmr11820380ejz.571.1662461139689; 
 Tue, 06 Sep 2022 03:45:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4gcTgU5JNShJy0WUU9uTEwUKtQf3OcvbXdl1zoOm0oMqVyvFc/WOhomCkaa3lDEmZ7ReFROA==
X-Received: by 2002:a17:906:b305:b0:742:1e04:998b with SMTP id
 n5-20020a170906b30500b007421e04998bmr11820363ejz.571.1662461139493; 
 Tue, 06 Sep 2022 03:45:39 -0700 (PDT)
Received: from redhat.com ([2.52.135.118]) by smtp.gmail.com with ESMTPSA id
 h1-20020a1709062dc100b00740f1a58e0bsm6541773eji.30.2022.09.06.03.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:45:38 -0700 (PDT)
Date: Tue, 6 Sep 2022 06:45:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 1/2] x86: only modify setup_data if the boot protocol
 indicates safety
Message-ID: <20220906064500-mutt-send-email-mst@kernel.org>
References: <20220906103657.282785-1-Jason@zx2c4.com>
 <20220906063954-mutt-send-email-mst@kernel.org>
 <CAHmME9oyf5MmZ4gXkbm+dA3t1NBYB6XdPrk8N1OyKLi5Lke0Rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9oyf5MmZ4gXkbm+dA3t1NBYB6XdPrk8N1OyKLi5Lke0Rg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, Sep 06, 2022 at 12:43:55PM +0200, Jason A. Donenfeld wrote:
> On Tue, Sep 6, 2022 at 12:40 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Sep 06, 2022 at 12:36:56PM +0200, Jason A. Donenfeld wrote:
> > > It's only safe to modify the setup_data pointer on newer kernels where
> > > the EFI stub loader will ignore it. So condition setting that offset on
> > > the newer boot protocol version. While we're at it, gate this on SEV too.
> > > This depends on the kernel commit linked below going upstream.
> > >
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: Laurent Vivier <laurent@vivier.eu>
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > > Cc: Richard Henderson <richard.henderson@linaro.org>
> > > Cc: Ard Biesheuvel <ardb@kernel.org>
> > > Link: https://lore.kernel.org/linux-efi/20220904165321.1140894-1-Jason@zx2c4.com/
> > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> >
> > BTW what does it have to do with SEV?
> > Is this because SEV is not going to trust the data to be random anyway?
> 
> Daniel (now CC'd) pointed out in one of the previous threads that this
> breaks SEV, because the image hash changes.
> 
> Jason

Oh I see. I'd add a comment maybe and definitely mention this
in the commit log.

-- 
MST


