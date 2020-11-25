Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE1F2C48E7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 21:15:14 +0100 (CET)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki1C4-0003By-PI
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 15:15:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antoine.damhet@blade-group.com>)
 id 1ki1AP-0002OU-8s
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:13:29 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antoine.damhet@blade-group.com>)
 id 1ki1AL-0004Yd-Rs
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:13:27 -0500
Received: by mail-wr1-x42a.google.com with SMTP id i2so3151423wrs.4
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 12:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blade-group.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aitP/wpfsmKGGsQMAWO0G+bJxHturguXoOkmtHKqDoA=;
 b=MkR7+r0O9qc5FEaoxVlqWNAjbBARon7GSWVLhhQDgHXUUndgKRVJFvKXBaW6AYzCL5
 QwUpQxenyXBU96h4CZVInO6zSk/Ar0MVrKlixhwc5Hl+uMwzB0lA9YzhDS4CxPG8OlL1
 C/CrzxCkBD3h7AgoPplc3lHE6DvlmqhIgbgZJn0LeblhLh60wCfV0QwtRWMKsfjxvIYD
 +YCcfzFjKBKm1uiZDnvy2UynDvpuonzk40wtViHHCKv0CimhzgYpz9j6Z1wa/WTCra+e
 f9Ms5OB2LwW0pWXTSt9Zzuc19a02lH6qHkifFQqQglrStZNkd8FGF0V9fWPXX3Z5ZXgx
 Bd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aitP/wpfsmKGGsQMAWO0G+bJxHturguXoOkmtHKqDoA=;
 b=OxNekFlh/lSHPsPvHGQRqzHYJ9+aqzarnWxkzz5jgOsyGwmZrFh4N6y6tEsv4Wpw8/
 sWwKgzs2Tyoy9meQU+JJuVgqMahRW7Nr0iEEa8787H+Lo492PNNy4pfB/mLvErT8SpR/
 cwkFvam5SHv3mHR2Je4MEPMPsyiRowTUVtjtE4NnwZxZ1piF482YpLw+SFYEKuRAimPp
 xWLHsJsPDppRzcKHQKPjGZcG07bZFDHWCiV3uMT7qEQCy3wDgR2HxMf7AEVN4VoDvRxU
 y5JswvLLtp+Q2mbGmYOhi8+5d2hR5lW42f6Ew3H6wt22UdvMyE2WzDi8jhfXCSsaE8ko
 i7ig==
X-Gm-Message-State: AOAM533bHF9hWMvuKCuEjFcJ/XvI6dAYra0z/QbA6IoEj0ZMCLvrcDVq
 XWf4WBKY3Q+GcevN27Eww9uY/Q==
X-Google-Smtp-Source: ABdhPJzpwAB3ZGngKAipbR9VIUyMaKAM3y3DegtmFbq5hCiOUrBAiYPirPJJdW70PyoliCfhxuxLVA==
X-Received: by 2002:adf:ed02:: with SMTP id a2mr6085444wro.81.1606335203628;
 Wed, 25 Nov 2020 12:13:23 -0800 (PST)
Received: from localhost ([2a01:e34:ec16:8a90:4e1d:96ff:fe49:7109])
 by smtp.gmail.com with ESMTPSA id l13sm5975017wrm.24.2020.11.25.12.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 12:13:22 -0800 (PST)
Date: Wed, 25 Nov 2020 21:13:22 +0100
From: Antoine Damhet <antoine.damhet@blade-group.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [DISCUSSION] Allow ACPI default OEM ID and OEM table ID fields
 to be set.
Message-ID: <20201125201322.urze5b7vwaa2t5sy@tartarus>
References: <20201125132711.jqb7znxu5jpoanwi@tartarus>
 <20201125133251.GI30079@redhat.com>
 <20201125110221-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125110221-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=antoine.damhet@blade-group.com; helo=mail-wr1-x42a.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 25, 2020 at 11:04:55AM -0500, Michael S. Tsirkin wrote:
> On Wed, Nov 25, 2020 at 01:32:51PM +0000, Richard W.M. Jones wrote:
> > On Wed, Nov 25, 2020 at 02:27:11PM +0100, Antoine Damhet wrote:
> > > Hello,
> > > 
> > > We recently found out that some softwares are effectively crashing
> > > when they detect qemu's `OEM ID` or `OEM table ID` in the ACPI tables.
> > > 
> > > I see no reason not to expose the setting to the user/command-line. A
> > > previous patch has been submitted in 2015[1] but did not get through
> > > because (if I understand correctly) using the IDs on the `SLIC`, `BXPC`
> > > and `RSDT` tables were enough at the time.
> > > 
> > > If you agree, I am willing to forward port the patches of M. Jones but I
> > > need to ask how it would work `Signed-Off`-wise ?
> > 
> > On this point, the patch I sent was actually written by
> > Michael Tokarev, I was only trying to get them upstream.
> > 
> > Rich.
> 
> I think at least one of the issues is that e.g. UEFI at least
> seems to assume unique OEM table IDs e.g. for SSDTs.
> 
> So let's try to be more specific please, which software
> crashes, what does it want to see and in which table.

I'm sorry I cannot give you the name of the crashing software due to a
company policy. But I can tell you that if either `BOCHS ` or `BXPC` is
present in any of the tables it will crash. Any (or at least the few
that I threw at it) other string will work so it seems it's some kind
of DRM-related hypervisor detection.

As for the uniqueness of the table IDs, I guess it would be sane to keep
the same pattern (id+table sig) but allowing the first 4 bytes to be
overridden.

[...]

-- 
Antoine 'xdbob' Damhet

