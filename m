Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AD9327DB1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:56:35 +0100 (CET)
Received: from localhost ([::1]:38332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhAA-0001B0-Av
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lGh7v-0006jg-V2
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:54:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lGh7u-0007q2-Ar
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:54:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614599653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Awf9s3kDlb4mB1kvGBrLIgMKQBdyqz9KiV0UafiY/+Q=;
 b=X5RlmrDs4dokWfdmSGRmAECR0sKZlRcmtaNiv4JtvnVm30Omw2ujMmRWnBk5bdv+usz9z2
 WgjuTRAwH/cRy+M7DCTjYEymfvl486rZwVczCu3eh3u4gLE6kSsq/MIuiGEATPEePFUjHn
 zBthSOvcJsTWWHTDbPSH1MFzFhW0zdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-TIStGMk_OpmQhS640TnOJQ-1; Mon, 01 Mar 2021 06:54:11 -0500
X-MC-Unique: TIStGMk_OpmQhS640TnOJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4147804023;
 Mon,  1 Mar 2021 11:54:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-165.ams2.redhat.com [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A039910013C1;
 Mon,  1 Mar 2021 11:54:01 +0000 (UTC)
Date: Mon, 1 Mar 2021 12:54:00 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 19/31] qapi/qom: QAPIfy object-add
Message-ID: <20210301115400.GF7698@merkur.fritz.box>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-20-kwolf@redhat.com>
 <e2114559-e0dd-a9bf-403c-a34874bb271d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e2114559-e0dd-a9bf-403c-a34874bb271d@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, mreitz@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.02.2021 um 12:30 hat Paolo Bonzini geschrieben:
> On 24/02/21 14:52, Kevin Wolf wrote:
> > +    v = qobject_output_visitor_new(&qobj);
> > +    visit_type_ObjectOptions(v, NULL, &options, &error_abort);
> > +    visit_complete(v, &qobj);
> > +    visit_free(v);
> > +
> > +    props = qobject_to(QDict, qobj);
> > +    qdict_del(props, "qom-type");
> > +    qdict_del(props, "id");
> > +
> > +    v = qobject_input_visitor_new(QOBJECT(props));
> > +    obj = user_creatable_add_type(ObjectType_str(options->qom_type),
> > +                                  options->id, props, v, errp);
> > +    object_unref(obj);
> 
> Please add a check in object_property_add_child that the id is well formed
> (using the id_wellformed function).  This is pre-existing, but it becomes a
> regression for -object later in the series.

Are the conditions for internally called object_property_add_child()
actually the same as for IDs specified by the user? For example, I seem
to remember some array-ish properties with [] in their name which aren't
allowed by id_wellformed().

The obvious place to affect only the external interfaces would be
user_creatable_add_type().

Kevin


