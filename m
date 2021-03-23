Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E8A346944
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:43:14 +0100 (CET)
Received: from localhost ([::1]:44618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmvp-0003YQ-DX
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOmtL-00010h-If
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOmtH-00009Z-DS
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616528434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n4pHlAIibjp1zFAOBP4I9AJ/qXyvtEmbnQ5i0mb1GnE=;
 b=Qic3fKut2uk7w2IBK5iFlK9LbBMI1kpqxjZXNCgWubH3o0+IdPCmJet6gDzx/cPqoIpw12
 wL073S4LVHf+Gqxap1CmDdbRLvXoro44ApgH1QEdn/DkgAfraPJ16mH0Ycriqnx40AXKyl
 WBIkf5azne7rOaHwE7U2gA0LPwpSXPU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-147LAU4NN46gtpg8Jw6WKQ-1; Tue, 23 Mar 2021 15:40:29 -0400
X-MC-Unique: 147LAU4NN46gtpg8Jw6WKQ-1
Received: by mail-wr1-f70.google.com with SMTP id z17so1566777wrv.23
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 12:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=n4pHlAIibjp1zFAOBP4I9AJ/qXyvtEmbnQ5i0mb1GnE=;
 b=QnN0uN2L/5PtEM+oRzouk9ou5nP+lBQj+sMgcDEBR1i7nVcm3c7XKyxE+Lqb6yfWc8
 RN5bc61e8mXnBHxjn6cZTvxUalpRoB/U4BeFGpSraEQFEQrn+qZd3cURF9DVnBNnbMs/
 AgpmkZ8wrEE+kvE90sWtzmIxaeGsOZF6X/F5iW39s+5pBKcU7/45Hv9WUUJAz0VLbqyk
 Mg/cxwuKkYKkY5zrGW9EklpqVxPYE6xR0cL6eEV5tx0WQblg17/XWse2HGDFFEfbiugr
 VzE5GRTBeL3NTdRFrXB/9UEa42XhvyGvQNfVP6XCdZRG+Rav+D4Wriv2DuiBOmQ1W+2m
 gmRg==
X-Gm-Message-State: AOAM532AbMRyunb0w7bhGc3637wqii99h1mOMC1n0WDAc4uI2Oko6iKg
 oZH2zpDc3+e18OpOTqrkhsWjlTBmB9qUPOcSUppzXImbnUc4ZMvupdWy8OWMzHHNNjyJyyDsaCu
 rDM/ohV2biKJOQII=
X-Received: by 2002:a05:600c:290a:: with SMTP id
 i10mr4815233wmd.91.1616528427853; 
 Tue, 23 Mar 2021 12:40:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZmnHl5I50nh5U/M86UAt+H6BSGQDDJKPp+2ZagFMEDw3AEOlADO/7Gyb5UkPJqNPq1L6cQg==
X-Received: by 2002:a05:600c:290a:: with SMTP id
 i10mr4815217wmd.91.1616528427584; 
 Tue, 23 Mar 2021 12:40:27 -0700 (PDT)
Received: from redhat.com (bzq-79-183-252-180.red.bezeqint.net.
 [79.183.252.180])
 by smtp.gmail.com with ESMTPSA id b15sm13627806wrx.73.2021.03.23.12.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 12:40:27 -0700 (PDT)
Date: Tue, 23 Mar 2021 15:40:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Ways to deal with broken machine types
Message-ID: <20210323153730-mutt-send-email-mst@kernel.org>
References: <20210301195919.9333-1-cheptsov@ispras.ru>
 <20210322114116-mutt-send-email-mst@kernel.org>
 <B813DBC6-B989-4630-B2DE-8F5825484E78@ispras.ru>
 <20210323104542-mutt-send-email-mst@kernel.org>
 <71AD039B-775A-4DF3-B16D-4BC3768A20AC@ispras.ru>
 <a1a1b783-6217-cb22-0dd8-fab9b7971542@proxmox.com>
 <20210323175447.0c57d2a4@redhat.com> <YFooFMWxwpiSB6ZJ@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YFooFMWxwpiSB6ZJ@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 qemu devel list <qemu-devel@nongnu.org>, Vitaly Cheptsov <cheptsov@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 05:40:36PM +0000, Daniel P. Berrangé wrote:
> On Tue, Mar 23, 2021 at 05:54:47PM +0100, Igor Mammedov wrote:
> > Let me hijack this thread for beyond this case scope.
> > 
> > I agree that for this particular bug we've done all we could, but
> > there is broader issue to discuss here.
> > 
> > We have machine versions to deal with hw compatibility issues and that covers most of the cases,
> > but occasionally we notice problem well after release(s),
> > so users may be stuck with broken VM and need to manually fix configuration (and/or VM).
> > Figuring out what's wrong and how to fix it is far from trivial. So lets discuss if we
> > can help to ease this pain, yes it will be late for first victims but it's still
> > better than never.
> 
> To summarize the problem situation
> 
>  - We rely on a machine type version to encode a precise guest ABI.
>  - Due a bug, we are in a situation where the same machine type
>    encodes two distinct guest ABIs due to a mistake introduced
>    betwen QEMU N-2 and N-1
>  - We want to fix the bug in QEMU N
>  - For incoming migration there is no way to distinguish between
>    the ABIs used in N-2 and N-1, to pick the right one


Not just incoming migration. Same applies to a guest restart.


> So we're left with an unwinnable problem:
> 
>   - Not fixing the bug =>
> 
>        a) user migrating N-2 to N-1 have ABI change
>        b) user migrating N-2 to N have ABI change
>        c) user migrating N-1 to N are fine
> 
>     No mitigation for (a) or (b)
> 
>   - Fixing the bug =>
> 
>        a) user migrating N-2 to N-1 have ABI change.
>        b) user migrating N-2 to N are fine
>        c) user migrating N-1 to N have ABI change
> 
>     Bad situations (a) and (c) are mitigated by
>     backporting fix to N-1-stable too.
> 
> Generally we have preferred to fix the bug, because we have
> usually identified them fairly quickly after release, and
> backporting the fix to stable has been sufficient mitigation
> against ill effects. Basically the people left broken are a
> relatively small set out of the total userbase.
> 
> The real challenge arises when we are slow to identify the
> problem, such that we have a large number of people impacted.
> 
> 
> > I'll try to sum up idea Michael suggested (here comes my unorganized brain-dump),
> > 
> > 1. We can keep in VM's config QEMU version it was created on
> >    and as minimum warn user with a pointer to known issues if version in
> >    config mismatches version of actually used QEMU, with a knob to silence
> >    it for particular mismatch.
> > 
> > When an issue becomes know and resolved we know for sure how and what
> > changed and embed instructions on what options to use for fixing up VM's
> > config to preserve old HW config depending on QEMU version VM was installed on.
> 
> > some more ideas:
> >    2. let mgmt layer to keep fixup list and apply them to config if available
> >        (user would need to upgrade mgmt or update fixup list somehow)
> >    3. let mgmt layer to pass VM's QEMU version to currently used QEMU, so
> >       that QEMU could maintain and apply fixups based on QEMU version + machine type.
> >       The user will have to upgrade to newer QEMU to get/use new fixups.
> 
> The nice thing about machine type versioning is that we are treating the
> versions as opaque strings which represent a specific ABI, regardless of
> the QEMU version. This means that even if distros backport fixes for bugs
> or even new features, the machine type compatibility check remains a
> simple equality comparsion.
> 
> As soon as you introduce the QEMU version though, we have created a
> large matrix for compatibility.


