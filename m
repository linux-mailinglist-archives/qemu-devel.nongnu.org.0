Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230C73809DF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:51:11 +0200 (CEST)
Received: from localhost ([::1]:58950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhXHa-000371-5m
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhXFT-0001Tn-7O
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:48:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhXFL-0007T7-Vb
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620996527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pUgHarxqwom+LnES9WT05U95kaEFZivYexMy3CAnAeM=;
 b=HJVlftLMbZENayaTTE18M53JfPKySP2O4aXxnYtPvAtEZxuI10ZHzfTcxeHswpHQFVaUlO
 sNuSC/hLM3zn0Z4b6CTz6gPsVoDEswwR+afGjHfiE8IDy5Fc0m8Z/+w3cv6QbA6VIRy1jB
 0hPLO6b5VGi1+7Xx0M92jFQsz1CXSx8=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-zMudWPtpP-iIWH2k9uMSIQ-1; Fri, 14 May 2021 08:48:45 -0400
X-MC-Unique: zMudWPtpP-iIWH2k9uMSIQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 q16-20020a67d7900000b0290228198e77b6so12854181vsj.23
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 05:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUgHarxqwom+LnES9WT05U95kaEFZivYexMy3CAnAeM=;
 b=RI/vHFPHjyGEEAFB7CJ96Q5wXNBnKjHYSHeMRsw4YEV354bwPaBtD3BYhGDsFYj3p+
 O1j68eTkc6am9ooSjEUxizX/ZIJtnwF0pmrg/JlviZ5b0zR6D/HTfGvW6sOPDmUYrwg+
 T2rZ3mNEDDEIKWHtxzazuu+KkXelBzFxtzgFd+l2LCW18sePsWGVwG0Zpqxxm3ThCkFC
 9SYXFSnCIFwnrCGE/ICdE7mj7D9xgqjNrzONjjkwPW3YV7oOh1QEA1tOzdFrVWwfSoJx
 R5kv7QjZgPqH2UvhYPvqY6qNg2NiZQTD5ZZjLq/qrQeFg4k1IW4TXw7lWz7nTGIFOdRy
 RIzA==
X-Gm-Message-State: AOAM532UAhtjKBZP7yapx2lDdOJNYv1HrdAlNRPgsclPw2Sedx5NMhG9
 k1Z81pEN4iR+oilfNH6/evWubACOYx0QSs0biD7HGsM7yJs0SJHP75jCzC397ZJt9Uhf/4ZeVOP
 D/q0iRAhMA6Y6g6YztuuVoRTHKS0de4E=
X-Received: by 2002:a67:2642:: with SMTP id m63mr40961093vsm.39.1620996524528; 
 Fri, 14 May 2021 05:48:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu+nLPs7k071mL8bsxT+qe4cVn+KVZt82HBeFoln2tJc1CtzQiaBHf5xSs72ApuYbndK/8ulEn2ISzYv5C9i8=
X-Received: by 2002:a67:2642:: with SMTP id m63mr40961078vsm.39.1620996524365; 
 Fri, 14 May 2021 05:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190401112945.25592-1-pbonzini@redhat.com>
 <c75b2eb6-4127-61e3-20e0-b572de89668d@redhat.com>
 <e49b9ef9-2d01-7a0d-38a1-2891c52a4279@redhat.com>
 <26449478-0553-64f1-2cd6-b0ac6ce97e38@redhat.com>
In-Reply-To: <26449478-0553-64f1-2cd6-b0ac6ce97e38@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 14 May 2021 09:48:18 -0300
Message-ID: <CAKJDGDZfkr9JxwqEvaaWNFzsCtmfrg3A1zBrd+XGGk81Xq+RAg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: convert to JSON
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Matteo Croce <mcroce@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 2:31 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 13/05/21 23:02, Willian Rampazzo wrote:
> > I think I understand why you brought this thread back now. Finding a way
> > to correlate maintainers and tags is, indeed, a nice feature that can
> > help with your idea about correlating tags and maintainers to use on tests.
>
> --verbose? :)

The main idea is here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg799981.html

Tl;dr, Philippe had this idea about correlating tests and maintainers
with tags one or two months ago and we were discussing what was
missing on the Avocado side and what we could do on the QEMU side to
make things work.

One of the points was how to record a tag of interest of a maintainer.
A new field to the MAINTAINERS file is one solution.

This patch about converting the MAINTAINERS file to JSON would make
things easier, as Avocado is adding a new --json option to the 'list'
command in this next release which will help to extract tags from
tests in a machine-readable way, but, as I said, moving the
MAINTAINERS file to json would be painful to edit in the future, so I
think a way to convert the current file to json solves our needs.

>
> Paolo
>


