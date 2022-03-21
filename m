Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481644E23B6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 10:57:01 +0100 (CET)
Received: from localhost ([::1]:39134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWEmZ-0003Q4-Ra
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 05:56:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nWEku-0002ZA-CK
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:55:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nWEkr-0006pG-JJ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647856512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zec6uIXiq/kud1XCDn65FEy7CwAMeqihh5IwVf/YR5U=;
 b=LvvcrY0f+iXcXUOxa9014rFdXeNTY0ysGpQ7Mn+MPvGIGosmxoaZbHllq0NuNRkK0hDMLX
 GHTZmo8aW2dSotfGQ9pkIw2DR5s/0Up+4437Sif83OjIfVG3/VhLl+mmWK/3QmjyRRjgpi
 L9PKak+/u6Sg1SP410l7pYHWwvucljA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-97ebBUdsOZWD9s_Lknm-wg-1; Mon, 21 Mar 2022 05:55:08 -0400
X-MC-Unique: 97ebBUdsOZWD9s_Lknm-wg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ECCC185A79C;
 Mon, 21 Mar 2022 09:55:08 +0000 (UTC)
Received: from paraplu (unknown [10.39.194.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9480AC28103;
 Mon, 21 Mar 2022 09:55:07 +0000 (UTC)
Date: Mon, 21 Mar 2022 10:55:05 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 2/3] docs: rSTify MailingLists wiki; move it to QEMU Git
Message-ID: <YjhLeU8sIIMAwUK+@paraplu>
References: <20220314104943.513593-1-kchamart@redhat.com>
 <20220314104943.513593-3-kchamart@redhat.com>
 <31ae45f5-e9ce-f905-ea4f-c5d869ecc72b@redhat.com>
 <YjC4Bmr3s96TzYTv@paraplu>
 <CAFEAcA9vqS+2Tou1iK7hqmFXnvsXxABmYW9EQRjGnKKAp=k_xQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9vqS+2Tou1iK7hqmFXnvsXxABmYW9EQRjGnKKAp=k_xQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, Thomas Huth <thuth@redhat.com>, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 04:12:50PM +0000, Peter Maydell wrote:
> On Tue, 15 Mar 2022 at 16:00, Kashyap Chamarthy <kchamart@redhat.com> wrote:
> >
> > On Tue, Mar 15, 2022 at 02:25:05PM +0100, Thomas Huth wrote:
> > > On 14/03/2022 11.49, Kashyap Chamarthy wrote:
> >
> > [...]
> >
> > > At least the "users" mailing list is not related to development, so maybe
> > > this should rather go into docs/about/ instead?
> >
> > Yeah, makes sense.  I wonder if should create a new doc in docs/about/
> > for user-lists, as none of the existing docs fit the bill:
> >
> >     build-platforms.rst  deprecated.rst  index.rst license.rst
> >     removed-features.rst
> 
> Yes, I think that about/ should have a document something like
> "Contacting the project" or "Support", which could tell users about not just
> the user-facing mailing lists but also where to file bugs, and so on.
> 
> In fact, it should probably look rather like the
> https://www.qemu.org/support/ page...

Heh, thanks, I missed that page.  So, if I parsed you right, you're
implying, given the above qemu-web page, there's no need for a separate
about/support.rst doc.

-- 
/kashyap


