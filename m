Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FC62517CC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 13:39:25 +0200 (CEST)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAXIS-0008L1-T5
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 07:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kAXHC-0007f7-0D
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 07:38:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kAXHA-0008OF-Cz
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 07:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598355483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nKrTSGiR9FnqPfwm0xQx2ANu4eIpb4+xkx0FXSzzRYs=;
 b=cpF19EYhNBZDiHng+Nrpey/3HgGsUdzKl14c8BJVigu4hBEUWhKnC/b2eGm6QqlUa/DbmQ
 fJAFr8K48iWLGFqEM+tJYyTjjqzZqc2LBr/8WSWnASoGXkDjRTHu6hwbECp15M/KNT+hc+
 19DUYQtdNKso7szNzeb6QGvW/3LNG58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-OwJPyH-2MtGuykto8cVf-Q-1; Tue, 25 Aug 2020 07:37:58 -0400
X-MC-Unique: OwJPyH-2MtGuykto8cVf-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCF12100746C;
 Tue, 25 Aug 2020 11:37:57 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-220.ams2.redhat.com [10.36.114.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FF032B3A1;
 Tue, 25 Aug 2020 11:37:56 +0000 (UTC)
Date: Tue, 25 Aug 2020 13:37:54 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Nir Soffer <nirsof@gmail.com>
Subject: Re: [PATCH v2 0/5] iotest.FilePath fixes and cleanups
Message-ID: <20200825113754.GB5500@linux.fritz.box>
References: <20200820235427.374645-1-nsoffer@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200820235427.374645-1-nsoffer@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 06:38:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21.08.2020 um 01:54 hat Nir Soffer geschrieben:
> Fix some issues introduced when iotests.FilePaths was added and merge it back
> into FilePath keeping the option to create multiple file names.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


