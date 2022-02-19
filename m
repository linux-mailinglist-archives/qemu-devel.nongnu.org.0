Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AAD4BC8BF
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 14:53:53 +0100 (CET)
Received: from localhost ([::1]:50938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLQBL-0004wJ-PT
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 08:53:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nLQ7m-0003lc-T7
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 08:50:33 -0500
Received: from [2607:f8b0:4864:20::1036] (port=38843
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nLQ7F-0005AY-IC
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 08:50:02 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 m1-20020a17090a668100b001bc023c6f34so905968pjj.3
 for <qemu-devel@nongnu.org>; Sat, 19 Feb 2022 05:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TMSny8Hb1/dj+Tg4cloLmwVkat85TCFFhtPIeBpg4qg=;
 b=pEI5DA4H3nyYsQetFyyEgRvzQXP2CNIZpTo6L2RWZLMnNP8t+aHpFkHJWJNtwFxzjP
 FyrzbI7oFcKD+/l3+xdincK/+TOEw4+5t0jw3AH1UPcDOWGyv8Z+jfrOlxnjoWoNj1Ya
 kDs3WMQGbqXBNnWmSH9cBZRzwGSGgGcwBRF4Ni7EWrNRZiuOyzeJVKyf3C04dPMtwYpO
 8zIxuhiv8PAgTlMme0SvpBkNt7hp+NCoKy6xdyxV0D3iHhmrI9oIc7J/jb0qTR4TKN7a
 rMZ+naEWS9O+3BU8EjLmoZjaGVpd1w9x66tQYwPRIOir2TsvweQ24kLoSJO4PxaeOkLI
 ZOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TMSny8Hb1/dj+Tg4cloLmwVkat85TCFFhtPIeBpg4qg=;
 b=xDVC/WbZ3eyhk3uwPIPzSX7iA/cwgM8EG3dj+XmLrWNMbKqzQoJdCTF0i07Iz05oy9
 vFSbhwiu1Bp4ZWZujcvSJXqc+Cb4B3S18vVdg27ZneC6s+QXc0aYM4R7ic6DRT533SDL
 nXjLyBhcSYs8pl16vkkBqF9+TxMz3dth+J15ZV3U7qQ3ra7Rk3dVXxgb98HtX2ENFE76
 psXBBjxIWO1cRqHNC2fR/8Yg6ZW82/H2cQdtSzjgRFpfVxfuSm2L1itiSqJ/RuDZKVQA
 QYK/x/iXIhcTLZVymczp07BngS4UhXJAg4SCsYOoT2wFid1rDPFvqQPE5lfFmW0FDmzi
 aOeg==
X-Gm-Message-State: AOAM531uwCrfGS1Refw5OsK+VX0O7SBuekGk9wzwf/YmGwMB+29P7e8P
 bacwB09/gi/KBWGgsrBD3p8RtS9dn60uPvXlRhM=
X-Google-Smtp-Source: ABdhPJyE47hQVgA1q72jThE17dy2tEtzCHWvrzz2PSgzP3GXQcFrprR1DKCs5OoUeUiM+hddAnYZQy8ErlzDy/Qmh2g=
X-Received: by 2002:a17:90a:f318:b0:1bb:c168:90ec with SMTP id
 ca24-20020a17090af31800b001bbc16890ecmr11433360pjb.157.1645278520612; Sat, 19
 Feb 2022 05:48:40 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <f7dc638d-0de1-baa8-d883-fd8435ae13f2@redhat.com>
 <bf97384a-2244-c997-ba75-e3680d576401@redhat.com>
In-Reply-To: <bf97384a-2244-c997-ba75-e3680d576401@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 19 Feb 2022 13:48:29 +0000
Message-ID: <CAJSP0QU1LgqbKXePwojKKZsyKeyAR=reuMUt8ecBH8B6bhVV8Q@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "libvir-list@redhat.com" <libvir-list@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 kvm <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Feb 2022 at 11:40, Michal Pr=C3=ADvozn=C3=ADk <mprivozn@redhat.c=
om> wrote:
>
> On 2/17/22 18:52, Paolo Bonzini wrote:
> > On 1/28/22 16:47, Stefan Hajnoczi wrote:
> >> Dear QEMU, KVM, and rust-vmm communities,
> >> QEMU will apply for Google Summer of Code 2022
> >> (https://summerofcode.withgoogle.com/) and has been accepted into
> >> Outreachy May-August 2022 (https://www.outreachy.org/). You can now
> >> submit internship project ideas for QEMU, KVM, and rust-vmm!
> >>
> >> If you have experience contributing to QEMU, KVM, or rust-vmm you can
> >> be a mentor. It's a great way to give back and you get to work with
> >> people who are just starting out in open source.
> >>
> >> Please reply to this email by February 21st with your project ideas.
> >
> > I would like to co-mentor one or more projects about adding more
> > statistics to Mark Kanda's newly-born introspectable statistics
> > subsystem in QEMU
> > (https://patchew.org/QEMU/20220215150433.2310711-1-mark.kanda@oracle.co=
m/),
> > for example integrating "info blockstats"; and/or, to add matching
> > functionality to libvirt.
> >
> > However, I will only be available for co-mentoring unfortunately.
>
> I'm happy to offer my helping hand in this. I mean the libvirt part,
> since I am a libvirt developer.
>
> I believe this will be listed in QEMU's ideas list, right?

You're welcome to co-mentor the QEMU project indepently of a separate
libvirt project (if there is one). Your involvement would be great so
you can give input on what APIs libvirt wants.

Stefan

