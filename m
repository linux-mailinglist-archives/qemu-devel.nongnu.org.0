Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8D6380E9C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:08:22 +0200 (CEST)
Received: from localhost ([::1]:58178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbIT-0003zy-LC
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhb2G-0008BS-9L
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:51:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhb2E-0000OE-N7
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621011094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8tq7O0R+jYDSbAc+fBOQeLOjTtFL3226HXmzwf7SzA=;
 b=PBLRWvJdYnu+8qMMoIJHnwPwgGCWHQhkDfVgChd4QTSkJckKK67asYaWbYox0COCqg/LLv
 +aK8VdPk1xZPdz4w8HbbF+t1vw43AgE8bqBVuqLoGNyqrfT3KRa0eqnGKJUumakT9kG7++
 70a253wH1c8X8mS2RwZUyZcXMjGLJb8=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-DGOJhrsjOd-vJ1xPfSVquQ-1; Fri, 14 May 2021 12:51:32 -0400
X-MC-Unique: DGOJhrsjOd-vJ1xPfSVquQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 q5-20020a9f38450000b02901e7f4035131so5598404uad.10
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X8tq7O0R+jYDSbAc+fBOQeLOjTtFL3226HXmzwf7SzA=;
 b=VKagvpRN+DiNxwgP1P0AJMsnyyxYgtXVpKXJz6r2zgw5/7M7SRD7pu7f74oCkbWQLr
 rUJusk8fnppz14UTMumaLJf04Okkv4rkdZaAHhd92ucYP4yKVFVAjn7cHepaDJR9YXQJ
 wNPd0afRbrYF+2T7kXNiwB+QShXh7IX42doGrla2KyyZKY1E6W2ybEtwJbTAUqlQc2uq
 LQPvX84MpU3tnie2KYg0hfJgT/FdyAP5NMKOzQ/XPEU1+v9uKLGAVnAzMWSwqBytPktA
 A4KStyE5cFfH1PXLHljpZ/sRYMzYo3izKISdJlpRghsN2P9vmIhE+MyiCx1D5k0y7AjF
 Ez+w==
X-Gm-Message-State: AOAM532fF5ji+h24mgznbMxGfUFBDSZFqCspJ8C9odj3lsWtCy89jkEJ
 vCEW7p/jJndO5H6cik/67/O9I5A7b5qw6dw4zgGjaAnHj3yhnbbJiPvs0RNMsP1MvJsicX0eVyq
 67YERWQBbh784R8kZVyJQmi1dS28D5sE=
X-Received: by 2002:a05:6102:2431:: with SMTP id
 l17mr9127097vsi.45.1621011092084; 
 Fri, 14 May 2021 09:51:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvrf2XY7Q13UTcxeoH4dzzcy5/aOQJ2rhOUV07s3eCs5CyK0zAKj0F8toOtdJfUaXh9fcVyxyweHkBo4lWaDk=
X-Received: by 2002:a05:6102:2431:: with SMTP id
 l17mr9127061vsi.45.1621011091574; 
 Fri, 14 May 2021 09:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-5-berrange@redhat.com>
In-Reply-To: <20210514120415.1368922-5-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 14 May 2021 13:51:05 -0300
Message-ID: <CAKJDGDZSoHBF507Bqa4kxu+5epAKqx-q59ZDdT93xJ0GxGD9iQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] crypto: drop back compatibility typedefs for
 nettle
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 9:04 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> Now that we only support modern nettle, we don't need to have local
> typedefs to mask the real nettle types.
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  crypto/cipher-nettle.c.inc | 60 ++++++++++++++++----------------------
>  crypto/hash-nettle.c       |  6 ++--
>  crypto/hmac-nettle.c       |  8 ++---
>  3 files changed, 30 insertions(+), 44 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>=CC=89=CC=89


