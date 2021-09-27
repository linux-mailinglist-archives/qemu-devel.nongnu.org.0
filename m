Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA4E419220
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:21:14 +0200 (CEST)
Received: from localhost ([::1]:47490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnl3-0006TX-Mm
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mUnhK-00042I-Ef
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mUnhH-0007H3-FH
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632737838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wf+C4HhDVRes471lphYgOVBmYX8+0UP+GKC6RNTbOts=;
 b=eaZxlg6U5efUwoLLQlCcwdjtQxOXYcnbiIS3VsUEeuD8ylwUTgrSNKycEGOec/knudxbhi
 j5dVv679af+UVDedmzi/9oHNHl69aK41Q2Zq8JCWpcz/B/vSlM0yLMh4Cn+oHAykWahrSy
 SgrxTfIxsnnXLPs7xYOdkjXMc3fSPSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-K41dmNK7OKeNGEZ1BX8gcA-1; Mon, 27 Sep 2021 06:17:15 -0400
X-MC-Unique: K41dmNK7OKeNGEZ1BX8gcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA4F2835DE3;
 Mon, 27 Sep 2021 10:17:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6834D652A5;
 Mon, 27 Sep 2021 10:17:05 +0000 (UTC)
Date: Mon, 27 Sep 2021 12:17:03 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 11/11] Deprecate stable non-JSON -device and -object
Message-ID: <YVGaH1Cf8kiT11Nh@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-12-kwolf@redhat.com>
 <e2d47803-87ab-f48b-0947-70d99f3996be@redhat.com>
 <YVF/DThb+Yq8/dd1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVF/DThb+Yq8/dd1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pkrempa@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 its@irrelevant.dk, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.09.2021 um 10:21 hat Daniel P. Berrangé geschrieben:
> On Mon, Sep 27, 2021 at 10:15:43AM +0200, Paolo Bonzini wrote:
> > On 24/09/21 11:04, Kevin Wolf wrote:
> > > We want to switch both from QemuOpts to the keyval parser in the future,
> > > which results in some incompatibilities, mainly around list handling.
> > > Mark the non-JSON version of both as unstable syntax so that management
> > > tools switch to JSON and we can later make the change without breaking
> > > things.
> > 
> > Maybe we need a different section for unstable syntaxes, rather than
> > overloading deprecated.rst?
> 
> This case feels like it hits two scenarios - we want to declare it
> unstable, which is something we should document in qemu-options.hx.

Actually, I think a section for unstable syntaxes or generally
compatibility promises wouldn't hurt. When I checked, I couldn't find
any documentation about the support status of HMP either.

Basically, I imagine HMP and non-JSON -device/-object would be on the
same level: We don't change things without a reason, but if we do want
to change things, compatibility isn't an argument against making the
change.

> We want to also to warn of specific breakage when the impl changes
> which is something suitable for deprecations.

We don't do this for HMP either for individual changes.

Basically this deprecation notice was meant to make people aware that
we're lowering the support status from a long-term stable interface to
HMP-like.

Kevin


