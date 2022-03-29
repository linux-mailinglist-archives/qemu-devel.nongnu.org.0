Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13434EB186
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 18:11:30 +0200 (CEST)
Received: from localhost ([::1]:56728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZERN-0001Rr-PA
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 12:11:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZEPf-0008LH-0z
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:09:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZEPb-0007HP-GB
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648570178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DrJSQyp7FqFC0Qbvkf577YJMAeKa9lM+lS/uIulRARQ=;
 b=TnMlyTxJ4heYZ60fJCZmasOceZm5QihhjzEbHCRgOzOe5evmW5bZkyyz16rGE+ZfESRJ2+
 esKR2O8aVJu1CnOafOJ33zqeIZFITBBB9LuUjPIin8Dq/ewFMPrCQDRgpCbLKyehBHHaGB
 qCthKa5dI2v9ADy+v4a0go3BFP+mPjA=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-TxroTBHlMZuQvsDu7ayv3Q-1; Tue, 29 Mar 2022 12:09:35 -0400
X-MC-Unique: TxroTBHlMZuQvsDu7ayv3Q-1
Received: by mail-vk1-f198.google.com with SMTP id
 u83-20020a1f2e56000000b0033e842c83f7so3499215vku.4
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 09:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DrJSQyp7FqFC0Qbvkf577YJMAeKa9lM+lS/uIulRARQ=;
 b=J5Eirch0YhM5NJWJRFZsggQg/HX1wf5/naDg1ZgHaisRyQCPvI/nzNgVDI0c9jBYk7
 K7eABLGvT8AjkEzULPiJgAuiz4LMcTI9fIlZtlSOLw/P/oIB6nIp7Z9RucX3v2Ragk+y
 K6KF0W2JT3ckd3DuBY/+jCFd2awwXqBegMVtXH3xXzVhlem0haZXzFEP3rKbdISDbdpo
 ATAlt99C54iemus1Az+J1nvB42Ss2i32tZyiRyY/KZoFDfNp5IY6UiMyGbu/dTKbwLyx
 LqSIzUzwx0Th3Ssu3KjTNGODkdktanJH4bi675mAVEiGzUeCEnfJSXf2+hDB9uqmPUdd
 zWwQ==
X-Gm-Message-State: AOAM530IXj7puAzxXW6/4jyfCv74IHv6ApW4ti4TKsVHeaJzQ++/n9kx
 l8N7n2X+bhz07Q4UzhPguV116GFF8vXaXPkeTyy2Co5o17VAMw6hb+05KqfoxB9xy0+1zqPQ7JG
 51ENHFwMg3ZxSRuZ0Pp6JetL7j/0x5iU=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr16716554vsx.61.1648570174763; 
 Tue, 29 Mar 2022 09:09:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzyjePfgAlSHf5zUuHrE/lJdRLGoej4Fm6L5Mu4gmy/Y+YJyzAsEFmfcsLleTCd7iRTSBlzA/NId7dslKBUBo=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr16716506vsx.61.1648570174407; Tue, 29
 Mar 2022 09:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220325200438.2556381-1-jsnow@redhat.com>
 <20220325200438.2556381-4-jsnow@redhat.com>
 <20220329110802.GB447081@fam-dell>
In-Reply-To: <20220329110802.GB447081@fam-dell>
From: John Snow <jsnow@redhat.com>
Date: Tue, 29 Mar 2022 12:09:23 -0400
Message-ID: <CAFn=p-aFhyn6DnnseJKbZvQWimW1JJVTXXxba8xUwiHOs18aLQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] python/qmp-shell: relicense as LGPLv2+
To: Fam Zheng <fam.zheng@bytedance.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Luiz Capitulino <lcapitulino@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <mlureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@habkost.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 7:08 AM Fam Zheng <fam.zheng@bytedance.com> wrote:
>
> On 2022-03-25 16:04, John Snow wrote:
> > qmp-shell is presently licensed as GPLv2 (only). I intend to include
> > this tool as an add-on to an LGPLv2+ library package hosted on
> > PyPI.org. I've selected LGPLv2+ to maximize compatibility with other
> > licenses while retaining a copyleft license.
> >
> > To keep licensing matters simple, I'd like to relicense this tool as
> > LGPLv2+ as well in order to keep the resultant license of the hosted
> > release files simple -- even if library users won't "link against" this
> > command line tool.
> >
> > Therefore, I am asking permission from the current authors of this
> > tool to loosen the license. At present, those people are:
> >
> > - John Snow (me!), 411/609
> > - Luiz Capitulino, Author, 97/609
> > - Daniel Berrang=C3=A9, 81/609
> > - Eduardo Habkost, 10/609
> > - Marc-Andr=C3=A9 Lureau, 6/609
> > - Fam Zheng, 3/609
> > - Cleber Rosa, 1/609
> >
> > (All of which appear to have been written under redhat.com addresses.)
> >
> > Eduardo's fixes are largely automated from 2to3 conversion tools and ma=
y
> > not necessarily constitute authorship, but his signature would put to
> > rest any questions.
> >
> > Cleber's changes concern a single import statement change. Also won't
> > hurt to ask.
> >
> > CC: Luiz Capitulino <lcapitulino@redhat.com>
> > CC: Daniel Berrange <berrange@redhat.com>
> > CC: Eduardo Habkost <ehabkost@habkost.com>
> > CC: Marc-Andr=C3=A9 Lureau <mlureau@redhat.com>
> > CC: Fam Zheng <fam@euphon.net>
> > CC: Cleber Rosa <crosa@redhat.com>
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> No longer wearing that hat any more so maybe my reply doesn't matter, but=
 since
> I'm Cc'ed with my new address, I am personally happy with the re-licensin=
g:
>

I don't know either, but your ack is almost guaranteed to make things
quite a lot simpler :)

Hope you're doing well, Fam!

> Acked-by: Fam Zheng <fam@euphon.net>

Thanks!
--js


