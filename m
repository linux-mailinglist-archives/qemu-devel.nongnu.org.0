Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9322A44320F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:53:20 +0100 (CET)
Received: from localhost ([::1]:37022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhw6B-0003xG-L9
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mhw4R-0002gP-1j
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:51:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mhw4O-0005KP-4w
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635868286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qIni/00QLB2Ktz8yC1P+kRmHBtTMaJzYcZfRZLIIFXY=;
 b=YGFEmOOddtKmHgmstR1qzZyOKM+jhm2g99P7FX7AvhdpBefx5PeaE78CA7+R88tXg4iXda
 CdW+oEiBYg6LW5pkTb3niHv3K0IHBFpYgkAXeQbdky9qoYl65KNOb+0JOY7vRtj5UfUcIU
 aptd8Rt7XmbY/JS3SZ5y0xcda/KdKnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-HXGsE5qhPRafhordIKlJUw-1; Tue, 02 Nov 2021 11:51:23 -0400
X-MC-Unique: HXGsE5qhPRafhordIKlJUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46A00100CD1C;
 Tue,  2 Nov 2021 15:51:22 +0000 (UTC)
Received: from paraplu (unknown [10.39.195.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCBFC67849;
 Tue,  2 Nov 2021 15:51:11 +0000 (UTC)
Date: Tue, 2 Nov 2021 16:51:08 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 0/6] rSTify contribution-related wiki pages
Message-ID: <YYFebObSyo6itE/R@paraplu>
References: <20211019090344.3054300-1-kchamart@redhat.com>
 <CAFEAcA8CHVfAXFaQwfZrQUfJcD9qQNOYAEt9vvpQVtgwtTf80w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8CHVfAXFaQwfZrQUfJcD9qQNOYAEt9vvpQVtgwtTf80w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Laurent Vivier <Laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 01, 2021 at 02:56:43PM +0000, Peter Maydell wrote:
> On Tue, 19 Oct 2021 at 10:04, Kashyap Chamarthy <kchamart@redhat.com> wrote:
> >
> > My main motivation was to convert SubmitAPatch[1] based on a chat with
> > Peter Maydell and Dan Berrang� on #qemu channel (on OFTC).  But the page
> > also links to a couple of other contribution-related pages, so I
> > converted them too:
> >
> >   - SubmitAPullRequest: https://wiki.qemu.org/Contribute/SubmitAPullRequest
> >   - KeySigningParty: https://wiki.qemu.org/KeySigningParty
> >   - SpellCheck: https://wiki.qemu.org/Contribute/SpellCheck
> >   - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches
> 
> I'm not sure that SpellCheck in particular is sufficiently baked
> to be in the actual docs. I'd rather just drop the reference to it
> from SubmitAPatch. 

Sure, will drop.

> KeySigningParty I'm on the fence about.

This is linked only from the SubmitAPullRequest page.  If we're
ambivalent about it, I'll just keep it in for reference.

I'll also fix the index-updating part you caught in your other review.

Thanks for the review.

-- 
/kashyap


