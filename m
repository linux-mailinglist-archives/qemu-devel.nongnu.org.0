Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF5A4E609C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:48:01 +0100 (CET)
Received: from localhost ([::1]:42732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXJ8S-0001jz-M9
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:48:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1nXIoE-0005ZW-4j
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:27:07 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:32780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1nXIoC-0005e7-1T
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:27:05 -0400
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 506383F17A
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 08:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1648110416;
 bh=BEFjFwdyZ+juzcTNBKdWVSKt7IAvgYfjXetEuCbPO0k=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=K6OFJpZJeWr/7hNID9w7476JqqSVJzfGX6EZGMu4Dh4pLia24M8evCjxAqON9XW4K
 Iu/nEMD+0fFCcw2v6hHNGUNjgu8DpF6MkRsz+45OIjeJNxDNrTK1lPh6BFFjzbYOzx
 IH5iRWZhqPrRbAJsZN5SReBY+RSw/v0vkAegymz455M9Ey9KP7mlGqhxgL9a4UOUmm
 1itSGah/Ku1SVfi66odFSWBSbAGSHOTQk6QkpFGZoIsiyJ407sti8lNy+zIB5SzvUh
 j4Cq1kQfX7E/JU24p63pOL2tnj9nBxcNGZH5HDEOkHtVyWhpM+btN7m5N/KmhhqHNt
 Y8kJCR00LjTMw==
Received: by mail-qt1-f197.google.com with SMTP id
 z18-20020ac84552000000b002e201c79cd4so3173347qtn.2
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 01:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BEFjFwdyZ+juzcTNBKdWVSKt7IAvgYfjXetEuCbPO0k=;
 b=1a+f0FWK4Hb5uWLVit+isP6oPkomE3EY2joV/ZECzoZI76HpHlqanrcE7EbFe4L7jG
 pgmxIDWCFZhUrEj2MqxtPpehoZaxbcl1dSMN/DTXxKSlXrzwdIcfyGsq+7lGPDes/DYJ
 7Ytm3csZZa26EyP5ZjztCxRDzEdq7hBVm6ZiWeMpPBTWx7idfdXrweiEb8m+1xO61fPa
 M9b6+9UzxR6Uugr7OWw2WY2RoPkObT4i9LFDiLLdlMRfsl3XIEZQmzykhqDdzIxrlD+r
 qPTe2cUuxmp43ItUC33FEDzRw37e4ffXqVjTzVix6FOr+055WijEmz6mqI6u3S80tJK9
 GDTQ==
X-Gm-Message-State: AOAM532GdYiYxpxeh+voUlk7btmMyQ8fPWdgX3HrWrAhVlA8K6I7jvkZ
 SphcwLk6SHkIiSisq/Qe371MsS3xX+Om6WDhcnRWRLCs7H5dNZPO2lBb2tpd71C4dANih0snutR
 VnQbX86G+Fz7YQ9U5/Wj1nIpk9kIT5OlVS3ozY+ItbVZs8W4I
X-Received: by 2002:a05:6214:2b07:b0:432:f7e6:e443 with SMTP id
 jx7-20020a0562142b0700b00432f7e6e443mr3126456qvb.125.1648110415343; 
 Thu, 24 Mar 2022 01:26:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPqonh0666Z6+zXddgsZGkRRl9Ni3JQxR3fbgNFO7OwSZk8j7a7ekPiEUCoxMy1fbFwI5BwhD4cMs2x8uadZg=
X-Received: by 2002:a05:6214:2b07:b0:432:f7e6:e443 with SMTP id
 jx7-20020a0562142b0700b00432f7e6e443mr3126447qvb.125.1648110415142; Thu, 24
 Mar 2022 01:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220323090713.1002588-1-christian.ehrhardt@canonical.com>
 <7f4e9d3a-78fd-4b48-56c6-418d8516a0df@gmail.com>
In-Reply-To: <7f4e9d3a-78fd-4b48-56c6-418d8516a0df@gmail.com>
From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Date: Thu, 24 Mar 2022 09:26:28 +0100
Message-ID: <CAATJJ0KOyvHMhRSHJSf3x_5KmGGxHxRa9twR9tA15_SD-a6c_w@mail.gmail.com>
Subject: Re: [PATCH-for-7.0] build: disable fcf-protection on -march=486 -m16
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=christian.ehrhardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 11:54 AM Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> On 23/3/22 10:07, christian.ehrhardt@canonical.com wrote:
> > From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> >
> > Some of the roms build with -march=3Di486 -m16 which is incompatible
> > with -fcf-protection. That in turn is can be set by default, for
> > example in Ubuntu [1].
> > That causes:
> >   cc1: error: =E2=80=98-fcf-protection=E2=80=99 is not compatible with =
this target
> >
> > This won't work on -march=3Di486 -m16 and no matter if set or not we ca=
n
> > override it to "none" if the option is known to the compiler to be
> > able to build reliably.
> >
> > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/889
> >
> > [1]: https://wiki.ubuntu.com/ToolChain/CompilerFlags#A-fcf-protection
> >
> > Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> > ---
> >   pc-bios/optionrom/Makefile | 4 ++++
> >   1 file changed, 4 insertions(+)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thank you for the review Thomas and Philippe!
For the sake of testing other than my local build checks, the CI jobs
on [1] on gitlab also all passed for this.

[1]: https://gitlab.com/paelzer/qemu/-/pipelines/498917375

--=20
Christian Ehrhardt
Staff Engineer, Ubuntu Server
Canonical Ltd

