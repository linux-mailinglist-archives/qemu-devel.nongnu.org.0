Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76383F5B21
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:32:23 +0200 (CEST)
Received: from localhost ([::1]:39238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISn8-0007zG-OJ
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mISlx-0007Ke-MD
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:31:09 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mISlu-0007a7-L9
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:31:09 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so1378562pjw.2
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 02:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=QkcwJeKOKVM4FA6eRhONiDarKN15RXvbCnsdj/0MNJ0=;
 b=znygjngdm9Xu8yU3c/1YuytRDMe2O+JsM3BHLSaERR67VoCa2b20dVvrQRgcVzafMz
 W0opppiI0unnMW6JZWsEGfLVyIglkyV3K0ENm5I26Y8mNQDbobz4ktoNUdrTICaHJ2hy
 LVzYGG/ztHIsm87LiSUF8vYNGhQqmP4TF9nEkw+qMwBE+xPCuRKiLrQNJwdVh9Y38bRD
 2qkE759xOhCRjwjux6+jLuF78cWyuJp+qDxcu5Mhk4+mOqvE8J+jC9XDd3g8Csx/TT0z
 L6IpjPmw6A7K5XFDaPHTa4Lak56/YenTKd6ug2XXv+dPt+b9KJ8HnaY10k2eOHhFFA5/
 0rAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=QkcwJeKOKVM4FA6eRhONiDarKN15RXvbCnsdj/0MNJ0=;
 b=PmzNGhPSb3DsbIoetlTqc60j85D92nLPKuEHCZj6K7YFnCnOtHmffeAwhmJqg2pvgt
 V3Tcl7lnkac3t+yLk2m91N1+rmPMqAKwlF61eEt4ua9jtYB+RGJtehYaVbBEfk8v0mVP
 q4P3ROGJHd5mELAb67Q5wJIAPUflH++yStC6ilhCq+rDSqThX1Jd/pFtNnMp4wgjqgfZ
 SxuLWrMUif4tLfypDo+oxBmGtiqYUBQOcG24PJ3lHjyDFGjYCfv5cyHTUIEdcWqKoJiN
 XWgnnaQtK+P/FPqKdMeaDgR318d5QmWLp3c7aYuiPezf8aCzJSYrHpQ3crzIJL6xrLgM
 zUzw==
X-Gm-Message-State: AOAM531C71o/j/Qq/f3J8czFbEgm/yUqamDDvq4wONpiXxZtIi/kePeN
 A9k25YR5f1aBPANJ+whBQdvhXg==
X-Google-Smtp-Source: ABdhPJzAQS7u9uRf1/WKj7iJwSE8/v8AfbrcKjOj4cOwUHPtj8eSPgUZIf1nV5wEEgrsVg+4IMnAcQ==
X-Received: by 2002:a17:90a:d3d0:: with SMTP id
 d16mr3460849pjw.103.1629797465197; 
 Tue, 24 Aug 2021 02:31:05 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.135.45])
 by smtp.googlemail.com with ESMTPSA id j35sm22302625pgm.55.2021.08.24.02.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 02:31:04 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 24 Aug 2021 15:00:58 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] hw/acpi/pcihp: validate bsel property of the bus before
 unplugging device
In-Reply-To: <20210824105614.2762541f@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2108241500110.889504@anisinha-lenovo>
References: <20210821150535.763541-1-ani@anisinha.ca>
 <20210823190444-mutt-send-email-mst@kernel.org>
 <20210824105614.2762541f@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, philmd@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 24 Aug 2021, Igor Mammedov wrote:

> On Mon, 23 Aug 2021 19:06:47 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>
> > On Sat, Aug 21, 2021 at 08:35:35PM +0530, Ani Sinha wrote:
> > > Bsel property of the pci bus indicates whether the bus supports acpi hotplug.
> > > We need to validate the presence of this property before performing any hotplug
> > > related callback operations. Currently validation of the existence of this
> > > property was absent from acpi_pcihp_device_unplug_cb() function but is present
> > > in other hotplug/unplug callback functions. Hence, this change adds the missing
> > > check for the above function.
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> >
> > I queued this but I have a general question:
> I convinced myself that this patch is wrong, pls drop it.

OK so now we have a situation where this function callback does not have
this check whereas others does. Should we drop them from everywhere?


