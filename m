Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558B94D9C8C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:43:42 +0100 (CET)
Received: from localhost ([::1]:33716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU7Sf-0000pb-3x
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:43:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nU7RW-0008TP-SX
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:42:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nU7RU-0007yH-4h
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:42:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647351746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ODZiqNsjlScHZFeFdYkGglCO3I7dGKpj5/r4DC6m/qs=;
 b=CK5KrBKrOY02HS1nhDsb9/B46doSkNHgQpN2m51f2ertwiDppZDNz/m+Z6knp4lquo/P3m
 9tOzV4XRBMyPbXuAdjq4S+YwvPO21Qn9jACadT3eEmzYmcW6rPyjVez4J6xnVFH+cz1ZF2
 ksLi9OTFsLUfx6PdLpYKD8teNu0/vKA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-LoampRg-MSGKaNBOmFm4Kg-1; Tue, 15 Mar 2022 09:42:23 -0400
X-MC-Unique: LoampRg-MSGKaNBOmFm4Kg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 673E9811E84;
 Tue, 15 Mar 2022 13:42:23 +0000 (UTC)
Received: from paraplu (unknown [10.39.196.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 234922141DE7;
 Tue, 15 Mar 2022 13:42:17 +0000 (UTC)
Date: Tue, 15 Mar 2022 14:42:15 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/3] docs: rSTify "security-process" page; move it to
 QEMU Git
Message-ID: <YjCXl7V+eapPJwc6@paraplu>
References: <20220314104943.513593-1-kchamart@redhat.com>
 <20220314104943.513593-2-kchamart@redhat.com>
 <89c85796-9853-e2fe-977b-2ab321c29af5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <89c85796-9853-e2fe-977b-2ab321c29af5@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Cc: pbonzini@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 qemu-security@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 01:47:38PM +0100, Thomas Huth wrote:
> On 14/03/2022 11.49, Kashyap Chamarthy wrote:

[...]

> > +   -  Once the patch is merged, close the upstream bug with a link to
> > +      the commit
> > +
> > +      -  Fixed in:
> 
> There used to be a "<commit hash/link>" after that "Fixed in" on the
> original page, seems like you've lost that somewhere along the way?

Ouch, Pandoc seems to have eaten it during conversion, because of "< >"?
(But it didn't eat "<qemu-security@nongnu.org>" or
"<secalert@redhat.com>" at the top ... probably because they're
hyperlinks.)  Anyway, I'll add it back in v2.

Thanks for the eagle eyes!
 
> Anyway, I'd like to hear from the security folks whether they are OK with
> moving this page to the main git repo, or whether it rather should stay in
> the qemu-web repo.

Sure.

-- 
/kashyap


