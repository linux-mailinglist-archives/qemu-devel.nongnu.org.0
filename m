Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F597623010
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:22:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnpM-0008GU-Hu; Wed, 09 Nov 2022 11:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1osnpK-00089e-6c
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:21:22 -0500
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1osnpI-0006cI-8x
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:21:21 -0500
Received: by mail-io1-xd32.google.com with SMTP id 11so14338110iou.0
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CHDNhqsl0EksV51pcpMf8fBuPNknSBTldmm1flGb0L0=;
 b=zba6hIHfoHUs8Invm476VJvQPGpYvbkVeE7a8cxA+Bz7Nym4XGXrIt2OfQP2NnG4OJ
 +MLZQbXs9q0C8UpIN9z3n1hDZ5BVWerwZMbhwJ2GDYud2xwUnwZdrTOM7aJG/kTZbMuq
 7kEnTlvWkOF5+fWyVoXpP+AfK1NjYyOwwnKCeTpn9Gvuqoubg5V7XJOis/QrffUZdXOX
 A5bH59AUq9bBm2aXCv9PmIUdmNhtKdkiCqJ3vixF3JzEkcjwWZh0vdQF+yt+eENVx+6G
 XA0SlKz12C5XbKWxQwZnCUXwdt6Rj5F1sNtz3cdhI/OdjYftytnXVsM2j7EF/a+y4CZb
 T9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CHDNhqsl0EksV51pcpMf8fBuPNknSBTldmm1flGb0L0=;
 b=yXGt1gOxf5n6oNs+ngHrSm4LZecRAc3dfAjWWl6nOT74O3wlnnMy9JcNbNeKGuaxTM
 F2kvugS7ZvG7Uhl+uLPjg6kYZ3IPoBGCYmesCDLx5U3vzequfUOXUsN8lARKamTGM3GO
 7fD9cAeKzlLOCs/I74r2BRHSTbk7O1w49LX0pF8oDRR6JMgJH4c73q94rtrHPYfwm5pw
 noYJnz1OAnmzVgeYmOEcL+O67JuV/SxsfWpc0/7c3DJZyq4ve++KBfFdZdr9SIlskpCq
 QzGYwy2k2CfrYwt/gDI8W8JESvasj+VkUUzny2TBf30FWznpiWspb0OZyxFKjgTnQj5C
 uDGg==
X-Gm-Message-State: ACrzQf0xiupuJUuYnxx2Z5xRufWoXM0p3aAFZWSBsEoWc6GNA77mdmP0
 SvZ1MdDV66ln57LkkPg/Tqkl7x4J856htH7klBbUPw==
X-Google-Smtp-Source: AMsMyM68gEwd6oPsVe0pk0LouKZAkZRv8JeyA+BQ/1QYB/7uFWaX9rOG1KF9ETgOHoPeRJHJKWcS8phN2apoK3cKCzY=
X-Received: by 2002:a02:1d41:0:b0:371:2c88:1d3e with SMTP id
 62-20020a021d41000000b003712c881d3emr33868472jaj.265.1668010878454; Wed, 09
 Nov 2022 08:21:18 -0800 (PST)
MIME-Version: 1.0
References: <20221108162324.23010-1-cfontana@suse.de>
 <20221109080452.72nqppvaqj73bakl@sirius.home.kraxel.org>
 <38bf7a34-826c-26d3-5978-21da1d37bdef@suse.de>
In-Reply-To: <38bf7a34-826c-26d3-5978-21da1d37bdef@suse.de>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 9 Nov 2022 21:51:07 +0530
Message-ID: <CAARzgwwgMkGiu_NTY1O3j75cJdObjLdWwpt8KqLYSJOkMwG20Q@mail.gmail.com>
Subject: Re: [PATCH] gtk: disable GTK Clipboard with a new option
 'gtk_clipboard'
To: Claudio Fontana <cfontana@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 9, 2022 at 6:09 PM Claudio Fontana <cfontana@suse.de> wrote:
>
> On 11/9/22 09:04, Gerd Hoffmann wrote:
>
>
> Thanks Gerd,
>
> I think at least for our packaging purposes we'd rather have it as a configure time option,
> so as to not put functionality in the hands of our users that can potentially lock the guest.
>
> Is someone going to queue this, where?

Unfortunately we are on a hard code freeze at this time for the next
release. It might be better if you can resend the patch again to
remind someone to queue this up once the window opens again after the
release (mid december at the latest).

