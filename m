Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3B42B68D3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 16:37:08 +0100 (CET)
Received: from localhost ([::1]:54778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf32Z-0006cM-Hx
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 10:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kf30k-0005ZO-Fi
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:35:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kf30h-0005Um-BZ
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605627309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ElNgR4xE6Ap0r18v7oS3MS94y06Xd2jOWxZuQ2twcE=;
 b=O/UrveT143Y1+kOoSFPC70uzGs4W6o4X0S4CoaQ0dQfC2zZiqSZ/i/u/Gs4PLRxf5kO+9l
 p1kOTCYGsltYM/4fmkV03u1aWkbCaOc6Lt8u2xi5nUitDbcaCdx4y46giNrHetIySc79Tt
 VULBDbz5GvMC2NJR8WEkphbdQiovExw=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-wEi5nVtCNAe8lYY3v0h05Q-1; Tue, 17 Nov 2020 10:35:06 -0500
X-MC-Unique: wEi5nVtCNAe8lYY3v0h05Q-1
Received: by mail-io1-f71.google.com with SMTP id r16so13420620ioc.15
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 07:35:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1ElNgR4xE6Ap0r18v7oS3MS94y06Xd2jOWxZuQ2twcE=;
 b=Yx8agqjMSR8Fb5zIffKeCNWwjGuMAVTFhrvmLDmvEmKRM6NDeJfPkCWRE4gvOCYwIz
 fYP3nhZVpd5cYRgw/hYVQAO/s2fqjzyNh/bM6q8BvxQnxeWtjRFPsQ0U7huQaNl9hE/O
 4Gd5MRhSAutEALcUk2cSi3I3plbg5pGXI7GoG0uuly7AeY8Qgp/YV5uuzhTFJoUMQ9YJ
 sBBC6cLtFZETGkpvcjL2Np6S8KVbvIw88xup74sQfpYPfmxOOzyQO0rft227axS/TncF
 d/u+mZoK0rCDLlURwAiszLOlBZnybq9ys4BXCL/S1sXJv0DD8qO0vBWbDcC1wyzY5qeT
 0OpQ==
X-Gm-Message-State: AOAM530nce7bbjVgqc9YS43kgvRFQO0uZEoWh+38AQiulTM+grcIzzuU
 FPGHdYAIFLHWSHpHVHE4oa0zimKDvu5dIt0htJCcjI7leiOE9u8gY0OtNdeO55Y0ylVVTT6LjZ8
 vTYujEAGncpBQ7KiUzaR7hnPC9BervzU=
X-Received: by 2002:a92:cb8d:: with SMTP id z13mr12124126ilo.182.1605627306200; 
 Tue, 17 Nov 2020 07:35:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3X7xjXFynF6Xexe5o7BfvBKXLIjlSp685xdRQr5P/QDwBrALeXoAQ+f8GP2tv6lPYv2VYVp3LzADmHZYMUOY=
X-Received: by 2002:a92:cb8d:: with SMTP id z13mr12124116ilo.182.1605627306020; 
 Tue, 17 Nov 2020 07:35:06 -0800 (PST)
MIME-Version: 1.0
References: <87r1os6mn5.fsf@dusky.pond.sub.org>
In-Reply-To: <87r1os6mn5.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 17 Nov 2020 19:34:55 +0400
Message-ID: <CAMxuvaxYacr6mcQZjqnG4GtmpGPbLbw-UMkumJyQZZCtDJhh2Q@mail.gmail.com>
Subject: Re: Use of g_return_if_fail(), g_return_val_if_fail()
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Tue, Nov 17, 2020 at 7:14 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> g_return_if_fail(), g_return_val_if_fail() are for programming errors:
>
>     If expr evaluates to FALSE, the current function should be
>     considered to have undefined behaviour (a programmer error). The
>     only correct solution to such an error is to change the module that
>     is calling the current function, so that it avoids this incorrect
>     call.
>
> Unlike assert(), they continue regardless, undefined behavior be damned:
>
>     To make this undefined behaviour visible, if expr evaluates to
>     FALSE, the result is usually that a critical message is logged and
>     the current function returns.
>
> Except when you ask for abort():
>
>     To debug failure of a g_return_if_fail() check, run the code under a
>     debugger with G_DEBUG=3Dfatal-criticals or G_DEBUG=3Dfatal-warnings
>     defined in the environment.
>
> Like assert(), they can be compiled out:
>
>     If G_DISABLE_CHECKS is defined then the check is not performed. You
>     should therefore not depend on any side effects of expr .
>
> There are just three uses outside contrib/:
>
> * backends/dbus-vmstate.c:232:        g_return_val_if_fail(bytes_read =3D=
=3D len, -1);
>
>   Marc-Andr=C3=A9, why is bytes_read !=3D len a programming error?
>
>   Why is returning safe?

It's "safe" as it returns -1 to indicate an error to post_load callback.

Hmm, it may not be just a programming error. read_all() may return
success with less bytes than requested.

Here, replacing it with full error_report() may be more appropriate,
since possibly the condition could happen if the input stream is
malformed. I can send a patch.

g_return* would be fine if it was just a programming error (checking
read_all contract for example).


