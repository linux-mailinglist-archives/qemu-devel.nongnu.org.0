Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500912C556A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 14:32:17 +0100 (CET)
Received: from localhost ([::1]:56746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiHNf-00050x-Uy
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 08:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kiHLL-0003wR-GK
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 08:29:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kiHLJ-0003Xc-89
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 08:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606397387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RfilU3sxMO+u6NdKdsAHEPH2kDMW09Z7jh/YUdC0leo=;
 b=gqTdDB/G7NYCGEfcLprFEzJcFFpzy6vsTRRMNTjjN8if08bBLuAFh494DyLAKWtda/bTRk
 PRSLBlHkHhRcRiVmEh4JUOlvbvY4iQcmeZr6g2PsioDgVaSHdvOr7CDeXZAYks2Oak1i1j
 vt3/GX5VeA1Vcx45z0ly/pL01XJajdg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-FZasqlAFPYSsA4YLD8N40g-1; Thu, 26 Nov 2020 08:29:45 -0500
X-MC-Unique: FZasqlAFPYSsA4YLD8N40g-1
Received: by mail-wr1-f71.google.com with SMTP id b12so1301783wru.15
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 05:29:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RfilU3sxMO+u6NdKdsAHEPH2kDMW09Z7jh/YUdC0leo=;
 b=jE1mPDdoPZGA8hACFrTJo617D4dd8y766pBjlbULn1NlSqE2M3cNOAlE1XZDALdV4g
 CmlriMMMTxQN5206b20h+Ht10O5syPv/cD0Gfprby8weuFUTNNc2GuEAkP8L3Pp15ayH
 vBeGXs4lJ7XmXuKOg3qF113i4X7cn49fJz7U/cyp1lum5x1Gh8LEH2lRf0M58AcBBrgl
 Aw0RFlMFcZxdYe8DjoPeSdgBYC+h+f7DZGU4S96Rs/iZ3yqWsjRjQY6vt4M1db3f9wVw
 ixIQNUTs02e/x9PqfVqnrufowKLehecy/c9ynjJx0hprLl17lz6ysErl9LYE69F/2IA/
 IJxQ==
X-Gm-Message-State: AOAM533H3wdFPmos/H79q02DTBP/bY1qY7nPZwY+s++1Dr32O1N1dccm
 q1bLGGAeCchGQBgix64CN+bAhVq1CVds59x6ZllBwBoiuqlDzCe2aXcF8KJw411TpqFydPpiW5G
 EdKj/ggER+9L4BiE=
X-Received: by 2002:a5d:5643:: with SMTP id j3mr3770354wrw.43.1606397384463;
 Thu, 26 Nov 2020 05:29:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyxXcf4o78aXwuc+ICrLb3o92rmqToa7QBzxR1DUOUiMpHlGZimRrL57c6m2mACa/gtqgf5A==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr3770329wrw.43.1606397384238;
 Thu, 26 Nov 2020 05:29:44 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c2sm9458857wrf.68.2020.11.26.05.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:29:43 -0800 (PST)
Date: Thu, 26 Nov 2020 08:29:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Antoine Damhet <antoine.damhet@blade-group.com>
Subject: Re: [DISCUSSION] Allow ACPI default OEM ID and OEM table ID fields
 to be set.
Message-ID: <20201126082606-mutt-send-email-mst@kernel.org>
References: <20201125132711.jqb7znxu5jpoanwi@tartarus>
 <20201125133251.GI30079@redhat.com>
 <20201125110221-mutt-send-email-mst@kernel.org>
 <20201125201322.urze5b7vwaa2t5sy@tartarus>
 <20201126051838-mutt-send-email-mst@kernel.org>
 <20201126125012.x6yzsou5rmlxagli@tartarus>
MIME-Version: 1.0
In-Reply-To: <20201126125012.x6yzsou5rmlxagli@tartarus>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Nov 26, 2020 at 01:50:12PM +0100, Antoine Damhet wrote:
> On Thu, Nov 26, 2020 at 06:09:11AM -0500, Michael S. Tsirkin wrote:
> > On Wed, Nov 25, 2020 at 09:13:22PM +0100, Antoine Damhet wrote:
> > > On Wed, Nov 25, 2020 at 11:04:55AM -0500, Michael S. Tsirkin wrote:
> > > > On Wed, Nov 25, 2020 at 01:32:51PM +0000, Richard W.M. Jones wrote:
> > > > > On Wed, Nov 25, 2020 at 02:27:11PM +0100, Antoine Damhet wrote:
> 
> [...]
> 
> > > 
> > > I'm sorry I cannot give you the name of the crashing software due to a
> > > company policy. But I can tell you that if either `BOCHS ` or `BXPC` is
> > > present in any of the tables it will crash. Any (or at least the few
> > > that I threw at it) other string will work so it seems it's some kind
> > > of DRM-related hypervisor detection.
> > 
> > Hmm I'm not sure how far we want to go with this. If software vendors
> > want to detect a hypervisor there will always be a way.
> > How are we sure we are not starting an arms race here?
> 
> We can't but IMHO, as long as we stay within the specs we should be OK.
> There are far more obvious checks like the `CPUID[0x1].ECX[31]` which
> would destroy most of the PV features in a proprietary OS like Windows
> if disabled.
>
> Worst case scenario they would do timing-based detection and that would
> be insane to defeat. As for the `Shadow` virtual machines we try to
> "play" fair by exposing deterministic values (for example `Shadow` and
> `Blade` are clearly exposed in SMBIOS) and don't hide the fact that we
> are a virtual machine, so we are easy to ban if the vendor really wishes
> to.
> 
> > 
> > Also which of the IDs matter?  OEMID? OEM Table ID? Creator ID?
> 
> I just checked for the Creator ID and it also crash, my guess is that
> they dump the tables and look for `BOSH` and `BXPC` patterns anywhere.
> 
> PS: we reached-out to the software-vendor which did not acknowledge
>     banning VMs but added an entry to their FAQ saying that VMs were not
>     supported.

Exactly so I ask myself whether it's worth it, their next version
will check CPUID and then where are we?
But maybe it's time we just changed all these IDs to e.g. QEMU.
We are very far from bochs generated tables by now.
Question is will this cause annoyances with e.g. windows guests?
Igor what's your experience with this?

> 
> > 
> > 
> > > As for the uniqueness of the table IDs, I guess it would be sane to keep
> > > the same pattern (id+table sig) but allowing the first 4 bytes to be
> > > overridden.
> > > 
> > > [...]
> > 
> > It's certainly possible, it's just very specific to just this DRM scheme.
> > Not sure what's a better way to do it:
> >   qemu -acpidefault oem_id=ABCD,oem_table_id=EFGHIJKL
> > is probably going too far since then table IDs are not unique.
> > 
> > Also I'd probably use machine properties for this, the need here
> > is baroque enough that we don't want a dedicated option.
> > 
> > > 
> > > -- 
> > > Antoine 'xdbob' Damhet
> > 
> 
> -- 
> Antoine 'xdbob' Damhet


