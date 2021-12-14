Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D93F4741DD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:54:39 +0100 (CET)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx6OE-00052E-HC
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:54:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mx6MH-0003kn-F2
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mx6MF-0005sb-Lv
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:52:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639482755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=68joYVsxYgRbbC3YX0biXMKlaR8CQvKFL0poyRWQGQ0=;
 b=CdYSPVP+sMX6LVVMmgzLhcpOTsirJzjBizChWB3TTAz0UCg6xMTQcFxl5VWVvgIJgGS2Eh
 1ugDwjTRtX8hOV+bwNLfxezufgEQkriLigbFwMF5SXDx2cIXmE0og1bp+5D74MX7TO38QM
 4Bv4FRAgoPTlurZ+44DomQFOspJCECY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-gmdRfbkoNES5ePUibnHeEg-1; Tue, 14 Dec 2021 06:52:34 -0500
X-MC-Unique: gmdRfbkoNES5ePUibnHeEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E90C8015CD;
 Tue, 14 Dec 2021 11:52:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFD7A67842;
 Tue, 14 Dec 2021 11:52:31 +0000 (UTC)
Date: Tue, 14 Dec 2021 12:52:30 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 00/12] QOM/QAPI integration part 1
Message-ID: <YbiFfnsR009U+Nrd@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
 <871r365042.fsf@dusky.pond.sub.org> <YbhwrGRDs5lA7I7r@redhat.com>
 <CAFEAcA_MhWPycXs0yZtnHq1BTdYecDHR+xGo21o8ASP=hFSr1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_MhWPycXs0yZtnHq1BTdYecDHR+xGo21o8ASP=hFSr1g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.12.2021 um 11:40 hat Peter Maydell geschrieben:
> On Tue, 14 Dec 2021 at 10:26, Kevin Wolf <kwolf@redhat.com> wrote:
> > Configuration is for creating objects, properties are for runtime after
> > the creation.
> 
> Well, yes and no. In a few places we have some properties which
> are morally speaking configuration stuff, but which are runtime
> settable. This happens because the property needs to be set after
> the device is realized but before the machine is run, and we
> don't have a concept of "settable only during the machine creation
> phase", only of "settable only before realize". (I can't find an
> example of this in the codebase offhand, but I definitely have one
> in a patchset I'm working on -- the code which needs to
> configure the property of the configured object is far removed
> in both location in the codebase and point at which it runs
> from the code which is doing the initialize-and-realize.)

Yes, that's fair, but for the infrastructure it doesn't matter much what
something is "morally speaking". These things use properties at
"runtime" (i.e. after realize) today and will keep using them until we
find a different solution. I have no intention to change anything about
it in the context of QAPIfication. The only liberty I'm taking is
removing setters that can't work after realize.

Kevin


