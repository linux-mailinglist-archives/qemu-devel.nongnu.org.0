Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E387EB5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 17:57:19 +0200 (CEST)
Received: from localhost ([::1]:60434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw7GY-0007dX-BK
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 11:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53292)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hw7G3-00076V-OA
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:56:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hw7G2-0000fb-Q1
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:56:47 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38488)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hw7G2-0000fD-J0
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:56:46 -0400
Received: by mail-ot1-x342.google.com with SMTP id d17so134535999oth.5
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+7O6/G7XyEZNt+096NLA2bSkE6Ci8ecvyTTyZp13tBo=;
 b=xAPZ/Ffxnj4nD33y1a8HVOpITtjLklkOij3U8b8WpWn3OcgF3DW7GC26SGHOUpnHQX
 0UtQWq8kS5iiDz4kO5a3jOyQOM+sHdNHCwvojBGyG64gKKjP2m36Vw8Sc8UfIEuAnfcu
 34K6xcD/YyMpuBao4tfiuPOhEFn6D5TMSft2BQI/2L+puzi5uezotKvTMyQhvpsYLRXZ
 Gi8AnxdWlCNI0gBgzB1X7ocvuHORyVwRcKBvB8F2j+XXgj2qMpcHbYkFM97m7n080rFl
 X5dtEhKknU3jp0yFe0Ib0mdBfHwrDOgngsAhPWTjz8E/D+r2r9sDuJe5aMyEQukDHXf1
 Fofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+7O6/G7XyEZNt+096NLA2bSkE6Ci8ecvyTTyZp13tBo=;
 b=EwTbga2Pgc7VwGEMRmMAlIeCzwlnY/ME4kmUkWAUDNF2hj7SapXYj1JHDsIz5mxuBA
 PWnqQePwsTo6bVl7j8smLbFf7wnrxXeWh8LLze8VV78KywAlwd3r09lOQsBoPSubbW9o
 mr7kGoZV2OX02qeK8endeJl5R4dq3Q1HcVnY8E1O+548y3bxwjSOU0Y+eToaLw12TT9s
 O3/UxzKvUIxF+41K15IMqQhf7IqpqdXNU0TObAn3NF3bwgM4kEDFVnNArpYL2H69d3Ge
 sIoGuGe0+piDaOwTN7MrRhLXpSqZzyuz871L2nDuk9Fl7yPVzt/LtD51A73MRkCOYBNf
 f0bQ==
X-Gm-Message-State: APjAAAWn3cAbOfAHwKZKT+huWz6pc8iHKi9cpQB/MuV7fWB4lOaV5GcP
 bppe5V2YjHAWSp8EDeviT4G6IzYgVyXZs8nVkB01/Q==
X-Google-Smtp-Source: APXvYqwXtTsG0SKG9Z3OShT58FKt1RERXFBOeg4ckkgmNn7/cbo/I3ihV80rOp6zWSAkpbmja23qCpuA3DasRIcQYGk=
X-Received: by 2002:aca:4a57:: with SMTP id x84mr2664346oia.170.1565366205708; 
 Fri, 09 Aug 2019 08:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190618114328.55249-1-vsementsov@virtuozzo.com>
 <20190618114328.55249-8-vsementsov@virtuozzo.com>
 <2375ac0d-f7b1-8ddb-03ab-2a0e7e8885fc@redhat.com>
In-Reply-To: <2375ac0d-f7b1-8ddb-03ab-2a0e7e8885fc@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Aug 2019 16:56:34 +0100
Message-ID: <CAFEAcA-6TNQFyOa92r5zK2C9K9Vts5kTz0sfytxN-BB-+9Mvhw@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v7 7/9] qemu/units: add SI decimal units
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
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Aug 2019 at 16:39, Eric Blake <eblake@redhat.com> wrote:
> Also, would it be worth swapping out existing constants in the code base
> that should instead be using these macros, so that they actually have a
> use and so that we can see whether using them adds legibility?
>
> For example, block/nvme.c, block/qapi.c, block/sheepdog.c, blockdev.c,
> util/async.c, util/oslib-win32.c, util/qemu-thread-posix.c,
> util/qemu-timer.c all seem to be dealing with conversions between
> seconds and subdivisions thereof, where constants 1000000 or larger are
> in use and could be rewritten with these.

I'm not sure that it would be more readable to replace
1000000000LL with SI_G -- I would tend to assume the latter
would be 2^30. Using "1000LL * 1000 * 1000" inline at
the point of use, or better still abstracting any particular use
into something more semantically meaningful as we already
do with NANOSECONDS_PER_SECOND, would be my personal preference.

thanks
-- PMM

