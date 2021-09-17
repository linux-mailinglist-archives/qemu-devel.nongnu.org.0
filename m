Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6945840F16E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 06:44:14 +0200 (CEST)
Received: from localhost ([::1]:54014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR5jR-0004uc-IE
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 00:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mR5go-0002hY-H5
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 00:41:33 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mR5gm-0003Go-22
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 00:41:30 -0400
Received: by mail-pf1-x42c.google.com with SMTP id b7so7972703pfo.11
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 21:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=zt2+v9ztHpr9aB3fYErZck8RU0sgQiw3egOS2Sb+GHQ=;
 b=y+p6528JWnm7/AjsxatSD7nsu5c6SfcLGt1e2uoZJ22zT2fg2a8HRrAZGAk4Zu/ufx
 Mq09J+kKX1J6jU3IMEYSydyJhT+QXSda6y762jQsN2t43UPZtE42GhFlD9Z6vFdCj8da
 dDi4eb/gLBFb4xakDs5cboU61PDjNu2hDZlbNuuAig0gIrKfRSnvLs/i03UL+aG9xUnp
 PUl9K5DPuedFNc+GLCrAsTu0ZE6cjjjwSiET0NNeBI9drGSOWHov1p/GOt3i6jp1A1tO
 cTLtnTfSHHtRLaj4k6XiwEFuoHyU96EGs5fFZRBzri7BFrDltxbC2Z1sBxEnwSrrKTou
 OwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=zt2+v9ztHpr9aB3fYErZck8RU0sgQiw3egOS2Sb+GHQ=;
 b=eSezu1nbZ6ilsB4PDFdN1DS4DnLDzXnEgM7m4bdsH8fXVVDBdfyAotCmin2KdCoZgn
 vp1nldKNhmlolaHQzVqsnRgx8kQAhaAG+WdjssBGNP00CoRY8EZpC056eP2H40dwl6ao
 m84I695ZeFT4vpsRv7ZbjM2oFrgShn2CVxlzFfSte0tkW3T21NQIidXftdw4bZRBtRnF
 Kvtm2DloUVpEg+zp9DdHiHKtrbYSLoBWQuzG4CMQxOk6kCT7F+at/dpyyovOa+fybuqq
 IvpRhbSSkpPvFuolGrpjD5hJERsaaEmb7sLI9Ad6DadCm6svlYgKIAtA9YQ1bN1AiU3I
 8yIg==
X-Gm-Message-State: AOAM5325aNd98NVHGLxsJpNDngF9uVOWUUXgFmvoAgHCMxAZZD4RIF95
 1R1BvG5/b7t1H0l0NrpVf4BcGw==
X-Google-Smtp-Source: ABdhPJzBWw2ElfodqG2rg39KXR5ukyVmNUR8mlL1V0ml6xV7JjkxB4pj5dZGSHcIrnJjO99jP8Mt/Q==
X-Received: by 2002:aa7:8106:0:b0:416:143c:44e3 with SMTP id
 b6-20020aa78106000000b00416143c44e3mr8455612pfi.41.1631853685498; 
 Thu, 16 Sep 2021 21:41:25 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.238.80])
 by smtp.googlemail.com with ESMTPSA id m9sm4518334pfo.44.2021.09.16.21.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 21:41:24 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 17 Sep 2021 10:11:19 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: hw/i386/acpi: fix conflicting IO address range for acpi pci
 hotplug in q35
In-Reply-To: <20210916185427-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2109171002510.3487658@anisinha-lenovo>
References: <20210916132838.3469580-1-ani@anisinha.ca>
 <20210916185427-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::42c;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: jusual@redhat.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 16 Sep 2021, Michael S. Tsirkin wrote:

> On Thu, Sep 16, 2021 at 06:58:35PM +0530, Ani Sinha wrote:
> > Here's sending v2.
> >
> > changelog :
> > v1: original patch.
> > v2: typo fixed. reviewed-by tags added.
>
>
> Thanks, tagged!
> Ani pls make sure the voer letter in the series has
> subject
>
> [PATCH 0/3] hw/i386/acpi: fix conflicting IO address range for acpi pci
>  hotplug in q35
>
>
> using --cover-letter with git format-patch will do this automatically.
>
> It will also include diffstat and other useful info.

Ah I see. I was wondering about this few days back because I saw a
patchset with diffstat etc. I use git send-email --cover -v2 -3 -cc
--cc-cmd etc. I did not realize that git format-patch also has similar
options and adds more info to the cover letter. I wonder why the behavior
is different between them.  Also --cc-cmd is missing in format-patch!

Was this an essential complexity or accidental one :-)



>
>
> > This issue has been reported here:
> > https://gitlab.com/qemu-project/qemu/-/issues/561
> >
> > We have disucssed this issue at length here:
> > https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02146.html
> >
> > This issue affects Qemu version 6.1.
> >
> > Patch 1 : allows q35 DSDT table changes.
> > Patch 2 : actual fix.
> > Patch 3: updates DSDT table blobs.
> >
> >
>
>

