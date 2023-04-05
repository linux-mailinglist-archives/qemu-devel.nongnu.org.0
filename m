Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F136D82BC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 17:55:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5St-00007n-Nl; Wed, 05 Apr 2023 11:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pk5Sr-00006q-58
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pk5Sp-0007wp-K9
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680710062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/VGSJSEBBQClVeqL21/CdBFRFob2gVXzaA7NBZgVFdk=;
 b=iDPitA9aNRTxqjMbU+O5nLfLcQowSPz34GA+ViY+P/8NFrWy3pyhZ1EynattqGglwyVipu
 mdqtK4P70ka6M0GratPteL+a8Amvi/fdOBPGmwZhrkp1FIJ+GRDTJWPeYq+jNFWOrpo/Zr
 t64FoArEM9lNqwryERKbF+t2z00k3GU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-6pZvoYWKPtqJ90dUKdmh0Q-1; Wed, 05 Apr 2023 11:54:18 -0400
X-MC-Unique: 6pZvoYWKPtqJ90dUKdmh0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 663F388B767;
 Wed,  5 Apr 2023 15:54:18 +0000 (UTC)
Received: from localhost (unknown [10.39.194.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15B752027061;
 Wed,  5 Apr 2023 15:54:17 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: David Turner <digit@google.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/2] Add missing Linux kernel headers.
In-Reply-To: <CACnJMqrf-YH6P0zBC4FSSp_LcO=pxDOrx-P3MGGFDj_uWbWjvg@mail.gmail.com>
Organization: Red Hat GmbH
References: <20230405125920.2951721-1-digit@google.com>
 <20230405125920.2951721-3-digit@google.com> <87h6tuqy0f.fsf@redhat.com>
 <CACnJMqrf-YH6P0zBC4FSSp_LcO=pxDOrx-P3MGGFDj_uWbWjvg@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 05 Apr 2023 17:54:16 +0200
Message-ID: <87mt3mxr2v.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, Apr 05 2023, David Turner <digit@google.com> wrote:

> On Wed, Apr 5, 2023 at 3:06=E2=80=AFPM Cornelia Huck <cohuck@redhat.com> =
wrote:
>
>> On Wed, Apr 05 2023, "David 'Digit' Turner" <digit@google.com> wrote:
>> > The script has then been run against the official
>> > 6.2.8 kernel source tree (current stable release),
>> > which explains why comments in <linux/vfio.h>
>> > have been updated too.
>>
>> I think we usually run the script against a release or release
>> candidate, not stable.
>>
>> I meant that this was run against the headers of the 6.2.8 official
> release, which was listed as "stable" on https://kernel.org/ (that page n=
ow
> lists the 6.2.9 release btw)
> I'd be happy to re-run it against a different set if you can tell me which
> one (and where to get it, just in case).

I think most people actually run it against a checkout of Linus' git
tree, preferrably either the latest -rc version (or the latest release
during the kernel merge window) -- people usually run the script because
they want to use some new interfaces that were recently introduced to
the kernel. (This also ensures linear history, although I don't think
that's too much of a problem.)

Just make sure you note the exact version (or git hash), then it's
fine. Might also be worth splitting this into adding the new files to
the script and actually updating the headers.


