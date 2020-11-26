Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331D62C595B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 17:35:59 +0100 (CET)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiKFR-00047Z-Pw
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 11:35:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antoine.damhet@blade-group.com>)
 id 1kiKER-0003fJ-An
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 11:34:55 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:32776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antoine.damhet@blade-group.com>)
 id 1kiKEP-0004MG-CE
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 11:34:54 -0500
Received: by mail-wm1-x329.google.com with SMTP id u10so179544wmm.0
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 08:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blade-group.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fbsrhUKb5NlZuy7Dkjjfx+ELei8BnVVLZa7z0nJiTkk=;
 b=HuOmA9XTVBziYK5oXBUNTL0BBKxsNl3fRm9xoPfj9vNa3glkfT6FzGgpjocowXvoPB
 86BAXH64j0IrgoX10dsWZiNlDbrBI1hOPg/NuK3iNIHNAiupCvBMsb0yHONf/q9U0Zq2
 mwFxoJxRjDFE5Vcs5Zdr3xKxbJC/c8krEgSTaUGZd8auggM4QEm1Ws7CNABBl8QQAtCG
 rhrRdnwUd1lZ3Mea7LBNAwZhjDaLz3kyC3wazE8qsLwNHFznHPKmAOT639HbnGI7usd2
 pB4uZjnhHPUVc8w99MmnK4M1cBRkPPNRbLufoAkjeFtXenrkkm5sgJDiJR2ArPWeZFfC
 x0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fbsrhUKb5NlZuy7Dkjjfx+ELei8BnVVLZa7z0nJiTkk=;
 b=RJf+nxnerWnGrkPb1K2p/2kLe924EeKWvbXQsr9sw6E07rWQtGGcPxYvNDUTMMrFW/
 /Feqc0vkE+Du/73m+MNStlhxZ8QC5D8kYlA6W00c93yFaKTf2KbA+xHiiYTNqrQc89YQ
 NvNR10xNrj8UoXG+jyCP0wwm34v3JD7S/cdY9EB8UEGXjaOodO+Fm1IIwuxkb235Bg34
 qAWYCRBUqfb22zgdVmUUt4G7Jo8pm82+DhLSfo33R+hkNfSO0g43dm83bGIQeOcupgkz
 vwuaPfvniHDcz6tRA2mFJDmbBrG0snfbtsYUHAXLQOfS+gOf105yKVgG+1JLKX+h2vle
 u+BA==
X-Gm-Message-State: AOAM532tNYMo0ld//hbWeJa0D8jTyA3VskYkXZrNyCfkmIKV/zX+i6CF
 9vzCYMqERqqt6HN/AY4PgnSvgQ==
X-Google-Smtp-Source: ABdhPJzHNodbGckd8zlsVWuc33yL7/EJkxfO+9LUMcDVmn4bmJp+ve4kpJO6qHEtB4TIi+MFHgsnDQ==
X-Received: by 2002:a05:600c:211:: with SMTP id
 17mr4304214wmi.84.1606408491475; 
 Thu, 26 Nov 2020 08:34:51 -0800 (PST)
Received: from localhost ([2a01:e34:ec16:8a90:4e1d:96ff:fe49:7109])
 by smtp.gmail.com with ESMTPSA id c2sm10381914wrf.68.2020.11.26.08.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 08:34:50 -0800 (PST)
Date: Thu, 26 Nov 2020 17:34:50 +0100
From: Antoine Damhet <antoine.damhet@blade-group.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [DISCUSSION] Allow ACPI default OEM ID and OEM table ID fields
 to be set.
Message-ID: <20201126163450.knb55wh2u7k2qgbb@tartarus>
References: <20201125132711.jqb7znxu5jpoanwi@tartarus>
 <20201125133251.GI30079@redhat.com>
 <20201125110221-mutt-send-email-mst@kernel.org>
 <20201125201322.urze5b7vwaa2t5sy@tartarus>
 <20201126051838-mutt-send-email-mst@kernel.org>
 <20201126125012.x6yzsou5rmlxagli@tartarus>
 <20201126082606-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126082606-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=antoine.damhet@blade-group.com; helo=mail-wm1-x329.google.com
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

On Thu, Nov 26, 2020 at 08:29:41AM -0500, Michael S. Tsirkin wrote:
> On Thu, Nov 26, 2020 at 01:50:12PM +0100, Antoine Damhet wrote:
> > On Thu, Nov 26, 2020 at 06:09:11AM -0500, Michael S. Tsirkin wrote:
> > > On Wed, Nov 25, 2020 at 09:13:22PM +0100, Antoine Damhet wrote:
> > > > On Wed, Nov 25, 2020 at 11:04:55AM -0500, Michael S. Tsirkin wrote:
> > > > > On Wed, Nov 25, 2020 at 01:32:51PM +0000, Richard W.M. Jones wrote:
> > > > > > On Wed, Nov 25, 2020 at 02:27:11PM +0100, Antoine Damhet wrote:

[...]

> Exactly so I ask myself whether it's worth it, their next version
> will check CPUID and then where are we?

Then I guess they will have to admit that they are purposefully blocking
VM use and it's not our problem anymore.

> But maybe it's time we just changed all these IDs to e.g. QEMU.
> We are very far from bochs generated tables by now.

That's a good idea, but I still think they should be user override-able
(unless you think it would be a heavy maintenance burden, in that case
you are king in your castle :D )

> Question is will this cause annoyances with e.g. windows guests?

Windows 10 guests seems unaffected, I cannot say for the other
versions/servers editions.

> Igor what's your experience with this?

[...]

-- 
Antoine 'xdbob' Damhet

