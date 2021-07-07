Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CBA3BF0E3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 22:41:04 +0200 (CEST)
Received: from localhost ([::1]:50868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ELv-0006Zh-1k
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 16:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1m1EKk-0005lt-Do
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 16:39:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1m1EKg-0008Ce-0x
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 16:39:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625690384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tK2cEpeJbeIBRudU8QHN4T2Gl2MfQnV6BZQivjDP+C0=;
 b=VxzNaYRrsB+an1t+oxhbvroPQnNYL9n5llfOrCLiN7w/FeBcg8VveZaOks5bq3j5f8kiMe
 aCkWSh6r8OtPXO2mZb+LuL+y4ks8iNCdqqAWxeVCKY1mppZ9HRJkQ5gd2hSqNvI4Vn+GbS
 zkUgyoL0lrEZHH62oZQD1LPE2I/OLBY=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-K0rh1P7bMSmIIwOdGsxzMA-1; Wed, 07 Jul 2021 16:39:42 -0400
X-MC-Unique: K0rh1P7bMSmIIwOdGsxzMA-1
Received: by mail-ot1-f72.google.com with SMTP id
 p17-20020a0568301311b0290467775813d3so2419257otq.9
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 13:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tK2cEpeJbeIBRudU8QHN4T2Gl2MfQnV6BZQivjDP+C0=;
 b=M8AX8WFDpet+JRCZzGIC7Q2aqkVb2KWgvH7B2eMcoLCyQnI0V4+PlyhkrGHeQzb9V4
 cSNUliquoXAX1lgN7WbfvFiK0qC5xfBNkaEQmj9kL5ookdViBCyLn0STPzjmrUDyqXSY
 4/3y1OGynZpox7c05Sxadrb9lnsXxJtjml80CD0C3/7gRjc8cFx/owhUdynDdCXUrj96
 u4SUBK93+bnckzpPnZ+EXjgBDMKxeBOm5JavIrGw0nllB/gfXH4S8Tymk4r4uR2wJrzN
 N/yfATVmvv14XGOVbb83jD3eWDzl/xRInFMTLvxrMmFtvN1d3gf6gCPoUPugsF6xATa6
 /t4A==
X-Gm-Message-State: AOAM531DDSQEgK4QPSFo2+Me8mFhD+VNGAhstZx/W/UwGW8MpgSz9KD6
 8ijSIGhNp20ZTjREW+ZbyGGujtZcZfbhaiJj3a+q+8IJ20lJ5I2JmQys5TaMVKpmyT+KW1MWuv8
 riN7Ubh3SE8OXUN2aT+PigXJS9SVec68=
X-Received: by 2002:aca:5b07:: with SMTP id p7mr20676708oib.118.1625690382260; 
 Wed, 07 Jul 2021 13:39:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3NQQqAOtT7op2agMFsJ3aQJmYds9TB7odnVbaJb9zkVSU1aAvqEE/rHZYQNzJD1GIWXvtB7PP3wAY9s2VgM4=
X-Received: by 2002:aca:5b07:: with SMTP id p7mr20676699oib.118.1625690382120; 
 Wed, 07 Jul 2021 13:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210701190655.2131223-1-eblake@redhat.com>
 <20210707184125.2551140-1-eblake@redhat.com>
In-Reply-To: <20210707184125.2551140-1-eblake@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 7 Jul 2021 23:39:26 +0300
Message-ID: <CAMRbyyvNaxr_KLLN3dv7DuxqVCZdL6Ug9+OUKcgn49iLf7CAcQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/2] qemu-img: Reword 'qemu-img map --output=json' docs
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 7, 2021 at 9:41 PM Eric Blake <eblake@redhat.com> wrote:
>
> Reword the paragraphs to list the JSON key first, rather than in the
> middle of prose.
>
> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  docs/tools/qemu-img.rst | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index d6300f7ee03d..1d8470eada0e 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -593,16 +593,16 @@ Command description:
>    the ``start``, ``length``, ``offset`` fields;
>    it will also include other more specific information:
>
> -  - whether the sectors contain actual data or not (boolean field ``data``;
> -    if false, the sectors are either unallocated or stored as optimized
> -    all-zero clusters);
> -  - whether the data is known to read as zero (boolean field ``zero``);
> -  - whether the data is actually present (boolean field ``present``);
> -    if false, rebasing the backing chain onto a deeper file would pick
> -    up data from the deeper file;
> -  - in order to make the output shorter, the target file is expressed as
> -    a ``depth``; for example, a depth of 2 refers to the backing file
> -    of the backing file of *FILENAME*.
> +  - boolean field ``data``: true if the sectors contain actual data,
> +    false if the sectors are either unallocated or stored as optimized
> +    all-zero clusters
> +  - boolean field ``zero``: true if the data is known to read as zero
> +  - boolean field ``present``: true if the data belongs to the backing
> +    chain, false if rebasing the backing chain onto a deeper file
> +    would pick up data from the deeper file;
> +  - integer field ``depth``: the depth within the backing chain at
> +    which the data was resolved; for example, a depth of 2 refers to
> +    the backing file of the backing file of *FILENAME*.
>
>    In JSON format, the ``offset`` field is optional; it is absent in
>    cases where ``human`` format would omit the entry or exit with an error.
> --
> 2.31.1

Would be nice if this could be generated from the json schema instead
of repeating the type and description of the fields, but this is a nice
improvement.

Reviewed-by: Nir Soffer <nsoffer@redhat.com>


