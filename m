Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B559D45734E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:43:06 +0100 (CET)
Received: from localhost ([::1]:38108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6yf-0006me-Rn
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:43:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo6bK-0005Ua-Ls
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:18:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo6bH-0004NI-N0
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637338734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PlvVppBVudH/UEJy9S8QVuC82f8h8BZZu6Qw7PbzFO0=;
 b=ekrKxALKhG8ykqKxqx8X58d9RzlJ3C4kPVXTcxqrOljToC1jrFz2VvJrOrBJ6SBQVw8cKA
 x6AChuEH/GIotPW8NzikaUOoM5jR+rriEubL/59k6vW+TuSFfSZ8tu90lAtKu8FIJ3kXJt
 uFCodOjlcee9ASAtDt4DZDwQTNW5Azk=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-TWuZASCsMDWS6jLopjrYWA-1; Fri, 19 Nov 2021 11:18:53 -0500
X-MC-Unique: TWuZASCsMDWS6jLopjrYWA-1
Received: by mail-pf1-f200.google.com with SMTP id
 l7-20020a622507000000b00494608c84a4so5898309pfl.6
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:18:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PlvVppBVudH/UEJy9S8QVuC82f8h8BZZu6Qw7PbzFO0=;
 b=T7dwuQfOw7o32xGH4UuHUxkhqxVs0bbVdCDa0C5zGPDyYO+rSS4gi2UBRO9UDhw3za
 /jh0nISQqmot+TT3dEJaKT9KGBoOIH+qlwr7bGNWtf7Ssn5C1agSTM6+VDEbQR7VmbsE
 lBEJ2EYyPIy4l19O0J+nBOHQDDdYoFaRt4tdWDkbDnRXNF77H0dMIMQ8FQrFJLSxwBtm
 eVAxupJji9C/UYAiMpmJXT2VtvxO00t/UdfJ4V+WEYptm4sGd9vrS6WIRGY8svRy2K+j
 /cMrYsAqbKJoBx1heqwTLTe1bbxCvsYtz0lKnnS11N7lfDhkpLyNvcO6TiyBvlKQ8HQy
 IapA==
X-Gm-Message-State: AOAM531/+F9Yvuxt4U8eNk8Gp2OWcn25809Ak9K0y5hvm7KY5WOmD36b
 IrjYzPLfWheGD5B6BFnYIs34ePrnxl5u5mzPVE6US8t6wCqk2XSFOZvC8OBIKsNS70UiHp1+M6M
 e0xvnZJvWPHi8c0yRQJx6MSBnXIkUdRI=
X-Received: by 2002:a17:90b:1057:: with SMTP id
 gq23mr883264pjb.203.1637338731745; 
 Fri, 19 Nov 2021 08:18:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7OP3lG8BIDuvgsmg3BvHvPxHNSiSHVKnTr6+Eu5F13qS7oXzLBwpe+p1jifpASeX6FTZWqOe5NYJHSSls4e8=
X-Received: by 2002:a17:90b:1057:: with SMTP id
 gq23mr882532pjb.203.1637338724863; 
 Fri, 19 Nov 2021 08:18:44 -0800 (PST)
MIME-Version: 1.0
References: <20211118204620.1897674-1-jsnow@redhat.com>
 <20211118204620.1897674-8-jsnow@redhat.com>
In-Reply-To: <20211118204620.1897674-8-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 19 Nov 2021 13:18:18 -0300
Message-ID: <CAKJDGDb2HsHbF8M_9LDqkS+D9pP=-XvmRRw+HJBhG7J+hFvM2A@mail.gmail.com>
Subject: Re: [PATCH 7/7] python/aqmp: fix send_fd_scm for python 3.6.x
To: John Snow <jsnow@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 18, 2021 at 5:53 PM John Snow <jsnow@redhat.com> wrote:
>
> 3.6 doesn't play keepaway with the socket object, so we don't need to go
> fishing for it on this version. In fact, so long as 'sendmsg' is still
> available, it's probably preferable to just use that method and only go
> fishing for forbidden details when we absolutely have to.
>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/qmp_client.py | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


