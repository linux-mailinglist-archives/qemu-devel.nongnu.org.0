Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB830DD69
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:00:26 +0100 (CET)
Received: from localhost ([::1]:48758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Jdq-0000cu-1j
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:00:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l7Jcq-0008Ec-6v
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:59:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l7Jco-00083W-Dq
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612364361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qRsnFCp69nsbxXfmHfyjx9X1g5xmAxOPqTLuIGbNv7s=;
 b=USXS1lNEc3AKPq229S+8IqftX+3Z+Q67PXVN+Mn98+gJ4SewNWYaGjabvYVOIlsLH/+AMg
 3y7tS7sJ0zi63rukUcAFAly0mqYmiX0jlXmqhxx4KQbtopx0d/9yCb4gK/IFwKlfZpKOyK
 010k2e6CPilS/CYSLYGNuvgPmrDO2wY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-kVqM9USaMVunYTw5J2qymg-1; Wed, 03 Feb 2021 09:59:19 -0500
X-MC-Unique: kVqM9USaMVunYTw5J2qymg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3E5CC7400;
 Wed,  3 Feb 2021 14:59:17 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A220850DE3;
 Wed,  3 Feb 2021 14:59:17 +0000 (UTC)
Date: Wed, 3 Feb 2021 09:59:17 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v15 00/23] i386 cleanup PART 2
Message-ID: <20210203145917.GU3872207@habkost.net>
References: <20210201100903.17309-1-cfontana@suse.de>
 <87ft2drzy1.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87ft2drzy1.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 02:22:38PM +0000, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
> > v14 -> v15:
> >
> > * change the TcgCpuOperations so that all fields of the struct are
> >   defined unconditionally, as per original patch by Eduardo,
> >   before moving them to a separate struct referenced by a pointer
> >   (Richard, Eduardo).
> >
> <snip>
> 
> I'm not sure if their is some instability because I keep seeing failures
> in the review trees, e.g:
> 
>   https://gitlab.com/stsquad/qemu/-/pipelines/250749404

Seems unrelated to this series, Eric Blake reported similar
iotest failures at
https://lore.kernel.org/qemu-devel/9e71568c-ce4a-f844-fbd3-a4a59f850d74@redhat.com

-- 
Eduardo


