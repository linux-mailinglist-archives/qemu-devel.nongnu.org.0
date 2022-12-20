Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C288D6524A9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 17:33:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7fWN-0004M7-BY; Tue, 20 Dec 2022 11:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <16567adigashreesh@gmail.com>)
 id 1p7fWK-0004LF-QY
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 11:31:12 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <16567adigashreesh@gmail.com>)
 id 1p7fWE-0004y3-A2
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 11:31:12 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so12661545pjo.3
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 08:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3r+UhOBCqfMpoAMPWfXpkojjuhB919az/+sprQBrzl0=;
 b=mM1lvqtgPlkL6FBo+WNYXTQfAKUfzDoo2waGmXULW+ErmqtGymjKI5wVXZTQzsR2+v
 y3ShHhB+77g5CmLlXYlrY6BdKTh97VMPOmlC0c3b/8CnEqOg0dGOcm2WWA2BqGVSpmvy
 Dk6IuNp3wiFyhCFLhgDO+dib8fVgwz5FDYvFbNKTbuQSzJwU9eUArAYh92/TlCZucC2l
 GOmScz4NIbLEpZn597lnycjWUZTKRm/cQwVUcEFQw4L+8CazaIl4eiQdSdH5GYDPY1hH
 0gg3NQ08Y64pcKOBPPfem+MY8b2SHKn5hQEk842baXkiD/B+sHN3bM3C1P31l4xgVK3o
 ecyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3r+UhOBCqfMpoAMPWfXpkojjuhB919az/+sprQBrzl0=;
 b=ja1vMdjTZJknxs0/KLg8Vfpox4WQS1fwq8R3IHih9xcPQMgbxiqhyT/nIjwMOZ0Ovk
 GjVSwotcFEiaioGl27ZjoM/PSqNAHJntqifAvPu8SdiIK+RjrJp1jSczOVy9oti4UhLG
 MEmMC86+D44SkRzLZVfD7x2/st4PyHpytQvKll9wrVnXjLakxgronPrgzmJ7i+TNuZ6H
 C3R8zuUbC7Rn8aeZAP3MQ9YkE7n+3Vxl22ifMYgwPW9yoR2rTIACEd3Corm+Esl6eYU5
 +EmrrWiFf/CgE/FLv5lzTnim62URxlNc0DsjEZWYZYYeQVMMHkY5a5pCVYFucYG1afKU
 SHIg==
X-Gm-Message-State: AFqh2ko39Qwr30FvzU2m5+n67PxE1k5l/l2pTuG2GzOq8OYw42qb9InR
 igtLuMRr7mRz4Fpmc4zJhH8=
X-Google-Smtp-Source: AMrXdXuXWGLOGUFNhKfkY+anty+poGh5cSIi2tnvFe1SIBNt7sjAlHNX718a3Sb5j9sWCb11cb/4fw==
X-Received: by 2002:a17:903:41c4:b0:189:ced9:a5ea with SMTP id
 u4-20020a17090341c400b00189ced9a5eamr19519920ple.27.1671553856289; 
 Tue, 20 Dec 2022 08:30:56 -0800 (PST)
Received: from arch.localdomain ([49.206.0.157])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a170902d34600b0018703bf42desm9547654plk.159.2022.12.20.08.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 08:30:55 -0800 (PST)
Date: Tue, 20 Dec 2022 22:00:50 +0530
From: Shreesh Adiga <16567adigashreesh@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, andrew@daynix.com,
 yuri.benditovich@daynix.com, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>
Subject: Re: [PATCH] ebpf: fix compatibility with libbpf 1.0+
Message-ID: <Y6HjOqjECShxPfzU@arch.localdomain>
References: <20221218143927.597975-1-16567adigashreesh@gmail.com>
 <d7f05d4f-2a56-6663-4a66-e53c3f14a061@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7f05d4f-2a56-6663-4a66-e53c3f14a061@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=16567adigashreesh@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Dec 18, 2022 at 05:15:04PM +0100, Philippe Mathieu-Daudé wrote:
