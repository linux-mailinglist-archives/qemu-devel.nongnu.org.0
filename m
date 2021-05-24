Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EC238F35F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:58:46 +0200 (CEST)
Received: from localhost ([::1]:60612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFmm-0008NJ-FF
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llFkc-0005Wz-Ty
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:56:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llFkW-0008FS-Fx
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621882583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9RkkZweqkEv10x5FtSVmm+ejgtXt8OElsZyec07uoXU=;
 b=ZKIuxR2begZ/4xmKnNpz/J+M5dtgqwVuKtPYHeJNS1qwG9fXxLyxpi00V7884GfdOtJX+g
 DB1fQVyuydp/uJ6QjF7Fb5g+CEychshq+NzGy18D7ovMrRifDNAdqLrZdoRx2S/3exGpfT
 ocGBqiFmCuba5CemT9JGNI2u6xpwoMc=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-qTwtmmjvN_O2iGzEjDSgLw-1; Mon, 24 May 2021 14:56:22 -0400
X-MC-Unique: qTwtmmjvN_O2iGzEjDSgLw-1
Received: by mail-vs1-f70.google.com with SMTP id
 s22-20020a67c3960000b02902364d2f502bso11273046vsj.13
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9RkkZweqkEv10x5FtSVmm+ejgtXt8OElsZyec07uoXU=;
 b=Erop0UhNZiJJaAtneIGLGVbG2X3SW0F0KZxkFaklpph63kGoYMQ5KJHUxrke5aQNCR
 CVC5OXCZfweYO3MsBtWwy6SIFhS0H/cFhsQh+6aytvFqzqkP07Rag7Es5kv7IrNN9v7H
 FEgXG+5mRU8UtHb4RylM0OvdbmlKBJQHF/w9Cd4/7Ufps+jXgTeHgPLtunD6ouCwY6rm
 kwOm2MnHh0jJqlXkA53bg7t8/vNM24S1HpS/xzVqb7oP2/f7Qda9ypFAVuarIHGVpM1T
 lDeGHFdfqPaDdZ/MsGr794gjrUqIRYNE+hbM4zmFo3og7Bo6qNJ73VMXTPCIxMZZjt0i
 fIIw==
X-Gm-Message-State: AOAM531sIIu9HuzTDG4RZB5iivcXivBwlrhQOFqL3knu8dAN+xzrXONb
 a2nhcM2cqtMmXMebP6aqUC8hFA4I2uRrKuME3AwZrRka6ksl8KighDZsb8G0mDfPK3sO1tc39ch
 Mn5g42kOfsVEkZF1iAfE0VaRtiRoC5FA=
X-Received: by 2002:a05:6102:2f3:: with SMTP id
 j19mr22527677vsj.1.1621882581155; 
 Mon, 24 May 2021 11:56:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL6+kR8i5FDgFjq2HfAwyo4Y2wEKmdobheko2OynUFl2plOThKYMbV3cx0430iZjE0QG8uWkU6BPoT8fNpv7g=
X-Received: by 2002:a05:6102:2f3:: with SMTP id
 j19mr22527670vsj.1.1621882580966; 
 Mon, 24 May 2021 11:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210520204747.210764-1-willianr@redhat.com>
 <20210524175057.GA1567491@amachine.somewhere>
In-Reply-To: <20210524175057.GA1567491@amachine.somewhere>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 24 May 2021 15:55:54 -0300
Message-ID: <CAKJDGDbURnRGGbEwNxnkWhvu31W-LWUaRR8TA0mypJDZW1m=iA@mail.gmail.com>
Subject: Re: [RFC 0/1] acceptance tests: bump Avocado version to 88.1
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 24, 2021 at 2:55 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> On Thu, May 20, 2021 at 05:47:46PM -0300, Willian Rampazzo wrote:
> > CI pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/306904401
> >
>
> While not related to change in Avocado version (I've verified the same
> behavior with 85.0), we need to investigate (further) one of the jobs
> getting stuck here:
>
>    https://gitlab.com/willianrampazzo/qemu/-/jobs/1281481564#L79
>
> Would you care to take that task?

Sure, I can do that!

>
> Thanks,
> - Cleber.


