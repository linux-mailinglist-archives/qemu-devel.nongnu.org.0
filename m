Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C644A6866
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:13:17 +0100 (CET)
Received: from localhost ([::1]:53720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2Kq-0008Jd-LK
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:13:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nExuP-0002tt-1W
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nExuN-0001il-Id
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643740179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EmL0QcRjWoY3CGK0mw5HzT3PNLj4U8fH4fVMnSEnfhU=;
 b=BKTPedlnjHJfw39rqRTz+KW4NxvfiN3kT+CzNyW+F8Q3lhfUfDxzrv5QKLCGkIilh2xvhb
 xsm+B2/HnnNiNXjwdqL1bfV2V8U6sGEhncLkFvT+eZQxndk5X9o/v8th/4HPP9QFkqoiTy
 3zylO6j0PCjJYk/c8Hkb1Wc+wE1hbx8=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-DOKKWn48OKujoCr4MlM2yg-1; Tue, 01 Feb 2022 13:29:38 -0500
X-MC-Unique: DOKKWn48OKujoCr4MlM2yg-1
Received: by mail-yb1-f197.google.com with SMTP id
 y4-20020a5b0f44000000b00611862e546dso34705271ybr.7
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EmL0QcRjWoY3CGK0mw5HzT3PNLj4U8fH4fVMnSEnfhU=;
 b=KEgfAXPJfjaCiJr2S7LruSG+KZaFhcJIYMXL7nwaaLuc8JaiK2QfRn7TFuNyU2sx1p
 Yj7h6RfU4kv2fzh0eSRVeChNMdg1lCmUy83f2eY8pKLPmOHAdplqrOKr//HPnUA/l3FA
 hsBVsL5r3lbWqTsYj17VhTeCLUX4zkOH+qZwrpOdHDxTguq/c8l4EeIh4GYhwi1hdvJZ
 c8Be8ppqjCM/1JyplLO6p+TtuUWp5iC0EPdqGhM7r4LU/MNwpj0tHFI/gusPkRrAiHyi
 7GLkl0LxWFdHpCjSRy5WJmQaubzEiwF+0itf/JTGmEjZzQ1JdQ8HTwfD34W8498OwZpp
 yrSA==
X-Gm-Message-State: AOAM530BTcphOViYDcRQ8mNuMYz49A1bg8e5BaimUeaRkKKI0qcRY//K
 0JZNGhjvuRqRjEOExekMqjf89FV/N43bMbTIdqOYf80zi0IUaNkDWU1Lx0XorifbbZVyFXXwZ8h
 87Gn0Aeo9xHbyu4H1INPyrU4f1Y+upi8=
X-Received: by 2002:a25:244e:: with SMTP id k75mr33712283ybk.635.1643740177554; 
 Tue, 01 Feb 2022 10:29:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2zNmAKl3yN4otxNRnM7EpjuFSYcOaIuSuTxyedgRGhfFK5a783JOMZIl956yui+R5WKLwp1ahF6fLSMHsNJA=
X-Received: by 2002:a25:244e:: with SMTP id k75mr33712256ybk.635.1643740177360; 
 Tue, 01 Feb 2022 10:29:37 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Feb 2022 10:29:36 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20220201101911.97900-1-thuth@redhat.com>
 <CABJz62Osah308O2pHFMWs+D2X+Mq=aOf1NAKFcUaWF5bGzwJEw@mail.gmail.com>
 <Yfl1rZN6yKCyQ1O0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yfl1rZN6yKCyQ1O0@redhat.com>
Date: Tue, 1 Feb 2022 10:29:36 -0800
Message-ID: <CABJz62Nf4RCeiq0=+G1ZqPA48dBR1dVwWhL0b7LPdu1R7m3x5Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests: Update CentOS 8 container to CentOS Stream 8
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 01, 2022 at 06:02:21PM +0000, Daniel P. Berrang=C3=A9 wrote:
> On Tue, Feb 01, 2022 at 09:08:22AM -0800, Andrea Bolognani wrote:
> > CentOS 8 and CentOS Stream 8 are two pretty distinct operating
> > systems in terms of update cadence and stability expectations, so I
> > think that using the label "centos8" for containers and CI jobs that
> > are actually consuming CentOS Stream 8 is going to be a source of
> > confusion.
>
> Given the EOL of what I call the "traditional" CentOS model at the
> end of 2021, both "CentOS" and "CentOS Stream" terms effectively
> mean the same thing now.

Note that while CentOS 7 is no longer targeted by QEMU, it still is
very much relevant as an OS and will keep receiving updates for ~2.5
more years.

> The caveat is that aside from this dockerfile, we also have a
> VM config in test/vm/ that historically used traditional CentOS.
> That may also need updating to point to Stream unless it has
> seemlessly transitioned to using Stream content without us
> needing to change anything. I've not looked closely at that yet.

This example IMO only highlights the need for names to match reality
and why overloading existing names is a bad idea.

--=20
Andrea Bolognani / Red Hat / Virtualization


