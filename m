Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84912F6B7D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:51:54 +0100 (CET)
Received: from localhost ([::1]:48254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08ev-000440-PA
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:51:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08Z9-0008Oo-TA
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:45:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08Z7-000258-JN
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:45:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610653551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OY7l4pUbOn9ofxo+AQ8IqdMFC8mt1Wf77b0U/2AhUag=;
 b=jL9+PtiBRUL/kVrFAS3mKSdSHH7cqBUfDZ+mUWwrf+AeaCwAqrd6uAo12vcrF1EyECLkZ/
 IhHK6jFMbnH5JSFZegkY8r0BUPs3H8CdIOAgZLtQiZpxnipeHZVN9UpVYNt8b5Z7bBdP9q
 MUKhmDYiyD04wx7JTselyF3WPINUm80=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-xlzql11DOYiz7c1hQQ8mOw-1; Thu, 14 Jan 2021 14:45:48 -0500
X-MC-Unique: xlzql11DOYiz7c1hQQ8mOw-1
Received: by mail-ua1-f69.google.com with SMTP id z4so5441uan.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OY7l4pUbOn9ofxo+AQ8IqdMFC8mt1Wf77b0U/2AhUag=;
 b=hD3wYHDyAhi0NYy6NKcf+LiiJhow6Hb/opStzg1D4W4BV2aJtf4XUOg2Mp7/zPQvV9
 /XcuPn5zxE4kOrvWk5DSaQyEdEOXec7GI5qjL7NOgSeZvi3OAKT7smCH69zqL+tlk//2
 Nlp5oDymhMrDKIksJP/1DY4h8qvP4/27HF3cblsyp1Qn3d+TMHiJ3Xlu3XZ7pYTdvwHC
 r2ZMXq37diHEkisy1xarF1uGzA/JhTnq6ZbV2hXshdJQvaGS4oVmMmcwAbaN7RpeP08J
 ZzH6YFjfNxicS1UOWMO9VyIx5FGfdgJ00mQqWl7GgJnxqk3z9JO24FTHj6427NmhN0y2
 vj5Q==
X-Gm-Message-State: AOAM531dO1maVqlB0UeqOgY3QXmwTcI839sC6Yp9cIMpC9HLOk3bLyl9
 OL3NbLs+aHdAPL6pTPPv0hnqMIFbGeshhSuAoWMn02ovOxkKS5lsrBZV+h1olHH1zHV5hu9dzdw
 xrwgtSOee8VzXDwmP+oEUhVqm0Nfer/Y=
X-Received: by 2002:a9f:240a:: with SMTP id 10mr7239042uaq.124.1610653547178; 
 Thu, 14 Jan 2021 11:45:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXd/FdPgXPQODDPB8hhCTbRiXn6JGqsuCr8UfNST6MjS3fwb3oOgsPwopmTx45E459rpqPGLzK56DhuOpcjlo=
X-Received: by 2002:a9f:240a:: with SMTP id 10mr7239034uaq.124.1610653547034; 
 Thu, 14 Jan 2021 11:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-8-alex.bennee@linaro.org>
In-Reply-To: <20210114165730.31607-8-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 14 Jan 2021 16:45:21 -0300
Message-ID: <CAKJDGDaGqOGuSrPrX7cfpGVUxMKLKXok0xWvCgg-72vGYZABRA@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] Makefile: wrap cscope in quiet-command calls
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 2:29 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> For prettier output.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  Makefile | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


