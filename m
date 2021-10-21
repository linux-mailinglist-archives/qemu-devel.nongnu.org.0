Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85094435CC1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 10:17:16 +0200 (CEST)
Received: from localhost ([::1]:55134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdTGF-0005WZ-KP
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 04:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mdTEm-0004nx-C1
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:15:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mdTEk-00054m-9j
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634804141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IBRyC8roJcGGCG08lKq7K9PiemuxKiPj0V3bitDI48w=;
 b=LWLyk/DU/waXNydPoUrMFvFdbYo6F6lVJFj0mzn1e9hupmKK3Sezurv1O29VdRpg0qMxst
 lfsqq2DPEtBpxAFWYlszeWH7om/oU65aF2m8wV1ofwgR7gFtHNsbRL0JQKxtevWRir343E
 Nq3fy71C6giyCvevTQlQZjXK5scQ/mE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-4SvkvdQVM-utqdn78C4iZw-1; Thu, 21 Oct 2021 04:15:40 -0400
X-MC-Unique: 4SvkvdQVM-utqdn78C4iZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77B14192376F;
 Thu, 21 Oct 2021 08:15:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94A3B5DD68;
 Thu, 21 Oct 2021 08:15:37 +0000 (UTC)
Date: Thu, 21 Oct 2021 10:15:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2] qapi: Improve input_type_enum()'s error message
Message-ID: <YXEhqGFqkLXHrz/B@redhat.com>
References: <20211020180231.434071-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020180231.434071-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, michael.roth@amd.com,
 qemu-devel@nongnu.org, hreitz@redhat.com, pbonzini@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.10.2021 um 20:02 hat Markus Armbruster geschrieben:
> The error message claims the parameter is invalid:
> 
>     $ qemu-system-x86_64 -object qom-type=nonexistent
>     qemu-system-x86_64: -object qom-type=nonexistent: Invalid parameter 'nonexistent'
> 
> What's wrong is actually the *value* 'nonexistent'.  Improve the
> message to
> 
>     qemu-system-x86_64: -object qom-type=nonexistent: Parameter 'qom-type' does not accept value 'nonexistent'
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


