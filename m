Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A8D58DC51
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 18:43:50 +0200 (CEST)
Received: from localhost ([::1]:56914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLSKc-000869-2c
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 12:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oLSG5-0001Vm-UD
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 12:39:09 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:43952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oLSG4-0005sT-DP
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 12:39:09 -0400
Received: by mail-qt1-x82d.google.com with SMTP id a4so4466474qto.10
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 09:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=qOpcURmNj72Chdju3MjeWIk+Jm3kD5wGeppnjvLsqQE=;
 b=KIspzyiTWjCLqiUns903508fKqUKboKILJrP/M9MK5B2yN+RuhsmfGivQdmiENijkJ
 0G3Ky1uyxBi1m/7CKOz6CNp4O49wK7grUyzAP3A87yc269otmYUfqJUEIe/TIpxWXCdO
 d3tPA1gJhkNZdhnmvzCKKRP4zbeW6gX3UxfNkCPnrHeD51tPKxSswS1hBqXVqSt0bvyg
 yX6NIUzi/32+4BIhtAGr0wfah+N6ZZcK3bNJGj77YnqImHs+nap8eCQSenWcG/vy9xp1
 aM1uXQfV6NCoV6fdTNAFNWGv4NIdX3+frlKStJ29KZ0CgxmlxNfIbTJn50EBK0IRrf3C
 lRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=qOpcURmNj72Chdju3MjeWIk+Jm3kD5wGeppnjvLsqQE=;
 b=YWfGrcXtBhhNusjpG14pTLM2oH2k1Iyk/YtCL6Sx0RTpASsdSqhVWe88hAZgDJnfOe
 pK7jSq1iHROCp6cv0QZXqfKp13j5ej0zRD4aRunwcstis8yopjvc8xtq0B5mRcKRwvf7
 gSBEH5hNSgRf/YTJqdqdklMjdVazoSRTvwrqwaDrG9EeBdx743CKfGTcLkerS6WneZaw
 5rKCQRmakRauljdWhM9D4DZ9ZA+XG4iQAlhZskkjRTzciLznT4o/c7C6i6shmLe4pTw2
 HayUGU6/eZB02GhoO+rqzH0wNerjnSQYmHvx2MAmginAfYz/Aa/SWMJWlux9IK0WSUvV
 0Iaw==
X-Gm-Message-State: ACgBeo1ESdU+o5RGQwhf1uGDwN7KYh6+8+b8n1CnvLabCvc1fEU9B2t9
 s0IM+v5qxf3Fompni/iukRmKZSp31n/4JHkOF7c=
X-Google-Smtp-Source: AA6agR5ByYRcZKRXkD+znLwC/v19yojPtccU+u+WVkpEZuBpcRd1/IOGdXZtiJh/t0Z7lhQvOjYOf+LQ8ZSmdFlLR+o=
X-Received: by 2002:a05:622a:100d:b0:31f:25e3:7a45 with SMTP id
 d13-20020a05622a100d00b0031f25e37a45mr20629075qte.365.1660063147561; Tue, 09
 Aug 2022 09:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220805145617.952881-1-bmeng.cn@gmail.com>
 <CAJ+F1CK5Di14cxc8t67bw9hyCoqWKz62m6j-m4OMqh31trrW=w@mail.gmail.com>
In-Reply-To: <CAJ+F1CK5Di14cxc8t67bw9hyCoqWKz62m6j-m4OMqh31trrW=w@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Aug 2022 00:38:56 +0800
Message-ID: <CAEUhbmVM8V-bcSjuXmH231zeXJe4UsQN0c+U-_MvoXtwFSL1xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] util/main-loop: Fix maximum number of wait objects
 for win32
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Aug 9, 2022 at 9:15 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Fri, Aug 5, 2022 at 6:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> The maximum number of wait objects for win32 should be
>> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
>
> Nack,
>
> if wait_objects.num reaches MAXIMUM_WAIT_OBJECTS,
>
> then qemu_del_wait_object() will iterate up to it, and then the branch "i=
f (found)" will access the arrays at position i+1 =3D=3D MAXIMUM_WAIT_OBJEC=
TS.
>
> Note that the add functions should probably learn to avoid adding the sam=
e HANDLE twice, otherwise del is a bit broken.
>

Thanks for the review. Will fix in v2.

Regards,
Bin

