Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED47316119
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 09:33:49 +0100 (CET)
Received: from localhost ([::1]:59416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9kwW-0002LS-1P
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 03:33:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9kuv-0001sp-9B
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:32:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9kuq-0000Wb-SP
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612945923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LsZ40j6vwLNYdgbdsd2Z0HxtNB+eYL/k3BBgqIncgOM=;
 b=edIxg/QLksnw6Rek3YzemDe7LmQ4asiZv438fGYNS2uGi/fXAoHTxyqCRu6RVVSc21zVyh
 ZnyvsR+kk8eGiHqscksCUPyXP4olLa/vg6uctetb9gasRvMLHHa0HsXXhjEZfc/72QBy/X
 fZS5U9x45t93ngW/YlT5iPzagtoShJY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-WttqOW0vPDOErMhbOXnbZg-1; Wed, 10 Feb 2021 03:32:01 -0500
X-MC-Unique: WttqOW0vPDOErMhbOXnbZg-1
Received: by mail-wr1-f70.google.com with SMTP id s15so1280345wrt.14
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 00:32:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LsZ40j6vwLNYdgbdsd2Z0HxtNB+eYL/k3BBgqIncgOM=;
 b=RfcjoeETEPb5uF3Nza4W0q6quNRe+rrZERQAgNIWdm3dVnn2q2n6Nek4QU4nMwaGJR
 Ytn8UunfRpGR9lkdVReCftUG0fdTfHR3ABYMdRrOJVH9yMjtsJpTGV2t/kR1Q5yjDFsq
 s816NxaqzJTLsASBEcid4DAiZoAvYH4OQPOmbd6TF40wP0xyYdoWR9vcbAK6E5RgTGC4
 izHZ6e4ORMbfZ/P/U58IunN1nkQbU9EuYUIKS/qfSuNrCp5ZYpugK05jkIHtR83hTU71
 P3ewLcxRcLJ+bQ9w84+0Ig8hEsM7WY0RC+caQjAwALvtbnewDrQLe8+Dem0SdQQhq8CP
 tJcQ==
X-Gm-Message-State: AOAM530jqMptoaNd0IecqI2Uajy8vktYB9IpLfc+OzYq+0T54kTt1aHS
 8aMhLm6DL5OEDJfz39aFixDBpA7FAMfdEUkjJ/1Yt1E6g1WOQ11OShCdksdnpRKCI49+6/RNuCP
 +PeTtHRGWPzO30O0=
X-Received: by 2002:a1c:c242:: with SMTP id s63mr1906212wmf.9.1612945920433;
 Wed, 10 Feb 2021 00:32:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyL7xzfCEcLLOxPH+SKV5B7tUzCi2je5rT3ZqTq5hi6kQKD9fYWqDF1jBK1Xj3kL0KuJVm9UA==
X-Received: by 2002:a1c:c242:: with SMTP id s63mr1906197wmf.9.1612945920293;
 Wed, 10 Feb 2021 00:32:00 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id r11sm1590558wmh.9.2021.02.10.00.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 00:31:59 -0800 (PST)
Date: Wed, 10 Feb 2021 03:31:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Isaku Yamahata <yamahata.qemudev@gmail.com>
Subject: Re: [PATCH v2 6/9] hw/i386: declare ACPI mother board resource for
 MMCONFIG region
Message-ID: <20210210032931-mutt-send-email-mst@kernel.org>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
 <ff52a5969a6666235745d7e067f5fb500a8c70fb.1612821109.git.isaku.yamahata@intel.com>
 <20210209165241.5ba1a953@redhat.com>
 <20210209200258.GB28049@private.email.ne.jp>
MIME-Version: 1.0
In-Reply-To: <20210209200258.GB28049@private.email.ne.jp>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com, qemu-devel@nongnu.org,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 12:02:58PM -0800, Isaku Yamahata wrote:
> > > +     * When the method of _CRS is called to determine MMCONFIG region,
> > > +     * only port io is allowed to access PCI configuration space.
> > > +     * It means qword access isn't allowed.
> > > +     *
> > > +     * Device(DRAC)
> > > +     * {
> > > +     *     Name(_HID, EisaId("PNP0C01"))
> > > +     *     OperationRegion(DRR0, PCI_Config, 0x0000000000000060, 0x8)
> > > +     *     Field(DRR0, DWordAcc, Lock, Preserve)
> > > +     *     {
> > > +     *         PEBL, 4,
> > > +     *         PEBH, 4
> > > +     *     }
> > 
> > why are you trying to fetch it dynamically?
> > what prevents you from getting MMCONFIG address in QEMU when building
> > ACPI tables and encode _CRS statically at that time?
> 
> My motivation is to prepare for TDX where ACPI tables will be part of
> measurement. I wanted ACPI tables to remain same irrelevant of chipset
> configuration which guest can change.

I mean we are encoding lots of things like PCI description which is
guest controllable. Is there reason to think mmconfig specifically will
change after measurement?

-- 
MST


