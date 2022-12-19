Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB57650B03
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 12:58:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7EmP-0001Gz-KE; Mon, 19 Dec 2022 06:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7EmN-0001Gc-3d
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:57:59 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7EmK-0000Ti-Bo
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:57:58 -0500
Received: by mail-oi1-x231.google.com with SMTP id c133so669325oif.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 03:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gIRxDLJVtLTPOEyQd3RnAizXBkSBE4jwEN5GJQW1YFg=;
 b=XSjswQ51s/o+77ZPk6oVIvdtBimqOuxcaEDa2acp3yx5kVFcLFArVJGzoN0EPIOR1E
 Uwg9EY9mon6wLVe14ebFWyZgGbgFW34xGF5VKfFQ+IfN8Aq+K60m66ZW5L3cW3G6B1Mj
 3ChmDUowgExHQhMB/L8bwC8G0jMGu8F91pKIS6fwWTCcmtPxt4Tm3BWJ4/9I2L9SR7kG
 uzJtnRAelrrhyuu4m4SdzrnCyAfO7+RHa+Qp6SJT0UcVuPyD2NpyOCdjDQPD9ivz1DXc
 Q2vRXR4S6BKnHBRqLHcdZCEB55tJ71VbgB/ABGvxOloKtBRxP6lis49b2W6wzSCH5E27
 PoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gIRxDLJVtLTPOEyQd3RnAizXBkSBE4jwEN5GJQW1YFg=;
 b=z6K/D16WvRNYzbIl4+asq0vwYocZ3u/NuS8bBhx4f8IfUTwy4RE5kzbShtchhewbDX
 DHu43TqPaJ3KyED+b2j8c2Rjb9JYxAJSXzvkfnXaZSSqBHFFAIGjHNzT8ol0hp1czPlD
 /16BWCJcYLLjl2k6xjztFJW/0S9kb7TqARyrMYpEhwoRtczbi0hLJ8B+mud9jZw0FB9L
 /SFW9DCGcPxTNBBJl9P3ojHIIQ0PWdlyyGTiX0qd0sAwltJ1UlS3OMidDCdHpcaPMtR1
 mp17oVJGYvZgl6JnhauJpDASSIIqmcUw1UKXfIdbDG774YI5JMUXSAvvCu4yxSbtjFlK
 xOUA==
X-Gm-Message-State: ANoB5pljnITMSFYsfnIcdF9MihSdAoyKzA7b3NdPCI9nSrCGl1LeIWhc
 uFJH05j2oatky2+q0mxANMrQlWnOQcX/HnwD5KG2UKAbC1U/mQ==
X-Google-Smtp-Source: AMrXdXtlcybFS6iUD8TTfswUplZhSAwe8La7oTySfBqEuS/z/gVSdyw4wWu3PuHFPEaFN4WPZQA8cdPE+oOx5Dg5Zig=
X-Received: by 2002:a17:90b:146:b0:219:94b2:2004 with SMTP id
 em6-20020a17090b014600b0021994b22004mr1719848pjb.215.1671450740849; Mon, 19
 Dec 2022 03:52:20 -0800 (PST)
MIME-Version: 1.0
References: <Y5zB+5t5K0AEj6Rn@p100>
 <31003f9a-5392-67ee-9ef2-01794c09510c@redhat.com>
 <75b841f6-1eab-9d5f-2ad7-89440931ac18@gmx.de>
 <CAFEAcA8q8aqWvd7dwuH79yzq6Kyg-EVo9YzsWJ_mav4bLLH7eQ@mail.gmail.com>
 <02766634-1ec0-436d-d641-c0c61997138e@linaro.org>
In-Reply-To: <02766634-1ec0-436d-d641-c0c61997138e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Dec 2022 11:52:09 +0000
Message-ID: <CAFEAcA-_ncQwXjkV7=ZMwQOjOonQhqJhOfQ8B7xAcVM=phhzyg@mail.gmail.com>
Subject: Re: [PATCH] meson: Clean up some dependencies regarding qemu-system
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Helge Deller <deller@gmx.de>, Michael Tokarev <mjt@tls.msk.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 19 Dec 2022 at 11:40, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 19/12/22 12:31, Peter Maydell wrote:
> > On Mon, 19 Dec 2022 at 11:22, Helge Deller <deller@gmx.de> wrote:
> >>
> >> Hi Paolo,
> >>
> >> On 12/17/22 14:28, Paolo Bonzini wrote:
> >>> These are wrong.  qemu-bridge-helper, virtiofsd, qemu-storage-daemon
> >>> and qemu-keymap *are* tools; if they fail to build due to any
> >>> dependencies, or due to other compilation issues, you need to add
> >>> tests to meson.build and check for the cause of the issues.
> >>
> >> No doubt, those are *tools*.
> >> But aren't those only required when you run system- and/or user-emulat=
ion?
> >>
> >> Looking at the packaging of qemu in debian:
> >>
> >> qemu-system-common debian package consists of thse *tools*:
> >>     qemu-bridge-helper, vhost-user-gpu, virtfs-proxy-helper, virtiofsd
> >>
> >> qemu-utils debian package consists of the *utilities*:
> >>     qemu-img, qemu-io, qemu-nbd
> >>
> >> IMHO this categorization makes sense.
> >
> > Possibly, but it's not the categorization we use upstream,
> > which splits our binaries into three groups:
> >   * system-emulation binaries (qemu-system-arm, etc)
>
> Subcategory:
>
>         * helpers (required to use system-emulation binaries),
>           apparently provided by 'qemu-system-common' on Debian
>           -- except virtiofsd which is not a helper --

No, I don't think this is a subcategory. We provide
 --enable-system
 --enable-user
 --enable-tools
but there is no
 --enable-helper
and qemu-bridge-helper, etc are built via --enable-tools.

> >   * usermode-emulation binaries (qemu-arm, etc)
> >   * tools (everything else)
>
>        apparently provided by 'qemu-utils' on Debian (without
>        virtiofsd).
>
> @Debian: Maybe virtiofsd deserves its own qemu-virtiofsd package?
>
> >
> > (I think the guest-agent may be a fourth group.)
>
> (or part of tools?)

No, it looks like we build it via --enable-guest-agent,
and --enable-tools is not checked.

thanks
-- PMM

