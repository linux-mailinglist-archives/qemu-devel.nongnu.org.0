Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B99340EA24
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 20:43:22 +0200 (CEST)
Received: from localhost ([::1]:45642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQwLx-0004GG-NW
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 14:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mQwK7-0002Ab-77
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mQwK4-00043t-TM
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631817684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tDt/13dDzxJAUb+KoSDdzBIPP/la+cTsOV3D5RDMrKY=;
 b=bGgTaUETEYqQSgF+vGdziIqzBP8Bz8so3/OkNMdN0FjKPoyEc91HKI7aPpBdf2XWTSiodn
 v92pMd8iIUHL1WlXie3Ra6hX+VcxsuaVqD4eVB98M6nESJuL7IUz6nkTMb+WoQFlTgJau1
 ZEXPaDur+1VgPo9SgRZKJVf+xZqeiY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-QxO2SlH-P-SmV0zOOsfYdw-1; Thu, 16 Sep 2021 14:41:22 -0400
X-MC-Unique: QxO2SlH-P-SmV0zOOsfYdw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01CB91800D41
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 18:41:22 +0000 (UTC)
Received: from localhost (unknown [10.22.8.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2FAF5C1C5;
 Thu, 16 Sep 2021 18:41:21 +0000 (UTC)
Date: Thu, 16 Sep 2021 14:41:21 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/2] python: pylint 2.11 support
Message-ID: <20210916184121.k6q7t4k4qgbslcmu@habkost.net>
References: <20210916182248.721529-1-jsnow@redhat.com>
 <20210916182248.721529-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210916182248.721529-3-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 16, 2021 at 02:22:48PM -0400, John Snow wrote:
> We're not ready to enforce f-strings everywhere, so just silence this
> new warning.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


