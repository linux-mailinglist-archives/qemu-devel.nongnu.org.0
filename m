Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875FF3A8AF1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:18:50 +0200 (CEST)
Received: from localhost ([::1]:35930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGSP-0008Iv-BW
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1ltGQU-00069u-B2
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 17:16:50 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:37681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1ltGQS-0000EN-9w
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 17:16:49 -0400
Received: by mail-qk1-x730.google.com with SMTP id c5so422917qka.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 14:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=Adkeg05XtBRzj518r7ZKWMZxrJVPmHR7v4TTo/rX37o=;
 b=JB2Ixtd9HRV11sdY/bcx83EHGHYNvbhDCl/09rKsgS7cu9SILKGUKg/69UN4B00bb5
 Vu6Qikc2Nxz0N1kHm6lbxMVvpGH+Ac4bxS9uSZ362oxNw/ylom5CWT3JyNBgy4W+PK+q
 NOPbp8zptyLy5+QZTGFJkAQDifn/rEcIdPRpYSFp+MRN2Nnf4JfxTc87Pg2ft44INpfF
 K4U91ZNg33HPF7xfrUmenFioh+ijOzwVUv4JVbv2olTI+4vyhXxhvcslHlTNA7XVWg05
 e3BlHLvpvttBoply9Mq0cRUIiVRVZhU2xVUCddMXoxdUap0A8Rcou9E4a4z0NRuUzxGV
 q7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Adkeg05XtBRzj518r7ZKWMZxrJVPmHR7v4TTo/rX37o=;
 b=XSpV4kKQeIBQ2aWIpabmCkadkKPtBI4cCPIC+xsK0F3OpQHjAfmXwcjhhKCg7CUOta
 R+TfBSmG9NgFchG90Y9foD1oXCs0XLCoT4nVUBCbeNIeu9Y6d/rNTNQm0vYJ3bibXLTs
 OqlV9cCsp4CBbarboJNpME8v9uRP2/XBjh8iWDIDSnMRIsiN/5KYl+c26h0CC0U3Junf
 +ybe5QxwXWsCRKOQu+CDV6Qpci+eATPjFr3u7mNGiEl//ZP1tKqeQb3USpfZAYOXjwWc
 KPS4YXYipPoRm3cfEVjgRNqcQI8/YSJs92eMVBaYMgV5viZgyCWIhINPMvB34cAzPGsy
 eF4Q==
X-Gm-Message-State: AOAM5333tCUXb6xFkDf/J/bykPep6ViRjp89bW4R3EMWGZTXddNVRwwM
 6MljIQ48uPeG1ZGgNNDbAFI=
X-Google-Smtp-Source: ABdhPJx/hIkol9pYLGDwixjBWsQMKbZF4w0TO+CINAJByGrthH0V63juh2NKngZK3Q+kQzn+y4SmBg==
X-Received: by 2002:a37:9d4a:: with SMTP id g71mr1721371qke.126.1623791806795; 
 Tue, 15 Jun 2021 14:16:46 -0700 (PDT)
Received: from ?IPv6:2804:14c:482:87bb::1001? ([2804:14c:482:87bb::1001])
 by smtp.gmail.com with ESMTPSA id f4sm3650548qte.28.2021.06.15.14.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 14:16:46 -0700 (PDT)
Message-ID: <8d72c8b34d0eb60daab7e8099bc1f1f31f89231a.camel@gmail.com>
Subject: Re: [PULL 1/9] yank: Unregister function when using TLS migration
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, "Dr.
 David Alan Gilbert (git)"
 <dgilbert@redhat.com>, qemu-devel@nongnu.org, huangy81@chinatelecom.cn, 
 peterx@redhat.com, lizhijian@cn.fujitsu.com, pabeni@redhat.com
Date: Tue, 15 Jun 2021 18:17:26 -0300
In-Reply-To: <453116f4-9e24-41db-2fd7-5f08428eca8a@amsat.org>
References: <20210609144512.211746-1-dgilbert@redhat.com>
 <20210609144512.211746-2-dgilbert@redhat.com>
 <453116f4-9e24-41db-2fd7-5f08428eca8a@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=leobras.c@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-06-14 at 07:14 +0200, Philippe Mathieu-Daudé wrote:
> Hi Leonardo,
> 
> On 6/9/21 4:45 PM, Dr. David Alan Gilbert (git) wrote:
> > From: Leonardo Bras <leobras.c@gmail.com>
> > 
> > After yank feature was introduced in migration, whenever migration
> > is started using TLS, the following error happens in both source
> > and
> > destination hosts:
> > 
> > (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> > Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> > 
> > This happens because of a missing yank_unregister_function() when
> > using
> > qio-channel-tls.
> > 
> > Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to
> > perform
> > yank_unregister_function() in channel_close() and
> > multifd_load_cleanup().
> > 
> > Also, inside migration_channel_connect() and
> > migration_channel_process_incoming() move yank_register_function()
> > so
> > it only runs once on a TLS migration.
> > 
> > Fixes: b5eea99ec2f ("migration: Add yank feature", 2021-01-13)
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > Reviewed-by: Lukas Straub <lukasstraub2@web.de>
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > 
> > --
> 
> Please use the '---' separator, otherwise tools don't strip
> out your comments and they end in the repository, adding
> confusion.
> 

Sure, sorry about that.

> > Changes since v2:
> > - Dropped all references to ioc->master
> > - yank_register_function() and yank_unregister_function() now only
> > run
> >   once in a TLS migration.
> > 
> > Changes since v1:
> > - Cast p->c to QIOChannelTLS into multifd_load_cleanup()
> > Message-Id: <20210601054030.1153249-1-leobras.c@gmail.com>
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  migration/channel.c           | 26 ++++++++++++++------------
> >  migration/multifd.c           |  3 ++-
> >  migration/qemu-file-channel.c |  4 +++-
> >  3 files changed, 19 insertions(+), 14 deletions(-)



