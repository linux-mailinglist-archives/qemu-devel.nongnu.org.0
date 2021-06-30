Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2900B3B89EA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 22:54:01 +0200 (CEST)
Received: from localhost ([::1]:57498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyhDb-00044X-Qf
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 16:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyhCO-0003Kj-4S
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 16:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyhCK-0003Zs-0t
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 16:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625086358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CksgyOiL6W//9EAx0NihRF9lmtU3zQT6bTx8glcOs7E=;
 b=HQrQVWqE8yTIBuDS2Rf6Kzc7rohpg/TO9mz6JxYWFl2c6plUfl3x/u5fnARUoCood3KU6t
 pW8Ww8lWV+CqDoM5rVzqPYXX4SJOoKtX2VseKdL3NXqz/+Kd1PO8woaM14CfX9Lc3tV055
 9CcUrI+d2IVkWc42Ata1FlrzTZDyjV4=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-GIpJBySKOGeHW99ch8a52Q-1; Wed, 30 Jun 2021 16:52:37 -0400
X-MC-Unique: GIpJBySKOGeHW99ch8a52Q-1
Received: by mail-vs1-f71.google.com with SMTP id
 i4-20020a67f5840000b0290274a00a20d6so1440348vso.19
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 13:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CksgyOiL6W//9EAx0NihRF9lmtU3zQT6bTx8glcOs7E=;
 b=DqShHVW4DuvXxiFu+o0rUshwsj1hSNZSjaJYVZSdOLjoANR4nRlXKFLgG7kIUgDfsV
 RXZIO1VZ4lvmUN8Cy/YohjQZhj3aUosEJEGFh5CEhbpSVOXIF5bSpaY77mj9jtIHyYnV
 vUYj5isrpXNjBSncchyk1FSTnk9BVNyyUbtosFjmgnd+45W9Y2SlHOMn7EFulAbLnYS7
 Ce6DusEWOmp5vlClD3F1Q59dLTIrZCNcpRYIu/rbmE0b1/6xUsRUUs+6QsUXHWu4ltRe
 5GUJYbtLzdBsn7ZU2HuvOQPh3+BL/mS5NaJSycMpxOSbFyGPnpP8Qxsc5NthZ0AqHxHb
 CEIg==
X-Gm-Message-State: AOAM533O+06UCeV3ron3D2X53bEgJCCyEL7oNEpjOYlPRBkO2LVfcJu5
 HAQ/MRMEkCL6TKWNffGb2B6wb54J0JkzP9yuSPvwp+5RKdHtDzf/TbfKHFAeJusqUIHqCfauE/X
 nEQFk061uC9HIgxuA7EyrXsnwA6rv/Ck=
X-Received: by 2002:a05:6102:214e:: with SMTP id
 h14mr10234719vsg.1.1625086356786; 
 Wed, 30 Jun 2021 13:52:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUAnK4sxmPLhba6Its6se/vtrccOD8ONarY45mcs9k8QVYW4S3UTQvZI0WJf7woLFxz5DhIYr19lJ+2cdyTBE=
X-Received: by 2002:a05:6102:214e:: with SMTP id
 h14mr10234709vsg.1.1625086356631; 
 Wed, 30 Jun 2021 13:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210625172211.451010-1-berrange@redhat.com>
 <20210625172211.451010-4-berrange@redhat.com>
In-Reply-To: <20210625172211.451010-4-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 30 Jun 2021 17:52:10 -0300
Message-ID: <CAKJDGDYUC7hkvj4rx__VwKEmJqZZX+XPtN8wtkdWePeEaUd4qw@mail.gmail.com>
Subject: Re: [PATCH 3/3] cirrus: delete FreeBSD and macOS jobs
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 2:22 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> The builds for these two platforms can now be performed from GitLab CI
> using cirrus-run.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .cirrus.yml | 55 -----------------------------------------------------
>  1 file changed, 55 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


