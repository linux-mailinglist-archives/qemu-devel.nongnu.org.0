Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670C33BC0DD
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 17:35:33 +0200 (CEST)
Received: from localhost ([::1]:60386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0QdA-0004bQ-G7
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 11:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0QaH-00018L-Js
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:32:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0QaF-0002S5-QY
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625499150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMArE7Jm2mnxX0455gAQnJ09GGafgUvhLsRJG+2lxoo=;
 b=B7AZS4q2I9KhRTW0JjZy6SGMDGPhKEzW0Bn9u5zLLlNSUD8eG9FjhyeGZDYICvSgGVYe/W
 BSiaQxgQTfXgJ3gPQB5jNzEHj02zlVxmJYX8ux3yFy2Sn8W78oXfPOd2GGlu2Vk6YQcD14
 wvPbmNj/rLGjFwbtt6jIwEyQ5A8fHR8=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-ySH--9EZNUqvyK650bWYPg-1; Mon, 05 Jul 2021 11:32:27 -0400
X-MC-Unique: ySH--9EZNUqvyK650bWYPg-1
Received: by mail-vk1-f198.google.com with SMTP id
 g64-20020a1f52430000b0290230feb5a2b9so4904245vkb.21
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 08:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RMArE7Jm2mnxX0455gAQnJ09GGafgUvhLsRJG+2lxoo=;
 b=tFc5ju3Y/TLJyvMY5RlB3dI/smXptbe7YAejCnhx60Ys/DbkIWfGr6bks0Cf74AEbX
 4qfbxc1qgntTwZdN/Vie2pqCMQKhT1unr9MISO5Y1zNQEz6LoTOQGxShpbMa7QLDGEkd
 xpZl/LI+HmaLPgOtbvhpb/yA1J5fpYnD+ywUzeCLFN/dbdvGSkZ7upTPZXbffBHpkFvt
 ie9nWPN/5Wj1Dg0bpyqyt+ULw231o4XZEWupiUiQKbnIyvWjS7AQEtuJe1S2CYnZUHUJ
 tn2zXfWg2WoFK+aOTkX8NRXBcLuDuuvpLQnMRhIcBkbErbE5ESuk2U/n7vNBegLo8gJV
 tQyQ==
X-Gm-Message-State: AOAM5308R2ova3ooZpvVBhVlaAbLr/RT2gz34cq9xJCN5Web1tvXQZWY
 MqbYnKcPciSAkW3uJBz9OuT6wfqbuLCV8S7L9yqbXAmHGT5pBp4vrJDzJ/5m2TCDuafjvWV1Owo
 5KuIf1gIIwXJrIdJI+sm7c4uJnghUuhw=
X-Received: by 2002:ab0:3253:: with SMTP id r19mr10371799uan.5.1625499147366; 
 Mon, 05 Jul 2021 08:32:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeWsj5WFuv2FLOPp7gPH8NntDd2YTDpa2+WNM/k4VtYtig2g3qF6Upcn6yiO9rLYyCZieA1IP4WKbHOgW6PrU=
X-Received: by 2002:ab0:3253:: with SMTP id r19mr10371776uan.5.1625499147187; 
 Mon, 05 Jul 2021 08:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-9-f4bug@amsat.org>
In-Reply-To: <20210623180021.898286-9-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 12:32:01 -0300
Message-ID: <CAKJDGDYbYzM-=8unSiWbfgi+Q-CQgaUu3VaPe5zwY1yeT2X9Fw@mail.gmail.com>
Subject: Re: [PATCH 8/9] tests/acceptance: Remove now unused pow2ceil()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel <qemu-devel@nongnu.org>, Tom Yan <tom.ty89@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 3:10 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> We don't use pow2ceil() anymore, remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 12 ------------
>  1 file changed, 12 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


