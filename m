Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD28ADE11
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 19:34:27 +0200 (CEST)
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7NYY-0001eT-O9
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 13:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49459)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7NXK-0000hC-Tf
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 13:33:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7NXJ-0005zO-NT
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 13:33:10 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:38061)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7NXJ-0005yy-IG
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 13:33:09 -0400
Received: by mail-ot1-x32b.google.com with SMTP id h17so9540901otn.5
 for <qemu-devel@nongnu.org>; Mon, 09 Sep 2019 10:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PBFf7vl8kL/3QQGA+Ksg9PI5MtTziRG0/zMptgaa6x4=;
 b=DeJGaLYTJ7ki4G+Te6qgjDwLpMZPRyTp05OZ2YmEY/xeHRxY22F47nlTEr2+k65JrB
 viQ+RUaqi8z8PoDFxeY9WcbjUYpP0KgMLvNERBRlbFXyq2witlLU0cMpRSPltas0HPBW
 QHOUCYSiQvsarNaJSjrg3tL5nWOlEM7zy7rY1FIgfqJzHlbybQkOcYaGEnbo1vehfl4T
 MEqbLall6MuqjxgpEL1h1v6b1OV6cEnkjVOLZ8mEvgTWSIzb2AZipxH7S2KYGKPD0BQ6
 cBsvKbE4jqmFWJu8abd0z5bUGXLQUHYz1xaRMg3hdk00UgSt0oKyCluwqdC0efab1OY5
 0vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PBFf7vl8kL/3QQGA+Ksg9PI5MtTziRG0/zMptgaa6x4=;
 b=iuALBHZJ+Sy6o1m0cU+28gplrYnjkfPL5ws6sZofDGcokw7mwvzfLXV4+XfXLlpemP
 p8F3OcbiAr57CcUAxNsuOSSQ9keq+ABtyi9v+jxtmiT85d9DYMk9qH0H6HDa+nvtg+hQ
 kDMtvrhkqEfF7WGTmffqj9/YkcQZ9vIhJnrityAgshbSF8ZInwL4TdECY98g00OAD98r
 72yFYAf0VpaLK5S8TIEqeAq86WtIxvvSsQpaZXog1d7FP1BOchxZ3ia25RqqttbV32BF
 MWRVOiIcn4NRiJrhPNsxzFtCVTVGjQ2UBaZM87Ft+/pGYgRNyUHUukDWZiu+6PGCO900
 IHSA==
X-Gm-Message-State: APjAAAWUAY5jwffuiVdmcx96vCaBP3oNR6tlQqDqczr77uNqbZtbV3y7
 cLtnK6lPAuhDquqPCqkvuHkSl5Ul9BsHtcvnaNtRgg==
X-Google-Smtp-Source: APXvYqyEUlCISoKYc+bwqz9UwahFBuBDFxadUccHy48ilpZXngoOjELyo0GgLiK+mb1KSL3GpEfSuSyS6jDnjAAfftQ=
X-Received: by 2002:a9d:68d6:: with SMTP id i22mr11493385oto.232.1568050388681; 
 Mon, 09 Sep 2019 10:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190815183039.4264-1-eblake@redhat.com>
 <20190815183039.4264-2-eblake@redhat.com>
In-Reply-To: <20190815183039.4264-2-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Sep 2019 18:32:57 +0100
Message-ID: <CAFEAcA-ic=jdSvzOiNCEWmuhXythc2MQGYZYgV=3CBBT2RkEoQ@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32b
Subject: Re: [Qemu-devel] [PULL 1/9] qapi: Add InetSocketAddress member
 keep-alive
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Aug 2019 at 19:34, Eric Blake <eblake@redhat.com> wrote:
>
> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
> It's needed to provide keepalive for nbd client to track server
> availability.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Message-Id: <20190725094937.32454-1-vsementsov@virtuozzo.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Acked-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> [eblake: Fix error message typo]
> Signed-off-by: Eric Blake <eblake@redhat.com>

Hi; Coverity spots a bug in this change (CID 1405300):

> @@ -458,6 +464,19 @@ int inet_connect_saddr(InetSocketAddress *saddr, Err=
or **errp)
>      }

At this point in the function, we might be in one of
two cases:
 (1) sock >=3D 0 : the connect succeeded
 (2) sock < 0 : connect failed, we have just called
     error_propagate() and are using the same end-of-function
     codepath to free 'res' before returning the error code.

>
>      freeaddrinfo(res);
> +
> +    if (saddr->keep_alive) {
> +        int val =3D 1;
> +        int ret =3D qemu_setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
> +                                  &val, sizeof(val));

...but here we use 'sock' assuming it is valid.

> +
> +        if (ret < 0) {
> +            error_setg_errno(errp, errno, "Unable to set KEEPALIVE");
> +            close(sock);
> +            return -1;
> +        }
> +    }
> +
>      return sock;
>  }

If we want to add more "actual work" at this point in
the function we should probably separate out the failed-case
codepath, eg by changing


    if (sock < 0) {
        error_propagate(errp, local_err);
    }

    freeaddrinfo(res);

into

    freeaddrinfo(res);

    if (sock < 0) {
        error_propagate(errp, local_err);
        return sock;
    }



thanks
-- PMM

