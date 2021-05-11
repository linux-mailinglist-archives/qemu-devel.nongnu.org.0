Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF0D37B06A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:00:08 +0200 (CEST)
Received: from localhost ([::1]:45382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZU5-0002Ji-F5
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZT3-0001Tk-4G
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:59:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZT1-0007Rx-N8
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:59:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620766739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yi2vqWXur7W2vFjJzhXkLj+xEjhMi03bMCFWbgl4xFI=;
 b=IsSi4QBughNey7GBOqu1skmJmWwlXFYdLt5nmYwWFbwBHKh17LEzR467PCmXQOlYEgNU+I
 Dg30ReJKv4Sm5+s4lSdj6f8eXRNvTy6Vo1iW0BBNxfZQfo5gZb5lfK0sJMPHLEiIozkrZX
 qXgDtJ4bcAvqoxTMjpKnhAdl8EIH5c0=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-d0W13PAhMnSvRRPFS9iYBQ-1; Tue, 11 May 2021 16:58:57 -0400
X-MC-Unique: d0W13PAhMnSvRRPFS9iYBQ-1
Received: by mail-vs1-f69.google.com with SMTP id
 x22-20020a67c0960000b02902259994ab39so10210149vsi.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yi2vqWXur7W2vFjJzhXkLj+xEjhMi03bMCFWbgl4xFI=;
 b=FGjCfDFW6qaGGjwskNSBBG0Xh3xqMoy3dRBk7CnY27DY4aLsVgrP7cY7SMEiRp4DTm
 UZl7/Gce27n/WbgtYFByoPqFItqBthJDHmm0YtRuErp3tvxhpD3P46ZbhUlPn+NyswOl
 n2xTd7uVLpksGeKT0rvEy84oXUF1TSIoBe6Ln6kIQz2CJY1/ISgdGpUiUKSjUSsHqMZx
 Pv5N0fpOZaomZsSfhC9k0Nd07YBCpQNKZaN2XrQkcxteZTthLDs2YdsXyysBimNZCf73
 cTSZpbLzWalhyLneOKoJ65nkpiuEHqgekCiFs9luWGm4l/nVa6vuBLV4PeZUQumZO0bH
 IsfQ==
X-Gm-Message-State: AOAM531awBQXfHrDMTV+vIIkojrIsIcq9rFEamti0fRGGWl9d8PUhCPl
 HC4zhNGD5iySUcwp9Lbe4yNHVIWqANN5fO/blHcAezeuPekYlUUZRzP9RGwTgfEOrWanSdvg6fZ
 qlwJKTl5Ww/f/oLmqo/SyQfYwtQWlDvM=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr28378678vsg.45.1620766737148; 
 Tue, 11 May 2021 13:58:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6fmc41EoPD15TtNxH6AYczkmIPKfUxsssPKrvM9kuGD3e36Ym6WokSPi/7DhAi6Gl+QDbo+NsC2OyamnWZHQ=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr28378671vsg.45.1620766737001; 
 Tue, 11 May 2021 13:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-6-berrange@redhat.com>
In-Reply-To: <20210511132641.1022161-6-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 17:58:31 -0300
Message-ID: <CAKJDGDaWb1P9SUCAic11dfjRD08+2=r+5n+HUyX_PV1KYDV5tA@mail.gmail.com>
Subject: Re: [PATCH 05/12] crypto: bump min gcrypt to 1.7.6,
 dropping RHEL-7 support
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
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 10:28 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target. This lets us increment the minimum required gcrypt version and
> assume that HMAC is always supported
>
> Per repology, current shipping versions are:
>
>              RHEL-8: 1.8.5
>      Debian Stretch: 1.7.6
>       Debian Buster: 1.8.4
>  openSUSE Leap 15.2: 1.8.2
>    Ubuntu LTS 18.04: 1.8.1
>    Ubuntu LTS 20.04: 1.8.5
>             FreeBSD: 1.9.2
>           Fedora 33: 1.8.6
>           Fedora 34: 1.9.3
>             OpenBSD: 1.9.3
>      macOS HomeBrew: 1.9.3
>
> Debian Stretch has the oldest version and so 1.7.6 is the new minimum.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.yml     | 10 ----------
>  configure          | 18 +-----------------
>  crypto/meson.build |  6 +-----
>  3 files changed, 2 insertions(+), 32 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


