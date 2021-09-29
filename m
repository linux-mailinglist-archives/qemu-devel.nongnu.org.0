Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7245E41C2B7
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 12:29:37 +0200 (CEST)
Received: from localhost ([::1]:40184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWqG-0004u8-IU
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 06:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVWlt-0002Xa-Hx
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 06:25:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVWlo-0002D7-Io
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 06:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632911099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oRTXE+Sxi2u8+R1mDVEc8idxq9wXswoMHeVWbEWbOBA=;
 b=Q15LNclZd2yiZ9ijzU5wnJtvxBgz2aM6EwX6A7+sFt4Daq3+Z+b8RIBlGNsCDS4IqRaHx/
 qGFJq43GfOKCNNaqOFxUPu9UeumbM+cVtZo3lRKxdEuw+Zs6i2BQe3EvsRN1C/C5DJCzzh
 OkG2NWQKKURU3EhKUkRX/e5OqAC5raE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-AyOdhSMiNK-a9vfW2qK4vA-1; Wed, 29 Sep 2021 06:24:55 -0400
X-MC-Unique: AyOdhSMiNK-a9vfW2qK4vA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D05C71006AA4;
 Wed, 29 Sep 2021 10:24:54 +0000 (UTC)
Received: from localhost (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B0BA77E26;
 Wed, 29 Sep 2021 10:24:39 +0000 (UTC)
Date: Wed, 29 Sep 2021 11:24:38 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/1] vmx: Fix <genid/> mapping
Message-ID: <20210929102438.GK7596@redhat.com>
References: <cover.1632900578.git.mprivozn@redhat.com>
 <20210929092044.GE3361@redhat.com> <YVQy9yiU1RPxCcM8@redhat.com>
 <20210929094638.GF3361@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210929094638.GF3361@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
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
Cc: libvir-list@redhat.com, Michal Privoznik <mprivozn@redhat.com>, "Catangiu,
 Adrian Costin" <acatan@amazon.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 10:46:38AM +0100, Richard W.M. Jones wrote:
> I don't know why we decided to use a GUID for this.  The feature
> itself (https://go.microsoft.com/fwlink/?LinkId=260709) defines it as
> an 128 bit / 8 byte number.  The only connection to GUIDs is the size.

*cough* .. 16 bytes :-)

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


