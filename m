Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9054E429C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 16:14:30 +0100 (CET)
Received: from localhost ([::1]:45568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWgDN-0002Xy-Of
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 11:14:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWgCL-0001rK-8T; Tue, 22 Mar 2022 11:13:25 -0400
Received: from [2001:4860:4864:20::32] (port=45437
 helo=mail-oa1-x32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWgCJ-0005Hw-NX; Tue, 22 Mar 2022 11:13:24 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-d6ca46da48so1979210fac.12; 
 Tue, 22 Mar 2022 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MFAVBGxrgoQPzt6Fe91P2hzOqS5UGswF3NisSW5n9JU=;
 b=iqPq7f5divfBvO84QaizL7RpqST2j690seysyQl0358YUrFe3tmkHD4tEzv6d7YwGl
 oHgFjBPlzshadg6dDOtn0eRVU/bPxq2v5+QcxPZHn8tt3F8Nakjg2ObjM+YOBPKCCVpv
 P39jR0RpkcwO6vp/D9k1WjFaUPnbP6gJ5v5Hh5rhG83r9JxSShgSaqM8NLN1yFWXO5Ik
 zXxfPi6qaSIiP+jmtpEGyDIkGTV021qYv7wHDlu3pnaVpEXc9pHm51EwNklFoidDDirY
 yNDzpRruQw72DqPVRb0zlv85JFyY9aE+k/qVbhvm89m2NQsfohAyRxEvtW1aI3LeiKcp
 wYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MFAVBGxrgoQPzt6Fe91P2hzOqS5UGswF3NisSW5n9JU=;
 b=AX7bkuf8QY23MEdWJSD+E037Ta1cCJW3uubPNkyEuguZ0OVw3hkRA7zaofovENbfw+
 1qy/DpBtn7lZ8hrnPJmncr/uqaXFgaHdS7+Xz3FQbdkJgVH82cytycDPdtrakW+AdO+S
 jZgwx/bgBl/GDXUuXLQPMS1jMZ6cvj7D1QotgJ1A5WfNexsBDUQD2kP1KHErHoikKs4w
 49JXbmXs/Ig1l/xIsP3EBSFRGLGRAm0MnOfOu6J8ksJcOXQWQHk8o0X1AueC0nMpbWwV
 2Of5lrREoDEG2ZkB5QbDpIe3tS/ZRy9R2galtOnxUxMC83W5Q8LmdrSwk5ouCjwj03zT
 a+Ew==
X-Gm-Message-State: AOAM530eGBD3hDNT3ABupSHynw0tztVa99ecDWXQRF/ZWR4FypUBy81G
 uRvahZ0uRfoMqZTTfoC0ql3TWaI9TjsP9ppRMbCKWmrQRzc=
X-Google-Smtp-Source: ABdhPJy8pvvu2PCVvlx5c+yMfsCiT4wnFPa6zCdONeaDK2YjL0R1Gurd/wtIw5o0DGDfPk1Q/MivfYNlemzHBtuEok4=
X-Received: by 2002:a05:6870:4346:b0:da:b3f:2b23 with SMTP id
 x6-20020a056870434600b000da0b3f2b23mr2030622oah.194.1647961594399; Tue, 22
 Mar 2022 08:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <20220308015358.188499-4-richard.henderson@linaro.org>
 <86ecb12d-2777-e83a-f375-368a3baebe86@redhat.com>
 <69878475-d983-3729-255d-09c6de0a2816@linaro.org>
In-Reply-To: <69878475-d983-3729-255d-09c6de0a2816@linaro.org>
From: David Miller <dmiller423@gmail.com>
Date: Tue, 22 Mar 2022 11:06:20 -0400
Message-ID: <CAEgyohVutuP3eFr7JfGni=GizSPx=tCRezcyvteZGBEZn4JczQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] target/s390x: vxeh2: vector string search
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::32
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dmiller423@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I came to much the same conclusion

On Tue, Mar 22, 2022 at 10:42 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/21/22 03:31, David Hildenbrand wrote:
> >> +        for (i = 0; i < nelem; i++) {
> >> +            if (s390_vec_read_element(v3, i, es) == 0) {
> >> +                break;
> >> +            }
> >> +        }
> >> +        if (i < substr_elen) {
> >> +            substr_elen = i;
> >> +        }
> >
> > Maybe combine both, I guess there is no need to search beyond substr_elen.
> >
> > substr_elen = MIN(substr_elen, nelem);
> > for (i = 0; i < substr_elen; i++) {
> >      if (s390_vec_read_element(v3, i, es) == 0) {
> >          substr_elen = i;
> >          break;
> >      }
> > }
>
> Yep.
>
> > We should do the MIN(substr_elen, nelem) maybe right when reading it
> > from v4.
>
> No, v4 does not get bounded until zs is set.
>
> >> +    /* If ZS, look for eos in the searched string. */
> >> +    if (zs) {
> >> +        for (k = 0; k < nelem; k++) {
> >> +            if (s390_vec_read_element(v2, k, es) == 0) {
> >> +                eos = true;
> >> +                break;
> >> +            }
> >> +        }
> >
> > I guess we could move that into the main search loop and avoid parsing
> > the string twice. Not sure what's better.
>
> I'd leave it here, so that we only do the strlen once.  There's no obvious place within
> the the search loop that wouldn't wind up doing the strlen more than once.
>
>
> r~

