Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05F04C1D7F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 22:12:51 +0100 (CET)
Received: from localhost ([::1]:55666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMywM-0005RF-PS
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 16:12:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nMyvM-0004gy-R6; Wed, 23 Feb 2022 16:11:48 -0500
Received: from [2607:f8b0:4864:20::230] (port=38545
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nMyvL-0005U5-BY; Wed, 23 Feb 2022 16:11:48 -0500
Received: by mail-oi1-x230.google.com with SMTP id y7so371199oih.5;
 Wed, 23 Feb 2022 13:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KdrYFboPC4q9pzq8XyeyUVsUbSfezVY4rUewUmzo2/g=;
 b=J8TbqMvYiVvv1MNVu70hDkqdB8bdpYopzqUwENz+Ik+vxnN9EiFk4zRSDkhzBCLdtX
 I6t6BacUh5G2iQ213aapWXG29L/zIPkcnririFC3yV+xa5DAV+JpWVFXMMWRav9OOvBt
 wqf9ZP4prt9BjaotOc3sAazRCNjZ/wbfoOnlxmPtQFRZx+8XT2TrJ/nWP0a1IE2NR6Dc
 0bvGtHO+cs1kREi+wYd7or+TtL4WZaRK0bTtUEBNgxjLfmiO8sj+Ru8uCbo1UeNB3euV
 e3MhJj81rm3rfoJzAXPMN8wZZ7QRSH+OGqviex4ttMovCMiKey+haIYAqbc17ZTcoqot
 jP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KdrYFboPC4q9pzq8XyeyUVsUbSfezVY4rUewUmzo2/g=;
 b=JxgFKbv4vJM1aHiOlUlWaCwvnjYjPCfytX9r/PYXZAjy2tih59JeYzducHxCwMk+pv
 OwAiFLM3cy02wG1H3SfQiU7oK5gQOim8eoFsFaEJJ0zX4KjrNDbQ9U+WcbamliBnmj60
 2Dh6tzFri6hnQIDXSx6vVjK+1/o0GGIkfRmVwTaFfuAbkXnyk+1TVfxmG0xBkcEXCFfc
 CksK1qw+FUDv0D0hRhZPBmT6cMk+g65TCmece7JAsxujIVc8BW4W6QdhbwH29lbAuogA
 RDXMO55V0ijNTZhRhM+nAljObUFQY8dprfMSlmp4SBfwRa0TnwFcY/SYT0EQS/Q5BgEY
 DVTw==
X-Gm-Message-State: AOAM531//8WJQLfG1obBOF2KArApDBtWpq3RMFlrYlkHyrw+EG6RJJ8B
 7HkPP0m/dcrbp3LRnj2TMXxLCKWUSUtOWOGEX4o=
X-Google-Smtp-Source: ABdhPJxvz9QW9qZr3krp2/rIONOJhEFkLna/+yPZhMguwJHl4VWprB4zMZMTv/vOKQrmLE47IvoQe4ykEbnZXtGZapw=
X-Received: by 2002:a05:6808:ecd:b0:2cd:90e5:25cb with SMTP id
 q13-20020a0568080ecd00b002cd90e525cbmr5389316oiv.128.1645650705806; Wed, 23
 Feb 2022 13:11:45 -0800 (PST)
MIME-Version: 1.0
References: <20220217231728.13932-1-dmiller423@gmail.com>
 <20220217231728.13932-2-dmiller423@gmail.com>
 <66f97111-6ac5-2061-f72c-9bf6d3a2b723@linaro.org>
In-Reply-To: <66f97111-6ac5-2061-f72c-9bf6d3a2b723@linaro.org>
From: David Miller <dmiller423@gmail.com>
Date: Wed, 23 Feb 2022 16:11:33 -0500
Message-ID: <CAEgyohWJyE+2=nhqyXWGq=RjxicUChKBdZxG7-8_TNwzuynk8Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] s390x/tcg: Implement
 Miscellaneous-Instruction-Extensions Facility 3 for the s390x
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dmiller423@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, David Hildenbrand <david@redhat.com>,
 farman@linux.ibm.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Bit 0 controls this, and recall that IBM uses big-bit numbering, so "8".

> This stores the low part of r[23] in the high part of r1.
> You need to select the high part of r[23].

good catch, these are both fixed will update patch shortly.

Thanks for the review

- David Miller




On Wed, Feb 23, 2022 at 2:41 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/17/22 13:17, David Miller wrote:
> > +/* SELECT HIGH */
> > +    C(0xb9c0, SELFHR,  RRF_a, MIE3, r3, r2, new, r1_32h, loc, 0)
>
> This stores the low part of r[23] in the high part of r1.
> You need to select the high part of r[23].
>
> >   static DisasJumpType op_popcnt(DisasContext *s, DisasOps *o)
> >   {
> > -    gen_helper_popcnt(o->out, o->in2);
> > +    const uint8_t m3 = get_field(s, m3);
> > +
> > +    if ((m3 & 1) && s390_has_feat(S390_FEAT_MISC_INSTRUCTION_EXT3)) {
>
> Bit 0 controls this, and recall that IBM uses big-bit numbering, so "8".
>
>
> r~

