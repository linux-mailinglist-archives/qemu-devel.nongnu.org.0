Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CA43B0B14
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 19:06:23 +0200 (CEST)
Received: from localhost ([::1]:37410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvjqw-0006Qn-Ce
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 13:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lvjpY-0005Dp-Aq
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 13:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lvjpS-0004MR-FK
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 13:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624381488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H4WYyJ1kN09AqFbdJIHGv94jmZpe9T6KvYpS+kpxKOg=;
 b=cNuZTvARIM0k5bUAc44uTMIs0SGEmn1B8xzckZxHDINvZ/GqJAPlfrkpItiCsXfIDGmn1H
 NCe4vFS2aIkNbA+rkhH/j36Fi0i/KOeThjgPZiW4HKQLpXHO9c8QyHKFHurZbkym2Pc3pk
 ZyYSw7DeyHFnheslTKAaCLHWzyJFcsQ=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-uZ_-q8I6N0K9LCO2W5x3CQ-1; Tue, 22 Jun 2021 13:04:47 -0400
X-MC-Unique: uZ_-q8I6N0K9LCO2W5x3CQ-1
Received: by mail-oo1-f70.google.com with SMTP id
 v19-20020a4a31530000b029024944222912so72519oog.1
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 10:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H4WYyJ1kN09AqFbdJIHGv94jmZpe9T6KvYpS+kpxKOg=;
 b=KsP1NpWrU88uciHBT0h7C6QSa4+IvdIVggJIzey8Ym3M6V+i06yd8T1Ti3KtKyqFna
 8r1WPWK+wHwR4aNbIyd6+uFbctzu4JmWoEqWdS4ggwlp5nf9I0pnpaiwT/sSbHwJp5dU
 qogGeW9mAefM6srIcD2WD//oiOYsWjzpNQEfG6H78py9aT1lAQs15Kv8CQtovUV/vNOQ
 nWj2doxzmveh1JHMiRsfH/+nJKDwa5fTpczW7MpFS7PMfMdgIZVepLzLCzsATnQG6A5r
 9C8upBEZslx79sm1C+kenavznzQ0FrRBJXe1x8tV7edvZFJD+rh3RvyZcSpa9mmOPXkh
 2ETg==
X-Gm-Message-State: AOAM53360DY1GuOufIk/PRsX3kFLLj0jcsUzVIFdZFRn+lDxAOa1N1aJ
 GfnPwqpgPyHQ8Do/HsmRHHxA66nPXjGZtFjKoJNOLUxfZP298yjzZm19Eq1Fh8dwzGJJv9jFEAH
 33bpvYD0mShFWw2s9zWH9R0uNluBcc9E=
X-Received: by 2002:a05:6808:3c4:: with SMTP id
 o4mr3905306oie.41.1624381486985; 
 Tue, 22 Jun 2021 10:04:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp7xP7+RTJ9OIyFlrmjy49h0wp95ggMdIeT3O43+8Cv3efFt8Di6F34faQ0X/brWeAwLyQtcmtHsiAXpIYrqA=
X-Received: by 2002:a05:6808:3c4:: with SMTP id
 o4mr3905293oie.41.1624381486820; 
 Tue, 22 Jun 2021 10:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210611140157.1366738-1-eblake@redhat.com>
 <20210611190316.1424729-1-eblake@redhat.com>
In-Reply-To: <20210611190316.1424729-1-eblake@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 22 Jun 2021 20:04:30 +0300
Message-ID: <CAMRbyyv1hUAtPVqQFTmXkeBf5K3XdKyGMoQgX8xNLqPdTopd2g@mail.gmail.com>
Subject: Re: [PATCH v2 2/1] qemu-img: Add "backing":true to unallocated map
 segments
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 10:03 PM Eric Blake <eblake@redhat.com> wrote:
>
> To save the user from having to check 'qemu-img info --backing-chain'
> or other followup command to determine which "depth":n goes beyond the
> chain, add a boolean field "backing" that is set only for unallocated
> portions of the disk.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>
> Touches the same iotest output as 1/1.  If we decide that switching to
> "depth":n+1 is too risky, and that the mere addition of "backing":true
> while keeping "depth":n is good enough, then we'd have just one patch,
> instead of this double churn.  Preferences?
>
>  docs/tools/qemu-img.rst    |  3 ++
>  qapi/block-core.json       |  7 ++-
>  qemu-img.c                 | 15 +++++-
>  tests/qemu-iotests/122.out | 34 +++++++-------
>  tests/qemu-iotests/154.out | 96 +++++++++++++++++++-------------------
>  tests/qemu-iotests/179.out | 66 +++++++++++++-------------
>  tests/qemu-iotests/223.out | 24 +++++-----
>  tests/qemu-iotests/244.out |  6 +--
>  tests/qemu-iotests/252.out |  4 +-
>  tests/qemu-iotests/274.out | 16 +++----
>  tests/qemu-iotests/291.out |  8 ++--
>  tests/qemu-iotests/309.out |  4 +-
>  12 files changed, 150 insertions(+), 133 deletions(-)
>
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index c155b1bf3cc8..fbc623b645c3 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -601,6 +601,9 @@ Command description:
>      a ``depth``; for example, a depth of 2 refers to the backing file
>      of the backing file of *FILENAME*.  Depth will be one larger than
>      the chain length if no file in the chain provides the data.
> +  - an optional ``backing`` field is present with value true if no
> +    file in the backing chain provides the data (making it easier to
> +    identify when ``depth`` exceeds the chain length).
>
>    In JSON format, the ``offset`` field is optional; it is absent in
>    cases where ``human`` format would omit the entry or exit with an error.
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 2ea294129e08..cebe12ba16a0 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -264,6 +264,9 @@
>  # @offset: if present, the image file stores the data for this range
>  #          in raw format at the given (host) offset
>  #
> +# @backing: if present, the range is not allocated within the backing
> +#           chain (since 6.1)
> +#
>  # @filename: filename that is referred to by @offset
>  #
>  # Since: 2.6
> @@ -271,8 +274,8 @@
>  ##
>  { 'struct': 'MapEntry',
>    'data': {'start': 'int', 'length': 'int', 'data': 'bool',
> -           'zero': 'bool', 'depth': 'int', '*offset': 'int',
> -           '*filename': 'str' } }
> +           'zero': 'bool', 'depth': 'int', '*backing': 'bool',
> +           '*offset': 'int', '*filename': 'str' } }
>
>  ##
>  # @BlockdevCacheInfo:
> diff --git a/qemu-img.c b/qemu-img.c
> index 33a5cd012b8b..4d357f534803 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -2977,8 +2977,13 @@ static int dump_map_entry(OutputFormat output_format, MapEntry *e,
>          break;
>      case OFORMAT_JSON:
>          printf("{ \"start\": %"PRId64", \"length\": %"PRId64","
> -               " \"depth\": %"PRId64", \"zero\": %s, \"data\": %s",
> -               e->start, e->length, e->depth,
> +               " \"depth\": %"PRId64, e->start, e->length, e->depth);
> +        if (e->has_backing) {
> +            /* Backing should only be set at the end of the chain */
> +            assert(e->backing && e->depth > 0);
> +            printf(", \"backing\": true");
> +        }

It will be easier to inspect the output if common fields come before
optional fields.

> +        printf(", \"zero\": %s, \"data\": %s",
>                 e->zero ? "true" : "false",
>                 e->data ? "true" : "false");
>          if (e->has_offset) {
...
> diff --git a/tests/qemu-iotests/122.out b/tests/qemu-iotests/122.out
> index 779dab4847f0..c5aa2c9866f1 100644
> --- a/tests/qemu-iotests/122.out
> +++ b/tests/qemu-iotests/122.out
> @@ -68,11 +68,11 @@ read 65536/65536 bytes at offset 4194304
>  read 65536/65536 bytes at offset 8388608
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  [{ "start": 0, "length": 65536, "depth": 0, "zero": false, "data": true},
> -{ "start": 65536, "length": 4128768, "depth": 1, "zero": true, "data": false},
> +{ "start": 65536, "length": 4128768, "depth": 1, "backing": true, "zero": true, "data": false},

So this output would be:

    [{ "start": 0, "length": 65536, "depth": 0, "zero": false, "data": true},
     { "start": 65536, "length": 4128768, "depth": 1, "zero": true,
"data": false, "backing": true},


