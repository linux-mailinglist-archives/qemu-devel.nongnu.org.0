Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E154D8B3B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:01:07 +0100 (CET)
Received: from localhost ([::1]:46010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTp0E-0000U9-On
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:01:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nTouM-00073B-RO
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:55:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nTouK-0002Ba-DL
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:55:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647280498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=akGtW6StEt7GFCylKa1Tz/d7O76OfEjjXXdKurdh5pc=;
 b=gB6KruTxFj2Smq46Yh4dmD5rRDhGiJ98lshkFfjSGYX/q9IVLTOT8NKCKe8jsKU5fjPpMR
 Jv6h6WRO3oPb8m5cd+x16gl/DYdxxBEqOlh4WIVW8rzW0uzDOoM7EVXuIhKE5Zhj+Melmr
 x0Ta5zSKncNe6rf1pCgRbI+OLiJlBcM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-NKh_2PxyMV2Qh7AG7N0elQ-1; Mon, 14 Mar 2022 13:54:57 -0400
X-MC-Unique: NKh_2PxyMV2Qh7AG7N0elQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z9-20020a7bc7c9000000b00389bd375677so7338655wmk.4
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 10:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=akGtW6StEt7GFCylKa1Tz/d7O76OfEjjXXdKurdh5pc=;
 b=t8PiN1T9bhlL9KXuKuAI1xUc82II3I6+upou7C846vr8wZ4tQwgxeiisPXMIhWOMo9
 D7y+3TlJvO1CTljYVHLf7b73jMu9u5NkEX/jtMUSGMmwZBo+9nnGQ2uI8oUtgglPcodZ
 GtZeBV2bnbgFmxj8skWt366CL6PWWqnqTWNhHgjuTBQjWaXlAavy6GYS8Ow+SHnmNNua
 vKlSzZfWmATPbP5H+qN3v8tW9B25yw3iTQaR/ApiU7y9MIcn9JgMRiia/PU2t00u2zSx
 375+eIN7xMX/+GeKxESrGWL+tqvsf58NiiNlB8vbTzVGImWVLFWJ55SOpDjZhAa8llXD
 pbzg==
X-Gm-Message-State: AOAM531p5tdKBgQttVGqNYO8KOYUp1ZCd1PQDAfcjdC67z53vGBNiPA6
 fyMLHwqFooICBB7uAkbLG9vP3E4QTuMCmdznjySsmPfNcuaruG2R68QH+MP8yXPUx92VyAUsVNX
 PiDH83rNJvdvhGR8=
X-Received: by 2002:a05:6000:1687:b0:1f1:e5ad:7643 with SMTP id
 y7-20020a056000168700b001f1e5ad7643mr17255597wrd.117.1647280496580; 
 Mon, 14 Mar 2022 10:54:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwXSW9RM2cnmKXTivTW1m1AhM3GWyEA9b/KGBgHYMSJNPjpnorStOOPdzxBD93qhuGQiQJqw==
X-Received: by 2002:a05:6000:1687:b0:1f1:e5ad:7643 with SMTP id
 y7-20020a056000168700b001f1e5ad7643mr17255570wrd.117.1647280496339; 
 Mon, 14 Mar 2022 10:54:56 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 i9-20020adffdc9000000b001f046861795sm13627344wrs.19.2022.03.14.10.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 10:54:55 -0700 (PDT)
Date: Mon, 14 Mar 2022 17:54:53 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/18] migration queue
Message-ID: <Yi+BbRJ9lbJ4ku9L@work-vm>
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com>
 <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, s.reiter@proxmox.com, qemu-devel@nongnu.org,
 peterx@redhat.com, "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, f.ebner@proxmox.com, jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Mon, 14 Mar 2022 at 17:07, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > So the test harness is waiting for a reply to 'query-migrate'.
> >
> > This should be fast unless QEMU has hung in the main event
> > loop servicing monitor commands, or stopped.
> 
> I was kind of loose with the terminology -- I don't remember whether
> it was actually hung in the sense of stopped entirely, or just
> "sat in a loop waiting for a migration state that never arrives".
> I'll try to look more closely if I can catch it in the act again.

Yeh, there's a big difference; still, if it's always in this test at
that point, then I think it's one for Juan; it looks like multifd cancel
path.

> One thing that makes this bug investigation trickier, incidentally,
> is that the migration-test code seems to depend on userfaultfd.
> That means you can't run it under 'rr'.

That should only be the postcopy tests; the others shouldn't use that.

Dave

> 
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


