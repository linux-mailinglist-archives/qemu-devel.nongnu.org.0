Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC1C542141
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:30:07 +0200 (CEST)
Received: from localhost ([::1]:48526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyoGb-0000w3-WD
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nyoBH-0004Fp-Er
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:24:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nyoBE-0002dj-UB
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654665871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYl43kYCywf4f6G38/lwCKsBZAXisqf7hrLC3NKx+ak=;
 b=J1MNJKtOkPQznQ2dh2xkmCmiwKHs9H2aU22k5sMZgxeXJOM/I8M7T6jxhhhb7i2cZjWhwc
 YKGzrLPkZM5RlZwkrpSe/IahARbrS+otUcjo/eD7I1w2jIG9id+091PRCELuNlzVEDQRbf
 o+QXXRwVEWpEqZOUBX1je1EvYF7h4sQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-CM8InKTAPkKFPQ-TUykXUA-1; Wed, 08 Jun 2022 01:24:30 -0400
X-MC-Unique: CM8InKTAPkKFPQ-TUykXUA-1
Received: by mail-ed1-f69.google.com with SMTP id
 cy18-20020a0564021c9200b0042dc7b4f36fso14004293edb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hYl43kYCywf4f6G38/lwCKsBZAXisqf7hrLC3NKx+ak=;
 b=bFUYkx7gnH6IVDVTPmTIDd1KQNfvLlST+JGcgUVJPizG1XHvh7xyHjCXmHe5LtJCdm
 dbd6kJXoOoN5bNxxSQ6kBJ4KeSVCcW8S01zHQPjEXOH5kiV1OZnVGtHdIoRPl6Q33jIv
 6S2lGNiUnlkjBMpzmHO+XHMhl7Uh2YBgsDafJPMKxTBFrzdKQziIUeaXf0ss0trqA/Zj
 U9EOHcXh30Fq3b9mmSxamo9n2ctUa7Ff03ys9/gNW+uFtpaTI0nkyHviQdCylUTaPDQV
 xCf8OrV0s92ImlRN9ua4JhOIFrl5oqDMDFsNOwnQP1H5hY/xVUMQh2GC3BXuuIMcOKPD
 deyw==
X-Gm-Message-State: AOAM530hRaLxZEQf1nHS1y/hhXwfrFIpGKPab74k9VXsZ1MRXqEy1hIw
 knF1n4IUZmXtLXmcdq78zY+czoweJtnxVSM5lCCgJQJLeu0d/24gzxkN6bToVlHaEG6VAOHgaJS
 gKc2kL7UJB0g706+s8PqbegwytKvizlM=
X-Received: by 2002:a17:906:824a:b0:70f:4c58:6ec6 with SMTP id
 f10-20020a170906824a00b0070f4c586ec6mr22733615ejx.648.1654665869335; 
 Tue, 07 Jun 2022 22:24:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRVQKdcw/0jryphAIbJR902+Ah+nFseWc9111zA10BU1y+Y8W4dTBZJmBEa5X2vMPOEtIT0XCEjQGTbEhyWwM=
X-Received: by 2002:a17:906:824a:b0:70f:4c58:6ec6 with SMTP id
 f10-20020a170906824a00b0070f4c586ec6mr22733589ejx.648.1654665868967; Tue, 07
 Jun 2022 22:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-4-leobras@redhat.com>
 <b2fae41c-7f47-9bf1-21b9-1b123818a262@bytedance.com>
In-Reply-To: <b2fae41c-7f47-9bf1-21b9-1b123818a262@bytedance.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 8 Jun 2022 02:24:18 -0300
Message-ID: <CAJ6HWG447LyNpwwZJ_bYsT=MzY9K3mDwJ_Bh6EnGs0Cr7NJvYQ@mail.gmail.com>
Subject: Re: [External] [PATCH v13 3/8] QIOChannelSocket: Implement io_writev
 zero copy flag & io_flush for CONFIG_LINUX
To: =?UTF-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org, 
 Peter Xu <peterx@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 lizefan.x@bytedance.com, zhouyibo@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello =E5=BE=90=E9=97=AF,

Thanks for reviewing!

On Wed, Jun 1, 2022 at 6:37 AM =E5=BE=90=E9=97=AF <xuchuangxclwt@bytedance.=
com> wrote:
[...]
> Hi, Leonardo. I'm also paying attention to the application of
> MSG_ZEROCOPY in live migration recently. I noticed that you defined a
> member `zero_copy_queued` in the struct QIOChannelSocket, but I can't
> find out where the value of this member has been changed in your patch.
> Can you answer it for me?
>

You are right.
This was being correctly implemented until v6, and then the increment
just vanished.

Since v6 there  were a lot of changes both in the patch and in the
base repository, so I think I completely missed it in some change
iteration.

I will send a fix shortly.
Is that ok if I include a "Reported-by:  =E5=BE=90=E9=97=AF
<xuchuangxclwt@bytedance.com>" in the patch?

Best regards,
Leo


