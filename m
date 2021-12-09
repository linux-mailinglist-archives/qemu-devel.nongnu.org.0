Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4481346E298
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 07:36:20 +0100 (CET)
Received: from localhost ([::1]:52226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvD2R-0000Mc-0A
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 01:36:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mvCyO-00079T-Tl
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 01:32:09 -0500
Received: from [2a00:1450:4864:20::534] (port=38480
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mvCyH-0001mD-PO
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 01:32:08 -0500
Received: by mail-ed1-x534.google.com with SMTP id x6so16128718edr.5
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 22:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m7acl8+VUhybBwv4IO5dmfKON596feuy8S8DbmGxmUg=;
 b=DYgg+M3qgQdAgBz/YD7xtjOFVHcvAyC2hJchPfzptVEpurKxdSgdlyNVJAqSYqzVfm
 XvPDkPW3HvyDjrsA1cbPJeB4NaB0q8YLBVeQYfvseyjQ3cd+fCXmzulDlGFyqvnwWZFs
 fQDz7bimNecL78HTgboPTwNrOrpEI5u7uE5XKVaIN1PpySYAwIX4nSPMflFTK5+c8qJZ
 U6Via0J8zkO2INsVll5ISM4bOVDk1MdaG9+jK5wAY9Dwqvtj4prgOsuK/7a+w1LhP69k
 Pb7Mcrmr6KXq4q7HK983zXtoCli4ENChIQsl9Rg4MiiFypFBr8GQmO69n/o5GXuhksrx
 5iSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m7acl8+VUhybBwv4IO5dmfKON596feuy8S8DbmGxmUg=;
 b=LnOTc/h4UNdpwO7sjMMG6M3zj6x0tnzCd/olFXMu82Lb1Aarj0A7V++HtHq0iKh0vk
 1OMh+VMZvF2QNEAOViuOr6fNEPuUTMhLpv+9kSDxtocdWLwZiS93yyfUh09Gx2h3zzTg
 uaACneL2BZYwgqtKqCMCBkmkeRB1bBws8xXor4EZH/y6B44ee96TdW91rPr3Bmunvvnq
 ZJd5H2m3Minp1PKy2+vd9hajVo/jh6pB6RkM5jXtr96Ky0YZy0bIaoQ2KS4aCmY5vDTK
 o3c58MNIsLz/24SLAaIVxBrcGr9+xPnEV64jYOe3snwqrDXwzUCiuJmI7M+p0Fhx8V1c
 ISug==
X-Gm-Message-State: AOAM532JvXM02Ir9uMzVDGwd0vRTa5gl8fwHH0gj+Cc0pa+cQeCLDDfp
 xgSRKM0N/KngsFbocu819+t3+fhOdJcXpA3btmsKxld9Cc8=
X-Google-Smtp-Source: ABdhPJwYn9W40M8chWJBp1UAcgBc5rkElUFuTqM0jgJkButW+6e5Ofo5hoPw1AnfmmWaF36Ah9zh0Fb/mOgd/7o3Z5Q=
X-Received: by 2002:a17:906:245b:: with SMTP id
 a27mr13230380ejb.415.1639031520224; 
 Wed, 08 Dec 2021 22:32:00 -0800 (PST)
MIME-Version: 1.0
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
 <1638472142-14396-6-git-send-email-eric.devolder@oracle.com>
 <CAARzgwyrfW8Dy_fow7nOr9nF9XTLazidiTqn9itPmoOZpMxu-Q@mail.gmail.com>
 <af8dc304-ec4d-8c0f-696a-b00a72bd1764@oracle.com>
In-Reply-To: <af8dc304-ec4d-8c0f-696a-b00a72bd1764@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 9 Dec 2021 12:01:49 +0530
Message-ID: <CAARzgwzud45gtxMW-gnUmMcLeumQt9Zv=CVOKcxs=vSRO-RLWQ@mail.gmail.com>
Subject: Re: [PATCH v9 05/10] ACPI ERST: support for ACPI ERST feature
To: Eric DeVolder <eric.devolder@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x534.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 8, 2021 at 10:08 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
>
>
>
> On 12/6/21 02:14, Ani Sinha wrote:
> > On Fri, Dec 3, 2021 at 12:39 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
> >>
> >> This implements a PCI device for ACPI ERST. This implements the
> >> non-NVRAM "mode" of operation for ERST as it is supported by
> >> Linux and Windows.
> >
> > OK sent some more comments. It will take another pass for me to fully
> > review this.
> >
>
> Hi Ani, thank you for reviewing. I have incorporated your feedback thus far.
> I have v10 ready to go but not sure if your review of v9 is completed yet?

I completed scanning this patch. Don't hold your breath. I review
things when I find gaps in other work and can't promise timely
reviews.
You can send a v10 once you have addressed my last set of comments.

