Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F18566965
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:32:34 +0200 (CEST)
Received: from localhost ([::1]:58626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gnA-0000jX-Pq
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8gkM-0007oy-BI
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8gkI-0006UV-QZ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657020573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0bg41OIWt5gXKE2zfUusFAGGjkWxE5Rt1LR7ur12KlM=;
 b=Sn6piWL6BnOVmyezW6cUDo30oK4w9IqG0SOZyCZ10A7EYxm9K4+1ILaQGqZ0IrRgyLg2jR
 0iaeajKJne/AFwaRJeI4v+AZuRNgPmu/PL9s7Ih8RLtmUXdGcIQMrDGBHv5NClKQTJq2Dl
 sB6cdjuh+fZ6BzIeX5628/MiZTyhg1k=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-B9Ri0BsNMnakcKKDhkkjiA-1; Tue, 05 Jul 2022 07:29:32 -0400
X-MC-Unique: B9Ri0BsNMnakcKKDhkkjiA-1
Received: by mail-il1-f199.google.com with SMTP id
 b8-20020a92c568000000b002dc0d54f7b1so2898257ilj.19
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 04:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0bg41OIWt5gXKE2zfUusFAGGjkWxE5Rt1LR7ur12KlM=;
 b=g7B44ZxZD7dUC5cmQiMEtKuX7IK6+IMXcmyZtZyTSBhoRQvFUhRHaZaJEz0c2LFlRn
 mBy9avVG07Xe7GqltydhDGMunDLmuwqBP7P0l/HrcLFti3bFaR4tgl2jpCFsvvbUay7i
 n2mlyd1nic8Zq3GUQSy+rVLJ8jWu5sYhLQ/jZPmT2wysl4VQIFLnMQv7XL0ZhAp1K0ki
 qdTgkKaqUnHcRDvhEAh9kG5NUsjmGhCUEcpi+ZhPu+rjY4IBwMyGR4GzAP6bqAbt/sCs
 8ll7pDEatPlc9o+mYvjpudDY8+AZgqQUStTL8IlvAVrBdHoU/6hbR1ymY0T4pt4vzaaC
 R4uw==
X-Gm-Message-State: AJIora89sU5HXK6HsQb+mOK4pw6vLn+XUntztgiBT7wU+TsRZTnqk7sU
 07YfAETAJJCZxF/su2jv8H0n16nkUvmUwBAKXE4oGlzfeRm6jhbv1Bqu2oIgjU02zEk2egZXNFE
 ugUwHqbeyzTC/Gm5c5Fog11yWDGWDGJI=
X-Received: by 2002:a5d:9348:0:b0:669:d427:4393 with SMTP id
 i8-20020a5d9348000000b00669d4274393mr18115287ioo.88.1657020571803; 
 Tue, 05 Jul 2022 04:29:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uaB9ffCZQD/JD8H50UcQexJgvNyS/oiFSCEEYXEXi4x8fIQBBGV1mFOLXoPZu9s8q0znFJv7kLr9WwpgdzsIQ=
X-Received: by 2002:a5d:9348:0:b0:669:d427:4393 with SMTP id
 i8-20020a5d9348000000b00669d4274393mr18115268ioo.88.1657020571566; Tue, 05
 Jul 2022 04:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220702113331.2003820-1-afaria@redhat.com>
 <YsMVJLqNYmmpqjGc@redhat.com>
 <CAELaAXymGtALk+ZeMqWJX0mvj1_2p4MbaS4A+eY8V51KDNOddg@mail.gmail.com>
 <YsPlP6t0ALDkF4MU@redhat.com>
In-Reply-To: <YsPlP6t0ALDkF4MU@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Tue, 5 Jul 2022 12:28:55 +0100
Message-ID: <CAELaAXxdBvtxf2fXu1OxerBH+dTY_iti8CF-GMgGZpaWxgK_Gg@mail.gmail.com>
Subject: Re: [RFC 0/8] Introduce an extensible static analyzer
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Alberto Garcia <berto@igalia.com>,
 John Snow <jsnow@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Markus Armbruster <armbru@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 5, 2022 at 8:16 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>      for i in `git ls-tree --name-only -r HEAD:`
>      do
>         clang-tidy $i 1>/dev/null 2>&1
>      done

All of those invocations are probably failing quickly due to missing
includes and other problems, since the location of the compilation
database and some other arguments haven't been specified.

Accounting for those problems (and enabling just one random C++ check):

    $ time clang-tidy -p build \
        --extra-arg-before=3D-Wno-unknown-warning-option \
        --extra-arg=3D'-isystem [...]' \
        --checks=3D'-*,clang-analyzer-cplusplus.Move' \
        $( find block -name '*.c' )
    [...]

    real    3m0.260s
    user    2m58.041s
    sys     0m1.467s

Single-threaded static-analyzer.py without any checks:

    $ time ./static-analyzer.py build block -j 1
    Analyzed 79 translation units in 16.0 seconds.

    real    0m16.665s
    user    0m15.967s
    sys     0m0.604s

And with just the 'return-value-never-used' check enabled for a
somewhat fairer comparison:

    $ time ./static-analyzer.py build block -j 1 \
        -c return-value-never-used
    Analyzed 79 translation units in 61.5 seconds.

    real    1m2.080s
    user    1m1.372s
    sys     0m0.513s

Which is good news!

Alberto


