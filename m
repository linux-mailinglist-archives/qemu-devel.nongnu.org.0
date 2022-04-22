Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44F450B660
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:47:22 +0200 (CEST)
Received: from localhost ([::1]:37674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrkv-0008Ll-VJ
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nhqrg-00078l-1R
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:50:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nhqre-00019f-BK
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650624612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ItNwsmy2DnHkfHjwK/IBDpJyAJhD3TaOzfPWmtHNnAs=;
 b=QcypZtzcdGZ9lVnmk83zOWYIvu77FFOUr+H4sU1rBAgUjpoKW7br13ZoTufy+YSxllBcbV
 VQzJcOlQICDB++0diV8Wp4ic4FlFKCiaaG8lHNK6Lk384ey7WqR3PrdbG5cz/ciLrOSFtC
 4ZyIMmoUv3FWNbfCWyzuoJ2nm7AD7CA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-rIteetkLOfW-92izRJyPug-1; Fri, 22 Apr 2022 06:50:08 -0400
X-MC-Unique: rIteetkLOfW-92izRJyPug-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4E103C23FA4;
 Fri, 22 Apr 2022 10:50:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96516416146;
 Fri, 22 Apr 2022 10:50:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8AB84180098B; Fri, 22 Apr 2022 12:50:03 +0200 (CEST)
Date: Fri, 22 Apr 2022 12:50:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v5 0/2] Option to take screenshot with screendump as PNG
Message-ID: <20220422105003.7iyonfygwy47k6fm@sirius.home.kraxel.org>
References: <20220408071336.99839-1-kshitij.suri@nutanix.com>
 <48d3c4c2-7e64-902d-b6ce-d0a547ba4c4c@nutanix.com>
 <87tuamsfn9.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuamsfn9.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, peter.maydell@linaro.org, thuth@redhat.com,
 berrange@redhat.com, prerna.saxena@nutanix.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, Kshitij Suri <kshitij.suri@nutanix.com>,
 philippe.mathieu.daude@gmail.com, pbonzini@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 21, 2022 at 03:57:30PM +0200, Markus Armbruster wrote:
> Kshitij Suri <kshitij.suri@nutanix.com> writes:
> 
> > Hi,
> >
> > Hope this mail finds everyone well! I have updated the code as
> > required and would be grateful if I could get your reviews for any
> > changes that are needed to be implemented in the patch. In case no
> > change is required, please do let me know the next steps for the same.
> 
> Unless something still comes up in review, the next step is merging.
> 
> Gerd, would you like to take it?

I'm busy going through the backlog (patches not merged during freeze)
anyway.  Queued this now.

take care,
  Gerd


