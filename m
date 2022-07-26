Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4C7580ECF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 10:23:04 +0200 (CEST)
Received: from localhost ([::1]:55658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGFqJ-0000TU-I2
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 04:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oGFlh-0006Gj-S8
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:18:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oGFla-0004Ue-9j
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658823484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hw3Ro4SCqx7M15+GizIdttbDtmn8+2L8yNqhjFO+owY=;
 b=R4RJW0BJzuzc5M10pZD64m/5uHTeBjdo6FOOTUgblu7CGUFRVCg64ANbdXLMzcSfdS4riY
 k8DSjFYWrJODbwM4MZu9LfvyenGfv5Fr4WLx9oJFR2YMkHk1tecj+fdE+jiT7L4pt1bYOU
 DHsNSSvR7Wj61LKUKOy/zT9ZliRTHRg=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-8MWdBIjcMlCBjV7AE3bBFA-1; Tue, 26 Jul 2022 04:18:03 -0400
X-MC-Unique: 8MWdBIjcMlCBjV7AE3bBFA-1
Received: by mail-lj1-f200.google.com with SMTP id
 t7-20020a2e9d07000000b0025dc0e59778so3049174lji.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 01:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hw3Ro4SCqx7M15+GizIdttbDtmn8+2L8yNqhjFO+owY=;
 b=zy61s+Md2xX/F8/n6wh++50fK3fnPPBz302JCGi1BEWY1ZN9YhhI4pv1xdewi9Azvr
 0TZgT2g+bPXj8/KU3Z7KmvVJnLcWahLS5cX/17Jg/FAz585aAS+c7nkQGvTtHDsHMHzN
 usEHz0cPrbRPPdLbZYnft9L3QEz8VcvaNKQkMlQe4mOHigx5oehXAshxeM+cwb21Dq/W
 iGLtdJW83ayOpRa2+CoaTMU5dMbQOKDtUJ46q7C/KYqg8j641R8Dbp6coWTX7eRQYlUU
 NsePBZyybVpkrVTquSUVY07QcR/r9o9MgDTk0+MYo9QSmcSTt3Qc4nSy6MoqQa/ChsR6
 1vcg==
X-Gm-Message-State: AJIora8qwWweCygYVnknFO/GkrZMuZqAlUYGyzgaoc8xyF3xmkfz0/zt
 2s51hF8FxwaAeepOB7mUwJ+DR7BZV7TZE4KSxWaTWsdwnfhQ4zqCoSoX4LeBf72SqLc8zFLu3CJ
 P07wCkw9DeWhG53yfjsl0101zNItfsG0=
X-Received: by 2002:a05:6512:3087:b0:48a:9d95:e21e with SMTP id
 z7-20020a056512308700b0048a9d95e21emr1278673lfd.266.1658823481484; 
 Tue, 26 Jul 2022 01:18:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tPE00lmU8gsDp4jRwT/YnGi00613OQoBsAFAoWF0AGf9tOYR715QBQwPWzAOZBB5ZGWKskRRwCbtA0oVGb0Os=
X-Received: by 2002:a05:6512:3087:b0:48a:9d95:e21e with SMTP id
 z7-20020a056512308700b0048a9d95e21emr1278660lfd.266.1658823480900; Tue, 26
 Jul 2022 01:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220722170449.853222-1-pbonzini@redhat.com>
 <CAFEAcA9wRzwRgvwBzM=JJ3N4ZgVGpeZpuxjCWEsjyCJwmmKyYw@mail.gmail.com>
In-Reply-To: <CAFEAcA9wRzwRgvwBzM=JJ3N4ZgVGpeZpuxjCWEsjyCJwmmKyYw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 26 Jul 2022 10:17:50 +0200
Message-ID: <CABgObfZ69sC4O8=Oa_reRg7h-3ZDdiR=m953EuHLC3R0Keh18g@mail.gmail.com>
Subject: Re: [PULL v2 0/8] More fixes + random seed patches for QEMU 7.1
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, Jul 25, 2022 at 5:05 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Fri, 22 Jul 2022 at 18:08, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > The following changes since commit 5288bee45fbd33203b61f8c76e41b15bb591=
3e6e:
> >
> >   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into stag=
ing (2022-07-21 11:13:01 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/bonzini/qemu.git tags/for-upstream2
> >
> > for you to fetch changes up to 9fa032885583a2f1cb9cacad2f717784ccea02a1=
:
> >
> >   hw/i386: pass RNG seed via setup_data entry (2022-07-22 19:01:44 +020=
0)
>
> Hi -- this tag doesn't seem to be the same commit hash that this
> pull request quotes. The tag is commit 67f7e426e53833. Is the
> tag definitely pointing at the right thing ?

Yes, the only difference is it fixes mojibake in a commit message:

$ git range-diff origin/master 9fa032885583a tags/for-upstream2
1:  b67de91e0d =3D 1:  b67de91e0d docs: Add caveats for Windows as the
build platform
2:  d12dd9c7ee =3D 2:  d12dd9c7ee accel/kvm: Avoid Coverity warning in
query_stats()
3:  d5b5023691 =3D 3:  d5b5023691 oss-fuzz: remove binaries from qemu-bundl=
e tree
4:  7906f11e62 =3D 4:  7906f11e62 oss-fuzz: ensure base_copy is a generic-f=
uzzer
5:  6b23a67916 =3D 5:  6b23a67916 hw/nios2: virt: pass random seed to fdt
6:  5e19cc68fb =3D 6:  5e19cc68fb hw/mips: boston: pass random seed to fdt
7:  c287941a4d =3D 7:  c287941a4d hw/rx: pass random seed to fdt
8:  9fa0328855 ! 8:  67f7e426e5 hw/i386: pass RNG seed via setup_data entry
    @@ Commit message
         Cc: Richard Henderson <richard.henderson@linaro.org>
         Cc: Eduardo Habkost <eduardo@habkost.net>
         Cc: Peter Maydell <peter.maydell@linaro.org>
    -    Cc: Philippe Mathieu-Daud=C3=83=C2=A9 <f4bug@amsat.org>
    +    Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
         Cc: Laurent Vivier <laurent@vivier.eu>
         Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
         Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Sorry for the confusion, I probably re-created the pull request in a
different directory and then sent out the older one.

Paolo


