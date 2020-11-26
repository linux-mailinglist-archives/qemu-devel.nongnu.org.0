Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B053A2C543A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:53:24 +0100 (CET)
Received: from localhost ([::1]:43940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGm3-0002Cp-Fu
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antoine.damhet@blade-group.com>)
 id 1kiGj9-00010N-K6
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:50:23 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antoine.damhet@blade-group.com>)
 id 1kiGj3-0007J3-PO
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:50:21 -0500
Received: by mail-wm1-x32d.google.com with SMTP id a65so2297666wme.1
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blade-group.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bwIyx0arBnHDdTvl+uPoEaW30vZf8ALxRPV2pEcsXu4=;
 b=N1d17XhU4W1T2yaF5ENarX37rSNxLW+CL8lDT55bkDuH0qXvdaFUaFfMoPdgGNPFRI
 PwGl6i5kqnfcSVKEqht7wHekorTkdQJ6CBLbvifQZ9IGiQIDPtE9Jq2ElQg86+zzoqoj
 q8kWN9UuB03ZrgrEHE8/3dpow6GA4okUD/U3FApY0HuOmr4SeFC8XVpYtmJ4IAxZYqjN
 mDxiQLMPazb13oxMCXAoUAbn7w4NiEixe8z2pbzi5AmcJEn+TfoHDvwiXxMiUaMkKhtx
 gDBBHf2/1uRnBCfRWtq52a4US31sGkv7+7Tn0DCwOcrW7c5cJaW2PlPcHTylOPFUFl4G
 zZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bwIyx0arBnHDdTvl+uPoEaW30vZf8ALxRPV2pEcsXu4=;
 b=PI8+Gy69POPnsVLb9LpdZs3VMS4qiOrMCjTsYYKDDvx5WoSAO+Q0eaE1zBioNgg56P
 NIuEZZ5ET23HsFGhCZ0C3kt9dXlL0wJyJt62iEgKdD3mhFSIKOiZ90DH4kySQYmUhK6E
 FCUaPGtazRb5m0iyeO92zuT8hBDVoE22Xlo02zQaGsrkYfUjlTUIi2wFXevE9Bulk64k
 6pTj7BK9knKuX/TH32ZhQgAsxa1qxq03ATgOcKq1/D3XUWm+2UUQkfa+VT6OT6c+4P8K
 s7qOf+NzEYyP1ZC+n58stVFDOHJK+UJRlTmNV2QnfH8lWfAwgEFPpYrSI7bBxWtv8L6E
 Axxg==
X-Gm-Message-State: AOAM5336XaYig0UsNhQ8tCZqe2hFhzHfFOUlRAa92MrDZx8pUE+5geL1
 enPIOv/J5x/KzoCpIoHDzpLwFg==
X-Google-Smtp-Source: ABdhPJwHRIjfslIixduPhVNksouFloKK7dqG+uuGyP8UwEkAFSXgWte7WuJJqtpKQQw8rv8V93xzog==
X-Received: by 2002:a7b:cc95:: with SMTP id p21mr3230518wma.92.1606395013942; 
 Thu, 26 Nov 2020 04:50:13 -0800 (PST)
Received: from localhost ([2a01:e34:ec16:8a90:4e1d:96ff:fe49:7109])
 by smtp.gmail.com with ESMTPSA id w17sm8834531wru.82.2020.11.26.04.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 04:50:13 -0800 (PST)
Date: Thu, 26 Nov 2020 13:50:12 +0100
From: Antoine Damhet <antoine.damhet@blade-group.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [DISCUSSION] Allow ACPI default OEM ID and OEM table ID fields
 to be set.
Message-ID: <20201126125012.x6yzsou5rmlxagli@tartarus>
References: <20201125132711.jqb7znxu5jpoanwi@tartarus>
 <20201125133251.GI30079@redhat.com>
 <20201125110221-mutt-send-email-mst@kernel.org>
 <20201125201322.urze5b7vwaa2t5sy@tartarus>
 <20201126051838-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201126051838-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=antoine.damhet@blade-group.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, lersek@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 06:09:11AM -0500, Michael S. Tsirkin wrote:
> On Wed, Nov 25, 2020 at 09:13:22PM +0100, Antoine Damhet wrote:
> > On Wed, Nov 25, 2020 at 11:04:55AM -0500, Michael S. Tsirkin wrote:
> > > On Wed, Nov 25, 2020 at 01:32:51PM +0000, Richard W.M. Jones wrote:
> > > > On Wed, Nov 25, 2020 at 02:27:11PM +0100, Antoine Damhet wrote:

[...]

> >=20
> > I'm sorry I cannot give you the name of the crashing software due to a
> > company policy. But I can tell you that if either `BOCHS ` or `BXPC` is
> > present in any of the tables it will crash. Any (or at least the few
> > that I threw at it) other string will work so it seems it's some kind
> > of DRM-related hypervisor detection.
>=20
> Hmm I'm not sure how far we want to go with this. If software vendors
> want to detect a hypervisor there will always be a way.
> How are we sure we are not starting an arms race here?

We can't but IMHO, as long as we stay within the specs we should be OK.
There are far more obvious checks like the `CPUID[0x1].ECX[31]` which
would destroy most of the PV features in a proprietary OS like Windows
if disabled.

Worst case scenario they would do timing-based detection and that would
be insane to defeat. As for the `Shadow` virtual machines we try to
"play" fair by exposing deterministic values (for example `Shadow` and
`Blade` are clearly exposed in SMBIOS) and don't hide the fact that we
are a virtual machine, so we are easy to ban if the vendor really wishes
to.

>=20
> Also which of the IDs matter?  OEMID? OEM Table ID? Creator ID?

I just checked for the Creator ID and it also crash, my guess is that
they dump the tables and look for `BOSH` and `BXPC` patterns anywhere.

PS: we reached-out to the software-vendor which did not acknowledge
    banning VMs but added an entry to their FAQ saying that VMs were not
    supported.

>=20
>=20
> > As for the uniqueness of the table IDs, I guess it would be sane to keep
> > the same pattern (id+table sig) but allowing the first 4 bytes to be
> > overridden.
> >=20
> > [...]
>=20
> It's certainly possible, it's just very specific to just this DRM scheme.
> Not sure what's a better way to do it:
>   qemu -acpidefault oem_id=3DABCD,oem_table_id=3DEFGHIJKL
> is probably going too far since then table IDs are not unique.
>=20
> Also I'd probably use machine properties for this, the need here
> is baroque enough that we don't want a dedicated option.
>=20
> >=20
> > --=20
> > Antoine 'xdbob' Damhet
>=20

--=20
Antoine 'xdbob' Damhet