> Hi,
>
> On 18/12/22 15:39, Shreesh Adiga wrote:
> > The current implementation fails to load on a system with
> > libbpf 1.0 and reports that legacy map definitions in 'maps'
> > section are not supported by libbpf v1.0+. This commit updates
> > the Makefile to add BTF (-g flag) and appropriately updates
> > the maps in rss.bpf.c and update the skeleton file in repo.
> >
> > Signed-off-by: Shreesh Adiga <16567adigashreesh@gmail.com>
> > ---
> >   ebpf/rss.bpf.skeleton.h  | 1171 ++++++++++++++++++++++++++++----------
> >   tools/ebpf/Makefile.ebpf |    8 +-
> >   tools/ebpf/rss.bpf.c     |   43 +-
> >   3 files changed, 891 insertions(+), 331 deletions(-)
>
>
> > +static inline const void *rss_bpf__elf_bytes(size_t *sz)
> > +{
> > +	*sz = 20440;
> > +	return (const void *)"\
> >   \x7f\x45\x4c\x46\x02\x01\x01\0\0\0\0\0\0\0\0\0\x01\0\xf7\0\x01\0\0\0\0\0\0\0\0\
> > -\0\0\0\0\0\0\0\0\0\0\0\x18\x1d\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\x40\0\x0a\0\
> > -\x01\0\xbf\x18\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\x4c\xff\0\0\0\0\xbf\xa7\
> > -\0\0\0\0\0\0\x07\x07\0\0\x4c\xff\xff\xff\x18\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
> > +\0\0\0\0\0\0\0\0\0\0\0\x98\x4c\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\x40\0\x0d\0\
> > +\x01\0\xbf\x19\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\x54\xff\0\0\0\0\xbf\xa7\
> > +\0\0\0\0\0\0\x07\x07\0\0\x54\xff\xff\xff\x18\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
> >   \xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x06\0\0\0\0\0\0\x18\x01\0\0\0\0\0\
> > -\0\0\0\0\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x07\0\0\0\0\0\0\
> > -\x18\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0\x15\x06\x66\x02\0\0\0\0\xbf\x79\0\0\
> > -\0\0\0\0\x15\x09\x64\x02\0\0\0\0\x71\x61\0\0\0\0\0\0\x55\x01\x01\0\0\0\0\0\x05\
> > -\0\x5d\x02\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xc0\xff\0\0\0\0\x7b\x1a\xb8\xff\
> > -\0\0\0\0\x7b\x1a\xb0\xff\0\0\0\0\x7b\x1a\xa8\xff\0\0\0\0\x7b\x1a\xa0\xff\0\0\0\
> > -\0\x63\x1a\x98\xff\0\0\0\0\x7b\x1a\x90\xff\0\0\0\0\x7b\x1a\x88\xff\0\0\0\0\x7b\
> > -\x1a\x80\xff\0\0\0\0\x7b\x1a\x78\xff\0\0\0\0\x7b\x1a\x70\xff\0\0\0\0\x7b\x1a\
> > -\x68\xff\0\0\0\0\x7b\x1a\x60\xff\0\0\0\0\x7b\x1a\x58\xff\0\0\0\0\x7b\x1a\x50\
> > -\xff\0\0\0\0\x15\x08\x4c\x02\0\0\0\0\x6b\x1a\xd0\xff\0\0\0\0\xbf\xa3\0\0\0\0\0\
> > -\0\x07\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xb7\x02\0\0\x0c\0\0\0\xb7\
> > +\0\0\0\0\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x08\0\0\0\0\0\0\
> > +\x18\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0\x15\x06\x67\x02\0\0\0\0\xbf\x87\0\0\
> > +\0\0\0\0\x15\x07\x65\x02\0\0\0\0\x71\x61\0\0\0\0\0\0\x55\x01\x01\0\0\0\0\0\x05\
> > +\0\x5e\x02\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xc8\xff\0\0\0\0\x7b\x1a\xc0\xff\
> > +\0\0\0\0\x7b\x1a\xb8\xff\0\0\0\0\x7b\x1a\xb0\xff\0\0\0\0\x7b\x1a\xa8\xff\0\0\0\
> > +\0\x63\x1a\xa0\xff\0\0\0\0\x7b\x1a\x98\xff\0\0\0\0\x7b\x1a\x90\xff\0\0\0\0\x7b\
> > +\x1a\x88\xff\0\0\0\0\x7b\x1a\x80\xff\0\0\0\0\x7b\x1a\x78\xff\0\0\0\0\x7b\x1a\
> > +\x70\xff\0\0\0\0\x7b\x1a\x68\xff\0\0\0\0\x7b\x1a\x60\xff\0\0\0\0\x7b\x1a\x58\
> > +\xff\0\0\0\0\x15\x09\x4d\x02\0\0\0\0\x6b\x1a\xd0\xff\0\0\0\0\xbf\xa3\0\0\0\0\0\
> [...]
>
> Can we have a build system step which generates this file and compare
> with what is committed in the repository that we can run in our CI?
>
> That would avoid the need of human review of this blob.
>
Here are the steps to verify:
Pull latest archlinux/archlinux docker image and get a bash shell inside
the container. Install the required toolchain packages.
pacman -Syu --noconfirm
pacman -S --noconfirm  bpf libbpf llvm clang make

Confirm the versions:
clang 14.0.6
bpftool 7.0.0
libbpf 1.0.1

After this, ensure that the files Makefile.ebpf and rss.bpf.c from this
patch exist at /home/shreesh/c/qemu/tools/ebpf/ inside the docker.
This path seems to be important since BTF info seems to contain the absolute
path of rss.bpf.c which was compiled by clang and is embedded inside
the generated ELF object.

Run `make -C /home/shreesh/c/qemu/tools/ebpf -f Makefile.ebpf` and
verify that `sha256sum /home/shreesh/c/qemu/tools/ebpf/rss.bpf.skeleton.h` is
a54af3d1fb401ddd56c151f00ae20d6557e965c0a1a4d8ed5f8d925457158a0e which
should be the same as the one submitted as part of this patch.

I'm not familiar with QEMU's CI and am not sure if the above steps can
be converted into build system steps. However it should be doable by a
human and verify that the generated skeleton file is correct and not
tampered with.

Regards,
Shreesh

