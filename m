Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C133B7912
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 22:07:09 +0200 (CEST)
Received: from localhost ([::1]:55106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyK0i-00063y-HQ
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 16:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyJkv-0005YP-8A
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 15:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyJks-00038x-4e
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 15:50:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624996244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MvQ041pDKAL0f02FJnUffMOsn/p2bkURPhS3y3wYAy4=;
 b=PttUMn7YKa1jMzrLnF5983KHWbQ4Hm/JyByHSJuBN+ZOhuNsw2nF5o8YjRrTDgJHDueJnF
 ebMzRy39C1orkAPTO/1NyNrQ4nXcKQ9JvRiAnzWX4TqtB9IReyoojUJbqzX1C1DFnaH2OL
 6UHUvxPNEo/vYL/VgWU2yeSfCJTOLiA=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-UBNJcpBLOP-s0Le6WQ6pug-1; Tue, 29 Jun 2021 15:50:42 -0400
X-MC-Unique: UBNJcpBLOP-s0Le6WQ6pug-1
Received: by mail-vs1-f70.google.com with SMTP id
 e25-20020a67e1990000b0290272d600a2fbso96386vsl.21
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 12:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MvQ041pDKAL0f02FJnUffMOsn/p2bkURPhS3y3wYAy4=;
 b=XQVAePVyItvxkxnwKNkUMP9wDL9zkcdbN6UudM6sPJMqwZQ3FRn0DTDRCm3u9KSaNa
 /led72Dtf8+5h/8DEm2MqJMkwj7V5X05bNYAW4viCOA8D74QLZdtOahW95u3+hQ00b2t
 DrFwYOnaMce1D5QCiJ4Sv6LNkWjAoV1qNy6qDJdYnlnP7rEIx5l1XftDlUtfrSpuo6dj
 kUsruc4UhklH9DT5+Gr83UiQgzxsjSZtsBo/oSzI26fNlAcu2Pf0jLk0xV7KVBjtOlMN
 wBa5S1WJzxkMUobTE2hbsAAbfN+tJU6hhOuMdiHZjWSFXJJd+owF5UDIUij2tWRsGQKz
 daCw==
X-Gm-Message-State: AOAM530bUX2c/RPFIfV6y6e0ef7T6bgJNajEW90kz27D+SpibSiIwWeR
 sGeEI5Y7kGPWjei16VdrNPbiSq3iND1PKOIVwCnCLpkR15KS4/MdcB4Vv7sqe2zk76As5myeesv
 OQpvOyIn/U0KaDj4fVI1RE+JBduqcDOg=
X-Received: by 2002:a1f:ae4e:: with SMTP id x75mr24136369vke.2.1624996241932; 
 Tue, 29 Jun 2021 12:50:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2QwtwJFnQ63/rhwX7k7+qMLetArckbu0g15vGPmarhCOWp4qvhLfHbUIL/jpfR5QR5HN+3g9nD96j9Zpl5Jo=
X-Received: by 2002:a1f:ae4e:: with SMTP id x75mr24136358vke.2.1624996241742; 
 Tue, 29 Jun 2021 12:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210629143621.907831-1-eric.auger@redhat.com>
 <20210629143621.907831-2-eric.auger@redhat.com>
In-Reply-To: <20210629143621.907831-2-eric.auger@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 29 Jun 2021 16:50:15 -0300
Message-ID: <CAKJDGDb5EN5U6XejNb1a5HvQ2Q+PU6ymZ1wF_7JGwSkBTa_eJQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] Acceptance Tests: Add default kernel params and
 pxeboot url to the KNOWN_DISTROS collection
To: Eric Auger <eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
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
Cc: qemu-devel <qemu-devel@nongnu.org>, peterx@redhat.com,
 Wainer Moschetta <wainersm@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 11:36 AM Eric Auger <eric.auger@redhat.com> wrote:
>
> When running LinuxTests we may need to run the guest with
> custom params. It is practical to store the pxeboot URL
> and the default kernel params so that the
> tests just need to fetch those and augment the kernel params.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v2 -> v3:
> - add fed32 and fed33 checksums
>
> v3 -> v4:
> - fix indent issues (Wainer)
> - use dl.fedoraproject.org instead of mirror
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 52 ++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


