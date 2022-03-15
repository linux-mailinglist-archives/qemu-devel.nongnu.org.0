Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EDE4D9F9C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 17:06:38 +0100 (CET)
Received: from localhost ([::1]:58110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9gr-0001l9-0i
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 12:06:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nU9ap-00070N-8P
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:00:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nU9an-0005uK-JG
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647360012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+8urCcpssMKgblYGcdR6iEniVwLaeZ1QBb13qMt/FWY=;
 b=QjQ/c1w+gGtAICsKQFdotuPtZt782edZ8SQCDzIxGar/p88OoV96r/hUt0D3ay/IYeIvh3
 W2nM2mbeeg5YwQ1bqS+Vusy9wtC3+hsUvU/STKezrcdgpIFInNKgTvcMrosT6vINqH58jx
 SgcJa5y34n0S0V6CwilgIuN2V5vXQp0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-eaUVBqVlMzKIXHiI5emXSA-1; Tue, 15 Mar 2022 12:00:11 -0400
X-MC-Unique: eaUVBqVlMzKIXHiI5emXSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAF8E3802AC5;
 Tue, 15 Mar 2022 16:00:10 +0000 (UTC)
Received: from paraplu (unknown [10.39.193.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21147400F752;
 Tue, 15 Mar 2022 16:00:08 +0000 (UTC)
Date: Tue, 15 Mar 2022 17:00:06 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 2/3] docs: rSTify MailingLists wiki; move it to QEMU Git
Message-ID: <YjC4Bmr3s96TzYTv@paraplu>
References: <20220314104943.513593-1-kchamart@redhat.com>
 <20220314104943.513593-3-kchamart@redhat.com>
 <31ae45f5-e9ce-f905-ea4f-c5d869ecc72b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <31ae45f5-e9ce-f905-ea4f-c5d869ecc72b@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 02:25:05PM +0100, Thomas Huth wrote:
> On 14/03/2022 11.49, Kashyap Chamarthy wrote:

[...]

> At least the "users" mailing list is not related to development, so maybe
> this should rather go into docs/about/ instead?

Yeah, makes sense.  I wonder if should create a new doc in docs/about/
for user-lists, as none of the existing docs fit the bill:

    build-platforms.rst  deprecated.rst  index.rst license.rst
    removed-features.rst

> Anyway:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thank you.

Related: I just sent the below patch to the list and Cced you (it hasn't
yet appeared on the archives as of this writing):

    "docs/devel: Fix broken internal link to mailing lists"

The above should be merged on top of the current patch[1] you've just
reviewed.  Otherwise Sphinx will complain (correctly so).
    

[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03488.html
    -- docs: rSTify MailingLists wiki; move it to QEMU Git



-- 
/kashyap


