Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6DF26686A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 20:50:47 +0200 (CEST)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGo8E-0006rO-CV
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 14:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGo7F-0006Bd-TV
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 14:49:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44156
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGo7E-0003Mw-9M
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 14:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599850182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=RKOruyQaAqdhSy6xpZH9ml1L4slhGS0OC6qnGXeA3j0=;
 b=Z7cBDSFVAO1QY2cYgCcGLlqho9WTI/EH74tf+ybHkNXlisdEhD9RxRwrV3uZfzHPAQFHw7
 53esIj3kIi3ZBbMyQoDZmlBHJuWSLhG3mbxU6kFsYqg/RPp5TDHglqlQ+8HuSsd1/JhkNl
 6HhDC9bTIakJKjVv3XkXdvIDBWkOaxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-2eUT0WUwMFisoqCRolHqyA-1; Fri, 11 Sep 2020 14:49:32 -0400
X-MC-Unique: 2eUT0WUwMFisoqCRolHqyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C98A518B9EE5;
 Fri, 11 Sep 2020 18:49:20 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98CF578439;
 Fri, 11 Sep 2020 18:49:20 +0000 (UTC)
Date: Fri, 11 Sep 2020 14:49:19 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: Redefinition of typedefs (C11 feature)
Message-ID: <20200911184919.GV1618070@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 03:28:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm wondering: do our supported build host platforms all include
compilers that are new enough to let us redefine typedefs?

The ability to redefine typedefs is a C11 feature which would be
very useful for simplifying our QOM boilerplate code.  The
feature is supported by GCC since 2011 (v4.6.0)[1], and by clang
since 2012 (v3.1)[2].

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=ce3765bf44e49ef0568a1ad4a0b7f807591d6412
    https://gcc.gnu.org/gcc-4.6/changes.html
[2] https://github.com/llvm-mirror/clang/commit/c0004df84fca9225b66a50adc66cf21c34298227

-- 
Eduardo


