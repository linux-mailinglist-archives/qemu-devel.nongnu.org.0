Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10273B7B19
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 02:42:08 +0200 (CEST)
Received: from localhost ([::1]:47856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyOIp-0001Yy-AK
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 20:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyOHc-0000lL-25
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 20:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyOHW-0007Mo-TE
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 20:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625013645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eUAzeHRUymUbZaS8oz9Np82+Ihzi+8kT+xpLbPEggY=;
 b=VIWs7C2GJEjrvKfrB96jvy+MOjascl31c+XSg5h2qgzSdKqjehGHnNLzkANyUw/RV5AR7T
 Dly72G7M1+jjI8qLzvQht3Dg8lIGkMWjA9/86XiLzPXWe+JMq7ry+ujvQz/gUxzw686Cq9
 w5+yjwPeJSijomlkWFLDGqLW/JxW/vw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-ixL8JGzRMeKbY_JroHOzkg-1; Tue, 29 Jun 2021 20:40:42 -0400
X-MC-Unique: ixL8JGzRMeKbY_JroHOzkg-1
Received: by mail-ed1-f70.google.com with SMTP id
 p19-20020aa7c4d30000b0290394bdda6d9cso225944edr.21
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 17:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8eUAzeHRUymUbZaS8oz9Np82+Ihzi+8kT+xpLbPEggY=;
 b=XlkgEutCmu8UDRSIqSZuBYD8r33BE+pIFj+kgm+uhYBt09esUxBmfcVTDHFRTENYjc
 Lapy0IgoYZUPHKRdD+waShKtqj1lu3Ye6fE/UgD/xYdH4FuEwsu+lAPBLPaFJl505JjA
 Cm4NWE8d3YfpiddzHyHr19Q5lRgGaf+pNgcFlXY4o/5ZEYx2s29GfqW5Yf8zIy6K2lyj
 6rd9Sw+Ou+S9F6yZwvDOAoVkypqGGOni+l2QiM6JckfEjlLd70pTGktRoLAMKQ8qFNJf
 2wUnEz3gkfiYXTZPgv5B8RAXvnjaWbF7URDSrBcdc82cEveyxwRQZkAxTvJv+iXIxgD7
 rM9Q==
X-Gm-Message-State: AOAM531E/Znw/NFl8+L8WbGUClB20MH+T2D5iYNiVvRCqK3PJuwymp9d
 hO14YjwDDaDfFTto9eBfrtCWZO6bG9rL060TwJ4q2bsVLFVQaiozbiO17jIHbFKi7dQS9zq9NVP
 JVkrLn9bzHFWMZMxmLHTs1L9BJTRxOyQ=
X-Received: by 2002:a50:fc90:: with SMTP id f16mr43900831edq.254.1625013641646; 
 Tue, 29 Jun 2021 17:40:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXeAzI9wPU1k/VPJF3ZFjBjeG6ciAWcQwe+ewp+y7Y1IQtT22qFgBM/T1sI3e/DVlcCZul3HmduWYmu05Ty0w=
X-Received: by 2002:a50:fc90:: with SMTP id f16mr43900803edq.254.1625013641423; 
 Tue, 29 Jun 2021 17:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
 <9770910a-f586-0b79-395c-7154c4693690@amsat.org>
 <CA+bd_6+-je9t3DzegS0uiyC9fCYF++sMXkRJhAz1Dxe2zz-v1A@mail.gmail.com>
 <YMDWOIN469m4/LPu@stefanha-x1.localdomain>
In-Reply-To: <YMDWOIN469m4/LPu@stefanha-x1.localdomain>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 29 Jun 2021 20:40:30 -0400
Message-ID: <CA+bd_6Knq4opS=bZY1-qiyYGGsSMU8vSBZ4OG8_2FODUHoj=VQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 9, 2021 at 10:55 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Tue, Jun 08, 2021 at 09:36:37AM -0400, Cleber Rosa Junior wrote:
> > On Tue, Jun 8, 2021 at 2:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org>
> > wrote:
>
> Here are my thoughts. It's just my opinion based on experience running
> the old QEMU Buildbot infrastructure and interacting with our hosting
> providers. I'm not planning to actively work on the CI infrastructure,
> so if you have a strong opinion and want to do things differently
> yourself, feel free.
>
> > > Who has access to what and should do what (setup)? How is this list o=
f
> > > hw managed btw? Should there be some public visibility (i.e. Wiki)?
> > >
> >
> > These are good questions, and I believe Alex can answer them about thos=
e
> > two machines.  Even though I hooked them up to GitLab, AFAICT he is the
> > ultimate admin (maybe Peter too?).
> >
> > About hardware management, it has been suggested to use either the Wiki=
 or
> > a MAINTAINERS entry.  This is still unresolved and feedback would be
> > appreciated.  For me to propose a MAINTAINERS entry, say, on a v7, I'd =
need
> > the information on who is managing them.
>
> Here is the wiki page that lists project resources (machines, etc):
> https://wiki.qemu.org/AdminContacts
>
> We can continue to use this page.
>

ACK.  I'm adding a note to the documentation.

Thanks,
- Cleber.


