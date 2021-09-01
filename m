Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131DA3FE2EA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 21:22:37 +0200 (CEST)
Received: from localhost ([::1]:39650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLVoh-0003X7-MX
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 15:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLVna-0002dS-F6
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 15:21:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLVnX-0004TP-Ma
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 15:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630524082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2BbKK/dpOlnsSVWlrLage+/1So/UThqY82SvxJoaboA=;
 b=LoUmt24o2EfCCmFyu5tREh0K+qaq/tSrfOm94IbxmXfuJZ5HkiezNUvse6B0wRfbjYhc1n
 19Ta5cfuCS9STnncGBX3qQJaG9RjayDxFtrvW3FfqN1OSA0X4/yJMfZQVF1JKgNbxuYhyV
 CW7IENOYroku6GXV7kjqnvMZNVhJDn8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-ntK3Mh4PNcen8ghlNpiRKQ-1; Wed, 01 Sep 2021 15:21:20 -0400
X-MC-Unique: ntK3Mh4PNcen8ghlNpiRKQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 bq17-20020a056512151100b003dc8a4f1ba1so211069lfb.15
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 12:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2BbKK/dpOlnsSVWlrLage+/1So/UThqY82SvxJoaboA=;
 b=B/aTeqN9ZdeyNs/b5qdCwlD5H1P07tHZoJTwwPQQAzPNQ+IqWgOhgtniVUFveDv1tT
 5Mr5JXEaBld3CvaBEyACUNr9Q1oGi6kd+FWX1CD6m8Eri+RILT/1ZaXEk9M+MOc6OzsN
 c1YjlIIQK5ZSZ3d2SHLbJIZpqBf6hfhHbha3dYL1m5NuXHwGHAkKs7Gxwq4MIWcKaH7p
 RW5hV3rYygFjblQDDRVXLwssWVcuLXnxJ9Tgu/wZxUN22xld1K594Te7P+nC3XmlCix+
 0W55l4RY6QknObZUcqSSjCt1050LlL5mxWKjm8NXcHJUYswujtZxlgqYDHXQXAiQXz9L
 4DsA==
X-Gm-Message-State: AOAM5309Dlg52snI8yMcdvgfslRgo/18Y6y84Pg7uro+nljmzGhEkr+1
 6qdbShqdF12p/DVm5k7vmivefKXChLY1osOtTxne3+sXYcuQaxPrRdJKKiLWgk32EG+OGI9ghXL
 UcOJ/0h+++YnJdY7KU3CVMfqw8B86b/w=
X-Received: by 2002:ac2:5f0a:: with SMTP id 10mr741940lfq.14.1630524079369;
 Wed, 01 Sep 2021 12:21:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxdwW36YXkSVuu9QDCT/fTuuUF8OtHhmP+b1wThAYMdo/28Ect+p9DGTrlT3OkzVvCTs9zT71ZAkvJkeOLjUg=
X-Received: by 2002:ac2:5f0a:: with SMTP id 10mr741916lfq.14.1630524079089;
 Wed, 01 Sep 2021 12:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <YS6eDrEmgq49i+1H@t490s>
In-Reply-To: <YS6eDrEmgq49i+1H@t490s>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 1 Sep 2021 16:21:30 -0300
Message-ID: <CAJ6HWG7=4Ufnretz85w7ctTPvm2CWNyQEEZ8tt7YnSrki9NHkg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] QIOChannel flags + multifd zerocopy
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Tue, Aug 31, 2021 at 6:24 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Aug 31, 2021 at 08:02:36AM -0300, Leonardo Bras wrote:
> > Results:
> > So far, the resource usage of __sys_sendmsg() reduced 15 times, and the
> > overall migration took 13-18% less time, based in synthetic workload.
>
> Leo,
>
> Could you share some of the details of your tests?  E.g., what's the
> configuration of your VM for testing?  What's the migration time before/after
> the patchset applied?  What is the network you're using?
>
> Thanks,
>
> --
> Peter Xu
>

Sure,
- Both receiving and sending hosts have 128GB ram and a 10Gbps network interface
  - There is a direct connection between the network interfaces.
- The guest has 100GB ram, mem-lock=on and enable-kvm.
- Before sending, I use a simple application to completely fill all
guest pages with unique values, to avoid duplicated pages and zeroed
pages.

On a single test:

Without zerocopy (qemu/master)
- Migration took 123355ms, with an average of 6912.58 Mbps
With Zerocopy:
- Migration took 108514ms, with an average of 7858.39 Mbps

This represents a throughput improvement around 13.6%.

Comparing perf recorded during default and zerocopy migration:
Without zerocopy:
- copy_user_generic_string() uses 5.4% of cpu time
- __sys_sendmsg() uses 5.19% of cpu time
With zerocopy:
- copy_user_generic_string() uses 0.02% of cpu time (~1/270 of the original)
- __sys_sendmsg() uses 0.34% of cpu time (~1/15 of the original)


