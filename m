Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D396D66475E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:26:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHg2-0002No-06; Tue, 10 Jan 2023 11:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFHfz-0002MQ-Js
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:40:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFHfx-0005eh-Ax
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:40:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673368836;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zMjqy43np1vBHch+KMA9FysBo0T1CLp6RQkRoeitwWU=;
 b=C94xJrVW9zG+NbLR7AwQTDL8SSiX/u4PmRGZfyC4+m/IdT47EsLRh/x0hpU9OmEgDUiLoC
 bLW1/OERJJAaVSj4nwi2d8L0ivzK+HY/rZhgUIOBH1fOvwsv/LYUyXuFwlcLS4GSZZN1tq
 maky855qfRyWcjorZDqNpHeaC+TNcRw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-pv32nBlWMemGH8xGLmmq9Q-1; Tue, 10 Jan 2023 11:40:35 -0500
X-MC-Unique: pv32nBlWMemGH8xGLmmq9Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFC3E811E6E
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 16:40:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DDEAC16031;
 Tue, 10 Jan 2023 16:40:33 +0000 (UTC)
Date: Tue, 10 Jan 2023 16:40:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PULL 08/29] gitlab: remove redundant setting of PKG_CONFIG_PATH
Message-ID: <Y72U/8LeENuOKu/i@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
 <20230110160233.339771-9-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230110160233.339771-9-pbonzini@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 10, 2023 at 05:02:12PM +0100, Paolo Bonzini wrote:
> From: Daniel P. Berrang?? <berrange@redhat.com>
> 
> The PKG_CONFIG_PATH variable is not defined in GitLab CI
> envs and even if it was, we don't need to set it to its
> existing value.
> 
> Signed-off-by: Daniel P. Berrang?? <berrange@redhat.com>

This has mangled my name - think your client sending mail
needs to specify utf8 charset in the mail headers perhaps ?

> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Message-Id: <20221103173044.3969425-2-berrange@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


