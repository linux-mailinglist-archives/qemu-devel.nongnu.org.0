Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9603B55413
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 18:11:18 +0200 (CEST)
Received: from localhost ([::1]:33558 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfo2P-000702-1u
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 12:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41054)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sgarzare@redhat.com>) id 1hfnvL-0002q0-0K
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 12:04:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1hfnvI-0004XS-Aj
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 12:03:58 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:32984)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hfnvI-0004WI-1M
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 12:03:56 -0400
Received: by mail-oi1-f194.google.com with SMTP id f80so12948952oib.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 09:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OUu+8e6DNz+miKxAf5CHH0w9x+D9Prky3TKzZan1grw=;
 b=qSh17ucnol6w1fwB1qOqJeQ3NxbyhtmzLwBt3ZIO0cZ3RxWwNwDOkNtM6Fx22+HSI8
 83FeOGkaz/rD2f85p1ru3euJ2iMxAsQPbwKVQKQjmV/BlfIm/lRZNkxicqBAKQo0JbxI
 mUGqlLlGiUOYZl1S6ZEl06RQM9eSHwWYAII620e7mfEkohU/FXcR2vwIiWDRDtc41vmh
 3b30qZfoBexVglb5A925AShoNXweL6hqejZYdpOTkeArvZRWERcwQkf//fp8YQWCosT6
 39CHUAKjAeix7FfcDEtBbOQy/uMFxg03cmGQACjbMa9z8pwdNaVaSXELQ5xunXr2czIb
 NHMg==
X-Gm-Message-State: APjAAAXYc+ypclNcdN5r3dtHmePrRn8B8vD5sY8OXIm5PyWMqc4yNXEw
 1KzzmNeZQB1Q2592o/Nj9sq4ihE9lLcuPq7BqXwJ4R5P
X-Google-Smtp-Source: APXvYqwdxdGeM+0JC7051d1lHShqDMgehB6lyGdSap1DPJnF2FfFiobN5zCcjObVZKa0FrLdwiVQEIHKjH0KRZEj8nY=
X-Received: by 2002:aca:aad3:: with SMTP id
 t202mr15718212oie.158.1561478633751; 
 Tue, 25 Jun 2019 09:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190517134748.340381-1-sgarzare@redhat.com>
In-Reply-To: <20190517134748.340381-1-sgarzare@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 25 Jun 2019 18:03:42 +0200
Message-ID: <CAGxU2F4iGjwNe-D3zuFh3Mr-OJtiSTDLe=ZM_EdyufApQUe9hg@mail.gmail.com>
To: qemu devel list <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.194
Subject: Re: [Qemu-devel] [PATCH v3 0/4] Clean ups in net/net.c
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.

Thanks,
Stefano

On Fri, May 17, 2019 at 3:51 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> This series contains some clean ups in net/net.c
>
> The patch 1 solves an assertion failure when ipv6-prefixlen is not a number,
>
> Following the Markus' advice, I modified the parsing of IPv6 prefix
> (patch 2) and IPv4 host:port (patch 3). Then I removed the get_str_sep()
> function (patch 4) because it is no longer used.
>
> v3:
>  - Patch 2:
>    - fix indentation [Markus]
>    - move substrings at the function level, and call g_strfreev(substrings)
>      at the end of the function [Markus]
>  - add Markus' R-b
>
> v2: https://www.mail-archive.com/qemu-devel@nongnu.org/msg615866.html
> v1: https://www.mail-archive.com/qemu-devel@nongnu.org/msg614561.html
>
> Stefano Garzarella (4):
>   net: fix assertion failure when ipv6-prefixlen is not a number
>   net: avoid using variable length array in net_client_init()
>   net: use g_strsplit() for parsing host address and port
>   net: remove unused get_str_sep() function
>
>  net/net.c | 99 +++++++++++++++++++++++++++----------------------------
>  1 file changed, 49 insertions(+), 50 deletions(-)
>
> --
> 2.20.1
>
>

