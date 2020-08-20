Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5EC24C720
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 23:23:19 +0200 (CEST)
Received: from localhost ([::1]:36800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8s1m-00058D-Ai
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 17:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1k8s0v-0004Ee-5g
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 17:22:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36401
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1k8s0t-000699-4M
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 17:22:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597958542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ahJCW3Krcp5jfEB/pXyi0ZJrBM5Uoc0J/+oYWQ2Ggl8=;
 b=gg8BNbdMNBKsdTh7VrgdfCXa1XYua39HLGHZfLSprDGOiHZdWHQGrDbQAzA2hA4rrzvsJW
 OmQpSlUkD3uamewifnWDQSnUJMaFR7BknXerlOIB6HjdGQumI5wF3X9UynRoQsKpyeWNwq
 u+aR+mGz4J7CH3YktQB2wsOkplZ0EKY=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-IRBC4I62Ns6l8rgOo4SxWA-1; Thu, 20 Aug 2020 17:22:20 -0400
X-MC-Unique: IRBC4I62Ns6l8rgOo4SxWA-1
Received: by mail-ot1-f70.google.com with SMTP id b11so1523627otl.17
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 14:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ahJCW3Krcp5jfEB/pXyi0ZJrBM5Uoc0J/+oYWQ2Ggl8=;
 b=tvudrjIYCwV5uboahHFQbbOL+cnBesErRlwRcwvnLyejdLhbF2JSZVvyGXytE5Qi1/
 Z/U3pAGRoqd8Yuk2Z29BljJ/pHanjuCf0IjlehhAYfQvwInpHTRJgBKdJo5+QWl9fTB2
 D9+Jj9oA0DbyD8biRkTxRFXJF8TXxkmMdtjpeFvEBZ6ciyM9aGIvlSHJzGEU4DoCe4An
 Esq+1pEOFxDrWHNjyRCqx9WUEyx8InUXr7zMQcOFX2BOnsjqxkOmKEHIRVtxhSMG8Leu
 4lXHpGAihK8HVy4R2Ir9kao2xDr/zwZCaFY1k5ELsjRZw0Ce5/kRaRU2lC3GnqVN1hSS
 RF5A==
X-Gm-Message-State: AOAM532mSDpquOmsUYXQOsCSzHEMHlQkqvbvQbIAgn1CYfesY24wBjwD
 qmsWTgHhDAoUn+F1UuNp/TCUJH/qq/blKhJDqf8LCb1WTvdZdWheq9JpI7KcGuyaNZwSNznK3xz
 NcJeJq7jFIKRCawjoCFR5rH5q0On2vck=
X-Received: by 2002:a05:6808:204:: with SMTP id l4mr240415oie.16.1597958539781; 
 Thu, 20 Aug 2020 14:22:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOIr7ImNOz0HZ1Vim2xmc9WVIOyeMqmi6tkyXbiFqngOqPbZZ6MDRlD9s1nZuW1UlkntaYCYCEi3xDKof1Qw0=
X-Received: by 2002:a05:6808:204:: with SMTP id l4mr240358oie.16.1597958538114; 
 Thu, 20 Aug 2020 14:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200820211905.223523-1-nsoffer@redhat.com>
In-Reply-To: <20200820211905.223523-1-nsoffer@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Fri, 21 Aug 2020 00:22:02 +0300
Message-ID: <CAMRbyyuVk1wth6tjh2xroHwf6Ni1TbjBTKFZkHQxcdqJfqvMjw@mail.gmail.com>
Subject: Re: [PATCH] qemu-iotests: Fix FilePaths cleanup
To: Nir Soffer <nirsof@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=205.139.110.120; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 17:22:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 21, 2020 at 12:19 AM Nir Soffer <nirsof@gmail.com> wrote:
>
> If os.remove() fails to remove one of the paths, for example if the file
> was removed by the test, the cleanup loop would exit silently, without
> removing the rest of the files.
>
> Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> ---
>  dtc                           | 2 +-
>  tests/qemu-iotests/iotests.py | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/dtc b/dtc
> index 85e5d83984..88f18909db 160000
> --- a/dtc
> +++ b/dtc
> @@ -1 +1 @@
> -Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
> +Subproject commit 88f18909db731a627456f26d779445f84e449536

This sneaked into the patch somehow, I did not change this.

> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 717b5b652c..16a04df8a3 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -468,11 +468,11 @@ class FilePaths:
>          return self.paths
>
>      def __exit__(self, exc_type, exc_val, exc_tb):
> -        try:
> -            for path in self.paths:
> +        for path in self.paths:
> +            try:
>                  os.remove(path)
> -        except OSError:
> -            pass
> +            except OSError:
> +                pass
>          return False
>
>  class FilePath(FilePaths):
> --
> 2.26.2
>


