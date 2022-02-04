Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF34AA27C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 22:43:31 +0100 (CET)
Received: from localhost ([::1]:42800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG6Mc-0004iD-77
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 16:43:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG6Ja-0003Bq-SW
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 16:40:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG6JP-0007kh-CJ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 16:40:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644010810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0lB0Uv64wiCW2KQrRe+S3cV2pGknuc3Uv1lqQgC0aeo=;
 b=aZr3IXYYwhV8p/6p+Wv279VgXNk0x7F9WnLRs1pim7lAIaDHadrUfMRqnTeHIPDoXZLJiy
 dyxYRVafG7ZTtiEFjDKQw7J6vCCgd04jRoSih8IXGrsOwqc4VlByB9vyK0rzJIAfT/Tnnx
 xe+CFgoDfG1nwF+oqWuqsqj42ZJ67uY=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-G41JdbLhO2SxTF6D8dp9cw-1; Fri, 04 Feb 2022 16:40:09 -0500
X-MC-Unique: G41JdbLhO2SxTF6D8dp9cw-1
Received: by mail-ua1-f69.google.com with SMTP id
 m24-20020ab073d8000000b0033c33f58c32so1281117uaq.5
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 13:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0lB0Uv64wiCW2KQrRe+S3cV2pGknuc3Uv1lqQgC0aeo=;
 b=tg2zdBmO6Ac47fl/LCWo9n6t/u7zkdkFvkZ7tT824+7VbEI9dNZ4fh3ItYrTFb1wC/
 LFVsK7dXETztbFQ8yMnXeu0Xen9SEkIVGEMCOQbybUTfLgb3N2ThjHzNxofi30jh/qq3
 /KNA4Fz1aoj+3aYzpPWFDOONXwtnnKSD9Yi23i9g8vn1jw9qf+IyNLM5CfakT7gqhmHw
 ANpYNDy0S6aQxIJoNp8Oa0/O7EKN5k4g+/8YITb1gcrixXuBWU0vePZHs+hQRHFUudN6
 py50zUNforYkWybLo2/hcUGmWb/HnUNNuZ/wgCP6r1e0Zxa4GjWLpWcpHr7+cGxDp3yF
 uVTg==
X-Gm-Message-State: AOAM533gx3bufh8DG72Vi8xF5da8lYPAfsdiUxHUWXJMVe2DvVoaHM4K
 EbMr+Y16F14EBKqAUS704MQzYSMU4G25DVvD7rlv6Fq8Ate0KsUqCdB4CAAl9Ufh2FVYD/0dYZu
 G6wVzYqARZXD31saby5rcv6bUfN+Nfyw=
X-Received: by 2002:ab0:6f11:: with SMTP id r17mr426578uah.128.1644010808497; 
 Fri, 04 Feb 2022 13:40:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2tc8Bm0JsIdYRzBKshUW6tmaM2iIuxUcNwAjRDOp3t3kT6LDCILM/Wu0aRqNp2Dj+xV0DbnfL3hNgQX+HAys=
X-Received: by 2002:ab0:6f11:: with SMTP id r17mr426569uah.128.1644010808343; 
 Fri, 04 Feb 2022 13:40:08 -0800 (PST)
MIME-Version: 1.0
References: <20211118115733.4038610-1-philmd@redhat.com>
 <7153eadf-3c43-b62c-aaa1-919abf0634ca@redhat.com>
In-Reply-To: <7153eadf-3c43-b62c-aaa1-919abf0634ca@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 4 Feb 2022 16:39:57 -0500
Message-ID: <CAFn=p-YLUv3h_g__Fwq0UYu=otR-jMESs5c=o3wBaspOOkmjtw@mail.gmail.com>
Subject: Re: [PATCH-for-6.2 0/2] hw/block/fdc: Fix CVE-2021-3507
To: Jon Maloy <jmaloy@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 27, 2022 at 3:11 PM Jon Maloy <jmaloy@redhat.com> wrote:
>
>
> On 11/18/21 06:57, Philippe Mathieu-Daud=C3=A9 wrote:
> > Trivial fix for CVE-2021-3507.
> >
> > Philippe Mathieu-Daud=C3=A9 (2):
> >    hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)
> >    tests/qtest/fdc-test: Add a regression test for CVE-2021-3507
> >
> >   hw/block/fdc.c         |  8 ++++++++
> >   tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
> >   2 files changed, 28 insertions(+)
> >
> Series
> Acked-by: Jon Maloy <jmaloy@redhat.com>
>

I could have sworn that Philippe said that this patch was incomplete
and to not merge it for 6.2, but maybe I mistook that for a different
series.

I seem to recall that this series didn't apply correctly in
conjunction with the fix for 2021-20196, but if there was a followup,
I missed it.

--js


