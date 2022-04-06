Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD544F6C68
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 23:16:13 +0200 (CEST)
Received: from localhost ([::1]:55414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncD0e-0004EB-A0
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 17:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncCxb-0008Az-Ab
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 17:13:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncCxZ-0004pq-Il
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 17:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649279580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PDbQtZXFRcynaO5crIburnOO28W12ng7QswhW4regNI=;
 b=M9cgx9mBdiGmxvXnoAjdEUXadwcPlmwcMUXXuJFg/yZiGPcYBHaR+asz4sSAQh5UzaLe2D
 H03Kq9czDkd5Cb8U0IK8ZtiBX3YmJegJ8ZrrMR01jbhKSCumxdp+wgJlR15d5OI0MF6aGL
 2P+p5ejpQ0LUc5dIqb+/agDYgASCqVw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-fdDuwHRWNkOgMAp9xaDTQQ-1; Wed, 06 Apr 2022 17:12:59 -0400
X-MC-Unique: fdDuwHRWNkOgMAp9xaDTQQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg8-20020a05600c3c8800b0038e6a989925so953524wmb.3
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 14:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PDbQtZXFRcynaO5crIburnOO28W12ng7QswhW4regNI=;
 b=0OVBsDn2OsLQdZD7QPV0IZZ7dfIk6rfGNbHHYO4sauQVNtuxuu4KyIj71LqwQ85MHY
 pQ5yLKPiufQ5287jBD1R+Kcqzj3Tk550HrVHEi8GMonkszDQKAfADxglLjnac2LyfUw8
 Pi/W/Zn2OR1gHNIItLUq1xWsmKApewSraNHfZ3hP+bbc5uwry/qUK8NHk7u/hby9j0hl
 jIcTLlkLqvFsOTYBwfQBs+8NeYDTAT5fmGxm0kbhl1BCBeX5+mXmDPx+G/XX+UorCEq0
 eLs3HtDHEnwuCJjowkNkobojnUzOBELal1lkpYbQnIzfur5sB3aNHgDeC0WjDd2Rj/sC
 HUPw==
X-Gm-Message-State: AOAM5324WC10qnucKRhvTd4pxsqqYbFs4JQwcX188YUoM3osCyHpJ+7W
 m6SLJ0AH2eWXyGnNW0QJEa6RjeFSguXfh/F78+MZ1u5FXTsPBZsQ0kNTO/w0Yrjhc2zYYDSs+64
 xB1N0gjEi/KuHhUA=
X-Received: by 2002:a7b:cc15:0:b0:381:3fb8:5f93 with SMTP id
 f21-20020a7bcc15000000b003813fb85f93mr8959502wmh.106.1649279578319; 
 Wed, 06 Apr 2022 14:12:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuKsa5gmD0IGUN5sxdhA2Ib/QP4++UjKVwGT65BaWr+WDh5N461exyGJ4ZhTF9fFn83cWXcQ==
X-Received: by 2002:a7b:cc15:0:b0:381:3fb8:5f93 with SMTP id
 f21-20020a7bcc15000000b003813fb85f93mr8959485wmh.106.1649279578079; 
 Wed, 06 Apr 2022 14:12:58 -0700 (PDT)
Received: from redhat.com ([2.52.15.99]) by smtp.gmail.com with ESMTPSA id
 k9-20020adfb349000000b00206101fc58fsm9721050wrd.110.2022.04.06.14.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:12:57 -0700 (PDT)
Date: Wed, 6 Apr 2022 17:12:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] acpi: fix acpi_index migration
Message-ID: <20220406171222-mutt-send-email-mst@kernel.org>
References: <20220406185812.1055724-1-imammedo@redhat.com>
 <Yk3jILX8JfQG2ABl@work-vm>
 <CAFEAcA_mGDuzMZEz3uDyxyB9_Zp503FoLr6sdz-7hUF+CFaLRQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_mGDuzMZEz3uDyxyB9_Zp503FoLr6sdz-7hUF+CFaLRQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: quintela@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 peterx@redhat.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 leobras@redhat.com, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 06, 2022 at 09:29:02PM +0100, Peter Maydell wrote:
> On Wed, 6 Apr 2022 at 19:59, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> >
> > * Igor Mammedov (imammedo@redhat.com) wrote:
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > >
> > > vmstate_acpi_pcihp_use_acpi_index() was expecting AcpiPciHpState
> > > as state but it actually received PIIX4PMState, because
> > > VMSTATE_PCI_HOTPLUG is a macro and not another struct.
> > > So it ended up accessing random pointer, which resulted
> > > in 'false' return value and acpi_index field wasn't ever
> > > sent.
> > >
> > > However in 7.0 that pointer de-references to value > 0, and
> > > destination QEMU starts to expect the field which isn't
> > > sent in migratioon stream from older QEMU (6.2 and older).
> > > As result migration fails with:
> > >   qemu-system-x86_64: Missing section footer for 0000:00:01.3/piix4_pm
> > >   qemu-system-x86_64: load of migration failed: Invalid argument
> > >
> > > In addition with QEMU-6.2, destination due to not expected
> > > state, also never expects the acpi_index field in migration
> > > stream.
> > >
> > > Q35 is not affected as it always sends/expects the field as
> > > long as acpi based PCI hotplug is enabled.
> > >
> > > Fix issue by introducing compat knob to never send/expect
> > > acpi_index in migration stream for 6.2 and older PC machine
> > > types and always send it for 7.0 and newer PC machine types.
> > >
> > > Diagnosed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > Fixes: b32bd76 ("pci: introduce acpi-index property for PCI device")
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/932
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Applied to master for rc3, thanks.
> 
> -- PMM

Oh. I had this in my queue with a different commit log.
But sure. Feel free to add:
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

-- 
MST


