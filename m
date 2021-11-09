Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5079B44B106
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:18:42 +0100 (CET)
Received: from localhost ([::1]:48608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkTpZ-0004cF-GT
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:18:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkTno-0003s0-Tv
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:16:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkTnm-0002r0-0w
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:16:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636474604;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHjzmRWFP9B8AarsxvUzZSPveSie7EYo1oOFHygE0Dw=;
 b=KqvSrqC38xX0Dkl9h0bj1aJpEVvA8Je8IzzNXuHkX3dwoPPpAsOqtCfB6TkmbmMfZXU3xf
 GdOBr1w3f9rkHciEwXde7wtl7RwEvMQE27hPof5ZAYx4ADX4s38B7n8mk4NQNZEu9huHjY
 wuZI4VdryZijM8f/ukuBDxnn7l9q2Uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-u7nNGpKENvqTXcCvDuSyFw-1; Tue, 09 Nov 2021 11:16:41 -0500
X-MC-Unique: u7nNGpKENvqTXcCvDuSyFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14011BBEE0;
 Tue,  9 Nov 2021 16:16:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 989475C1C5;
 Tue,  9 Nov 2021 16:16:37 +0000 (UTC)
Date: Tue, 9 Nov 2021 16:16:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 3/3] tests: acpi: Add updated TPM related tables
Message-ID: <YYqe4o9b+mHzwz0r@redhat.com>
References: <20211109140152.3310657-1-stefanb@linux.ibm.com>
 <20211109140152.3310657-4-stefanb@linux.ibm.com>
 <20211109091338-mutt-send-email-mst@kernel.org>
 <YYqFxgu74BIh0ZjB@redhat.com>
 <20211109110331-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211109110331-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 11:05:28AM -0500, Michael S. Tsirkin wrote:
> On Tue, Nov 09, 2021 at 02:29:26PM +0000, Daniel P. Berrangé wrote:
> > On Tue, Nov 09, 2021 at 09:14:25AM -0500, Michael S. Tsirkin wrote:
> > > On Tue, Nov 09, 2021 at 09:01:52AM -0500, Stefan Berger wrote:
> > > > The updated TPM related tables have the following additions:
> > > > 
> > > >    Device (TPM)
> > > >    {
> > > >        Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
> > > > +      Name (_STR, "TPM 2.0 Device")  // _STR: Description String
> > > > +      Name (_UID, One)  // _UID: Unique ID
> > > >        Name (_STA, 0x0F)  // _STA: Status
> > > >        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > > > 
> > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > > Cc: Ani Sinha <ani@anisinha.ca>
> > > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > > ---
> > > >  tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 0 -> 8900 bytes
> > > >  tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 0 -> 8921 bytes
> > > >  tests/data/acpi/q35/TCPA.tis.tpm12          | Bin 0 -> 50 bytes
> > > >  tests/data/acpi/q35/TPM2.tis.tpm2           | Bin 0 -> 76 bytes
> > > >  tests/qtest/bios-tables-test-allowed-diff.h |  11 -----------
> > > >  5 files changed, 11 deletions(-)
> > > 
> > > A disadvantage to doing it like this is that git thinks
> > > it's ok to replace any empty file with this, so if acpi
> > > changed in any way git will happily resolve it
> > > replacing it with this version.
> > 
> > Do we actually need to be storing these binary files in git
> > at all ?
> > 
> > IIUC, the test will do two things
> > 
> >  - memcmp the expected binary we store, against the new binary
> >    we generated.
> >  - if they differ, then disassemble both and report the
> >    differences in a user friendly-ish way
> 
> Second if iasl is installed.
> 
> > What if we only stored the sha256 checksum of the binary
> 
> Hmm, point being? Same some space?
> 
> > *and*
> > the dissasembled output in git, never the full binary.
> 
> We used to. The issue is that dissasembled output depends
> very much on the disassembler. Disassembling both
> with the same tool is one way to address this.

Oh, so new isal releases can change the format, that's
annoying :-(

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


