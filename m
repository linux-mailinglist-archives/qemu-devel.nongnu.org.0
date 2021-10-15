Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E941042F239
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 15:27:29 +0200 (CEST)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbNFA-0002zC-NC
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 09:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mbNCd-0001B0-R0
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:24:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mbNCb-0000Be-Sq
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634304288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xih+eGw6UJHk9DZRM+1m7AD7NQBhaZd3eJvIqEibF2g=;
 b=fzCNxwWvDMOaLCfyOtXeiINBYP+bn589zRj3E8Zp4ggOHPxYmRcyTjilbyGaKXxDGmKyEO
 8c0TbwR1Co20C0SU/uhaCHz29YW2ElR/9EhxCijjzi4MBXgK36SvuW9+QG5cQamEGET/B7
 4Fva0ehrf+A9hpcT/N81FbNYb+SQgaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-zdiysXtxNOelK6DBoGD11g-1; Fri, 15 Oct 2021 09:24:45 -0400
X-MC-Unique: zdiysXtxNOelK6DBoGD11g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02F6F100C611;
 Fri, 15 Oct 2021 13:24:44 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95F2B5C1A3;
 Fri, 15 Oct 2021 13:24:30 +0000 (UTC)
Date: Fri, 15 Oct 2021 15:24:27 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 00/15] qdev: Add JSON -device
Message-ID: <YWmBC3HCDltX7YZr@angien.pipo.sk>
References: <20211008133442.141332-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211008133442.141332-1-kwolf@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: damien.hedde@greensocs.com, lvivier@redhat.com, vsementsov@virtuozzo.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 its@irrelevant.dk, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 08, 2021 at 15:34:27 +0200, Kevin Wolf wrote:
> It's still a long way until we'll have QAPIfied devices, but there are
> some improvements that we can already make now to make the future switch
> easier.
> 
> One important part of this is having code paths without QemuOpts, which
> we want to get rid of and replace with the keyval parser in the long
> run. This series adds support for JSON syntax to -device, which bypasses
> QemuOpts.
> 
> While we're not using QAPI yet, devices are based on QOM, so we already
> do have type checks and an implied schema. JSON syntax supported now can
> be supported by QAPI later and regarding command line compatibility,
> actually switching to it becomes an implementation detail this way (of
> course, it will still add valuable user-visible features like
> introspection and documentation).
> 
> Apart from making things more future proof, this also immediately adds
> a way to do non-scalar properties on the command line. nvme could have
> used list support recently, and the lack of it in -device led to some
> rather unnatural solution in the first version (doing the relationship
> between a device and objects backwards) and loss of features in the
> following. With this series, using a list as a device property should be
> possible without any weird tricks.
> 
> Unfortunately, even QMP device_add goes through QemuOpts before this
> series, which destroys any type safety QOM provides and also can't
> support non-scalar properties. This is a bug, but it turns out that
> libvirt actually relies on it and passes only strings for everything.
> So this series still leaves device_add alone until libvirt is fixed.

I've tested hotplug and standard -device with many (not all) devices
libvirt uses and seems that both '-device JSON' and monitor work
properly.

I'll enable '-device JSON' in libvirt once this hits upstream.

> 
> v2:
> - Drop type safe QMP device_add because libvirt gets it wrong, too

I've actually applied this patch too to make sure that libvirt is
working properly in both modes. It works now well with this too.

I'm not sure about the compatibility promise here, but libvirt is now
prepared even for teh strict version of 'device_add'. Libvirt's
requirements state that new libvirt needs to be used with new qemu and
thus from our view it's okay to do it even now.

> - More network patches to eliminate dependencies on the legacy QemuOpts
>   data structures which would not contain all devices any more after
>   this series. Fix some bugs there as a side effect.
> - Remove an unnecessary use of ERRP_GUARD()
> - Replaced error handling patch for qdev_set_id() with Damien's
> - Drop the deprecation patch until libvirt uses the new JSON syntax

Series:

Tested-by: Peter Krempa <pkrempa@redhat.com>


