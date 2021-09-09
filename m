Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6DE4047A5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 11:18:13 +0200 (CEST)
Received: from localhost ([::1]:37012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOGCB-0002Nc-7t
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 05:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1mOGB3-0001hb-91
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:17:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1mOGB0-00043M-8C
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631179016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZN1Gntog2URkdXQ3jgLEyauuu/QMuNzZtvQ9ys9RmY=;
 b=SSHA94l+vliHbKRofO+mdg162Mi4TTI48aDAnF2vq8UBbsC2SJkosbQ8Py/+0fI74OKoCs
 /YWXJiPxeD7XMeeu+qfVdmdHBR5+yYXX1tK3z9EbtKBWh2vuzmyAbp+1qth+aknjMJYo6B
 Lk35ZkJS93N4pPmU2VGjMAmKYfuJj0M=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-PmCTcO2zPTGdmNWxS9F2eA-1; Thu, 09 Sep 2021 05:16:53 -0400
X-MC-Unique: PmCTcO2zPTGdmNWxS9F2eA-1
Received: by mail-pj1-f72.google.com with SMTP id
 ne16-20020a17090b375000b0018f4f0ba3fbso964616pjb.9
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 02:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eZN1Gntog2URkdXQ3jgLEyauuu/QMuNzZtvQ9ys9RmY=;
 b=LQQgThnfthlhA9efBJFSYt4vj7d5LEy7i/pkBwWJ0M/ITfNob33qT30yDI/olBqz8x
 mFnL5sxUZ/ZR2y1ky1yDLwrhriAPBrI3rj8eQX9lUFbMAuDOfKI4WwDYoEkyBoknPY89
 JaLvMdKnCCp2lf9DkrZTKtGoqELANDG8GwylumWsAmo8avmt0lvrOTz6A4IdGDw33CuU
 VMWi4/3fg31ToRnjHPGOK659b6SzRBsPYViCv3K7uumlx56cgqVcijbpdzCMrejeppUn
 TR9lkgx1jtUl9MUwv/xxyFvR7LaJgBo6TmSxmt8X+N55zX0uSny/iti72R4XVf2v0zap
 zOLg==
X-Gm-Message-State: AOAM5321a910TIAlOPTWeuw5zGHSjIf87pvXja1Tr5SyFh/UqQgNMwlh
 1vGexg0jVNkZCjsQNVRCDqKpLgUglSCO8hzC0X8BDJnvLIoyqpuQ+eHeO8kk+z8eLTbzGkqWi2n
 xh777VwVg1dXsswz5xQzYVucph1Gu52c=
X-Received: by 2002:a63:4614:: with SMTP id t20mr1782734pga.372.1631179012654; 
 Thu, 09 Sep 2021 02:16:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG3oKil/lFY8MfhFkUsfDksQXCDjCfNr/pgSOuxR52KCb0dL6UT44lg9z3TC5siX+0wDlAA9jusCMumuLyj28=
X-Received: by 2002:a63:4614:: with SMTP id t20mr1782715pga.372.1631179012420; 
 Thu, 09 Sep 2021 02:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210906153103.1661195-1-philmd@redhat.com>
 <CAA8xKjXkDwPYxSAeRb+2mfHRrbiL_kh9unVkemFXLfF68UXePA@mail.gmail.com>
 <3ef43b0d-4b89-85a4-f2bf-b7f8a256d1db@redhat.com>
 <bb39ee8c-a567-591a-a1c4-822683bb723@eik.bme.hu>
 <8ba32305-3e9f-a770-0406-7612ed4aeece@redhat.com>
 <3ee3ca31-0d6c-a439-74c0-6397c3492893@redhat.com>
In-Reply-To: <3ee3ca31-0d6c-a439-74c0-6397c3492893@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Thu, 9 Sep 2021 11:16:41 +0200
Message-ID: <CAA8xKjWiRn5a9a1oTX7gpZ3k867sO-nqMB_V5oJQNhwPSWZyrg@mail.gmail.com>
Subject: Re: [PATCH] hw/display/ati_2d: Fix buffer overflow in ati_2d_blt
 (CVE-2021-3638)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Qiang Liu <qiangliu@zju.edu.cn>, Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 Ziming Zhang <ezrakiez@gmail.com>, Salvatore Bonaccorso <carnil@debian.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 7, 2021 at 8:22 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 9/7/21 7:38 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 9/6/21 9:52 PM, BALATON Zoltan wrote:
> >> I don't think assigning a CVE to a bug that is in an experimental and
> >> largely unused part and happens when one enables debug code really wor=
th
> >> the hassle, this could be handled as a normal bug. As long as the
> >
> > CVE assignment can happens outside of QEMU community, we try to make it
> > clear what is the "security boundary" but researchers filling CVEs
> > might not understand it well.
>
> BTW see commit b317006a3f1 ("docs/secure-coding-practices: Describe how
> to use 'null-co' block driver") which is related to your suggestion.

I agree we can avoid assigning CVEs to ati-vga and similar
experimental devices that are not intended to be used in production,
even if they fall under the virtualization use case. Maybe we can
improve the documentation
(https://qemu-project.gitlab.io/qemu/system/security.html) to clearly
state that some devices are not security supported? Would it be
possible/feasible to get a list of such devices? Or maybe the other
way around, document the list of devices that are undeniably security
supported (e.g., virtio*, *hci, e1000, etc.)?


--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


