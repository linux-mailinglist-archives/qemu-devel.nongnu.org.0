Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2A337B018
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:34:48 +0200 (CEST)
Received: from localhost ([::1]:41982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZ5b-00051c-B5
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZ3z-0003gr-Tc
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:33:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZ3y-0007uo-GM
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620765185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/VE+gLwmMk8u58B+zONWiemiknVL3uKCEyol7wUKD0=;
 b=YhCqCAz3kfOZAhKOfCNO8pScIGMR82jdphuR/WLxOcQ9bSEBP1AKTk+l10ej8qBzpNKbnH
 9xwnwyjo6jT3eMQymAXbM8jWGRpBr4CQh9+tk/OJpFeloVyiStUsiz6CdRJhNd2DN+wXAY
 pOzSuxLHmGO4Sqa9UtNC8yCXZisY2xU=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-BQDx9RHmPoesJGWOkowpmg-1; Tue, 11 May 2021 16:33:04 -0400
X-MC-Unique: BQDx9RHmPoesJGWOkowpmg-1
Received: by mail-ua1-f71.google.com with SMTP id
 n10-20020a9f3eca0000b029020c98b1ea68so462529uaj.18
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E/VE+gLwmMk8u58B+zONWiemiknVL3uKCEyol7wUKD0=;
 b=mdsHbSOrKqPahbkr8Zn6vB0rCYv3Vr1GadzNzWQ/jzvpo29JyqO9NJ4vQuEtu0oA8R
 GIVFTkmEbeaNDX6m7jk6xJ/kwWkE/8yccMUR6fNKYBHvxMMUrQ2a2jz75DBZFCySTOiM
 duZnb039Vy9OcS4erBHBWPE2P7lyIc6QmCNQb25yi71pyCLys040oqFPnCYYs6yK+5r9
 EQnl5S30+7zdqHETGeILIx7jODTsB9GcGfjvJM4rCYWJhJ/n3iPxhrsXfsxdWrpGEtbE
 YehqGzHfHuy585lUvSyl9Ya4va9rIgYFdXX9BtenFg/9MaR89967N1yK1fFiiQdRYCr1
 QK2A==
X-Gm-Message-State: AOAM532fFKenYLKDZ8G6TVOeWf39uN69xn1IoWjvtNBS17ZP3XpKxzQL
 n2oL3j7CpmicfLcg0pXjevvHl7f1fbXzBWKQqYmFjDiDPVsV8WI66MQ/nb8k9rM0/eHqBOGGLap
 ctbwH8uSoGysK0MLS8L604MgMq1Cu5MI=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr28296704vsg.45.1620765183736; 
 Tue, 11 May 2021 13:33:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze2GunvxwElUwrarzaYel1tFhbsLlPtLMQyuvLno+2bbVw7ZimhOY81UX4bEHMO+c6CFRNLIGDTJYDzLf40k8=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr28296691vsg.45.1620765183552; 
 Tue, 11 May 2021 13:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210511072952.2813358-1-f4bug@amsat.org>
 <20210511072952.2813358-7-f4bug@amsat.org>
In-Reply-To: <20210511072952.2813358-7-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 17:32:37 -0300
Message-ID: <CAKJDGDYW2X2h1Hh0=76GuZXihHprrJbGgQQ-s8c-yJZ_upOEpw@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] gitlab-ci: Extract build stages to stages.yml
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 4:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Extract the build stages used by our job templates to a new file
> (stages.yml) to be able to include it with the other templates,
> without having to run all the jobs included in the default
> .gitlab-ci.yml, which are mainly useful for mainstream CI.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/stages.yml |  8 ++++++++
>  .gitlab-ci.yml          | 10 +---------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>  create mode 100644 .gitlab-ci.d/stages.yml
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


