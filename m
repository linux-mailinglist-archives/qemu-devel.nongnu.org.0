Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699093F4764
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 11:25:50 +0200 (CEST)
Received: from localhost ([::1]:40814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI6DF-00025a-HF
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 05:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mI6C1-0000j0-T8
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:24:33 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:35681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mI6C0-0003TZ-44
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:24:33 -0400
Received: by mail-ej1-x630.google.com with SMTP id w5so35599001ejq.2
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 02:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mBhotRQOGZByY35WJ66PUxruZrUDovI14DTDBW43AsY=;
 b=v31kc4hi2qTVwmsVHXm0HUK4uTxMBsDFpN3duKL46Joi6Pm8fk/QLPhfMkcWXN3q2m
 9M/xDGHInIK9oTZfK8QjhkNQkarUilfUCUgmb+viB4b1fpc8TiIMg3v+Rq6Vd2ABsIJx
 BqxvCfyBCH5cSiFV7wSZvj9CrgWWXxbYI+J4hKjj2ETxbXV/gu7RjYmLc4VInHgzOLbe
 +PKCehHvUtiDU20rWN6HK8qUlv2dbODQIOgA7bEyplyZeermUpNPax2ZtDrX2ghNeq9m
 C929MR+13JVIsLVxqsBULjRsgYQxLQ65D4ZnL3VZ5bHexBSn4rJtlO1FMiwvGmiBDxta
 Q02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mBhotRQOGZByY35WJ66PUxruZrUDovI14DTDBW43AsY=;
 b=QUD5rYg6ds23UwwOwNWuRLrUHOmaUY6rdu3GGFouTR9kcOXktFo4wusNIhNR40Yyx/
 Ns0KvQ/ZCD9bS6Fm3lKnnL+DJBn3ZxiHafjniw43gb07Ot3rYFoBWYIRK8PhFD+v66g6
 3/CsxxA3wBr6XLav4Tl1Am8Y+houNqiI/mBhUp0oYVW5Kv2tAlh/cH3iNzJQZPpvP/wd
 9yRbN7VvJo+9s6n+pXsSzU4TGLXxq2JW+aNVX02q86xYc9xSpeg9y01Ovrjm0867qzHS
 GShoeI32oam39+RW3FWktKKpqZD7OvY0tDNV2mXisn6KQlVBI2q+85f78Wm0OLdkQs9a
 3I4g==
X-Gm-Message-State: AOAM532IT1Lk0X7oXW20V3F66VXuA5LKNypxL9l2Kk+AwETkXX3v2BRI
 SVEq7fjJmgNY5/5LbwmyvQMg/0zAyCICNU72eM7w0zXZtZs=
X-Google-Smtp-Source: ABdhPJwt5ZdOOnDwXqZuuY0wX7eLug+LpXZo4SiwiI/zOx+iQMAmbkO7K85590oR0r1PE37SgsK3EPPJJa68L641C+E=
X-Received: by 2002:a17:906:3497:: with SMTP id
 g23mr8093563ejb.85.1629710669994; 
 Mon, 23 Aug 2021 02:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210820155211.3153137-1-philmd@redhat.com>
 <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
 <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
 <d3cdb3bb-e05f-f909-1a98-ba45ff9b2b28@redhat.com>
In-Reply-To: <d3cdb3bb-e05f-f909-1a98-ba45ff9b2b28@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Aug 2021 10:23:43 +0100
Message-ID: <CAFEAcA8V6gaGZeWeXOwdts771Ni11Eo8vYR2nXNy-w8dEsxdpg@mail.gmail.com>
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Aug 2021 at 09:40, David Hildenbrand <david@redhat.com> wrote:
> Not opposed to printing the size, although I doubt that it will really
> stop similar questions/problems getting raised.

The case that triggered this was somebody thinking
-m took a byte count, so very likely that an error message
saying "you tried to allocate 38TB" would have made their
mistake clear in a way that just "allocation failed" did not.
It also means that if a future user asks us for help then
we can look at the error message and immediately tell them
the problem, rather than going "hmm, what are all the possible
ways that allocation might have failed" and going off down
rabbitholes like VM overcommit settings...

-- PMM

