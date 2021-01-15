Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69452F84B9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:51:12 +0100 (CET)
Received: from localhost ([::1]:55560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0UBj-0005eG-UZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0U63-0001yZ-D9
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:45:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0U5z-0005iZ-A6
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610736314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YST+dhls4Hu6RqpoK8yrjqIR3yK+g54h5P1dHKFwesM=;
 b=S4CjmogFKCt6o+5UEcO/V7HBNN4jHgkXAm/XG1Q/nIHLju4XzaRfqJ8P6UdzaRK89V1HO4
 h/P3OhIri13mACHVtpHsq1/NS40wjP6pkcNzoCJMryPx40a7F0Dne/l6yLfchTfDolUSwX
 qvNVKzqbBwZeA1OP/ExoumYRidUJ97U=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-NsoLxc2fMq-qPhq37TxEKg-1; Fri, 15 Jan 2021 13:45:10 -0500
X-MC-Unique: NsoLxc2fMq-qPhq37TxEKg-1
Received: by mail-vs1-f71.google.com with SMTP id a18so1855098vsp.9
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 10:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YST+dhls4Hu6RqpoK8yrjqIR3yK+g54h5P1dHKFwesM=;
 b=a86nXIlL9VU8hN/8xubo1QVPFTm0krhxrZG7H/54kIhzdnoV2UA99r759/6WAGlbY1
 LRY4G4M7kGpoenkH3KNoMLVB6sm/63oHPqK/htVeHgiqH6C8AuY10sGagwURPESLmb2v
 /RiaBsL6yDO5oSuYWZjILtCd+3rSuj3+cHJUsL9LQqzuB0aTpFX1fmwZI/2g2m3giX/t
 0NOixFKjPGQuJApzh5jLjqKJiYVa2+mhl46d6ZlSCXBz65w7I9XksaOot1smqvKTnl6X
 UyV9q0aoFmqP6CdpxqoOJjWv1dEwOiuWW6Q5Ep5M+9g/hGd48c94y3pth3RuE0TAnSm2
 B+5g==
X-Gm-Message-State: AOAM531+RB1f4bfuyc8VIeEpZIRfeB12O1fG4yCaSBd2MwZZ2CmCUeX1
 Ho6oLfhDr0ys5jM10Q3jGkVFKFJLux9FXA2ZuWZjVvLY5cN4G3gkj0RPTmpA3KVpj7sJZLasLtq
 9S3a8XZpj9h0rON4o53BKJhGiB9kaCCE=
X-Received: by 2002:a67:f910:: with SMTP id t16mr5753992vsq.50.1610736309726; 
 Fri, 15 Jan 2021 10:45:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMzonraecMtKXNK8SaQc4fXGelQTUESidqOCWrFV1CrIlZ55Eb0wyDXCyS9OXIBGzxZfJpJear0l5iU4HxxOE=
X-Received: by 2002:a67:f910:: with SMTP id t16mr5753970vsq.50.1610736309537; 
 Fri, 15 Jan 2021 10:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20210115174315.30949-1-mreitz@redhat.com>
 <20210115174315.30949-2-mreitz@redhat.com>
In-Reply-To: <20210115174315.30949-2-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 15 Jan 2021 15:44:43 -0300
Message-ID: <CAKJDGDbw2gyn4GpUnheZ6Fuz-3YSAX8hwEUKrWTOPV51fxnJ7w@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] iotests.py: Assume a couple of variables as given
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 2:43 PM Max Reitz <mreitz@redhat.com> wrote:
>
> There are a couple of environment variables that we fetch with
> os.environ.get() without supplying a default.  Clearly they are required
> and expected to be set by the ./check script (as evidenced by
> execute_setup_common(), which checks for test_dir and
> qemu_default_machine to be set, and aborts if they are not).
>
> Using .get() this way has the disadvantage of returning an Optional[str]
> type, which mypy will complain about when tests just assume these values
> to be str.
>
> Use [] instead, which raises a KeyError for environment variables that
> are not set.  When this exception is raised, catch it and move the abort
> code from execute_setup_common() there.
>
> Drop the 'assert iotests.sock_dir is not None' from iotest 300, because
> that sort of thing is precisely what this patch wants to prevent.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/300        |  1 -
>  tests/qemu-iotests/iotests.py | 26 +++++++++++++-------------
>  2 files changed, 13 insertions(+), 14 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


