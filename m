Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827F6655207
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 16:29:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8jyi-0003nP-K3; Fri, 23 Dec 2022 10:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p8jye-0003n7-7c
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 10:28:52 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p8jyc-0002TH-26
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 10:28:51 -0500
Received: from smtpclient.apple (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id 97DE0CED2D;
 Fri, 23 Dec 2022 16:28:45 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v4 00/12] Compiler warning fixes for libvhost-user,libvduse
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <c901ed54-7861-f2fa-9221-d6253ba471e1@redhat.com>
Date: Fri, 23 Dec 2022 16:28:45 +0100
Cc: qemu devel list <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, xieyongji@bytedance.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <DE29FACF-7A4B-4BE9-BF0E-7BF332F5B6C4@holtmann.org>
References: <cover.1671741278.git.marcel@holtmann.org>
 <c901ed54-7861-f2fa-9221-d6253ba471e1@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Received-SPF: pass client-ip=212.227.132.17; envelope-from=marcel@holtmann.org;
 helo=mail.holtmann.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Paolo,

>> The libvhost-user and libvduse libraries are also useful for external
>> usage outside of QEMU and thus it would be nice if their files could
>> be just copied and used. However due to different compiler settings, =
a
>> lot of manual fixups are needed. This is the first attempt at some
>> obvious fixes that can be done without any harm to the code and its
>> readability.
>> Marcel Holtmann (12):
>>   libvhost-user: Provide _GNU_SOURCE when compiling outside of QEMU
>>   libvhost-user: Replace typeof with __typeof__
>>   libvhost-user: Cast rc variable to avoid compiler warning
>>   libvhost-user: Use unsigned int i for some for-loop iterations
>>   libvhost-user: Declare uffdio_register early to make it C90 =
compliant
>>   libvhost-user: Change dev->postcopy_ufd assignment to make it C90 =
compliant
>>   libvduse: Provide _GNU_SOURCE when compiling outside of QEMU
>>   libvduse: Switch to unsigned int for inuse field in struct =
VduseVirtq
>>   libvduse: Fix assignment in vring_set_avail_event
>>   libvhost-user: Fix assignment in vring_set_avail_event
>>   libvhost-user: Add extra compiler warnings
>>   libvduse: Add extra compiler warnings
>>  subprojects/libvduse/libvduse.c           |  9 ++++--
>>  subprojects/libvduse/meson.build          |  8 ++++-
>>  subprojects/libvhost-user/libvhost-user.c | 36 =
+++++++++++++----------
>>  subprojects/libvhost-user/meson.build     |  8 ++++-
>>  4 files changed, 42 insertions(+), 19 deletions(-)
>=20
> Looks good, but what happened to "libvhost-user: Switch to unsigned =
int for inuse field in struct VuVirtq"?
>=20
> (I can pick it up from v3, no need to respin).

I found that it was already upstream and thus I removed it.

Regards

Marcel


