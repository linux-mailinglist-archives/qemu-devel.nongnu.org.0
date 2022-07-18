Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B45577F2F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:01:37 +0200 (CEST)
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDNZI-0001Sh-JY
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oDNWe-0006zo-Rl
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oDNWd-0004Y8-8X
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:58:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658138330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8RC28/19rL8+Sf+1qwBzTWLMUHeGZguk4g6w8ww5xXQ=;
 b=Sd3fOLoeBAC3LgJUmx8fEVRtgSkXSNonGCKmtNER/k4C5p/6zoiJLeLZBrLPGQarK4/j7r
 PltOJBM9wUZln1Z29IiCHDAOJBweLWEGWjYQlGdZATRA/OMSSLVHEey/YnuzHM9vBJWeG7
 C94Tj8t2GXm25l22M1jOr/d9GPKAhrQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-dZEHY1DtMWuB0dZvFhVxBQ-1; Mon, 18 Jul 2022 05:58:46 -0400
X-MC-Unique: dZEHY1DtMWuB0dZvFhVxBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D432985A584;
 Mon, 18 Jul 2022 09:58:45 +0000 (UTC)
Received: from localhost (unknown [10.39.193.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 897D12166B26;
 Mon, 18 Jul 2022 09:58:45 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, David Hildenbrand
 <david@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/3] target: RFC: display deprecation note for '-cpu help'
In-Reply-To: <YtUr2qG9r0zfyY2J@redhat.com>
Organization: Red Hat GmbH
References: <20220714150735.1835166-1-berrange@redhat.com>
 <30e66f70-a004-6789-d66a-351becaa48e2@redhat.com>
 <87wncapxr4.fsf@redhat.com> <YtUr2qG9r0zfyY2J@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Mon, 18 Jul 2022 11:58:44 +0200
Message-ID: <87tu7epwrv.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 18 2022, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Jul 18, 2022 at 11:37:35AM +0200, Cornelia Huck wrote:
>> Is it easy enough the figure out the deprecation note? I think you
>> either have to actually start something with the deprecated entity, or
>> use qmp (which is not that straightforward)?
>
> QMP doesn't tell you the note, just a boolean deprecation flag. It is
> only printed on startup only right now.
>
> In the context of libvirt what happens is that libvirt can report that
> something is deprecated (based on the QMP response). If you go ahead
> and use it anyway, you'll get the deprecation message in the logfile
> for the VM, and the VM gets marked tainted by libvirt, which serves
> as a guide to look in the logfile.

Hm... so, a user who notes via -help that 'foo' is deprecated does not
really have a good way to figure out what they should use instead, other
than actually trying to use 'foo'? Is that a use case worth spending
some effort on, or do we consider it more of a niche case?


