Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB7B4F3CBC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 19:05:58 +0200 (CEST)
Received: from localhost ([::1]:53506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbmcr-0000HM-CJ
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 13:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nbmaq-0007dO-8L; Tue, 05 Apr 2022 13:03:48 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:38411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nbmao-0007Xz-5i; Tue, 05 Apr 2022 13:03:47 -0400
Received: by mail-oi1-x22e.google.com with SMTP id r8so14023483oib.5;
 Tue, 05 Apr 2022 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9eaQx/vAVJq+7v6Er5T1x/t2Veg/9RQ+Eb9hRKiESgw=;
 b=qAY7CEGf6ELem4MzbzKzhlmd6AJRiyp7GPaqH/E5qHh9WB9RL3P54CJroTGA51CT7i
 vxr9UizJe02xcVvAX2r/c9l2KpfEZwZuavOYDwingoTTw2UcCQ+4GdQvBd3mIG/GOK4Y
 FcETQQ07anP1qcnrfXCc3cpyYwC7RrZhIGrKWiv2DkaH3n4rTw7yaQiu9dXbZ6mWOxaF
 mNOFv2ZjloOAB5AV7FUAtvM5oqkYGlbrgLcCgssddT1ZCawDCzBHyOorH2ytmbId3BK8
 BuPey0nrbebHpBGAw6td7cRrxiTW806IiukhM8IyaKAFzjvRl+cJaQ+KF/aJgh2UnDZo
 jhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9eaQx/vAVJq+7v6Er5T1x/t2Veg/9RQ+Eb9hRKiESgw=;
 b=ndfPF588oU5UrV/zKEIkTSfq3FLh2f4K9sNMzrIEQk30TqN1N8ffKJs/o/ZPDmELxC
 r7BErpvktHWNl2gHhwe9n8nae730lBg1nG/6KaA3K2Czv2tA4jpiN6axIvLldUfMOfT2
 JI+5pMBBST/ruoe1vx+el3HlzmXsep8dxBv/2MUVqMZRYngWp7v1fImJvdVeU/tRvk6x
 HvO0zVJe4QJYKT8JnauhF3R0LtDU+O6qw2QJW2+jLcwSuKU+P8thDwGutiSQZLJ0FTQO
 1xhVdsh+MO7TV04rmR6CYcUy140EM2aC+K59BoJZkrIIcRgX+o0noOfZ5du2+t7n2+3D
 gMRg==
X-Gm-Message-State: AOAM532RnOHgocmO2jrzGKSRJ3/atL5HSFkIRX/7n0gHpXg4ISVgGqmi
 rW+QShGETHFTpEj+BuIdwaeflLTB/xIMdyCe3o4=
X-Google-Smtp-Source: ABdhPJxSaP8OT/EC5gI2q20VQAK47FeOuMq2ugl3KrtVMPEYEwsKnki8hAPsVq12zs5ImdNNtQQEcRLxU8SdL+GC5nA=
X-Received: by 2002:aca:ead4:0:b0:2ec:ba66:12df with SMTP id
 i203-20020acaead4000000b002ecba6612dfmr2059532oih.194.1649178224186; Tue, 05
 Apr 2022 10:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-11-dmiller423@gmail.com>
 <c3bb72da-c390-f9b5-5254-f8c16df21427@redhat.com>
 <6409f049-d938-0e06-3cea-5877b31fce00@redhat.com>
 <95ad366c-509d-d41f-209b-dc66054de4b8@redhat.com>
 <CAEgyohVUHa+yd-inLOv3zTf143-_2Z35+K_XatUz74bqxDK9CA@mail.gmail.com>
 <CAEgyohWR6C1z8OyuGwkv8LT-P5fR9eVsCFw4LmGUxZCDNszoSg@mail.gmail.com>
 <58110f3f-3190-7af4-6839-9a30fce05855@linux.ibm.com>
 <CAEgyohUqmHrbQC5yqAtuhcqmnx-q5YxE+6xctbCVROGz+cqrqw@mail.gmail.com>
 <05661926-6d26-9d78-b576-a33391e25c24@linux.ibm.com>
 <654b2fcd-0532-4484-d9cf-f875acedf7ee@redhat.com>
In-Reply-To: <654b2fcd-0532-4484-d9cf-f875acedf7ee@redhat.com>
From: David Miller <dmiller423@gmail.com>
Date: Tue, 5 Apr 2022 13:03:32 -0400
Message-ID: <CAEgyohVRpn51FDaJ4xa5Ysfjo51g3yOpeJCjJqCK0SXkEHmQqg@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dmiller423@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, farman@linux.ibm.com, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recommendation for comment?

/* vri-d encoding matches vrr for 4b imm.
  .insn does not handle this encoding variant.
*/

Christian: I will push another patch version as soon as that's decided.
(unless you prefer to choose the comment and edit during staging)

On Tue, Apr 5, 2022 at 6:13 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 01.04.22 17:25, Christian Borntraeger wrote:
> > Am 01.04.22 um 17:02 schrieb David Miller:
> >> vrr is almost a perfect match (it is for this, larger than imm4 would
> >> need to be split).
> >>
> >> .long : this would be uglier.
> >> use enough to be filled with nops after ?
> >> or use a 32b and 16b instead if it's in .text it should make no difference.
> >
> > I will let Richard or David decide what they prefer.
> >
>
> I don't particularly care as long as there is a comment stating why we
> need this hack.
>
> --
> Thanks,
>
> David / dhildenb
>