Yes but. If we explicitly handle them all the same then
mechanically testing them all is an overkill.
We just need to test the ones that have bugs which we
care about fixing.


> This matrix is expanded if a distro
> chooses to backport fixes for any of the machine type bugs to their
> stable streams. This can get particularly expensive when there are
> multiple streams a distro is maintaining.
> 
> *IF* the original N-1 qemu has a property that could be queried by
> the mgmt app to identify a machine type bug, then we could potentially
> apply a fixup automatically.
> 
> eg query-machines command in QEMU version N could report against
> "pc-i440fx-5.0", that there was a regression fix that has to be
> applied if property "foo" had value "bar".
> 
> Now, the mgmt app wants to migrate from QEMU N-2 or N-1 to QEMU N.
> It can query the value of "foo" on the source QEMU with qom-get.
> It now knows whether it has to override this property "foo" when
> spawning QEMU N on the target host.
> 
> Of course this doesn't help us if neither N-1 or N-2 QEMU had a
> property that can be queried to identify the bug - ie if the
> property in question was newly introduced in QEMU N to fix the
> bug.
> 
> > In my opinion both would lead to explosion of 'possibly needed' properties for each
> > change we introduce in hw/firmware(read ACPI) and very possibly a lot of conditional
> > branches in QEMU code. And I'm afraid it will become hard to maintain QEMU =>
> > more bugs in future.
> > Also it will lead to explosion of test matrix for downstreams who care about testing.
> > 
> > If we proactively gate changes on properties, we can just update fixup lists in mgmt,
> > without need to update QEMU (aka Insite rules) at a cost of complexity on QMEU side.
> > 
> > Alternatively we can be conservative in spawning new properties, that means creating
> > them only when issue is fixed and require users to update QEMU, so that fixups could
> > be applied to VM.
> > 
> > Feel free to shoot the messenger down or suggest ways how we can deal with the problem.
> 
> The best solution is of course to not have introduced the ABI change in
> the first place. We have lots of testing, but upstream at least, I don't
> think we have anything that is explicitly recording the ABI associated
> with each machine type and validating that it hasn't changed. We rely on
> the developers to follow the coding practices wrt setting machine type
> defaults for back compat, and while we're good, we inevitably screw up
> every now & then.
> 
> Downstreams do have some of this ABI testing - several problems like the
> one we have there, have been identified when RHEL downstream QE did
> migration tests and found a change in RHEL machine types, which then
> was traced back to upstream.
> 
> I feel like we need some standard tool which can be run inside a VM
> that dumps all the possible ABI relevant information about the virtual
> machine in a nice data format.
> 
> We would have to run this for each machine type, and save the
> results to git immediately after release. Then for every change to
> master, we would have to run the test again for every historic
> machine type version and compare to the recorded ABI record.
> 
> Regards,
> Daniel


Unfortunately I do not think this is practical :(.

All examples of breakage I am aware of, we did not
realise some part of interface was part of guest ABI
and unsafe to change. We simply would not know to write a
test for it.

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


