Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9782357481
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 20:44:44 +0200 (CEST)
Received: from localhost ([::1]:37042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUDAR-0002bq-7S
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 14:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lUD6h-0000gb-80
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:40:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lUD6f-0001AK-CP
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617820848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwY3H4fJwDhb6b713eNOsvQ/tD8rzv8BNHLSTOmlFw8=;
 b=etiofa6357JBPdhvcT+hj9y1sF2lJp//wr1DyWqyyWDfPkJb62WxxIRtFSup/zDsKwc28A
 IrWarqWy6+FdYGe+dztb5cphbJr2mHmvg1HhKp8jqxqNIOOnHEv3Yfzb75HvSR5/lBhbGL
 2olN8P7XhoBxVVlW8mlud9QnRPahsWc=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-5A9qAKvfP567_lX0TCcsEw-1; Wed, 07 Apr 2021 14:40:46 -0400
X-MC-Unique: 5A9qAKvfP567_lX0TCcsEw-1
Received: by mail-vk1-f200.google.com with SMTP id s194so6230473vkh.8
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 11:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lwY3H4fJwDhb6b713eNOsvQ/tD8rzv8BNHLSTOmlFw8=;
 b=bEm7ZNjmH8meEjvOD0kLZLRlhkdBuA7xoDYMSyFBDtHcVWD/M9n5/5U7Qz9ZnTW7yy
 5QZuYoRy45SlN+XdqOttqBmQPibsSk9nu/RKWuxb/AuzPh/u08HjtCsC3arZVU/YiZHf
 i94A9wdbotXcy2PdN8JgQ2fcBcNPhfRFiL/zIgGT/IMZtPTW+HVcd2RR34e8KgPyrl8Q
 RSyDXOXXBvapsW5KHN9IS6zQSu6TQ9I52Bg2hwta2t+efgkzMCrxGktzNgIatYAzPZI8
 gaiK+Ro6Mu14bnYPdgoHZEEynvYaIgz5TVZ9zTRh5GXXcPdKu6xyOFu3CeG6G9DhrVxd
 Uvmw==
X-Gm-Message-State: AOAM531GLvEu5DkkRR3Rgjvm+qW6vH+g6Aad3KCAo6qL7QDtWoVTpGnx
 YtWQXjYTo56llT/cus+5tZxc6U/kWD3dJSpQ1QRdIw/uEFe182nD2TZdqln0L8mul+5xfUTutIT
 myScXMihWGc6Izza6J2DOa/zGsCiJoek=
X-Received: by 2002:a1f:2cd:: with SMTP id 196mr3147128vkc.19.1617820846336;
 Wed, 07 Apr 2021 11:40:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbIagdpxvLbEaTQrw2o3pNKxpfc8eGrg9ClYt7ohDJq/kmOvpdDDxEAp0qjeIb25bBgihE3iwgzRH2u6UlBxw=
X-Received: by 2002:a1f:2cd:: with SMTP id 196mr3147121vkc.19.1617820846165;
 Wed, 07 Apr 2021 11:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-12-clg@kaod.org>
In-Reply-To: <20210407171637.777743-12-clg@kaod.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 7 Apr 2021 15:40:20 -0300
Message-ID: <CAKJDGDYf5_4EA2viA=o1qvWmMJvOxoJMP60yiGX+11dVDd9HHA@mail.gmail.com>
Subject: Re: [PATCH 11/24] tests/acceptance: Test ast2400 and ast2500 machines
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 7, 2021 at 2:33 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Joel Stanley <joel@jms.id.au>
>
> Test MTD images from the OpenBMC project on AST2400 and AST2500 SoCs
> from ASPEED, by booting Palmetto and Romulus BMC machines.
>
> The images are fetched from OpenBMC's release directory on github.
>
> Cc: Cleber Rosa <crosa@redhat.com>
> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Co-developed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Tested-by: Cleber Rosa <crosa@redhat.com>
> [ clg : - removed comment
>         - removed ending self.vm.shutdown() ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Message-Id: <20210304123951.163411-2-joel@jms.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  tests/acceptance/boot_linux_console.py | 43 ++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


