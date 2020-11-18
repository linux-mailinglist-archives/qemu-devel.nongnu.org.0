Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD6F2B79DC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:00:48 +0100 (CET)
Received: from localhost ([::1]:47126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJKZ-0007v0-6A
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:00:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1kfJDa-00070R-RM
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:53:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1kfJDV-0007pk-AB
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:53:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605689608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NGKngIGBHxOa2h4eeTKrydwio6x1fs47QEapm7OczlA=;
 b=XX6fuWVikeWFRoMYR8hvI8sU5AIzzlGTSqJFxr6AGYlQ1kDZQHmUEL6IWC6ikXl5qF4ULR
 dtmsGfzJkPrnhpVxsaVtcVLBSG/rb4JYGwovfhYY4VmLUVRNtEv9iUEgV0CvYDMBoBspjY
 jYU5a9QD0LdD9LXeoZtiMkc++xLx+Fk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-VbvREq78Mjq3tsl5Dng3QA-1; Wed, 18 Nov 2020 03:53:25 -0500
X-MC-Unique: VbvREq78Mjq3tsl5Dng3QA-1
Received: by mail-ej1-f70.google.com with SMTP id o27so574756eji.12
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NGKngIGBHxOa2h4eeTKrydwio6x1fs47QEapm7OczlA=;
 b=KiJtkk1yd05sUDVU6+ecObvg1dUYWYmjJIwUtBsJQnErdGht3MnfcczIfqtLJME0Az
 P8bgoSgVG0Z6t8TFeaJcU1Cmo6SXjRM98CpM6H5zViTH7HDNcrR17/Sr9zi+Ena12REZ
 NTaEM/PbFTJ8nxBnZheJLi1YOwcnixfkRAa7dJ4h65dAF8KVyLl3GhwpGezJwpWEzCD/
 9m1JTj2Co+mnaPtNqe3Ne/wnSi7OacwvIiJkhTRtCfUTAKdYBCXuFO3EvcL3yc8Dbx0y
 2ro6ejOMhjZPKWn8PhvYsXnECVd2fpMjVPf4IQ5J775bYsieKCSKwdVfMP8hqz5J2l99
 u2AQ==
X-Gm-Message-State: AOAM530SyHEBb8rmv5xy6z8X21gWBHFqPTm7EB9tGI2RAiE8ZFYIT9X0
 3g1Ll27ZgRbMpJmK1YfzFDieL6RYfvsNfOZ+99wKya8VD2+Mnr7j8IqmJ3p6zLXOaTwzpKvDRPv
 1YeprNhdlz3sIr4iXlKPHiC1OvYaSZus=
X-Received: by 2002:a50:9b02:: with SMTP id o2mr1251210edi.208.1605689604393; 
 Wed, 18 Nov 2020 00:53:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgJD1o8ywEY4t4OQIueQbAmql3gTIcIP3ShzGrCx4YODX1q4Qn+IpCiMfdyPRRZSprJkgIxZPBIAhVZGzZUaA=
X-Received: by 2002:a50:9b02:: with SMTP id o2mr1251194edi.208.1605689604221; 
 Wed, 18 Nov 2020 00:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20201113103113.223239-1-mcascell@redhat.com>
 <f24438ed-ee77-0583-3570-b18514292404@redhat.com>
In-Reply-To: <f24438ed-ee77-0583-3570-b18514292404@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Wed, 18 Nov 2020 09:53:13 +0100
Message-ID: <CAA8xKjX5a1cTY=Zr+XvHsixrSTiCw9FvGg1Z-=5Yw7pWV6xweA@mail.gmail.com>
Subject: Re: [PATCH v2] net/e1000e_core: adjust count if RDH exceeds RDT in
 e1000e_ring_advance()
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
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
Cc: gaoning.pgn@antgroup.com, 330cjfdn@gmail.com,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Laszlo Ersek <lersek@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 4:56 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2020/11/13 =E4=B8=8B=E5=8D=886:31, Mauro Matteo Cascella wrote:
> > The e1000e_write_packet_to_guest() function iterates over a set of
> > receive descriptors by advancing rx descriptor head register (RDH) from
> > its initial value to rx descriptor tail register (RDT). The check in
> > e1000e_ring_empty() is responsible for detecting whether RDH has reache=
d
> > RDT, terminating the loop if that's the case. Additional checks have
> > been added in the past to deal with bogus values submitted by the guest
> > to prevent possible infinite loop. This is done by "wrapping around" RD=
H
> > at some point and detecting whether it assumes the original value durin=
g
> > the loop.
> >
> > However, when e1000e is configured to use the packet split feature, RDH=
 is
> > incremented by two instead of one, as the packet split descriptors are
> > 32 bytes while regular descriptors are 16 bytes. A malicious or buggy
> > guest may set RDT to an odd value and transmit only null RX descriptors=
.
> > This corner case would prevent RDH from ever matching RDT, leading to a=
n
> > infinite loop. This patch adds a check in e1000e_ring_advance() to make=
 sure
> > RDH does not exceed RDT in a single incremental step, adjusting the cou=
nt
> > value accordingly.
>
>
> Can this patch solve this issue in another way?
>
> https://patchew.org/QEMU/20201111130636.2208620-1-ppandit@redhat.com/
>
> Thanks
>

Yes, it does work nicely. Still, I think this patch is useful to avoid
possible inconsistent state in e1000e_ring_advance() when count > 1.

Thank you,
--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


