Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E263323A0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:07:54 +0100 (CET)
Received: from localhost ([::1]:60834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaDR-00020H-N2
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJaBV-0008Qp-M5
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:05:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJaBU-0000nl-5c
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:05:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615287950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rtubUEKkJMl2kjRgMftOcLyMqIxNfEzBh+dmAXaBf6k=;
 b=X8XQ8FdZ5yvcFBzVjwCYQS5RvKi6FdxgyWbvFdMufoMR+0jm46s4SlsVHtwj7RkF0doF4X
 1i9vK2EQXSZhNmEgyLPtGDtSN16FBFL4W0PloxwutdRlkAPOh/f3sWke/bc61jQZYjIofU
 rkTnRJnj/JJluGPaVzateARzkk3EaN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-kVoOk7E0PJKjn420JOZc7w-1; Tue, 09 Mar 2021 06:05:49 -0500
X-MC-Unique: kVoOk7E0PJKjn420JOZc7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26CA01074644;
 Tue,  9 Mar 2021 11:05:48 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-169.ams2.redhat.com [10.36.114.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D49A60C04;
 Tue,  9 Mar 2021 11:05:47 +0000 (UTC)
Date: Tue, 9 Mar 2021 12:05:45 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] block: remove format defaults from QemuOpts in
 bdrv_create_file()
Message-ID: <20210309110545.GC5798@merkur.fritz.box>
References: <20210308161232.248833-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210308161232.248833-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.03.2021 um 17:12 hat Stefano Garzarella geschrieben:
> QemuOpts is usually created merging the QemuOptsList of format
> and protocol. So, when the format calls bdr_create_file(), the 'opts'
> parameter contains a QemuOptsList with a combination of format and
> protocol default values.
> 
> The format properly removes its options before calling
> bdr_create_file(), but the default values remain in 'opts->list'.
> So if the protocol has options with the same name (e.g. rbd has
> 'cluster_size' as qcow2), it will see the default values of the format,
> since for overlapping options, the format wins.
> 
> To avoid this issue, lets convert QemuOpts to QDict, in this way we take
> only the set options, and then convert it back to QemuOpts, using the
> 'create_opts' of the protocol. So the new QemuOpts, will contain only the
> protocol defaults.
> 
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks, applied to the block branch.

Kevin


