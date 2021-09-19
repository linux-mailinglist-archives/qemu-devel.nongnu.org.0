Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE46B410D35
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 21:59:49 +0200 (CEST)
Received: from localhost ([::1]:46724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS2ya-0006kX-9x
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 15:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1mS2xK-0005nm-8J
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 15:58:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1mS2xI-0002dz-NS
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 15:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632081508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=524To+0KYt1SgxevdGdLmWljabKwgoV5pVSUmS+JX8Q=;
 b=eK9YqY3nTuv7qQroqpEOgZWk3GnJNzHNuYY0kNeB0HDVT0xPUQ8cDuzYWLRfw4R8i2IRA7
 9zN7mugUJbGh/CHFrMYopxIdGtZVDSw588TMVDNdiJ5s0CQAQmf+/P/sFvapU9CbJWtPbj
 D/whBDGzQFWe1K98z0z8Usgq2HkUmX0=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-9ejF7Ji7MBivKVPHJ6M5HA-1; Sun, 19 Sep 2021 15:57:15 -0400
X-MC-Unique: 9ejF7Ji7MBivKVPHJ6M5HA-1
Received: by mail-oo1-f70.google.com with SMTP id
 j27-20020a4ad2db000000b0029ac522e7d5so30208613oos.7
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 12:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=524To+0KYt1SgxevdGdLmWljabKwgoV5pVSUmS+JX8Q=;
 b=6XGWNI1XtDjgNCpEHWVXwzvSliXcm+dD4VErc71FRIQ7IIbrO23yHX0b/s/Fakz4TA
 GVqEnNLAt1fIq3Ao9vDG+6TOWaayoxsrfeb38D1BCE2SEFmGakGxkFNZS2bGGzule+kd
 C/31YIvx5iUTC9bJc93iJGKZmFkGFEKcGi7OegO2ewLWp1ohNKRmOVOQgQNee+3fZceF
 xLctSB0Q5RveZzuKd5R7XuGJZjjD+5cTnCK5fdd5DutRKyxMS5YvIqLE+Sf41JKRnyco
 2Bu9kCkAXMBqcm+cRhK//zHyqYro2D+HEoPyKNvGuL2Bv+QPhE+wTHqhFiAWmPgnn5oG
 8LKw==
X-Gm-Message-State: AOAM532+OZko0W+5B+ezQoIDPJohUjT48iaLANB8kOf7aIGjMYK8W/Ed
 8lK2sLyzbx8/uaii7mxbU2iw8TPJW2v9vdITWDzP8WWjzrPHnuflWqVCF6jToKsLgxoSm2mNhUE
 0CPz8SDmVPz1ykv8pK5bh1bXQCU6LRx0=
X-Received: by 2002:a4a:b34c:: with SMTP id n12mr17059398ooo.19.1632081434577; 
 Sun, 19 Sep 2021 12:57:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvjyjKbq1jz9i++dlAucoC9Qdg1TRvMioATws988/kvLLoCSwMM0u6IA6MOlCtOwrq2CzLp1jbbrGn3zQTdHc=
X-Received: by 2002:a4a:b34c:: with SMTP id n12mr17059389ooo.19.1632081434357; 
 Sun, 19 Sep 2021 12:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210813205519.50518-1-nsoffer@redhat.com>
 <20210816155028.6rfmuxpdmc6yniit@redhat.com>
In-Reply-To: <20210816155028.6rfmuxpdmc6yniit@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sun, 19 Sep 2021 22:56:58 +0300
Message-ID: <CAMRbyytKnLWFm7G5-bq5A-3nny63ESoxYYQt4sigYg2c4f9Ryg@mail.gmail.com>
Subject: Re: [PATCH] qemu-nbd: Change default cache mode to writeback
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block <qemu-block@nongnu.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Nir Soffer <nirsof@gmail.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 6:50 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Fri, Aug 13, 2021 at 11:55:19PM +0300, Nir Soffer wrote:
> > Both qemu and qemu-img use writeback cache mode by default, which is
> > already documented in qemu(1). qemu-nbd uses writethrough cache mode by
> > default, and the default cache mode is not documented.
> >
> > According to the qemu-nbd(8):
> >
> >    --cache=CACHE
> >           The  cache  mode  to be used with the file.  See the
> >           documentation of the emulator's -drive cache=... option for
> >           allowed values.
> >
> > qemu(1) says:
> >
> >     The default mode is cache=writeback.
> >
> > So users have no reason to assume that qemu-nbd is using writethough
> > cache mode. The only hint is the painfully slow writing when using the
> > defaults.
>
> Oh, good catch.  Unfortunately too late for 6.1 proper, but I'll add
> qemu-stable in cc and queue this through my NBD tree for 6.2.

I don't see this in master, lost in your NBD tree?

> > Users can avoid the issue by using --cache=writeback[1] but the defaults
> > should give good performance for the common use case.
> >
> > [1] https://bugzilla.redhat.com/1990656
> >
> > Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> > ---
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org


