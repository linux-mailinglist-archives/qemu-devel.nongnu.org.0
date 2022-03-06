Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25914CEBE7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 15:25:02 +0100 (CET)
Received: from localhost ([::1]:39624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQroj-0000Ap-GB
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 09:25:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQrnF-00079H-Jc
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 09:23:29 -0500
Received: from [2a00:1450:4864:20::636] (port=34499
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQrnE-0004Ve-1f
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 09:23:29 -0500
Received: by mail-ej1-x636.google.com with SMTP id gb39so26833900ejc.1
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 06:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AUStUpvTrwaf7AnqJNys9mFqax/KMs/1FOSv8Dun+cQ=;
 b=wzJPiIHneJquXA9yMF7StPFUB6qD6L+l2fBYO3KH4gv65+KyjvvE5Lm/u6T0mJJVH3
 U4ZwVOAxswo0zTT053EovGf6MeVEvmGDGWLHvf/pvCqIOXdxQIzRw+Jd/Sq98NR5jWQr
 mzuKp/rflLzG3imlKye9bSGcnxL1SwYPfPOVZXBrhDO6EJNi3eldHinuS/88AEuPaHFK
 Ux12+MVgJGVFauQ9ZUHzODJk9O593TggSjJjBxn5ch3Pfx3XeG8qvgGHWQsn3CY4RqDc
 22vv4u/Kq+ZRFDWK9z8AhmUxk41G4DHdnd6ZREaeEShGo6ZdXNoiOQQbLYQquB+bF8OE
 28WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AUStUpvTrwaf7AnqJNys9mFqax/KMs/1FOSv8Dun+cQ=;
 b=0wdk33PgjqC7Ad7PB2fdn1uRBMOr+rFTPMVt0zd3/sSlBNSwObLBpfYbKuu9+Zbpw2
 OdCiofiDLQlYJd0ARwHCD9vphpYj+H54ewSY+ZKLnG/YQLHp80tmM16lsCOUqWi7tAuK
 UM5SjfjsdQ13aJ/Vbkz+tpT283Ym7fnNeFf3j3xu0hJvF5AFS6KHy2FBsMXS7zvVj4/D
 JmydiNNyocTb+skglHmwC8Sjn0MzVLLuhLpmGlkYhzJSwr+ChNXMw32ao9LlPSDHJSOk
 JwIJ9Vkh+3Lwr9hU00y7ZjBjns1zV1BpZMHE4BA7H5sbmpNZHkjHO4jV2OSQ86NTFxQj
 Xp7A==
X-Gm-Message-State: AOAM530swgyDalAcsf7GvKKZ05PR+ICSoG9E/Q8Rzkfu8uTAfIVnH3H+
 ZPEFSxAPSvaUHOSZ+K2+j4vdZXwXXlCcWT6NjNsTbg==
X-Google-Smtp-Source: ABdhPJyCe7DOUEY3jsN0uyc7p020OptWOIpb9PbL3U/UQKi61i7pMszJU0/ixh/Kp0nXIM7BqNQgn88/3ryvU/9JreY=
X-Received: by 2002:a17:907:8a25:b0:6d7:d59:6912 with SMTP id
 sc37-20020a1709078a2500b006d70d596912mr5997066ejc.259.1646576605891; Sun, 06
 Mar 2022 06:23:25 -0800 (PST)
MIME-Version: 1.0
References: <20220304150722.2069132-1-ani@anisinha.ca>
 <20220304150722.2069132-2-ani@anisinha.ca>
 <20220306061833-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220306061833-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Sun, 6 Mar 2022 19:53:14 +0530
Message-ID: <CAARzgwyVYHLfAm6LBMrEszbL=5A-+ZVTd0BQPW3YrehZAWLV2A@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] tests/acpi: i386: allow FACP acpi table changes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x636.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 liavalb@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 6, 2022 at 4:49 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Mar 04, 2022 at 08:37:19PM +0530, Ani Sinha wrote:
> > From: Liav Albani <liavalb@gmail.com>
> >
> > The FACP table is going to be changed for x86/q35 machines. To be sure
> > the following changes are not breaking any QEMU test this change follows
> > step 2 from the bios-tables-test.c guide on changes that affect ACPI
> > tables.
> >
> > Signed-off-by: Liav Albani <liavalb@gmail.com>
> > Acked-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index dfb8523c8b..7570e39369 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,5 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/q35/FACP",
> > +"tests/data/acpi/q35/FACP.nosmm",
> > +"tests/data/acpi/q35/FACP.slic",
> > +"tests/data/acpi/q35/FACP.xapic",
>
> For me make check fails with the changes in patch 2.
> what about the rest of q35 FACP tables?

This is what I have :

anisinha@anisinha-lenovo:~/workspace/qemu/tests/data/acpi/q35$ ls -l FACP*
-rw-rw-r-- 1 anisinha anisinha 244 Mar  4 21:07 FACP
-rw-rw-r-- 1 anisinha anisinha 244 Mar  4 21:07 FACP.nosmm
-rw-rw-r-- 1 anisinha anisinha 244 Mar  4 21:07 FACP.slic
-rw-rw-r-- 1 anisinha anisinha 244 Mar  4 21:07 FACP.xapic

Do you have some more tables? Strange!

