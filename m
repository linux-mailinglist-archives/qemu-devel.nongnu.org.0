Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6446244B2BF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 19:33:53 +0100 (CET)
Received: from localhost ([::1]:35804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVwO-0002IQ-Ii
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 13:33:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkVv7-0000YJ-K6
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:32:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkVv5-0000pM-Q7
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636482751;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ny0HgQfvUJ/yekUgE1FnPr7sAT1VfRqlJvztvMWJamw=;
 b=XdYnlXsZegDb+1chzZ4xcBn/hqNO2hvWX3cHEkSSuWJONAkuC+zRAHtgMxNlIYCqFb7xCs
 EO/nufQ3wj3EWEJRt3e4t0OfyI4Jp5Sk6gXFgdqDBQJG+F9BH2hiScC0E0g1KsHeDuBm/3
 GPrdVLULyHyl6v2Ot8ILQT6ww/SEOzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-5KbWhQ3aNTmvJazIZsYw0g-1; Tue, 09 Nov 2021 13:32:28 -0500
X-MC-Unique: 5KbWhQ3aNTmvJazIZsYw0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7723C18414A2;
 Tue,  9 Nov 2021 18:32:27 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEB2360C04;
 Tue,  9 Nov 2021 18:32:25 +0000 (UTC)
Date: Tue, 9 Nov 2021 18:32:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Annie.li" <annie.li@oracle.com>
Subject: Re: Failure of hot plugging secondary virtio_blk into q35 Windows 2019
Message-ID: <YYq+tc4dxqSAjRCR@redhat.com>
References: <57170d20-635b-95fd-171e-e84de0d2d84e@oracle.com>
 <31c8012c-234f-2bb8-7db2-f7fee7bd311f@oracle.com>
 <4be352af-f3fc-0ef3-1d97-cd3eafbbb98f@oracle.com>
 <alpine.DEB.2.22.394.2111091226350.133428@anisinha-lenovo>
 <YYpE8zhRR2WWFl+j@redhat.com>
 <CAARzgww63RpHB+40q5=qzy+V2ZoJs-FF1C2WAz8TL58r2dwJ7g@mail.gmail.com>
 <YYpZOeZkzOa5dB5+@redhat.com>
 <59be6397-57f8-cd0e-2762-0a3f8b9b4a05@oracle.com>
MIME-Version: 1.0
In-Reply-To: <59be6397-57f8-cd0e-2762-0a3f8b9b4a05@oracle.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, "imammedo@redhat.com" <imammedo@redhat.com>,
 jusual@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 12:01:30PM -0500, Annie.li wrote:
> On 11/9/2021 6:19 AM, Daniel P. Berrangé wrote:
> > On Tue, Nov 09, 2021 at 04:40:10PM +0530, Ani Sinha wrote:
> > > On Tue, Nov 9, 2021 at 3:23 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > On Tue, Nov 09, 2021 at 12:41:39PM +0530, Ani Sinha wrote:
> > > > > +gerd
> > > > > 
> > > > > On Mon, 8 Nov 2021, Annie.li wrote:
> > > > > 
> > > > > > Update:
> > > > > > 
> > > > > > I've tested q35 guest w/o OVMF, the APCI PCI hot-plugging works well in q35
> > > > > > guest. Seems this issue only happens in q35 guest w/ OVMF.
> > > > > > 
> > > > > > Looks that there is already a bug filed against this hotplug issue in q35
> > > > > > guest w/ OVMF,
> > > > > > 
> > > > > > https://urldefense.com/v3/__https://bugzilla.redhat.com/show_bug.cgi?id=2004829__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ8E_c_jRg$
> > > > > > 
> > > > > > In this bug, it is recommended to add "-global
> > > > > > ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off \" on qemu command for 6.1.
> > > > > > However, with this option for 6.1(PCIe native hotplug), there still are kinds
> > > > > > of issues. For example, one of them is the deleted virtio_blk device still
> > > > > > shows in the Device Manager in Windows q35 guest, the operation of re-scanning
> > > > > > new hardware takes forever there. This means both PCIe native hotplug and ACPI
> > > > > > hotplug all have issues in q35 guests.
> > > > > This is sad.
> > > > > 
> > > > > > Per comments in this bug, changes in both OVMF and QEMU are necessary to
> > > > > > support ACPI hot plug in q35 guest. The fixes may likely be available in QEMU
> > > > > > 6.2.0.
> > > > > So we are in soft code freeze for 6.2:
> > > > > https://urldefense.com/v3/__https://wiki.qemu.org/Planning/6.2__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ_pKO8AzA$
> > > > > 
> > > > > I am curious about Gerd's comment #10:
> > > > > "The 6.2 rebase should make hotplug work
> > > > > again with the default configuration."
> > > > > 
> > > > > Sadly I have not seen any public discussion on what we want to do
> > > > > for the issues with acpi hotplug for bridges in q35.
> > > > I've raised one of the problems a week ago and there's a promised
> > > > fix
> > > > 
> > > >   https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00558.html__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ-np8GcUA$
> > > So https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/issues/641__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ86xk2gtg$  is the same as
> > > https://urldefense.com/v3/__https://bugzilla.redhat.com/show_bug.cgi?id=2006409__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ9crT9JKw$
> > > 
> > > isn't it?
> > Yes, one upstream, one downstream.
> 
> Thanks for the info.
> 
> So q35 guests with either OVMF or SeaBIOS have different ACPI hotplug issues
> in QEMU 6.1.
> 
> As Ani mentioned earlier, QEMU 6.2 is in soft code freeze.
> Today(Nov 9) is the date of hard feature freeze.
> 
> I suppose this means the fix for the issue with SeaBIOS or the feature to
> cooperate
> with the coming change in OVMF won't happen in 6.2?

Patches are allowed if they're bug fixes. If a change requires coordination
with an OVMF change too though, I think that's going to be difficult to
justify. 

Our fallback option is to revert to native hotplug out of the box for
QEMU machine types in 6.2

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


