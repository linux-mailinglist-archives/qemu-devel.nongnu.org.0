Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A32C3D679B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 21:42:42 +0200 (CEST)
Received: from localhost ([::1]:44260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86Ur-0007tU-J5
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 15:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m86TQ-0006Qc-Dn
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 15:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m86TO-0005LA-Si
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 15:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627328470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KhlsmPdrc+AsalWQUH1F+feSIsWBPOjlkdfQPIp3TNk=;
 b=HuxXLnmwjeNZq3Io4SX064Wme/Ulmaa7O5Ct24oVfu0u6mWcCC9A1T6CEDMJ5wQF1th3AL
 1001OQd+MuOucVlF4e9zu4XbBRTNNKkXSLpu/nrMXni3y8f+dPKaVNhY9e29jl0ui9wRu0
 Ij+kAQ9Ps/B73+Cj0j3jGG9lRi/zlmk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-nIDgmkHPN6Oy_HcOtoneZw-1; Mon, 26 Jul 2021 15:41:09 -0400
X-MC-Unique: nIDgmkHPN6Oy_HcOtoneZw-1
Received: by mail-pj1-f69.google.com with SMTP id
 o13-20020a17090a9f8db0290176ab79fd33so285384pjp.5
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 12:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KhlsmPdrc+AsalWQUH1F+feSIsWBPOjlkdfQPIp3TNk=;
 b=scuA/veWw7FXDE5ozXexnZsjKhVnPvqdQMQQyRPL5aOpkPGBvdKBlUQawKZoWjHisO
 4vpPTONFKtL6gsbx0tUksMo+OgIhbCREiGn6PHn8hTYK+UDN8EFLoYcYz8tJrIsvkJC/
 7znv2CxVefXlq8EJDPRbNcntxV3YHNBlFuuuAgeZg5lkixOpOc9KgFWGm1q59AnbWGZG
 5MFQjC4NOESHOgNyJF/jnb0xmRoo9/J8TFgL5gUgiXc6NEQb1K2dOPABp2uXlwMPk0bc
 5TRy8FIjTk+aBXUwzHYvttj6gFdKBKdZEleFHY403rtuD6SQyRQsHzKVm3tFh202y8zF
 L5Zg==
X-Gm-Message-State: AOAM530Viecpt2tcR5sSovv/2d8vYizsQG0RsWmbxAm1EHu9Zi52uCy+
 Q8z9clb5Ca5ISrtMIWx9xSGoqQsh5Dig23pWsJm3arU7IQlSu7pW2JnDQoqAF7FHEjRJGUYSpHw
 ZHWDYNFoKdA11U7JHFkmWPn+8wbxQXTU=
X-Received: by 2002:a17:90b:344a:: with SMTP id
 lj10mr579197pjb.108.1627328467976; 
 Mon, 26 Jul 2021 12:41:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+3QEl2EfqU6Dl6elwyt6FnT32XYMr80B1Tv0sMwGM7GGq9yq/LYFREcSkEqr/ZqORjV71n0giKKnNS++ntEM=
X-Received: by 2002:a17:90b:344a:: with SMTP id
 lj10mr579182pjb.108.1627328467761; 
 Mon, 26 Jul 2021 12:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210726150429.1216251-1-philmd@redhat.com>
 <20210726150429.1216251-4-philmd@redhat.com>
In-Reply-To: <20210726150429.1216251-4-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 26 Jul 2021 16:40:41 -0300
Message-ID: <CAKJDGDa_rWmomTwNDdCv4od3CyMQxbcAncRXi6f_f4RUkNJdPQ@mail.gmail.com>
Subject: Re: [PATCH-for-6.1 v4 3/4] gitlab-ci: Fix 'when:' condition in EDK2
 jobs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 26, 2021 at 12:07 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Jobs depending on another should not use the 'when: always'
> condition, because if a dependency failed we should not keep
> running jobs depending on it. The correct condition is
> 'when: on_success'.
>
> Fixes: 71920809cea ("gitlab-ci.yml: Add jobs to build EDK2 firmware binar=
ies")
> Reported-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .gitlab-ci.d/edk2.yml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


