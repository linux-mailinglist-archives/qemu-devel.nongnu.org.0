Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8157241C2C6
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 12:36:37 +0200 (CEST)
Received: from localhost ([::1]:44346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWx2-00086X-0c
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 06:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVWur-0006er-3q
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 06:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVWul-0001ac-V7
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 06:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632911649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fHOIyeBbH1xixn67eSlSTKqD1GfMw31WUgMFt8N/Ns4=;
 b=EOHDGvRq25PQX4SFVNpxcp8DcGRiSsJPTiyXpVaD9KP1u3xPwC50a4Fh/1hn/DONM5MS2z
 7eKf3iQ1OYMLyIxbRUER+bY7Oq43o39gBs5GlebcN2GzBam9qvplss+o5QwC9yC+84jZ9k
 dIL62hJub6F7GKWXOVyGpdQpnyi3c5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-M8wARw_YOBGvnlFyWbuJjw-1; Wed, 29 Sep 2021 06:34:07 -0400
X-MC-Unique: M8wARw_YOBGvnlFyWbuJjw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CDED1926DA0
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 10:34:06 +0000 (UTC)
Received: from localhost (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D399460936;
 Wed, 29 Sep 2021 10:34:01 +0000 (UTC)
Date: Wed, 29 Sep 2021 11:34:01 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/1] vmx: Fix <genid/> mapping
Message-ID: <20210929103400.GJ3361@redhat.com>
References: <cover.1632900578.git.mprivozn@redhat.com>
 <20210929092044.GE3361@redhat.com> <YVQy9yiU1RPxCcM8@redhat.com>
 <20210929095719.GH3361@redhat.com> <YVQ7my3BHi1On/JK@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVQ7my3BHi1On/JK@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, Michal Privoznik <mprivozn@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 11:10:35AM +0100, Daniel P. Berrangé wrote:
> On Wed, Sep 29, 2021 at 10:57:19AM +0100, Richard W.M. Jones wrote:
> > Looking at the qemu code the problem IMHO is:
> > 
> > https://gitlab.com/qemu-project/qemu/-/blob/6b54a31bf7b403672a798b6443b1930ae6c74dea/docs/specs/vmgenid.txt#L189
> > https://gitlab.com/qemu-project/qemu/-/blob/6b54a31bf7b403672a798b6443b1930ae6c74dea/hw/acpi/vmgenid.c#L37
> > 
> > This byte swapping makes no sense to me.  How do we know that the
> > guest is little endian?  What will this code do for BE guests?  I
> > think qemu would be better off treating the "GUID" as a list of bytes
> > and writing that exactly into the guest memory.
> 
> This is an artifact of the HyperV only caring about x86 and thus leaving
> endianness unspecified in the spec for GenID. QEMU docs say
> 
> 
> Endian-ness Considerations:
> ---------------------------
> 
> Although not specified in Microsoft's document, it is assumed that the
> device is expected to use little-endian format.
> 
> All GUID passed in via command line or monitor are treated as big-endian.
> GUID values displayed via monitor are shown in big-endian format.
> 
> 
> So by extension if libvirt is passing the value from its XML straight
> to QEMU, then libvirt has effectively defined that the XML is storing
> it big-endian too.
> 
> This could be where the confusion with VMX config is coming into play,
> though the byte re-ordering in v2v seems more complex than just an
> endianess-fiddle ?

qemu's qemu_uuid_bswap function only swaps some of the fields.

I think even more that applying qemu_uuid_bswap to these (not really)
"UUIDs" is a nonsense.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


